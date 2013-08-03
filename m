Return-Path: <lpapp@archlinux.us>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id E44046A9E1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 09:11:09 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i10so3102460oag.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 02:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4Jm9dWA4q3dFtIYTzZrmOesaKGwGoHVP3K7aRP0EdFk=;
	b=AY9jGNSvgEBX4WZMdlh0xuXvHE2Yqvb/dKAsdz0QUFRkCktrCSsEX02ocEN6OkpDv7
	eKEcN2WHveQMHu4BYCLjQara32wrvc+uA2q1EXDGUSMa0xA9Xnu/upGjI+etoDuVqgpB
	9VwPgP9mhoYzkZsbuUd+KGKGgL3LCdqZW4i9O/TBlr2I16OM+HkmN4gGAgm+IsJKV4OS
	0lwD39PVUrKltWTt6hJLPbgo8Oxb6MCtQcPFR86VbekXv0R7EoEYTzmJ+/vf/09rBL9c
	B0Xm79Ab0m3UP4oS8tLVLinztFLcvjdMtUaS1F9KyAkKqa0uhA58pmrhe3esDjZMHy3y
	mwYw==
X-Gm-Message-State: ALoCoQl2SSNFSnacPTUNWLObp/xBIRZcze0uyahShTqfe0UG2trf6+cfJgj+dU82KC8xzI+l1xRI
MIME-Version: 1.0
X-Received: by 10.50.4.66 with SMTP id i2mr271916igi.43.1375521069958; Sat, 03
	Aug 2013 02:11:09 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.42.76.199 with HTTP; Sat, 3 Aug 2013 02:11:09 -0700 (PDT)
In-Reply-To: <1375516603-9720-1-git-send-email-net147@gmail.com>
References: <1375516603-9720-1-git-send-email-net147@gmail.com>
Date: Sat, 3 Aug 2013 10:11:09 +0100
X-Google-Sender-Auth: c1nviHxc2UoTDa1lBYLk9JbcYY8
Message-ID: <CAOMwXhPTMUKQ+H34k_6pdTPXk=Luy4VPQ8N=kd3hT4CTqJ8qJg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Jonathan Liu <net147@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: add upstream QTBUG-32534 patch for QHttpMultiPart upload corruption
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
X-List-Received-Date: Sat, 03 Aug 2013 09:11:10 -0000
Content-Type: multipart/alternative; boundary=001a11c2a6f6c1a49404e3077412

--001a11c2a6f6c1a49404e3077412
Content-Type: text/plain; charset=ISO-8859-1

You need this fix right in your third-party project that it cannot wait
until the next upstream bugfix release, or if not you, someone else
requested it on the Yocto bugtracker?


On Sat, Aug 3, 2013 at 8:56 AM, Jonathan Liu <net147@gmail.com> wrote:

> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/recipes-qt/qt4/qt4-4.8.5.inc                  |  1 +
>  ...art-fix-data-corruption-in-readData-metho.patch | 43
> ++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644
> meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
>
> diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc
> b/meta/recipes-qt/qt4/qt4-4.8.5.inc
> index d05b174..95a14f3 100644
> --- a/meta/recipes-qt/qt4/qt4-4.8.5.inc
> +++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc
> @@ -22,6 +22,7 @@ SRC_URI = "
> http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
>             file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch \
>             file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
>
> file://0022-Fix-drawing-of-0-width-polylines-from-outside-the-de.patch \
> +
> file://0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch \
>             file://0027-tools.pro-disable-qmeegographicssystemhelper.patch
> \
>             file://g++.conf \
>             file://linux.conf \
> diff --git
> a/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
> b/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
> new file mode 100644
> index 0000000..c3c002e
> --- /dev/null
> +++
> b/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption-in-readData-metho.patch
> @@ -0,0 +1,43 @@
> +From 1f40ed553e618c3b0511c7db4b4fd26c2d2b65bf Mon Sep 17 00:00:00 2001
> +From: Peter Hartmann <phartmann@blackberry.com>
> +Date: Thu, 25 Jul 2013 12:05:29 -0400
> +Subject: [PATCH] QHttpMultiPart: fix data corruption in readData method
> +
> +When readData() is called repeatedly, we need to keep track which
> +part of the multipart message we are currently reading from.
> +Hereby we also need to take the boundary size into account, and not
> +only the size of the multipart; otherwise we would skip a not
> +completely read part. This would then later lead to advancing the
> +read pointer by negative indexes and data loss.
> +
> +Upstream-Status: Accepted [
> https://codereview.qt-project.org/#change,61861]
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +Task-number: QTBUG-32534
> +Change-Id: Ibb6dff16adaf4ea67181d23d1d0c8459e33a0ed0
> +Reviewed-by: Jonathan Liu <net147@gmail.com>
> +Reviewed-by: Shane Kearns <shane.kearns@accenture.com>
> +(cherry picked from qtbase/af96c6fed931564c95037539f07e9c8e33c69529)
> +Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
> +---
> + src/network/access/qhttpmultipart.cpp          |  3 +-
> + tests/auto/qnetworkreply/tst_qnetworkreply.cpp | 44
> ++++++++++++++++++++++++++
> + 2 files changed, 46 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/network/access/qhttpmultipart.cpp
> b/src/network/access/qhttpmultipart.cpp
> +index 635129a..b25e917 100644
> +--- a/src/network/access/qhttpmultipart.cpp
> ++++ b/src/network/access/qhttpmultipart.cpp
> +@@ -488,7 +488,8 @@ qint64 QHttpMultiPartIODevice::readData(char *data,
> qint64 maxSize)
> +
> +     // skip the parts we have already read
> +     while (index < multiPart->parts.count() &&
> +-           readPointer >= partOffsets.at(index) + multiPart->parts.at
> (index).d->size())
> ++           readPointer >= partOffsets.at(index) + multiPart->parts.at
> (index).d->size()
> ++           + multiPart->boundary.count() + 6) // 6 == 2 boundary dashes,
> \r\n after boundary, \r\n after multipart
> +         index++;
> +
> +     // read the data
> +--
> +1.8.3.4
> +
> --
> 1.8.3.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c2a6f6c1a49404e3077412
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You need this fix right in your third-party project that i=
t cannot wait until the next upstream bugfix release, or if not you, someon=
e else requested it on the Yocto bugtracker?</div><div class=3D"gmail_extra=
">
<br><br><div class=3D"gmail_quote">On Sat, Aug 3, 2013 at 8:56 AM, Jonathan=
 Liu <span dir=3D"ltr">&lt;<a href=3D"mailto:net147@gmail.com" target=3D"_b=
