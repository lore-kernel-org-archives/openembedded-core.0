Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7845971A6D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 11:21:05 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id n6so375258488qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2016 03:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s9QhJmUTdnLd2c+sgpIOVEid77s/l+L7sohxf1AsTbY=;
	b=qVPFDJxFvdfsPUW6LK/dSTeiw3IoBgBC9do1gpAj8R4ut3RKw0YaP5Vj8O+XfRTp9r
	l0l7ugOpn2u8jREKyIB/LhkhTOz9WnZGJaM0rfO3CAxjR4vuUL29To0nIzZKr0ujDKXn
	tbGQzROflZa8qekio+n/wR9m9/2js7cBiH5GqOHTgc+l446rrernwTe1/lGBlLJWruGK
	0PkgGIkeqd3HIGTB/Lro4QL8tHjgAOgk0Kn3vsYCFJZxboNYhjFkltjTskeEm/fS+GuQ
	2UK110yRT2+5asqmG3UpleQMRvn86dIe+VCQmJJm4YZjXMvVj3psID+HrQQ3Vu9d8etJ
	jOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s9QhJmUTdnLd2c+sgpIOVEid77s/l+L7sohxf1AsTbY=;
	b=QaMt1re2kOV6Bo/IA6pTymoZip6rk489v7JqSAg8bvwIxCBqOUt4kipT2QnWwHJ3Lu
	dPlePCHjQpzQFC/LhsSw6Vra5owWVCe/gTH0sl92aMCL5vbWozKLV5XczAxh6wskYk/w
	0Jd2yZ9X7Jiw9kaBm1zfPX0lyZMOivEIJqTT9LH5rpvKMOVtuOX5k7cGzk1+tnyojltZ
	MxZ7Qaj5dUITo+qAaN58TAaoL+xRAo9vN07kWzRbZEh1FQB9rjQlQN0JN+R/GY9/XPLs
	dZdsFzLMMVVYnHGMh7mc1xuTbDnDquJps5CvQo9pFuJRTtpYroF04sqO35q+M2ocm21S
	p0LQ==
X-Gm-Message-State: AKaTC03BA4wzDj8x2eLdH+Y3WOYqC4s+b4SGNLmb1Kt/D+fyYItqJbAIE23zKyqIIkZynTiHgeB8BpQ07CQtAZHx
X-Received: by 10.200.48.44 with SMTP id f41mr58952384qte.94.1481109666574;
	Wed, 07 Dec 2016 03:21:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Wed, 7 Dec 2016 03:20:36 -0800 (PST)
In-Reply-To: <CAJTo0Lbv+uXP4hy7huVCsW+3Lhf8NZRWX=iEquAbnG2YvqDpvg@mail.gmail.com>
References: <1481106793-126356-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0Lbv+uXP4hy7huVCsW+3Lhf8NZRWX=iEquAbnG2YvqDpvg@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 7 Dec 2016 13:20:36 +0200
Message-ID: <CAHiDW_F_o8X6B6y4JuLBMKUnLmhXqREnD1tJObDZCUPTedyE5w@mail.gmail.com>
To: zhengrq.fnst@cn.fujitsu.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: 2.18 -> 2.19
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
X-List-Received-Date: Wed, 07 Dec 2016 11:21:05 -0000
Content-Type: multipart/alternative; boundary=001a1137aa568ccf5305430fb7c2

--001a1137aa568ccf5305430fb7c2
Content-Type: text/plain; charset=UTF-8

Since you're already resending: please set "diff.renames" in your git
configuration to get smaller diffs.
Example from my ~/.gitconfig:

[diff]
        renames = true


Thanks,
  Jussi


On 7 December 2016 at 13:05, Burton, Ross <ross.burton@intel.com> wrote:

