Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id E07BF74908
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 12:57:10 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 144-v6so21742381iti.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JtnmeBFQJO4yGqs7oj08fGPZO/MSA1INyCBymxuSnLg=;
	b=nFT5iOUUUVL9uPHLV5/39l9lEXmgfFkGXaLqF8j1GuoxM+dZyHS4gIVdYGIYR4bF0B
	/F40QzyVuzqewF5kYmBOSh/pxfjW8HuylTbmNDJ/yiRsKKBz/MNZLDZ/HAaQwYwMblHk
	pdO0VY67sF7QWD+0L3Rh25cw+qSLmRt8jzCq+RPvQZxHqfAD1b+Aodh2IA/CC/GGzEkf
	zuzzVHVGCrvoQV8NqLGKTfoQ34+sAUW+HSco+riXfgLfkUcEH+iWbUP/qx8G8sZGqkzl
	j0/+sGO4i2EoEQTzszAMZ2rUlF05zg15zaDcyan+n0Mbk+ftxRmI0MlyH9Vo0X1VubRE
	5/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JtnmeBFQJO4yGqs7oj08fGPZO/MSA1INyCBymxuSnLg=;
	b=fzrtO09rL1XOy5H+GPEAUxewTDYKAIh2we8IjZ4SoGyvnSLuStPEpxllJGvNmUJ/bY
	AIdOXrPCfrEThs8EiekOcFGEP9WtF1XTorQUQ3dETmABDVRPl+iait0vM3edN3j4vr6e
	1jizmPlwpYT0rLDirwTH431eUQQTqXhQvfDSWGW1aNUokbdPe7ssFW/f5rLT73tZgSiz
	10ofCnqG/tjQMYBJlDtfLE6nL/OKFiu7GZOBt2xda6mFjR7bxV6ew/WkLLsoRZ/B3BRi
	8+6lVaxppbfT3valeSjMO6eszND+A+hkCRblCouvJIVwdLlP7lpBaQaI1N22ESTwJesi
	Fhdw==
X-Gm-Message-State: ALQs6tBNq8vDzIgY2sXFGcqGufN01CjW+541LmZuWSn3YE6Bb632k0m1
	cGLnCuLnvTwSZ1svbQooV477HTVKbCQ2BlWuxKxv5w==
X-Google-Smtp-Source: AB8JxZof28ZovBtQB4VpTzO+xa/zPYAL5BNRakBRPXib2EJoMutswDOCsDQ/zcoyZzzI8Jxs/TC9UlLFMqIoycQQvSQ=
X-Received: by 2002:a24:9493:: with SMTP id
	j141-v6mr22109267ite.60.1525352231591; 
	Thu, 03 May 2018 05:57:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Thu, 3 May 2018 05:56:51 -0700 (PDT)
In-Reply-To: <20180420140930.8149-2-niko.mauno@vaisala.com>
References: <20180420140930.8149-1-niko.mauno@vaisala.com>
	<20180420140930.8149-2-niko.mauno@vaisala.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 May 2018 13:56:51 +0100
Message-ID: <CAJTo0Lb85CAs8Y+fX=b8J=AQD29DwpeseVwUEVMi5OXmAu0ewA@mail.gmail.com>
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] e2fsprogs: Complement update-alternatives scope
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
X-List-Received-Date: Thu, 03 May 2018 12:57:11 -0000
Content-Type: multipart/alternative; boundary="000000000000ebf81c056b4cbde0"

--000000000000ebf81c056b4cbde0
Content-Type: text/plain; charset="UTF-8"

Breaks packaging:

packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs-mke2fs: FILELIST: removed
"/sbin/mkfs.ext2 /sbin/mke2fs", added "/sbin/mkfs.ext2.e2fsprogs"
packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs-tune2fs: FILELIST:
removed "/sbin/tune2fs"
packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs: PKGSIZE changed from
419692 to 645500 (+54%)
packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs: FILELIST: added
"/sbin/mke2fs.e2fsprogs /sbin/tune2fs.e2fsprogs"

Ross

