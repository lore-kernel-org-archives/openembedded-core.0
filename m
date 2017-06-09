Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id BB6BE78291
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 15:46:49 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id c10so80366345qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pQD2To/DuByteZ417w7+4H5gnKdmgQrqR5008Nkcsgw=;
	b=Ii8NuU+6vxpx/3BFd7GVtlXWZ8FChChS98kbriQDvyI7HcWCrthNc6xyFZ62sYrc0r
	5p3mf+a20HzZW7lcllgpNZuZFozdhwH3+mesr3usBcfd8Xt3mFyCGKpfPpXnynzFiMnX
	w8DKvKGOLQRmcKcSHWd3BRCjrDgpp+gLhgETpG9PLlBXq/uPkNJze1DX5o2v4c9AJ9zV
	Q1ui54kEF0L6N/SoQBQvjAvh461i2W7LiR/Qy6It0HnfR8xvUCwX+8pZPMbwv4c6iFL1
	DJWpTNOKO13Ix3LFvHX/6+rE1MKCl05KIyrFlDRbFt7mrUHsamoN/3AcTNSLQ43Lsdtl
	HSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pQD2To/DuByteZ417w7+4H5gnKdmgQrqR5008Nkcsgw=;
	b=V+GRsXfArm1BkXUt1AxqXmx1lgK0VhjOXQCY0s8Zy8jD9Vsk/VW9S0MlOHQqEyWCzp
	ZybxmZ6zbQaSAYnJyB+MW+//JjkhlkCaHC/fjREZj5Exobd8flYA2O7EWJZoML1TGpQ8
	y0JBZhUjktOvJNCLx0+mFmspm+CWqZfYLM2fPt4vZCBhy79MvdKP6mQ+RF+s++nw7VPH
	fC0c3vz2ypeX3Dh3rDXfHWYwEulzQJMM+u4X6+LZeAq4EPyPenj4D431etpdcQmAS0T6
	+kUkPN+81kUM9Y/8TL0wsF9Ioe39QF8L7DMwECC4vIn8Vx/nBGtqCCz91svt7xTVm9Og
	sc3g==
X-Gm-Message-State: AODbwcB7h0PtGgNE567PPg7WY0DRPwZy5v3TIW3s9DWPojNmesqCtN5e
	C9p2JQxpIT9uOAzqkNovafc6uTeYlh21gmk=
X-Received: by 10.237.49.8 with SMTP id 8mr42241269qtg.161.1497023210951; Fri,
	09 Jun 2017 08:46:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Fri, 9 Jun 2017 08:46:30 -0700 (PDT)
In-Reply-To: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1496972359-6459-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 16:46:30 +0100
Message-ID: <CAJTo0LZUH4cKgM8bPTJQziS4p-9KrOszgqBpGHVMMuMBKi2wiA@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] flex: Upgrade to 2.6.4
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
X-List-Received-Date: Fri, 09 Jun 2017 15:46:51 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c9b1cb5b435055188e0f9"

--94eb2c0c9b1cb5b435055188e0f9
Content-Type: text/plain; charset="UTF-8"

On 9 June 2017 at 02:39, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> -SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> +SRC_URI = "https://github.com/westes/flex/files/981163/${PN}-${PV}.tar.gz
> \
>             file://run-ptest \
>             file://do_not_create_pdf_doc.patch \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch
> \
> @@ -19,8 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2
> \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', '',
> 'file://disable-tests.patch', d)} \
>             "
>