> Can you resend with a proper From: address please not just root?
>
> Ross
>
> On 7 December 2016 at 10:33, root <zhengrq.fnst@cn.fujitsu.com> wrote:
>
>> Upgrade xkeyboard-config from 2.18 to 2.19
>>
>> Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
>> ---
>>  .../xorg-lib/xkeyboard-config_2.18.bb              | 31
>> ----------------------
>>  .../xorg-lib/xkeyboard-config_2.19.bb              | 31
>> ++++++++++++++++++++++
>>  2 files changed, 31 insertions(+), 31 deletions(-)
>>  delete mode 100644 meta/recipes-graphics/xorg-lib/
>> xkeyboard-config_2.18.bb
>>  create mode 100644 meta/recipes-graphics/xorg-lib/
>> xkeyboard-config_2.19.bb
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
>> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
>> deleted file mode 100644
>> index 79fcbd8..0000000
>> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -SUMMARY = "Keyboard configuration database for X Window"
>> -
>> -DESCRIPTION = "The non-arch keyboard configuration database for X \
>> -Window.  The goal is to provide the consistent, well-structured, \
>> -frequently released open source of X keyboard configuration data for X \
>> -Window System implementations.  The project is targeted to XKB-based \
>> -systems."
>> -
>> -HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
>> -BUGTRACKER = "https://bugs.freedesktop.org/
>> enter_bug.cgi?product=xkeyboard-config"
>> -
>> -LICENSE = "MIT & MIT-style"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
>> -
>> -SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${
>> PV}.tar.bz2"
>> -SRC_URI[md5sum] = "c28cf45616bfec276879360bc36c6b27"
>> -SRC_URI[sha256sum] = "c41d917d6c8a59feb7ccbda51c40a
>> 6ada824fdd1e9684b52dd48c9530617ddd0"
>> -
>> -SECTION = "x11/libs"
>> -DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
>> -
>> -EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
>> -
>> -FILES_${PN} += "${datadir}/X11/xkb"
>> -
>> -inherit autotools pkgconfig gettext
>> -
>> -do_install_append () {
>> -    install -d ${D}${datadir}/X11/xkb/compiled
>> -    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
>> -}
>> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
>> b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
>> new file mode 100644
>> index 0000000..79fcbd8
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
>> @@ -0,0 +1,31 @@
>> +SUMMARY = "Keyboard configuration database for X Window"
>> +
>> +DESCRIPTION = "The non-arch keyboard configuration database for X \
>> +Window.  The goal is to provide the consistent, well-structured, \
>> +frequently released open source of X keyboard configuration data for X \
>> +Window System implementations.  The project is targeted to XKB-based \
>> +systems."
>> +
>> +HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
>> +BUGTRACKER = "https://bugs.freedesktop.org/
>> enter_bug.cgi?product=xkeyboard-config"
>> +
>> +LICENSE = "MIT & MIT-style"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
>> +
>> +SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${
>> PV}.tar.bz2"
>> +SRC_URI[md5sum] = "c28cf45616bfec276879360bc36c6b27"
>> +SRC_URI[sha256sum] = "c41d917d6c8a59feb7ccbda51c40a
>> 6ada824fdd1e9684b52dd48c9530617ddd0"
>> +
>> +SECTION = "x11/libs"
>> +DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
>> +
>> +EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
>> +
>> +FILES_${PN} += "${datadir}/X11/xkb"
>> +
>> +inherit autotools pkgconfig gettext
>> +
>> +do_install_append () {
>> +    install -d ${D}${datadir}/X11/xkb/compiled
>> +    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
>> +}
>> --
>> 2.7.4
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a1137aa568ccf5305430fb7c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Since you&#39;re already resending: please set &quot;diff.=
renames&quot; in your git configuration to get smaller diffs.<div>Example f=
rom my ~/.gitconfig:</div><div><br></div><div><div><div>[diff]</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 renames =3D true</div></div><div><br></div><div=
><br><div class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">=C2=
=A0 Jussi</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On 7 December 2016 at 13:05, Burton, Ros=
s <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"=
_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">Can you resend with a proper=
 From: address please not just root?<span class=3D"gmail-HOEnZb"><font colo=
