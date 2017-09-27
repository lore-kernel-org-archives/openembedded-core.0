Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id D2CA8719C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 15:52:25 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id h191so3653607vke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uJ3PD0L7rVVNk0ny3uY0YGEwpSWDsov94G5+xu7YqZ0=;
	b=HJWrIv2kY8xin2vve6vSWh47SLP9gUlLp6AbupbY6G+ONrymHDjKPiFtdYU6hg4dOt
	DhVtOrOKl418N39uHIkREe7hI7rPcqrV5+l648Sdv9Yyq5aUXR3JeDg2Y16Z8rFSAfEF
	sTKvY62ZQCYi7BQ8SXHNuDgtBc21d2WF2072WCBWv6Gx3bN+/WtPKRyhi8kuY5csBh47
	dV0oJVa6I/ChYVbmxo4LY7VdgMQqwjExfjI/6GU8A7eXKw9UBSzl+5io+hYL1dFNUhxk
	/5CBFeSnBiVsDVA6sVGp65dfKKLpQWPFZNaM+/6WD/86G/rdmv8WZ8Iys+qsi9DCYoiH
	QaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uJ3PD0L7rVVNk0ny3uY0YGEwpSWDsov94G5+xu7YqZ0=;
	b=sRa3RNYEappoBxb2JzD/JRJEtlIUQN0C5qQqhWKi3KrTg+DrPrThwSGih5eejgUxRJ
	nEQp6isa7r0hjdFFyMmvcKKbVszr3gAxxCdvb3Q7/hAB+I8bWLu975ohDCVogGTtBZyP
	5fFOUjGgNyuyNTLS2k1VoWt3INBOQ2ciyAxkDiowaiU5ySjCQ8oEeSi50aef8l5sAV4U
	qgk06PjUWS0I1YChIYV8yKX8GpADc+Xx3deGxLnFZwlqo0thUI0Kw5ULWneWR2i7950e
	bPLYGGKs7Atvs3ZYDVusmV3AyDchdHpcndq/kPacGflwSymr3xUxpLJMJzMRBx0JOpt0
	7WjA==
X-Gm-Message-State: AHPjjUiQtdPsz6kdJLMn/PhsI9crgaPYUWotPdHaHnovBz1HilbnIeqS
	nc+K0d81xFHku1f7FjQfRyZfl3amINAhSR1FAow=
X-Google-Smtp-Source: AOwi7QAEPgagnaBXyV2o3HjPUKCwfcuHIC5L+wGADSel+ADu4xTANtKUYP8kbOfPzys++1uEiu/68Rs0HF5nfO2YAAc=
X-Received: by 10.31.11.19 with SMTP id 19mr920408vkl.69.1506527546746; Wed,
	27 Sep 2017 08:52:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.20.208 with HTTP; Wed, 27 Sep 2017 08:52:06 -0700 (PDT)
In-Reply-To: <1506513706-14213-1-git-send-email-matt@madison.systems>
References: <1506513706-14213-1-git-send-email-matt@madison.systems>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 27 Sep 2017 08:52:06 -0700
Message-ID: <CABcZAN=uMrwda=MGiKW9qPs_q7KLFR3V04KiSV-WCLwTPJ=XqQ@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: rework mips architecture checks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Sep 2017 15:52:26 -0000
Content-Type: multipart/alternative; boundary="001a11411ee044af79055a2dc750"

--001a11411ee044af79055a2dc750
Content-Type: text/plain; charset="UTF-8"

Another option is to use contains() for this. The signature generation code
knows how to handle contains specially, only depending on the presence of
the specified value in the list, rather than the entirety.

On Wed, Sep 27, 2017 at 5:01 AM, Matt Madison <matt@madison.systems> wrote:

