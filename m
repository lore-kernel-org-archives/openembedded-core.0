Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0848B60767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 07:35:02 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id x23so167395pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 23:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=rYdN5RVwcIUlVfUIcPjKNV0lBjqoRSoZ36BZfClM4Yk=;
	b=YwIBGo09upH4hW/IWDeuBGxwQ3epX03R3y9ioOTzZZvKEXSO9sjs+pUGw/vKjUKCdc
	P42r5k7wNocSYRyzV1zSBkdo17JxeS1MUH8oCBjL0eWbzZj/cy2q+rxEHdgU9O0sYWCH
	cgDNPbDvgTl9H/7irQ1xeVkhqKpmiIqZSwlaFwiVAF97z28+mD3nQympbn/pLa1jbg03
	NHEbDlF8r70S+MDn5N3jG9HXxuhIqpHZiPot52w27Ndb4w0BURpPbYkhCgY7ZQRv8ohV
	M0msYzQbCz2wnwgPfOsOi4LJCELMivo8/6QQhnr6VDvYIR66D1JOj6MKK1BQgcmO9mxd
	faUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=rYdN5RVwcIUlVfUIcPjKNV0lBjqoRSoZ36BZfClM4Yk=;
	b=H6av1Vxkgx9cm8JAymKTM+4K2QWOwjvpCDLhM9KE3XdZ0doK8Id00K1pKOTYS+NJvB
	W6YSgl+AYrDg5tUZaSpXv+hd89mIJ1oy0im+AA7cigDnXWVWJ5oqjqTGdQwRarp1q60K
	jgxgO6gw9iIKwOSdCAZmlLTsYFJlvWTXteyDBbUZmiwWnZEG3obRbo0QTMo5murqcssa
	18GGzDPdonf9OF+cIB8oLs/uDy6CmSCBogv26Q++dDSBhlJkVRuidZcjRaUl2MpkvCPt
	j9c2HXr6MlyADwYJK6ymzFIYduzsxLK6IhydI6I8D3PkU+hKFJBJ27yzNExQN22P653T
	QtTg==
X-Gm-Message-State: AKaTC02MAGyBbb4qpV9bh0RfRFpu2fdyrvPOuqsEUHQ2+hYkgrxKYYbrmUWfsRWffiDTnw==
X-Received: by 10.84.218.8 with SMTP id q8mr183267761pli.138.1481528104168;
	Sun, 11 Dec 2016 23:35:04 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:7446:7fee:3bbb:1fb9?
	([2601:646:8882:b8c:7446:7fee:3bbb:1fb9])
	by smtp.gmail.com with ESMTPSA id
	s3sm74098170pfe.27.2016.12.11.23.35.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Dec 2016 23:35:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <96C91F30-5FE1-4CB5-A39A-47B02F310183@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Sun, 11 Dec 2016 23:35:25 -0800
In-Reply-To: <CAHiDW_F_o8X6B6y4JuLBMKUnLmhXqREnD1tJObDZCUPTedyE5w@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1481106793-126356-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0Lbv+uXP4hy7huVCsW+3Lhf8NZRWX=iEquAbnG2YvqDpvg@mail.gmail.com>
	<CAHiDW_F_o8X6B6y4JuLBMKUnLmhXqREnD1tJObDZCUPTedyE5w@mail.gmail.com>
X-Mailer: Apple Mail (2.3251)
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
X-List-Received-Date: Mon, 12 Dec 2016 07:35:03 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_264F2358-ED6A-4268-B36A-D4DB650EFC51"

--Apple-Mail=_264F2358-ED6A-4268-B36A-D4DB650EFC51
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 7, 2016, at 3:20 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>=20
> Since you're already resending: please set "diff.renames" in your git =
configuration to get smaller diffs.
> Example from my ~/.gitconfig:
>=20
> [diff]
>         renames =3D true

if you want to do this, then its better to set renames =3D copies
since many a times we rename recipes when upgrading this comes quite =
handy


