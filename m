Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id E317A78419
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 11:57:26 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id u62so23906404ita.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 03:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HfTDoNizjD7/V7Xz9Fm8SIStRiQJKtQMp3KqnplZMfw=;
	b=LmbZLRNGXppMXLXuQpZ7snA2tipODwgkJaDJ/kAcN2/Eupq8JYYWItxWMwnZWpIP7e
	fWewpPsJQX74QqJaD3iw9NgqTPPFwmXj78orNPI+tHh6Yic+Oq3AewRRV/HHQcxnYQJ6
	Oa2ErROQqAMQPWKvYa5vtkSuwj5P5Gj7WZ32WSPH2LSzkEJL0ON5YtuF1b04X7WnEEYK
	lKeDm3Ot8Z6Clt6p7zgfkWLkdB7Y3hp20xeMKeYdxdoV5/3fMTOjnBtf/n0H2Mnl5k4b
	5yzH0ny2Pes0eF28AR2Zz2E7jcd27stGW0P26c5q13KuaxbAWssvbIZrGrkW4JDsKhyb
	JyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HfTDoNizjD7/V7Xz9Fm8SIStRiQJKtQMp3KqnplZMfw=;
	b=o6XT58ZzO5suqpwE34Q6tf/RKCO66xIZHLB3wYUXX/PFmvqtQd9bH4gFNPBpCVGk4q
	VNAD59sj9vCIAAHb7+Jd61MdGI+J/1Pvtjs2xgUlN5fIF/UnHNL+dolQ+wWalQUzz18I
	h2TkQ+CliSl0aLQb/FLoPxdX/WaK0yqsG2FJLYOAftNVOQep65V1scQ5v25igKRhfBml
	MS72ryRhIuCOGZgHR/PxoNygYcHhohn8aFk4eY5aPo2gf/XqjhIbYZCJX6MCAgJL4zRY
	3iu+BhoT13OwL+PM1e56unIMbpnAu/0jmP6HHSzaWLinqHE2kqsAXHrdOUyMW+iqtMPa
	BRww==
X-Gm-Message-State: AKGB3mLXfN4f7COVDyJQU5BDtr3TgEmaHbHphsDPXKlBDTinHZWcIeaT
	L1fcjP+YmcPCUCVjkxPJg2Z1hCW6yTTk4pEcVSGaFA==
X-Google-Smtp-Source: ACJfBos3tJe4BDbk3VF5B/T++EovkrBuVNKVuHk/O3YmASRk6YbXwPPRljsUjIDitpVnGsFPVn61afw71JzpOBHMo7I=
X-Received: by 10.107.180.18 with SMTP id d18mr4859168iof.52.1513079847929;
	Tue, 12 Dec 2017 03:57:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 12 Dec 2017 03:57:07 -0800 (PST)
In-Reply-To: <20171205230006.22740-1-sgw@linux.intel.com>
References: <20171205230006.22740-1-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 11:57:07 +0000
Message-ID: <CAJTo0LYhgbpRWEB6pjvBdtf1Qo1Sg8tqx8UherUfg2MsVFxyhg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: Use full mrproper to clean
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
X-List-Received-Date: Tue, 12 Dec 2017 11:57:27 -0000
Content-Type: multipart/alternative; boundary="94eb2c06f0fcda5c0d0560235ad6"

--94eb2c06f0fcda5c0d0560235ad6
Content-Type: text/plain; charset="UTF-8"

This breaks some of the sanity tests, which build a kernel module:

https://autobuilder.yocto.io/builders/nightly-x86-64/builds/664

Ross

On 5 December 2017 at 23:00, Saul Wold <sgw@linux.intel.com> wrote:

> By using the full mrproper clean target it also removes some generated
> files
> that are not required on the target to build. It also helps to fix
> reprodudible
> builds as the generated files could have different permissions causing the
> check to fail.
>
> Tested with building and booting kernel from source on the target
>
> [YOCTO #12137]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index c1b5b7786d7..d925a33aeb1 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -52,7 +52,7 @@ do_install() {
>          # The main build artifacts. We clean the directory to avoid QA
> errors on mismatched
>          # architecture (since scripts and helpers are native format).
>          KBUILD_OUTPUT="$kerneldir"
> -        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> clean _mrproper_scripts
> +        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> clean mrproper
>          # make clean generates an absolute path symlink called "source"
>          # in $kerneldir points to $kerneldir, which doesn't make any
>          # sense, so remove it.
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c06f0fcda5c0d0560235ad6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks some of the sanity tests, which build a kernel=
 module:<div><br></div><div><a href=3D"https://autobuilder.yocto.io/builder=
s/nightly-x86-64/builds/664">https://autobuilder.yocto.io/builders/nightly-=
x86-64/builds/664</a><br></div><div><br></div><div>Ross</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On 5 December 2017 at 23:=
00, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" =
target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">By using the full mrproper clean target it also removes =
some generated files<br>
that are not required on the target to build. It also helps to fix reprodud=
ible<br>
builds as the generated files could have different permissions causing the<=
br>
check to fail.<br>
<br>
Tested with building and booting kernel from source on the target<br>
<br>
[YOCTO #12137]<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kern<wbr>el-devsrc.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">ke<wbr>rnel-devsrc.bb</a> b/meta/recip=
es-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ke<wbr>rnel-devsrc.bb</a><br>
index c1b5b7786d7..d925a33aeb1 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">ke<wbr>rnel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">ke<wbr>rnel-devsrc.bb</a><br>
@@ -52,7 +52,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The main build artifacts. We clean the =
directory to avoid QA errors on mismatched<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# architecture (since scripts and helpers=
 are native format).<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KBUILD_OUTPUT=3D&quot;$kerneldir&quot;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C $kerneldir CC=3D&quot;${KERNEL_C=
C}&quot; LD=3D&quot;${KERNEL_LD}&quot; clean _mrproper_scripts<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C $kerneldir CC=3D&quot;${KERNEL_C=
C}&quot; LD=3D&quot;${KERNEL_LD}&quot; clean mrproper<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# make clean generates an absolute path s=
ymlink called &quot;source&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# in $kerneldir points to $kerneldir, whi=
ch doesn&#39;t make any<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# sense, so remove it.<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.6<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c06f0fcda5c0d0560235ad6--