> Move the mips32r2->mips32 rewrite to an anonymous
> python function, and change the GOARCH setting to
> use just the passed-in architecture string, to
> avoid an unwanted variable dependency.
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/classes/goarch.bbclass | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 9ed562d..7553987 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -43,14 +43,10 @@ def go_map_arch(a, d):
>          return 'mips64le'
>      elif re.match('mips64*', a):
>          return 'mips64'
> -    elif re.match('mips.*', a):
> -        tf = d.getVar('TUNE_FEATURES').split()
> -        if 'fpu-hard' in tf and 'n32' not in tf:
> -            if 'mips32r2' in tf:
> -                newtf = [t for t in tf if t != 'mips32r2']
> -                newtf.append('mips32')
> -                d.setVar('TUNE_FEATURES', ' '.join(newtf))
> -            return 'mips' if 'bigendian' in tf else 'mipsle'
> +    elif re.match('mipsel.*', a) and 'r6' not in a and '-nf' not in a and
> '-n32' not in a:
> +        return 'mipsle'
> +    elif re.match('mips', a) and 'r6' not in a and '-nf' not in a and
> '-n32' not in a:
> +        return 'mipsle'
>      elif re.match('p(pc|owerpc)(64)', a):
>          return 'ppc64'
>      elif re.match('p(pc|owerpc)(64el)', a):
> @@ -74,4 +70,10 @@ def go_map_os(o, d):
>          return 'linux'
>      return o
>
> -
> +python __anonymous () {
> +    tf = d.getVar('TUNE_FEATURES').split()
> +    if 'mips32r2' in tf:
> +        newtf = [t for t in tf if t != 'mips32r2']
> +        newtf.append('mips32')
> +        d.setVar('TUNE_FEATURES', ' '.join(newtf))
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a11411ee044af79055a2dc750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Another option is to use contains() for this. The signatur=
e generation code knows how to handle contains specially, only depending on=
 the presence of the specified value in the list, rather than the entirety.=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Sep=
 27, 2017 at 5:01 AM, Matt Madison <span dir=3D"ltr">&lt;<a href=3D"mailto:=
matt@madison.systems" target=3D"_blank">matt@madison.systems</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Move the mips32r2-&gt;mips32 rewr=
ite to an anonymous<br>
python function, and change the GOARCH setting to<br>
use just the passed-in architecture string, to<br>
avoid an unwanted variable dependency.<br>
<br>
Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
---<br>
=C2=A0meta/classes/goarch.bbclass | 20 +++++++++++---------<br>
=C2=A01 file changed, 11 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass<br>
index 9ed562d..7553987 100644<br>
--- a/meta/classes/goarch.bbclass<br>
+++ b/meta/classes/goarch.bbclass<br>
@@ -43,14 +43,10 @@ def go_map_arch(a, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;mips64le&#39;<br>
=C2=A0 =C2=A0 =C2=A0elif re.match(&#39;mips64*&#39;, a):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;mips64&#39;<br>
-=C2=A0 =C2=A0 elif re.match(&#39;mips.*&#39;, a):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tf =3D d.getVar(&#39;TUNE_FEATURES&#39;).<wbr>=
split()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;fpu-hard&#39; in tf and &#39;n32&#39; =
not in tf:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;mips32r2&#39; in tf:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newtf =3D [t for t=
 in tf if t !=3D &#39;mips32r2&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newtf.append(&#39;=
mips32&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;TUNE=
_FEATURES&#39;, &#39; &#39;.join(newtf))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips&#39; if &#39;bi=
gendian&#39; in tf else &#39;mipsle&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;mipsel.*&#39;, a) and &#39;r6&#39; not in=
 a and &#39;-nf&#39; not in a and &#39;-n32&#39; not in a:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mipsle&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;mips&#39;, a) and &#39;r6&#39; not in a a=
nd &#39;-nf&#39; not in a and &#39;-n32&#39; not in a:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mipsle&#39;<br>
=C2=A0 =C2=A0 =C2=A0elif re.match(&#39;p(pc|owerpc)(64)&#39;, a):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;ppc64&#39;<br>
=C2=A0 =C2=A0 =C2=A0elif re.match(&#39;p(pc|owerpc)(64el)&#39;, a):<br>
@@ -74,4 +70,10 @@ def go_map_os(o, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;linux&#39;<br>
=C2=A0 =C2=A0 =C2=A0return o<br>
<br>
-<br>
+python __anonymous () {<br>
+=C2=A0 =C2=A0 tf =3D d.getVar(&#39;TUNE_FEATURES&#39;).<wbr>split()<br>
+=C2=A0 =C2=A0 if &#39;mips32r2&#39; in tf:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 newtf =3D [t for t in tf if t !=3D &#39;mips32=
r2&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 newtf.append(&#39;mips32&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;TUNE_FEATURES&#39;, &#39; &#39;.=
join(newtf))<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engin=
eer, Mentor Graphics</div></div></div></div>
</div>

--001a11411ee044af79055a2dc750--