>=20
>=20
> Thanks,
>   Jussi
>=20
>=20
> On 7 December 2016 at 13:05, Burton, Ross <ross.burton@intel.com =
<mailto:ross.burton@intel.com>> wrote:
> Can you resend with a proper From: address please not just root?
>=20
> Ross
>=20
> On 7 December 2016 at 10:33, root <zhengrq.fnst@cn.fujitsu.com =
<mailto:zhengrq.fnst@cn.fujitsu.com>> wrote:
> Upgrade xkeyboard-config from 2.18 to 2.19
>=20
> Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com =
<mailto:zhengrq.fnst@cn.fujitsu.com>>
> ---
>  .../xorg-lib/xkeyboard-config_2.18.bb =
<http://xkeyboard-config_2.18.bb/>              | 31 =
----------------------
>  .../xorg-lib/xkeyboard-config_2.19.bb =
<http://xkeyboard-config_2.19.bb/>              | 31 =
++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 31 deletions(-)
>  delete mode 100644 =
meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb =
<http://xkeyboard-config_2.18.bb/>
>  create mode 100644 =
meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb =
<http://xkeyboard-config_2.19.bb/>
>=20
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb =
<http://xkeyboard-config_2.18.bb/> =
b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb =
<http://xkeyboard-config_2.18.bb/>
> deleted file mode 100644
> index 79fcbd8..0000000
> --- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb =
<http://xkeyboard-config_2.18.bb/>
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY =3D "Keyboard configuration database for X Window"
> -
> -DESCRIPTION =3D "The non-arch keyboard configuration database for X \
> -Window.  The goal is to provide the consistent, well-structured, \
> -frequently released open source of X keyboard configuration data for =
X \
> -Window System implementations.  The project is targeted to XKB-based =
\
> -systems."
> -
> -HOMEPAGE =3D "http://freedesktop.org/wiki/Software/XKeyboardConfig =
<http://freedesktop.org/wiki/Software/XKeyboardConfig>"
> -BUGTRACKER =3D =
"https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxkeyboard-config =
<https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxkeyboard-config>"
> -
> -LICENSE =3D "MIT & MIT-style"
> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0e7f21ca7db975c63467d2e7624a12f9"
> -
> -SRC_URI =3D =
"${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
> -SRC_URI[md5sum] =3D "c28cf45616bfec276879360bc36c6b27"
> -SRC_URI[sha256sum] =3D =
"c41d917d6c8a59feb7ccbda51c40a6ada824fdd1e9684b52dd48c9530617ddd0"
> -
> -SECTION =3D "x11/libs"
> -DEPENDS =3D "intltool-native virtual/gettext util-macros =
libxslt-native"
> -
> -EXTRA_OECONF =3D "--with-xkb-rules-symlink=3Dxorg =
--disable-runtime-deps"
> -
> -FILES_${PN} +=3D "${datadir}/X11/xkb"
> -
> -inherit autotools pkgconfig gettext
> -
> -do_install_append () {
> -    install -d ${D}${datadir}/X11/xkb/compiled
> -    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> -}
> diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb =
<http://xkeyboard-config_2.19.bb/> =
b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb =
<http://xkeyboard-config_2.19.bb/>
> new file mode 100644
> index 0000000..79fcbd8
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb =
<http://xkeyboard-config_2.19.bb/>
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "Keyboard configuration database for X Window"
> +
> +DESCRIPTION =3D "The non-arch keyboard configuration database for X \
> +Window.  The goal is to provide the consistent, well-structured, \
> +frequently released open source of X keyboard configuration data for =
X \
> +Window System implementations.  The project is targeted to XKB-based =
\
> +systems."
> +
> +HOMEPAGE =3D "http://freedesktop.org/wiki/Software/XKeyboardConfig =
<http://freedesktop.org/wiki/Software/XKeyboardConfig>"
> +BUGTRACKER =3D =
"https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxkeyboard-config =
<https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxkeyboard-config>"
> +
> +LICENSE =3D "MIT & MIT-style"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0e7f21ca7db975c63467d2e7624a12f9"
> +
> +SRC_URI =3D =
"${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "c28cf45616bfec276879360bc36c6b27"
> +SRC_URI[sha256sum] =3D =
"c41d917d6c8a59feb7ccbda51c40a6ada824fdd1e9684b52dd48c9530617ddd0"
> +
> +SECTION =3D "x11/libs"
> +DEPENDS =3D "intltool-native virtual/gettext util-macros =
libxslt-native"
> +
> +EXTRA_OECONF =3D "--with-xkb-rules-symlink=3Dxorg =
--disable-runtime-deps"
> +
> +FILES_${PN} +=3D "${datadir}/X11/xkb"
> +
> +inherit autotools pkgconfig gettext
> +
> +do_install_append () {
> +    install -d ${D}${datadir}/X11/xkb/compiled
> +    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
> +}
> --
> 2.7.4
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_264F2358-ED6A-4268-B36A-D4DB650EFC51
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Dec 7, 2016, at 3:20 AM, Jussi Kukkonen &lt;<a =
href=3D"mailto:jussi.kukkonen@intel.com" =
class=3D"">jussi.kukkonen@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Since you're already resending: please set "diff.renames" in =
your git configuration to get smaller diffs.<div class=3D"">Example from =
my ~/.gitconfig:</div><div class=3D""><br class=3D""></div><div =
class=3D""><div class=3D""><div class=3D"">[diff]</div><div =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; renames =3D =
true</div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>if you want to do this, then its better to set =
renames =3D copies</div><div>since many a times we rename recipes when =
upgrading this comes quite handy</div><div><br class=3D""></div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D""><div class=3D""><br =
class=3D""></div><div class=3D""><br class=3D""><div =
class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">&nbsp; =
Jussi</div><div class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra"><br class=3D""><div class=3D"gmail_quote">On 7 =
December 2016 at 13:05, Burton, Ross <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank" =
class=3D"">ross.burton@intel.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr" class=3D"">Can you resend with a proper From: address please =
not just root?<span class=3D"gmail-HOEnZb"><font color=3D"#888888" =
class=3D""><div class=3D""><br class=3D""></div><div =
class=3D"">Ross</div></font></span></div><div class=3D"gmail-HOEnZb"><div =
class=3D"gmail-h5"><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 7 December 2016 at 10:33, root <span dir=3D"ltr" =
class=3D"">&lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" =
target=3D"_blank" class=3D"">zhengrq.fnst@cn.fujitsu.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Upgrade xkeyboard-config from 2.18 to =
2.19<br class=3D"">
<br class=3D"">
Signed-off-by: zhengruoqin &lt;<a =
href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank" =
class=3D"">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br class=3D"">
---<br class=3D"">
&nbsp;.../xorg-lib/<a href=3D"http://xkeyboard-config_2.18.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">xkeyboard-<wbr =
class=3D"">config_2.18.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | 31 ----------------------<br class=3D"">
&nbsp;.../xorg-lib/<a href=3D"http://xkeyboard-config_2.19.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">xkeyboard-<wbr =
class=3D"">config_2.19.bb</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; | 31 ++++++++++++++++++++++<br class=3D"">
&nbsp;2 files changed, 31 insertions(+), 31 deletions(-)<br class=3D"">
&nbsp;delete mode 100644 meta/recipes-graphics/xorg-lib<wbr class=3D"">/<a=
 href=3D"http://xkeyboard-config_2.18.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">xkeyboard-config_2.18.bb</a><br class=3D"">
