Return-Path: <andrea.adami@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 79E1660657
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 21:53:24 +0000 (UTC)
Received: by iodt126 with SMTP id t126so114768415iod.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SIOzZ+e1SeVX9DjH3R2GNAiiAzixDAHH4KyynZ2fT2s=;
	b=Wlpv877EpGep8MzITUpFrmPSv9v55fNEIJBjr9s7M5RtsaFWuS5IFUCGohens5nuRX
	hJVTdKdyutFvDR5+tbe7HJk6QANauR2HCk2ZUzUyokB0RnR2To9uF6ctxw3guD+YTjbQ
	N4EXPeccQe2/6o2+Yv+BpDH0L8AF1kfMa5eGo1KQ7c7ovbfe4OcbbIASlowLQxNbS81L
	g33rHzHN5nPdBgcC1jx9KCOpCEjSEtNBTqKXL9YRN6+LnctvNDG8JJpWH35+3ogu1IZ8
	tj3wFJrT03VL5oDfohDLEvVUaZlqfYAAwo1phDYEe+GoTzM3MQ7gaKABIGUXCi2q6mdU
	n+fQ==
MIME-Version: 1.0
X-Received: by 10.107.46.86 with SMTP id i83mr13077667ioo.121.1440280404394;
	Sat, 22 Aug 2015 14:53:24 -0700 (PDT)
Received: by 10.36.158.5 with HTTP; Sat, 22 Aug 2015 14:53:24 -0700 (PDT)
In-Reply-To: <CAAQYJAt1ErcWAXsW4wTdYVOU7GoD3fwwU6HWrypEeJe5rymOnw@mail.gmail.com>
References: <1440199709-23502-1-git-send-email-andrea.adami@gmail.com>
	<CAJ86T=XmEdEQWhpSR9nZsnqn+pZqBdZmNqtfnKfXDx52CGXaxw@mail.gmail.com>
	<CAAQYJAugiMk95tg9rKk1PXfWQ4HXZXZnHeyHbjvWSQgfJ9kAOg@mail.gmail.com>
	<CAAQYJAt1ErcWAXsW4wTdYVOU7GoD3fwwU6HWrypEeJe5rymOnw@mail.gmail.com>
Date: Sat, 22 Aug 2015 23:53:24 +0200
Message-ID: <CAAQYJAsQ6L53NtZBk84r824anhTHkWF8ALo5Q7CbmTd3=W6gaQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: add dependency on acl
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
X-List-Received-Date: Sat, 22 Aug 2015 21:53:27 -0000
Content-Type: multipart/alternative; boundary=001a1137949ee18cf2051ded6929

--001a1137949ee18cf2051ded6929
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 22, 2015 at 11:50 AM, Andrea Adami <andrea.adami@gmail.com>
wrote:

>
>
> On Sat, Aug 22, 2015 at 11:47 AM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
>
>>
>>
>> On Sat, Aug 22, 2015 at 2:44 AM, Andre McCurdy <armccurdy@gmail.com>
>> wrote:
>>
>>> On Fri, Aug 21, 2015 at 4:28 PM, Andrea Adami <andrea.adami@gmail.com>
>>> wrote:
>>> > After commit 24fde4d do_compile fails:
>>> >
>>> > | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
>>> > |  #include <sys/acl.h>
>>> >
>>> > Adding acl to the list of dependencies fixes the build.
>>>
>>> Unconditionally enabling xattr and acl support is OK for the native
>>> build, but for the target both should probably be conditional on their
>>> respective DISTRO_FEATURES.
>>>
>>
>> I can agree, acl is one distro feature but atm it is not used by nodistro
>> and poky.
>> So the patch unconditionally  -DWITHOUT_XATTR seems wrong...this should
>> be done only if acl is used.
>>
>
>
> ofc I meant unconditionally removing -DWITHOUT_XATTR
> ( commit24fde4d983cc8f056177de6c1ad308369f6279ad )
> <http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/mtd/mtd-utils_git.bb?id=24fde4d983cc8f056177de6c1ad308369f6279ad>
>
>
>>
>> Andrea
>>
>>
>>
>>>
>>>
>>> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> > ---
>>> >  meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
>>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>>> >
>>> > diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb
>>> b/meta/recipes-devtools/mtd/mtd-utils_git.bb
>>> > index 8d4892a..72ce9ed 100644
>>> > --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
>>> > +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
>>> > @@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
>>> >  LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>>> >
>>> file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
>>> >
>>> > -DEPENDS = "zlib lzo e2fsprogs util-linux"
>>> > +DEPENDS = "zlib lzo e2fsprogs util-linux acl"
>>> >
>>> >  PV = "1.5.1+git${SRCPV}"
>>> >
>>> > --
>>> > 1.9.1
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-core mailing list
>>> > Openembedded-core@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>
Please ignore, patch v2 will be sent now.
Cheers