r=3D"#888888"><div><br></div><div>Ross</div></font></span></div><div class=
=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On 7 December 2016 at 10:33, root <span dir=3D"ltr=
">&lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhen=
grq.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Upgrade xkeyboard-config from 2.18 to 2.19<br>
<br>
Signed-off-by: zhengruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.co=
m" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../xorg-lib/<a href=3D"http://xkeyboard-config_2.18.bb" rel=3D"noref=
errer" target=3D"_blank">xkeyboard-<wbr>config_2.18.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ----------------------<br>
=C2=A0.../xorg-lib/<a href=3D"http://xkeyboard-config_2.19.bb" rel=3D"noref=
errer" target=3D"_blank">xkeyboard-<wbr>config_2.19.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 ++++++++++++++++++++++<br>
=C2=A02 files changed, 31 insertions(+), 31 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-lib<wbr>/<a href=3D"htt=
p://xkeyboard-config_2.18.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboar=
d-config_2.18.bb</a><br>
=C2=A0create mode 100644 meta/recipes-graphics/xorg-lib<wbr>/<a href=3D"htt=
p://xkeyboard-config_2.19.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboar=
d-config_2.19.bb</a><br>
<br>
diff --git a/meta/recipes-graphics/xorg-l<wbr>ib/<a href=3D"http://xkeyboar=
d-config_2.18.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.1=
8.bb</a> b/meta/recipes-graphics/xorg-l<wbr>ib/<a href=3D"http://xkeyboard-=
config_2.18.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.18.=
bb</a><br>
deleted file mode 100644<br>
index 79fcbd8..0000000<br>
--- a/meta/recipes-graphics/xorg-l<wbr>ib/<a href=3D"http://xkeyboard-confi=
g_2.18.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.18.bb</a=
><br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-SUMMARY =3D &quot;Keyboard configuration database for X Window&quot;<br>
-<br>
-DESCRIPTION =3D &quot;The non-arch keyboard configuration database for X \=
<br>
-Window.=C2=A0 The goal is to provide the consistent, well-structured, \<br=
>
-frequently released open source of X keyboard configuration data for X \<b=
r>
-Window System implementations.=C2=A0 The project is targeted to XKB-based =
\<br>
-systems.&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://freedesktop.org/wiki/Software/XKeyboa=
rdConfig" rel=3D"noreferrer" target=3D"_blank">http://freedesktop.org/wiki/=
S<wbr>oftware/XKeyboardConfig</a>&quot;<br>
-BUGTRACKER =3D &quot;<a href=3D"https://bugs.freedesktop.org/enter_bug.cgi=
?product=3Dxkeyboard-config" rel=3D"noreferrer" target=3D"_blank">https://b=
ugs.freedesktop.org/<wbr>enter_bug.cgi?product=3Dxkeyboar<wbr>d-config</a>&=
quot;<br>
-<br>
-LICENSE =3D &quot;MIT &amp; MIT-style&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0e7f21ca7d<wbr>b975c63467d=
2e7624a12f9&quot;<br>
-<br>
-SRC_URI =3D &quot;${XORG_MIRROR}/individual/dat<wbr>a/xkeyboard-config/${B=
PN}-${<wbr>PV}.tar.bz2&quot;<br>
-SRC_URI[md5sum] =3D &quot;c28cf45616bfec276879360bc36c6<wbr>b27&quot;<br>
-SRC_URI[sha256sum] =3D &quot;c41d917d6c8a59feb7ccbda51c40a<wbr>6ada824fdd1=
e9684b52dd48c953061<wbr>7ddd0&quot;<br>
-<br>
-SECTION =3D &quot;x11/libs&quot;<br>
-DEPENDS =3D &quot;intltool-native virtual/gettext util-macros libxslt-nati=
ve&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot;--with-xkb-rules-symlink=3Dxorg --disable-runtime-d=
eps&quot;<br>
-<br>
-FILES_${PN} +=3D &quot;${datadir}/X11/xkb&quot;<br>
-<br>
-inherit autotools pkgconfig gettext<br>
-<br>
-do_install_append () {<br>
-=C2=A0 =C2=A0 install -d ${D}${datadir}/X11/xkb/compile<wbr>d<br>
-=C2=A0 =C2=A0 cd ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base xorg<=
br>
-}<br>
diff --git a/meta/recipes-graphics/xorg-l<wbr>ib/<a href=3D"http://xkeyboar=
d-config_2.19.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.1=
9.bb</a> b/meta/recipes-graphics/xorg-l<wbr>ib/<a href=3D"http://xkeyboard-=
config_2.19.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.19.=
bb</a><br>
new file mode 100644<br>
index 0000000..79fcbd8<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/xorg-l<wbr>ib/<a href=3D"http://xkeyboard-confi=
g_2.19.bb" rel=3D"noreferrer" target=3D"_blank">xkeyboard-config_2.19.bb</a=
><br>
@@ -0,0 +1,31 @@<br>
+SUMMARY =3D &quot;Keyboard configuration database for X Window&quot;<br>
+<br>
+DESCRIPTION =3D &quot;The non-arch keyboard configuration database for X \=
<br>
+Window.=C2=A0 The goal is to provide the consistent, well-structured, \<br=
>
+frequently released open source of X keyboard configuration data for X \<b=
r>
+Window System implementations.=C2=A0 The project is targeted to XKB-based =
\<br>
+systems.&quot;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"http://freedesktop.org/wiki/Software/XKeyboa=
rdConfig" rel=3D"noreferrer" target=3D"_blank">http://freedesktop.org/wiki/=
S<wbr>oftware/XKeyboardConfig</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://bugs.freedesktop.org/enter_bug.cgi=
?product=3Dxkeyboard-config" rel=3D"noreferrer" target=3D"_blank">https://b=
ugs.freedesktop.org/<wbr>enter_bug.cgi?product=3Dxkeyboar<wbr>d-config</a>&=
quot;<br>
+<br>
+LICENSE =3D &quot;MIT &amp; MIT-style&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0e7f21ca7d<wbr>b975c63467d=
2e7624a12f9&quot;<br>
+<br>
+SRC_URI =3D &quot;${XORG_MIRROR}/individual/dat<wbr>a/xkeyboard-config/${B=
PN}-${<wbr>PV}.tar.bz2&quot;<br>
+SRC_URI[md5sum] =3D &quot;c28cf45616bfec276879360bc36c6<wbr>b27&quot;<br>
+SRC_URI[sha256sum] =3D &quot;c41d917d6c8a59feb7ccbda51c40a<wbr>6ada824fdd1=
e9684b52dd48c953061<wbr>7ddd0&quot;<br>
+<br>
+SECTION =3D &quot;x11/libs&quot;<br>
+DEPENDS =3D &quot;intltool-native virtual/gettext util-macros libxslt-nati=
ve&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot;--with-xkb-rules-symlink=3Dxorg --disable-runtime-d=
eps&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;${datadir}/X11/xkb&quot;<br>
+<br>
+inherit autotools pkgconfig gettext<br>
+<br>
+do_install_append () {<br>
+=C2=A0 =C2=A0 install -d ${D}${datadir}/X11/xkb/compile<wbr>d<br>
+=C2=A0 =C2=A0 cd ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base xorg<=
br>
+}<br>
<span class=3D"gmail-m_634762057000644363HOEnZb"><font color=3D"#888888">--=
<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div></div></div>

--001a1137aa568ccf5305430fb7c2--