&nbsp;create mode 100644 meta/recipes-graphics/xorg-lib<wbr class=3D"">/<a=
 href=3D"http://xkeyboard-config_2.19.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">xkeyboard-config_2.19.bb</a><br class=3D"">
<br class=3D"">
diff --git a/meta/recipes-graphics/xorg-l<wbr class=3D"">ib/<a =
href=3D"http://xkeyboard-config_2.18.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">xkeyboard-config_2.18.bb</a> =
b/meta/recipes-graphics/xorg-l<wbr class=3D"">ib/<a =
href=3D"http://xkeyboard-config_2.18.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">xkeyboard-config_2.18.bb</a><br class=3D"">
deleted file mode 100644<br class=3D"">
index 79fcbd8..0000000<br class=3D"">
--- a/meta/recipes-graphics/xorg-l<wbr class=3D"">ib/<a =
href=3D"http://xkeyboard-config_2.18.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">xkeyboard-config_2.18.bb</a><br class=3D"">
+++ /dev/null<br class=3D"">
@@ -1,31 +0,0 @@<br class=3D"">
-SUMMARY =3D "Keyboard configuration database for X Window"<br class=3D"">=

-<br class=3D"">
-DESCRIPTION =3D "The non-arch keyboard configuration database for X =
\<br class=3D"">
-Window.&nbsp; The goal is to provide the consistent, well-structured, =
\<br class=3D"">
-frequently released open source of X keyboard configuration data for X =
\<br class=3D"">
-Window System implementations.&nbsp; The project is targeted to =
XKB-based \<br class=3D"">
-systems."<br class=3D"">
-<br class=3D"">
-HOMEPAGE =3D "<a =
href=3D"http://freedesktop.org/wiki/Software/XKeyboardConfig" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://freedesktop.org/wiki/S<wbr =
class=3D"">oftware/XKeyboardConfig</a>"<br class=3D"">
-BUGTRACKER =3D "<a =
href=3D"https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxkeyboard-con=
fig" rel=3D"noreferrer" target=3D"_blank" =
class=3D"">https://bugs.freedesktop.org/<wbr =
class=3D"">enter_bug.cgi?product=3Dxkeyboar<wbr =
class=3D"">d-config</a>"<br class=3D"">
-<br class=3D"">
-LICENSE =3D "MIT &amp; MIT-style"<br class=3D"">
-LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D0e7f21ca7d" =
class=3D"">file://COPYING;md5=3D0e7f21ca7d</a><wbr =
class=3D"">b975c63467d2e7624a12f9"<br class=3D"">
-<br class=3D"">
-SRC_URI =3D "${XORG_MIRROR}/individual/dat<wbr =
class=3D"">a/xkeyboard-config/${BPN}-${<wbr class=3D"">PV}.tar.bz2"<br =
class=3D"">
-SRC_URI[md5sum] =3D "c28cf45616bfec276879360bc36c6<wbr class=3D"">b27"<br=
 class=3D"">
