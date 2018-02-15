Return-Path: <ccherukuri.chaitanya@gmail.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 52CDA719AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 12:59:34 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id u15so3278117wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 04:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4obKUqro/QnKx0mpkks/As4tkvvIq3Pznfs409n17v4=;
	b=Mcqf8K3iMZOjccqbvfP0EbSr7mljhfVTzR5enmkq/mvpe7FSaBNcANwYmBz246Dvzh
	KHLbyc4xt6xcMfXVUJwWXu5nsyIHOFvXAYhaOijVSEZ/B6qR4wCF1RlBY5yMg4GqsIre
	dgREfz6slJMaTWquSSiXMpLAQSKU2haRTlScC6IuD3H5kcuONRYmsAU/LJY25OsyhERl
	zRAHP3MPXUYLOccTLKewN/g/Vls3h5fDylfEbUHrIrqIpUbIW0FCa2SVOSBY5bC5LWtZ
	y45beIyMaZ+Ki0TV2C4bBsG71hlorJ9vMDOZ68xa03nOODpg7y7rLfOZ0I+qPLNVz699
	MowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4obKUqro/QnKx0mpkks/As4tkvvIq3Pznfs409n17v4=;
	b=Gje9DiKasQ6e3mo65FjxlA57r8SFuNI5UNKar+5GJyuddRtIzMDXdTGUXeWx+XCmfe
	ikAAlGc2T0IPI0jmL2tQB8Nno5VGgYvtzluQvPEHFJ/6VE3eNLKfTfcEfzx11jH2uzg8
	ZW8vOCNYf2pbpdRFnMcp8jHcKmoQwYpjANUakMFnBRYWA13dhnwc8k8ZHOXWCfp9tq8n
	DyzIwvoSLuJkRvzpJWZPZ4SXDg83lwps5T1P19qRWobjXJnYLru6PWGFC6MT6BGoLZQa
	XRwh6D4bAPLUTOdMF+Nf1JAb2vfYwqzWIGQpkhtDp4Opp6+uPmQAL/QLVtyMOd/w8TdH
	j9Vg==
X-Gm-Message-State: APf1xPBZHhv0e9TS+9jJHAih08uDoDw3Pu6/4X+kh1NbTpDVwRXFi5qG
	rgQw4tNSHQm5whXzFXcdnOwglWDXoEOt5VfN9NY=
X-Google-Smtp-Source: AH8x225PyC8wmUljxTBXhRRunAjdemWvPOzlTuD103Q4B6yrAjUVOsdIshIaXvCZGdQsLHKwcXHOeRUVYrLxuSyvU4E=
X-Received: by 10.223.209.18 with SMTP id a18mr2395985wri.141.1518699575909;
	Thu, 15 Feb 2018 04:59:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.61.9 with HTTP; Thu, 15 Feb 2018 04:59:35 -0800 (PST)
In-Reply-To: <CAP9ODKqo9yObWxoNs6bRPps-OsG2Zh9Y5BX2_E3_W1=pMgK2rg@mail.gmail.com>
References: <CAGix03zhY3ZEhKLUyzU3HDmMD3t2MmOwkM2TffZVUdByk+cA+A@mail.gmail.com>
	<68bad37c-fb4f-bfe1-2e51-7f191edca215@linux.intel.com>
	<CAP9ODKqo9yObWxoNs6bRPps-OsG2Zh9Y5BX2_E3_W1=pMgK2rg@mail.gmail.com>
From: Chaitanya Cherukuri <ccherukuri.chaitanya@gmail.com>
Date: Thu, 15 Feb 2018 07:59:35 -0500
Message-ID: <CAGix03ya92WbdxC1o+WSxtJK4t9LnS6G81ja9M1fzqZ2byJG5Q@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Regarding Patch ID: 132816
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
X-List-Received-Date: Thu, 15 Feb 2018 12:59:35 -0000
Content-Type: multipart/alternative; boundary="f4f5e80a3f64be229205653fcc30"

--f4f5e80a3f64be229205653fcc30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E2=80=8BHello,

The regular expression =E2=80=8B(from OEToolchainConfig.cmake)  below is no=
t
working for SDK path /sysroots/cortexa9hf-neon-poky-linux-gnueabi

if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
endif()

Thanks,
Chaitanya