Andrea

--001a1137949ee18cf2051ded6929
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Aug 22, 2015 at 11:50 AM, Andrea Adami <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:andrea.adami@gmail.com" target=3D"_blank">andrea.adami@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span cla=
ss=3D"">On Sat, Aug 22, 2015 at 11:47 AM, Andrea Adami <span dir=3D"ltr">&l=
t;<a href=3D"mailto:andrea.adami@gmail.com" target=3D"_blank">andrea.adami@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n>On Sat, Aug 22, 2015 at 2:44 AM, Andre McCurdy <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Fri, Aug 21,=
 2015 at 4:28 PM, Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.com=
" target=3D"_blank">andrea.adami@gmail.com</a>&gt; wrote:<br>
&gt; After commit 24fde4d do_compile fails:<br>
&gt;<br>
&gt; | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or director=
y<br>
&gt; |=C2=A0 #include &lt;sys/acl.h&gt;<br>
&gt;<br>
&gt; Adding acl to the list of dependencies fixes the build.<br>
<br>
</span>Unconditionally enabling xattr and acl support is OK for the native<=
br>
build, but for the target both should probably be conditional on their<br>
respective DISTRO_FEATURES.<br></blockquote><div><br></div></span><div>I ca=
n agree, acl is one distro feature but atm it is not used by nodistro and p=
oky.<br></div><div>So the patch unconditionally=C2=A0 -DWITHOUT_XATTR seems=
 wrong...this should be done only if acl is used.<span><font color=3D"#8888=
88"><br></font></span></div></div></div></div></blockquote><div><br><br></d=
iv></span><div>ofc I meant unconditionally removing -DWITHOUT_XATTR<br>( co=
mmit<a href=3D"http://cgit.openembedded.org/openembedded-core/commit/meta/r=
ecipes-devtools/mtd/mtd-utils_git.bb?id=3D24fde4d983cc8f056177de6c1ad308369=
f6279ad" target=3D"_blank">24fde4d983cc8f056177de6c1ad308369f6279ad )</a></=
div><span class=3D""><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><span=
><font color=3D"#888888"></font></span></div><span><font color=3D"#888888">=
<div><br></div><div>Andrea<br></div></font></span><span><div><br>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<div><div><br>
<br>
&gt; Signed-off-by: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.c=
om" target=3D"_blank">andrea.adami@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git=
.bb" rel=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> b/meta/recip=
es-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mtd-utils_git.bb</a><br>
&gt; index 8d4892a..72ce9ed 100644<br>
&gt; --- a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;GPLv2+&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff0215e8d=
672dc4c32c317bb3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://include/common.h;beginline=3D1;endline=3D17;md5=3Dba05b07912a=
44ea2bf81ce409380049c&quot;<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;zlib lzo e2fsprogs util-linux&quot;<br>
&gt; +DEPENDS =3D &quot;zlib lzo e2fsprogs util-linux acl&quot;<br>
&gt;<br>
&gt;=C2=A0 PV =3D &quot;1.5.1+git${SRCPV}&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
</div></div><span><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</font></span></blockquote></span></div><br></div></div>
</blockquote></span></div><br></div></div>
</blockquote></div><br></div><div class=3D"gmail_extra">Please ignore, patc=
h v2 will be sent now.<br></div><div class=3D"gmail_extra">Cheers<br><br></=
div><div class=3D"gmail_extra">Andrea<br></div><div class=3D"gmail_extra"><=
br></div></div>

--001a1137949ee18cf2051ded6929--