On 20 April 2018 at 15:09, Niko Mauno <niko.mauno@vaisala.com> wrote:

> Avoid collision of e2fsprogs provided tune2fs, mke2fs and mkfs.ext2
> commands with corresponding BusyBox provided applets in case both
> packages are installed to same rootfs, by adding these commands to
> update-alternatives scope
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
> index 56abb3b5d3..cda432460f 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
> @@ -100,6 +100,13 @@ ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.
> e2fsprogs"
>  ALTERNATIVE_${PN}-doc = "fsck.8"
>  ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
>
> +ALTERNATIVE_${PN}-tune2fs = "tune2fs"
> +ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
> +
> +ALTERNATIVE_${PN}-mke2fs = "mke2fs mkfs.ext2"
> +ALTERNATIVE_LINK_NAME[mke2fs] = "${base_sbindir}/mke2fs"
> +ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
> +
>  RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash"
>
>  do_compile_ptest() {
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ebf81c056b4cbde0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Breaks packaging:<div><br></div><div><div>packages/corei7-=
64-poky-linux/e2fsprogs/e2fsprogs-mke2fs: FILELIST: removed &quot;/sbin/mkf=
s.ext2 /sbin/mke2fs&quot;, added &quot;/sbin/mkfs.ext2.e2fsprogs&quot;</div=
><div>packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs-tune2fs: FILELIST: =
removed &quot;/sbin/tune2fs&quot;<br></div><div>packages/corei7-64-poky-lin=
ux/e2fsprogs/e2fsprogs: PKGSIZE changed from 419692 to 645500 (+54%)<br></d=
iv><div>packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs: FILELIST: added =
&quot;/sbin/mke2fs.e2fsprogs /sbin/tune2fs.e2fsprogs&quot;</div></div><div>=
<br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 20 April 2018 at 15:09, Niko Mauno <span dir=3D"ltr">&lt;<=
a href=3D"mailto:niko.mauno@vaisala.com" target=3D"_blank">niko.mauno@vaisa=
la.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Avoid collis=
ion of e2fsprogs provided tune2fs, mke2fs and mkfs.ext2<br>
commands with corresponding BusyBox provided applets in case both<br>
packages are installed to same rootfs, by adding these commands to<br>
update-alternatives scope<br>
<br>
Signed-off-by: Niko Mauno &lt;<a href=3D"mailto:niko.mauno@vaisala.com">nik=
o.mauno@vaisala.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.8.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.8.bb</a> | 7 +++=
++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fspro=
gs_1.43.8.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.8.bb</a> =
b/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43.8.b=
b" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.8.bb</a><br>
index 56abb3b5d3..cda432460f 100644<br>
--- a/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.8.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.8.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.8.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.8.bb</a><br>
@@ -100,6 +100,13 @@ ALTERNATIVE_TARGET[chattr] =3D &quot;${base_bindir}/ch=
attr.<wbr>e2fsprogs&quot;<br>
=C2=A0ALTERNATIVE_${PN}-doc =3D &quot;fsck.8&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[fsck.8] =3D &quot;${mandir}/man8/fsck.8&quot;<b=
r>
<br>
+ALTERNATIVE_${PN}-tune2fs =3D &quot;tune2fs&quot;<br>
+ALTERNATIVE_LINK_NAME[<wbr>tune2fs] =3D &quot;${base_sbindir}/tune2fs&quot=
;<br>
+<br>
+ALTERNATIVE_${PN}-mke2fs =3D &quot;mke2fs mkfs.ext2&quot;<br>
+ALTERNATIVE_LINK_NAME[mke2fs] =3D &quot;${base_sbindir}/mke2fs&quot;<br>
+ALTERNATIVE_LINK_NAME[mkfs.<wbr>ext2] =3D &quot;${base_sbindir}/mkfs.ext2&=
quot;<br>
+<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;${PN} ${PN}-tune2fs coreutils procps =
bash&quot;<br>
<br>
=C2=A0do_compile_ptest() {<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.11.0<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000ebf81c056b4cbde0--
