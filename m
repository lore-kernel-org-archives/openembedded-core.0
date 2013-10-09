Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id D15AE6CD4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 23:17:37 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so1372021lab.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2013 16:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=4bcMZZf8qgnBY+6S25xgs1WoH2+JRTmH4qOsTPIF98U=;
	b=Z2qubtVqMY0w4ZK64cJtK0bWdbADjPlKzCR0/Jubwkf14tPk2ci1KOEkHwsm+CeBqF
	hcUv9cbRzxeJ3VJrKwv3doji3dktKYvrwNAakyCo21OfUnmASptumVJciCeBD4CZ6KCy
	nlVlOPGrCHkxDwutORiCBT+GMjszkh9hmq1sLLA3MeTCgfr+e9BGAWqs4ywXE92d6Z3g
	fEA0rK5Z7tVIukvmbhUtwUKXhm3wAyF86GkeAh+pMcVf1aVFgw5fB4VqbaIRSjKt8hSk
	COxj+xv97tkxZP5oaj9Ai/jYD2fh3v4Kfu36BYm1aZK0+g6nf065ZoKz3IhVvpAZOyjU
	hhAg==
X-Received: by 10.152.26.72 with SMTP id j8mr8457651lag.19.1381360659069; Wed,
	09 Oct 2013 16:17:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Wed, 9 Oct 2013 16:17:19 -0700 (PDT)
In-Reply-To: <1381242605-13393-2-git-send-email-ross.burton@intel.com>
References: <1381242605-13393-1-git-send-email-ross.burton@intel.com>
	<1381242605-13393-2-git-send-email-ross.burton@intel.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 9 Oct 2013 16:17:19 -0700
X-Google-Sender-Auth: I_dSm3fnbwon35gw_byBiFD3Feg
Message-ID: <CABcZAN=u1TsXA745EJxv-NwHwv+HUvuzENGV7StnH=wOiOYB8Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane: configure option checking
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
X-List-Received-Date: Wed, 09 Oct 2013 23:17:38 -0000
Content-Type: multipart/alternative; boundary=089e0160c36e64000a04e8571787

--089e0160c36e64000a04e8571787
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 8, 2013 at 7:30 AM, Ross Burton <ross.burton@intel.com> wrote:

> +
>  ###########################################################################
> +    # Check unrecognised configure options (with a white list)
> +
>  ###########################################################################
> +    if bb.data.inherits_class("autotools", d):
> +        bb.note("Checking configure output for unrecognised options")
> +        try:
> +            flag = "WARNING: unrecognized options:"
> +            log = os.path.join(d.getVar('B', True), 'config.log')
> +            output = subprocess.check_output(['grep', '-F', flag, log])
> +            options = set(map(lambda s: s.strip(' ,'),
> output.partition(flag)[2].split()))
> +            whitelist = set(d.getVar("UNKNOWN_CONFIGURE_WHITELIST",
> True).split())
> +            options -= whitelist
> +            if options:
> +               pn = d.getVar('PN', True)
> +                error_msg = pn + ": configure was passed unrecognised
> options: " + " ".join(options)
> +                package_qa_handle_error("unknown-configure-option",
> error_msg, d)
> +        except subprocess.CalledProcessError:
> +            pass
>

Why is the entire block in the try/except rather than just the
subprocess.check_output()?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0160c36e64000a04e8571787
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Oct 8, 2013 at 7:30 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":i9" style=3D"overflow:hidden">+ =
=C2=A0 =C2=A0##############################################################=
#############<br>


+ =C2=A0 =C2=A0# Check unrecognised configure options (with a white list)<b=
r>
+ =C2=A0 =C2=A0############################################################=
###############<br>
+ =C2=A0 =C2=A0if <span class=3D"il">bb</span>.data.inherits_class(&quot;au=
totools&quot;, d):<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0<span class=3D"il">bb</span>.note(&quot;Checki=
ng configure output for unrecognised options&quot;)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flag =3D &quot;WARNING: unrecogn=
ized options:&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log =3D os.path.join(d.getVar(&#=
39;B&#39;, True), &#39;config.log&#39;)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output =3D subprocess.check_outp=
ut([&#39;grep&#39;, &#39;-F&#39;, flag, log])<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options =3D set(map(lambda s: s.=
strip(&#39; ,&#39;), output.partition(flag)[2].split()))<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0whitelist =3D set(d.getVar(&quot=
;UNKNOWN_CONFIGURE_WHITELIST&quot;, True).split())<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0options -=3D whitelist<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if options:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&=
#39;, True)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_msg =3D pn +=
 &quot;: configure was passed unrecognised options: &quot; + &quot; &quot;.=
join(options)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package_qa_handle_=
error(&quot;unknown-configure-option&quot;, error_msg, d)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError:<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pass</div></blockquote></div><br=
>Why is the entire block in the try/except rather than just the subprocess.=
check_output()?<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e0160c36e64000a04e8571787--