On Tue, Feb 13, 2018 at 9:50 AM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Tue, Feb 13, 2018 at 4:58 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > On 02/12/2018 11:06 PM, Chaitanya Cherukuri wrote:
> >>
> >> I'm new to this forum and didn't know to where to report an issue. I'm
> >> contacting you regarding the patch ID 132816 ( cmake: improve
> >> CMAKE_SYSTEM_PROCESSOR assignment in nativesdk).
> >>
> >> If SDKTARGETSYSROOT is "/sysroots/cortexa9hf-neon-poky-linux-gnueabi"
> this
> >> patch sets the CMAKE_SYSTEM_PROCESSOR as  "cortexa9hf-neon-poky"
> instead of
> >> "cortexa9hf-neon".
> >>
> >> This patch works if SDKTARGETSYSROOT is "/sysroots/core2-32-poky-
> linux".
> >
> > I guess this one is for Otavio Salvador, the cmake recipe maintainer?
>
> I had acked and test the patch. https://patchwork.
> openembedded.org/patch/132816/
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>



--=20
*Chaitanya Cherukuri*

--f4f5e80a3f64be229205653fcc30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:&quot;co=
mic sans ms&quot;,sans-serif;font-size:small">=E2=80=8BHello,</div><div cla=
ss=3D"gmail_default" style=3D"font-family:&quot;comic sans ms&quot;,sans-se=
rif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><font face=3D"verdana, sans-serif">The regular expression =E2=80=
=8B(from OEToolchainConfig.cmake)=C2=A0 below is not working for SDK path /=
sysroots/cortexa9hf-neon-poky-linux-gnueabi</font></div><div class=3D"gmail=
_default" style=3D"font-family:&quot;comic sans ms&quot;,sans-serif;font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-family:&quot=
;comic sans ms&quot;,sans-serif;font-size:small">if ($ENV{SDKTARGETSYSROOT}=
 MATCHES &quot;/sysroots/([a-zA-Z0-9_-]+)-.+-.+&quot;)</div><div class=3D"g=
mail_default" style=3D"font-family:&quot;comic sans ms&quot;,sans-serif">=
=C2=A0 set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})</div><div class=3D"gmai=
l_default" style=3D"font-family:&quot;comic sans ms&quot;,sans-serif">endif=
()</div><div class=3D"gmail_default" style=3D"font-family:&quot;comic sans =
ms&quot;,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:&quot;comic sans ms&quot;,sans-serif">Thanks,</div><div class=3D"gmai=
l_default" style=3D"font-family:&quot;comic sans ms&quot;,sans-serif">Chait=
anya</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Tue, Feb 13, 2018 at 9:50 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.sal=
vador@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D"">On Tue, Feb 13, 2018 at 4:58 AM, Alexander Kanavin<br>
&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@=
linux.<wbr>intel.com</a>&gt; wrote:<br>
&gt; On 02/12/2018 11:06 PM, Chaitanya Cherukuri wrote:<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m new to this forum and didn&#39;t know to where to report a=
n issue. I&#39;m<br>
&gt;&gt; contacting you regarding the patch ID 132816 ( cmake: improve<br>
&gt;&gt; CMAKE_SYSTEM_PROCESSOR assignment in nativesdk).<br>
&gt;&gt;<br>
&gt;&gt; If SDKTARGETSYSROOT is &quot;/sysroots/cortexa9hf-neon-<wbr>poky-l=
inux-gnueabi&quot; this<br>
&gt;&gt; patch sets the CMAKE_SYSTEM_PROCESSOR as=C2=A0 &quot;cortexa9hf-ne=
on-poky&quot;=C2=A0 instead of<br>
&gt;&gt; &quot;cortexa9hf-neon&quot;.<br>
&gt;&gt;<br>
&gt;&gt; This patch works if SDKTARGETSYSROOT is &quot;/sysroots/core2-32-p=
oky-<wbr>linux&quot;.<br>
&gt;<br>
&gt; I guess this one is for Otavio Salvador, the cmake recipe maintainer?<=
br>
<br>
</span>I had acked and test the patch. <a href=3D"https://patchwork.openemb=
edded.org/patch/132816/" rel=3D"noreferrer" target=3D"_blank">https://patch=
work.<wbr>openembedded.org/patch/132816/</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><i><font face=3D"comic sans ms,sans-serif">Chaitanya Cheruku=
ri</font></i></div>
</div></div>
</div>

--f4f5e80a3f64be229205653fcc30--