-SRC_URI[sha256sum] =3D "c41d917d6c8a59feb7ccbda51c40a<wbr =
class=3D"">6ada824fdd1e9684b52dd48c953061<wbr class=3D"">7ddd0"<br =
class=3D"">
-<br class=3D"">
-SECTION =3D "x11/libs"<br class=3D"">
-DEPENDS =3D "intltool-native virtual/gettext util-macros =
libxslt-native"<br class=3D"">
-<br class=3D"">
-EXTRA_OECONF =3D "--with-xkb-rules-symlink=3Dxorg =
--disable-runtime-deps"<br class=3D"">
-<br class=3D"">
-FILES_${PN} +=3D "${datadir}/X11/xkb"<br class=3D"">
-<br class=3D"">
-inherit autotools pkgconfig gettext<br class=3D"">
-<br class=3D"">
-do_install_append () {<br class=3D"">
-&nbsp; &nbsp; install -d ${D}${datadir}/X11/xkb/compile<wbr =
class=3D"">d<br class=3D"">
-&nbsp; &nbsp; cd ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base =
xorg<br class=3D"">
-}<br class=3D"">
diff --git a/meta/recipes-graphics/xorg-l<wbr class=3D"">ib/<a =
href=3D"http://xkeyboard-config_2.19.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">xkeyboard-config_2.19.bb</a> =
b/meta/recipes-graphics/xorg-l<wbr class=3D"">ib/<a =
href=3D"http://xkeyboard-config_2.19.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">xkeyboard-config_2.19.bb</a><br class=3D"">
new file mode 100644<br class=3D"">
index 0000000..79fcbd8<br class=3D"">
--- /dev/null<br class=3D"">
+++ b/meta/recipes-graphics/xorg-l<wbr class=3D"">ib/<a =
href=3D"http://xkeyboard-config_2.19.bb/" rel=3D"noreferrer" =
target=3D"_blank" class=3D"">xkeyboard-config_2.19.bb</a><br class=3D"">
@@ -0,0 +1,31 @@<br class=3D"">
+SUMMARY =3D "Keyboard configuration database for X Window"<br class=3D"">=

