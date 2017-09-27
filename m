Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 07C4571CA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 16:33:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id f84so7207958pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f9tNOsplq70uFwoXuI0pHIzGmDpIgk9aEk4mDzwJZFE=;
	b=ArhPX3hfystbQBBY+v02fiZ5I82V3c+7TvxePlx2nkUVd/Yp3wqS6rh3Y9riU5HD96
	296qyLYu+WGQ1Gk/UDMGoSiNkkNl9I6zYuwv1uyqvgfo22w2lQNU9dgH0mifGOGGZqBu
	aO4/4zx/YMs/rd6B8X+FB1WTLwnOOUxgIElsqH8YlTvdDKJmeusAaaMCwLLGZFICGiaY
	WGdeIDU7Wg7cwmAFc5mrCFWsAgAxY9yS3kL5eQ6cXC/O/uLXmv8Vqp3dI089Yz5wi9wc
	oBP7umyHMQm24exE0x0f/0yF0OCh4LP4AKHb4+hx3hwafTYPPytDaQ5pqZFGlFn0mFOv
	cJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f9tNOsplq70uFwoXuI0pHIzGmDpIgk9aEk4mDzwJZFE=;
	b=iaE/eeMBLNFuQc9bwpm5+TUbYLl2XOH/975S7mX81GEj5KMtY8Qo/6YRHugDzKqv/M
	pkI8nVtdl4FwzQjd2SvBTcepKlnTRxdzNeYHKAAWRMiQhsIK1/zYp8n7vwOOscaEkrW6
	YAu5Gp7/0dVkCFjrL/nJHLV6mUFpb6qO7uwNRxgFUGPTpCt566L+u3wu90G33tezT5Ex
	sVqLy2YA/KAB9Ich8UU7CU8z9T8zfcdHxtYc+zLp75yhlwrTsC3P4i70ChHOjV54N9gq
	3kb33Z2wtXPjO66CAecayMXnjjcXHFu7C3zTSrusKklMc50HBukjt0DJc1U64cbYRoQG
	fJ8w==
X-Gm-Message-State: AHPjjUic0sS6bPcAO9heXseyYfjCs13Amy5l1YObgkgw7J5FZxkvRrO0
	nDfIARjx4U5YK7kA2mKXq7BafUDt/Y80tXSqNa8=
X-Google-Smtp-Source: AOwi7QBwHc8lCwwks8LbTSuA6NbHHOJDy24D9G6qUaDIHELKQ404bVU+pwisyI/ZPMrqlt1JgPUYv2Tp2iBNBovw2lM=
X-Received: by 10.98.156.152 with SMTP id u24mr1769794pfk.255.1506529993847;
	Wed, 27 Sep 2017 09:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <1506513706-14213-1-git-send-email-matt@madison.systems>
	<CABcZAN=uMrwda=MGiKW9qPs_q7KLFR3V04KiSV-WCLwTPJ=XqQ@mail.gmail.com>
In-Reply-To: <CABcZAN=uMrwda=MGiKW9qPs_q7KLFR3V04KiSV-WCLwTPJ=XqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Sep 2017 16:33:03 +0000
Message-ID: <CAMKF1soU7--gaCF1E70Ufp_tPy3NDs8w3FhHQpo592E4Yo=9eg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>, Matt Madison <matt@madison.systems>
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
X-List-Received-Date: Wed, 27 Sep 2017 16:33:13 -0000
Content-Type: multipart/alternative; boundary="94eb2c0a4a7e2079cc055a2e5985"

--94eb2c0a4a7e2079cc055a2e5985
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 8:52 AM Christopher Larson <kergoth@gmail.com>
wrote:

> Another option is to use contains() for this. The signature generation
> code knows how to handle contains specially, only depending on the presence
> of the specified value in the list, rather than the entirety.
>

This approach seems better than anon python

>
> On Wed, Sep 27, 2017 at 5:01 AM, Matt Madison <matt@madison.systems>
> wrote:
>
>> Move the mips32r2->mips32 rewrite to an anonymous
>> python function, and change the GOARCH setting to
>> use just the passed-in architecture string, to
>> avoid an unwanted variable dependency.
>>
>> Signed-off-by: Matt Madison <matt@madison.systems>
>> ---
>>  meta/classes/goarch.bbclass | 20 +++++++++++---------
>>  1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 9ed562d..7553987 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -43,14 +43,10 @@ def go_map_arch(a, d):
>>          return 'mips64le'
>>      elif re.match('mips64*', a):
>>          return 'mips64'
>> -    elif re.match('mips.*', a):
>> -        tf = d.getVar('TUNE_FEATURES').split()
>> -        if 'fpu-hard' in tf and 'n32' not in tf:
>> -            if 'mips32r2' in tf:
>> -                newtf = [t for t in tf if t != 'mips32r2']
>> -                newtf.append('mips32')
>> -                d.setVar('TUNE_FEATURES', ' '.join(newtf))
>> -            return 'mips' if 'bigendian' in tf else 'mipsle'
>> +    elif re.match('mipsel.*', a) and 'r6' not in a and '-nf' not in a
>> and '-n32' not in a:
>> +        return 'mipsle'
>> +    elif re.match('mips', a) and 'r6' not in a and '-nf' not in a and
>> '-n32' not in a:
>> +        return 'mipsle'
>>      elif re.match('p(pc|owerpc)(64)', a):
>>          return 'ppc64'
>>      elif re.match('p(pc|owerpc)(64el)', a):
>> @@ -74,4 +70,10 @@ def go_map_os(o, d):
>>          return 'linux'
>>      return o
>>
>> -
>> +python __anonymous () {
>> +    tf = d.getVar('TUNE_FEATURES').split()
>> +    if 'mips32r2' in tf:
>> +        newtf = [t for t in tf if t != 'mips32r2']
>> +        newtf.append('mips32')
>> +        d.setVar('TUNE_FEATURES', ' '.join(newtf))
>> +}
>>
> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0a4a7e2079cc055a2e5985
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Sep 27, 2017 =
at 8:52 AM Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">kerg=
oth@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>A=
nother option is to use contains() for this. The signature generation code =
knows how to handle contains specially, only depending on the presence of t=
he specified value in the list, rather than the entirety.</div></blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">This approach seems better t=
han anon python</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote"></div></div><div class=3D"g=
mail_extra"><div class=3D"gmail_quote">On Wed, Sep 27, 2017 at 5:01 AM, Mat=
t Madison <span>&lt;<a href=3D"mailto:matt@madison.systems" target=3D"_blan=
k">matt@madison.systems</a>&gt;</span> wrote:<br></div></div><div class=3D"=
gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Move=
 the mips32r2-&gt;mips32 rewrite to an anonymous<br>
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
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 tf =3D d.getVar(&#39;TUNE_FEATURES&#39;).split=
()<br>
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
+=C2=A0 =C2=A0 tf =3D d.getVar(&#39;TUNE_FEATURES&#39;).split()<br>
+=C2=A0 =C2=A0 if &#39;mips32r2&#39; in tf:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 newtf =3D [t for t in tf if t !=3D &#39;mips32=
r2&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 newtf.append(&#39;mips32&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;TUNE_FEATURES&#39;, &#39; &#39;.=
join(newtf))<br>
+}<br>
</blockquote></div></div><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"m_-2383841123682171792HOE=
nZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"m_-2383841123682171792gmail_signature" data-smartmail=3D"gm=
ail_signature"><div><div><div>Christopher Larson<br>kergoth at gmail dot co=
m<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Enginee=
r, Mentor Graphics</div></div></div></div>
</div>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c0a4a7e2079cc055a2e5985--