lank">net147@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@=
gmail.com</a>&gt;<br>
---<br>
=A0meta/recipes-qt/qt4/qt4-4.8.5.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A01 +<br>
=A0...art-fix-data-corruption-in-readData-metho.patch | 43 ++++++++++++++++=
++++++<br>
=A02 files changed, 44 insertions(+)<br>
=A0create mode 100644 meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix=
-data-corruption-in-readData-metho.patch<br>
<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5.inc b/meta/recipes-qt/qt4/qt4-4.=
8.5.inc<br>
index d05b174..95a14f3 100644<br>
--- a/meta/recipes-qt/qt4/qt4-4.8.5.inc<br>
+++ b/meta/recipes-qt/qt4/qt4-4.8.5.inc<br>
@@ -22,6 +22,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.qt-project.o=
rg/official_releases/qt/4.8/${PV}/qt-ever" target=3D"_blank">http://downloa=
d.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever</a><br>
=A0 =A0 =A0 =A0 =A0 =A0 file://0019-Fixes-for-gcc-4.7.0-particularly-on-qem=
ux86.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://0020-webkit-disable-the-fuse-ld-gold-flag.pa=
tch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://0022-Fix-drawing-of-0-width-polylines-from-o=
utside-the-de.patch \<br>
+ =A0 =A0 =A0 =A0 =A0 file://0023-QHttpMultiPart-fix-data-corruption-in-rea=
dData-metho.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://0027-tools.pro-disable-qmeegographicssystemh=
elper.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://g++.conf \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://linux.conf \<br>
diff --git a/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-cor=
ruption-in-readData-metho.patch b/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpM=
ultiPart-fix-data-corruption-in-readData-metho.patch<br>
new file mode 100644<br>
index 0000000..c3c002e<br>
--- /dev/null<br>
+++ b/meta/recipes-qt/qt4/qt4-4.8.5/0023-QHttpMultiPart-fix-data-corruption=
-in-readData-metho.patch<br>
@@ -0,0 +1,43 @@<br>
+From 1f40ed553e618c3b0511c7db4b4fd26c2d2b65bf Mon Sep 17 00:00:00 2001<br>
+From: Peter Hartmann &lt;<a href=3D"mailto:phartmann@blackberry.com">phart=
mann@blackberry.com</a>&gt;<br>
+Date: Thu, 25 Jul 2013 12:05:29 -0400<br>
+Subject: [PATCH] QHttpMultiPart: fix data corruption in readData method<br=
>
+<br>
+When readData() is called repeatedly, we need to keep track which<br>
+part of the multipart message we are currently reading from.<br>
+Hereby we also need to take the boundary size into account, and not<br>
+only the size of the multipart; otherwise we would skip a not<br>
+completely read part. This would then later lead to advancing the<br>
+read pointer by negative indexes and data loss.<br>
+<br>
+Upstream-Status: Accepted [<a href=3D"https://codereview.qt-project.org/#c=
hange,61861" target=3D"_blank">https://codereview.qt-project.org/#change,61=
861</a>]<br>
+Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147=
@gmail.com</a>&gt;<br>
+<br>
+Task-number: QTBUG-32534<br>
+Change-Id: Ibb6dff16adaf4ea67181d23d1d0c8459e33a0ed0<br>
+Reviewed-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@g=
mail.com</a>&gt;<br>
+Reviewed-by: Shane Kearns &lt;<a href=3D"mailto:shane.kearns@accenture.com=
">shane.kearns@accenture.com</a>&gt;<br>
+(cherry picked from qtbase/af96c6fed931564c95037539f07e9c8e33c69529)<br>
+Reviewed-by: Thiago Macieira &lt;<a href=3D"mailto:thiago.macieira@intel.c=
om">thiago.macieira@intel.com</a>&gt;<br>
+---<br>
+ src/network/access/qhttpmultipart.cpp =A0 =A0 =A0 =A0 =A0| =A03 +-<br>
+ tests/auto/qnetworkreply/tst_qnetworkreply.cpp | 44 +++++++++++++++++++++=
+++++<br>
+ 2 files changed, 46 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/network/access/qhttpmultipart.cpp b/src/network/access/qh=
ttpmultipart.cpp<br>
+index 635129a..b25e917 100644<br>
+--- a/src/network/access/qhttpmultipart.cpp<br>
++++ b/src/network/access/qhttpmultipart.cpp<br>
+@@ -488,7 +488,8 @@ qint64 QHttpMultiPartIODevice::readData(char *data, qi=
nt64 maxSize)<br>
+<br>
+ =A0 =A0 // skip the parts we have already read<br>
+ =A0 =A0 while (index &lt; multiPart-&gt;parts.count() &amp;&amp;<br>
+- =A0 =A0 =A0 =A0 =A0 readPointer &gt;=3D partOffsets.at(index) + multiPar=
t-&gt;<a href=3D"http://parts.at" target=3D"_blank">parts.at</a>(index).d-&=
gt;size())<br>
++ =A0 =A0 =A0 =A0 =A0 readPointer &gt;=3D partOffsets.at(index) + multiPar=
t-&gt;<a href=3D"http://parts.at" target=3D"_blank">parts.at</a>(index).d-&=
gt;size()<br>
++ =A0 =A0 =A0 =A0 =A0 + multiPart-&gt;boundary.count() + 6) // 6 =3D=3D 2 =
boundary dashes, \r\n after boundary, \r\n after multipart<br>
+ =A0 =A0 =A0 =A0 index++;<br>
+<br>
+ =A0 =A0 // read the data<br>
+--<br>
+1.8.3.4<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.3.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11c2a6f6c1a49404e3077412--