ERROR: flex-native-2.6.4-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-master/tmp/work/x86_64-linux/flex-native/2.6.4-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch do_not_create_pdf_doc.patch
patching file doc/Makefile.am
Hunk #1 FAILED at 2.
1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
Patch do_not_create_pdf_doc.patch does not apply (enforce with -f)
ERROR: flex-native-2.6.4-r0 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/data/poky-master/tmp/work/x86_64-linux/flex-native/2.6.4-r0/temp/log.do_patch.20795
ERROR: Task
(virtual:native:/home/ross/Yocto/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
failed with exit code '1'
ERROR: flex-2.6.4-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.4-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch do_not_create_pdf_doc.patch
patching file doc/Makefile.am
Hunk #1 FAILED at 2.
1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am
Patch do_not_create_pdf_doc.patch does not apply (enforce with -f)
ERROR: flex-2.6.4-r0 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.4-r0/temp/log.do_patch.20879
ERROR: Task (/home/ross/Yocto/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch)
failed with exit code '1'

Ross

--94eb2c0c9b1cb5b435055188e0f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 June 2017 at 02:39, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:fa=
n.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><div id=3D"gmail-:4lu" class=3D"gmail-a3s gma=
il-aXjCH gmail-m15c8a80d83477b26">-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/=
<span class=3D"gmail-il">flex</span>/<wbr><span class=3D"gmail-il">flex</sp=
an>-${PV}.tar.bz2 \<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/westes/flex/files/981163/$=
{PN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
westes/<wbr><span class=3D"gmail-il">flex</span>/files/981163/${PN}-${PV}.<=
wbr>tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://do_not_create_pdf_doc.<wbr=
>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tests-add-a-<wbr>targ=
et-for-building-tests-<wbr>without-runnin.patch \<br>
@@ -19,8 +19,8 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/<span class=3D"gm=
ail-il">flex</span>/<wbr><span class=3D"gmail-il">flex</span>-${PV}.tar.bz2=
 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_<=
wbr>ENABLED&#39;, &#39;1&#39;, &#39;&#39;, &#39;file://disable-tests.patch&=
#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</div></blockquote></div><b=
r><div class=3D"gmail_extra">ERROR: flex-native-2.6.4-r0 do_patch: Command =
Error: &#39;quilt --quiltrc /data/poky-master/tmp/work/x86_64-linux/flex-na=
tive/2.6.4-r0/recipe-sysroot-native/etc/quiltrc push&#39; exited with 0 =C2=
=A0Output:</div><div class=3D"gmail_extra">Applying patch do_not_create_pdf=
_doc.patch</div><div class=3D"gmail_extra">patching file doc/Makefile.am</d=
iv><div class=3D"gmail_extra">Hunk #1 FAILED at 2.</div><div class=3D"gmail=
_extra">1 out of 1 hunk FAILED -- rejects in file doc/Makefile.am</div><div=
 class=3D"gmail_extra">Patch do_not_create_pdf_doc.patch does not apply (en=
force with -f)</div><div class=3D"gmail_extra">ERROR: flex-native-2.6.4-r0 =
do_patch: Function failed: patch_do_patch</div><div class=3D"gmail_extra">E=
RROR: Logfile of failure stored in: /data/poky-master/tmp/work/x86_64-linux=
/flex-native/2.6.4-r0/temp/log.do_patch.20795</div><div class=3D"gmail_extr=
a">ERROR: Task (virtual:native:/home/ross/Yocto/poky/meta/recipes-devtools/=
flex/flex_2.6.4.bb:do_patch) failed with exit code &#39;1&#39;</div><div cl=
ass=3D"gmail_extra">ERROR: flex-2.6.4-r0 do_patch: Command Error: &#39;quil=
t --quiltrc /data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.4-r0/r=
ecipe-sysroot-native/etc/quiltrc push&#39; exited with 0 =C2=A0Output:</div=
><div class=3D"gmail_extra">Applying patch do_not_create_pdf_doc.patch</div=
><div class=3D"gmail_extra">patching file doc/Makefile.am</div><div class=
=3D"gmail_extra">Hunk #1 FAILED at 2.</div><div class=3D"gmail_extra">1 out=
 of 1 hunk FAILED -- rejects in file doc/Makefile.am</div><div class=3D"gma=
il_extra">Patch do_not_create_pdf_doc.patch does not apply (enforce with -f=
)</div><div class=3D"gmail_extra">ERROR: flex-2.6.4-r0 do_patch: Function f=
ailed: patch_do_patch</div><div class=3D"gmail_extra">ERROR: Logfile of fai=
lure stored in: /data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.4-=
r0/temp/log.do_patch.20879</div><div class=3D"gmail_extra">ERROR: Task (/ho=
me/ross/Yocto/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_patch) faile=
d with exit code &#39;1&#39;</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div></div>

--94eb2c0c9b1cb5b435055188e0f9--