+<br class=3D"">
+DESCRIPTION =3D "The non-arch keyboard configuration database for X =
\<br class=3D"">
+Window.&nbsp; The goal is to provide the consistent, well-structured, =
\<br class=3D"">
+frequently released open source of X keyboard configuration data for X =
\<br class=3D"">
+Window System implementations.&nbsp; The project is targeted to =
XKB-based \<br class=3D"">
+systems."<br class=3D"">
+<br class=3D"">
+HOMEPAGE =3D "<a =
href=3D"http://freedesktop.org/wiki/Software/XKeyboardConfig" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://freedesktop.org/wiki/S<wbr =
class=3D"">oftware/XKeyboardConfig</a>"<br class=3D"">
+BUGTRACKER =3D "<a =
href=3D"https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxkeyboard-con=
fig" rel=3D"noreferrer" target=3D"_blank" =
class=3D"">https://bugs.freedesktop.org/<wbr =
class=3D"">enter_bug.cgi?product=3Dxkeyboar<wbr =
class=3D"">d-config</a>"<br class=3D"">
+<br class=3D"">
+LICENSE =3D "MIT &amp; MIT-style"<br class=3D"">
+LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D0e7f21ca7d" =
class=3D"">file://COPYING;md5=3D0e7f21ca7d</a><wbr =
class=3D"">b975c63467d2e7624a12f9"<br class=3D"">
+<br class=3D"">
+SRC_URI =3D "${XORG_MIRROR}/individual/dat<wbr =
class=3D"">a/xkeyboard-config/${BPN}-${<wbr class=3D"">PV}.tar.bz2"<br =
class=3D"">
+SRC_URI[md5sum] =3D "c28cf45616bfec276879360bc36c6<wbr class=3D"">b27"<br=
 class=3D"">
+SRC_URI[sha256sum] =3D "c41d917d6c8a59feb7ccbda51c40a<wbr =
class=3D"">6ada824fdd1e9684b52dd48c953061<wbr class=3D"">7ddd0"<br =
class=3D"">
+<br class=3D"">
+SECTION =3D "x11/libs"<br class=3D"">
+DEPENDS =3D "intltool-native virtual/gettext util-macros =
libxslt-native"<br class=3D"">
+<br class=3D"">
+EXTRA_OECONF =3D "--with-xkb-rules-symlink=3Dxorg =
--disable-runtime-deps"<br class=3D"">
+<br class=3D"">
+FILES_${PN} +=3D "${datadir}/X11/xkb"<br class=3D"">
+<br class=3D"">
+inherit autotools pkgconfig gettext<br class=3D"">
+<br class=3D"">
+do_install_append () {<br class=3D"">
+&nbsp; &nbsp; install -d ${D}${datadir}/X11/xkb/compile<wbr =
class=3D"">d<br class=3D"">
+&nbsp; &nbsp; cd ${D}${datadir}/X11/xkb/rules &amp;&amp; ln -sf base =
xorg<br class=3D"">
+}<br class=3D"">
<span class=3D"gmail-m_634762057000644363HOEnZb"><font color=3D"#888888" =
class=3D"">--<br class=3D"">
2.7.4<br class=3D"">
<br class=3D"">
<br class=3D"">
<br class=3D"">
--<br class=3D"">
______________________________<wbr class=3D"">_________________<br =
class=3D"">
Openembedded-core mailing list<br class=3D"">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" =
target=3D"_blank" class=3D"">Openembedded-core@lists.openem<wbr =
class=3D"">bedded.org</a><br class=3D"">
<a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://lists.openembedded.org/<wbr =
class=3D"">mailman/listinfo/openembedded-<wbr class=3D"">core</a><br =
class=3D"">
</font></span></blockquote></div><br class=3D""></div>
</div></div><br class=3D"">--<br class=3D"">
______________________________<wbr class=3D"">_________________<br =
class=3D"">
Openembedded-core mailing list<br class=3D"">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.<wbr class=3D"">openembedded.org</a><br=
 class=3D"">
<a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://lists.openembedded.org/<wbr =
class=3D"">mailman/listinfo/openembedded-<wbr class=3D"">core</a><br =
class=3D"">
<br class=3D""></blockquote></div><br class=3D""></div></div></div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_264F2358-ED6A-4268-B36A-D4DB650EFC51--
