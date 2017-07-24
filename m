Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id A18C971C54
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 18:42:02 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id m85so24777471wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gr5hjOb0iCIQ2qZ6a5t6fgxTiYFJne6nbm4HfO3G1SE=;
	b=mlXgn68QqM0Ywhy6/0rtR7gmdeK3QLzF2wYxC+SXovybiG5zgLXvuBMuS4MTtEsPvp
	ILOmUlunDSbQuq5n32mlVNz/jsdwFCRFcU/o13jC1AwLSlK71mJdcfmpt9jgPnB1GhdX
	XzOI+avEsfc4WIiNgvYtNXHzx1AybNEXachm1BNq+d5IK5/f/BcJZ2WcaT78IWvUMQis
	n1+FB8p87CVtyskVng+4WziIyPyEiMSEvZRkdbEUozQsPOXViAMnZxOZgLeBTQRELJf8
	V25FIcn7zyI+7mopfSI+feGCIx7WpR87+tnHJq3D3I7S6b8Hg7QzRza7TGciN8GHD2Rj
	6Tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gr5hjOb0iCIQ2qZ6a5t6fgxTiYFJne6nbm4HfO3G1SE=;
	b=OZo0fXOEXkp8y4nCDe9pYXfWCWu4/2y1E8PcRIiYlOSKIEDAJg2wnsvBKHpdYpSdTH
	oERUCiL2x2z8M0ZWi5G8sYlnDSTVHd2fGmA1xjq2/UfqT8sAFwNiKxuFogWn2P8Uf1Iu
	HNFAG7yh87x4AH/5+n6EQxWu8PB2IyPUctqm3WcZvNYWY0PjEBd3OJi/KqfQNqYJgicn
	eget93VfiePi/i31gteT5n6Tm9vHNKniZ6M7rWsF730+ikYdvOFrhfcoSrzP87p7BYaX
	budQZrVKaHnxWArOJFQN6kg3t0AvNX38LbqtbK7PoiZbVk2dqae8nHNfjPtz/HF6aQST
	wpIw==
X-Gm-Message-State: AIVw111lH+GKCole2LVf2oIGZ4LKTVj4gqOVkN/asP9hD6ZBcjKihRZV
	LiJpAnchtnsMD4du508nql4iB7J35g==
X-Received: by 10.80.164.18 with SMTP id u18mr3322105edb.250.1500921723319;
	Mon, 24 Jul 2017 11:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20170724101901.7728-1-alexandru.vasiu@ni.com>
In-Reply-To: <20170724101901.7728-1-alexandru.vasiu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jul 2017 18:41:52 +0000
Message-ID: <CAMKF1soHp2LNZuQf1sEc5v2bNxRBTP-KYRXhKWeJRM90nCvqjA@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>,
	openembedded-core@lists.openembedded.org
Cc: will.page@ni.com
Subject: Re: [PATCHv2 RESEND] dkms: Add new recipe for supporting dkms
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
X-List-Received-Date: Mon, 24 Jul 2017 18:42:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c198834277b3d05551492e9"

--94eb2c198834277b3d05551492e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 3:19 AM Alexandru Vasiu <alexandru.vasiu@ni.com>
wrote:

> Dkms is a tool used to compile out of tree modules directly on
> target devices (sometimes you have sources or binaries which
> need to be compiled directly on target, outside OE).
> I used a simple module and a dkms config to test it, and dkms
> compiled and installed the module on target.
>
> For example:
> .
> =E2=94=9C=E2=94=80=E2=94=80 dkms.conf
> =E2=94=94=E2=94=80=E2=94=80 src
>     =E2=94=9C=E2=94=80=E2=94=80 hello.c
>     =E2=94=94=E2=94=80=E2=94=80 Makefile
>
> hello.c:
>         #include <linux/module.h>
>
>         int init_module(void)
>         {
>                 printk("Hello World!\n");
>                 return 0;
>         }
>
>         void cleanup_module(void)
>         {
>                 printk("Goodbye Cruel World!\n");
>         }
>
>         MODULE_LICENSE("GPL");
>
> Makefile:
>         obj-m +=3D hello.o
>
>         KERNELDIR ?=3D /lib/modules/$(shell uname -r)/build
>
>         PWD :=3D $(shell pwd)
>
>         install:
>                 $(MAKE) -C $(KERNELDIR) M=3D$(PWD) modules
>
>         clean:
>                 rm -rf *.o *.ko *~ core .depend .*.cmd *.mod.c
> modules.order Module.symvers
>
> dkms.conf:
>         MAKE=3D"make -C src/ KERNELDIR=3D/lib/modules/${kernelver}/build"
>         CLEAN=3D"make -C src/ clean"
>         BUILT_MODULE_NAME=3Dhello
>         DEST_MODULE_LOCATION=3D/kernel/drivers/scsi
>         BUILT_MODULE_LOCATION=3Dsrc/
>         PACKAGE_NAME=3Dhello
>         PACKAGE_VERSION=3D0.1
>         AUTOINSTALL=3Dyes
>         REMAKE_INITRD=3Dyes
>
> All files should be in /usr/src/<package-name>-<package-version>,
> in our case in /urs/src/hello-0.1.
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta/recipes-kernel/dkms/dkms_2.4.0.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 meta/recipes-kernel/dkms/dkms_2.4.0.bb
>
> diff --git a/meta/recipes-kernel/dkms/dkms_2.4.0.bb
> b/meta/recipes-kernel/dkms/dkms_2.4.0.bb
> new file mode 100644
> index 0000000000..78b23c43e9
> --- /dev/null
> +++ b/meta/recipes-kernel/dkms/dkms_2.4.0.bb
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "DKMS Recipe - Adds DKMS tool for target"
> +HOMEPAGE =3D "https://github.com/dell/dkms/"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
> +
> +SRC_URI =3D "https://github.com/dell/${PN}/archive/v${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "d2e74dd79086c564a924b5763794091b"
> +
> +RDEPENDS_${PN} +=3D "bash kmod gcc make patch"
> +


Perhaps you also need kernel-dev package

>
> +inherit autotools-brokensep
> --
> 2.13.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c198834277b3d05551492e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, Jul 24, 2017 =
at 3:19 AM Alexandru Vasiu &lt;<a href=3D"mailto:alexandru.vasiu@ni.com">al=
exandru.vasiu@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Dkms is a tool used to compile out of tree modules directly on<br>
target devices (sometimes you have sources or binaries which<br>
need to be compiled directly on target, outside OE).<br>
I used a simple module and a dkms config to test it, and dkms<br>
compiled and installed the module on target.<br>
<br>
For example:<br>
.<br>
=E2=94=9C=E2=94=80=E2=94=80 dkms.conf<br>
=E2=94=94=E2=94=80=E2=94=80 src<br>
=C2=A0 =C2=A0 =E2=94=9C=E2=94=80=E2=94=80 hello.c<br>
=C2=A0 =C2=A0 =E2=94=94=E2=94=80=E2=94=80 Makefile<br>
<br>
hello.c:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;linux/module.h&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int init_module(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Hello =
World!\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 void cleanup_module(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(&quot;Goodby=
e Cruel World!\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 MODULE_LICENSE(&quot;GPL&quot;);<br>
<br>
Makefile:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 obj-m +=3D hello.o<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNELDIR ?=3D /lib/modules/$(shell uname -r)/b=
uild<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PWD :=3D $(shell pwd)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(MAKE) -C $(KERNEL=
DIR) M=3D$(PWD) modules<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clean:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf *.o *.ko *~ =
core .depend .*.cmd *.mod.c modules.order Module.symvers<br>
<br>
dkms.conf:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 MAKE=3D&quot;make -C src/ KERNELDIR=3D/lib/modu=
les/${kernelver}/build&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CLEAN=3D&quot;make -C src/ clean&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILT_MODULE_NAME=3Dhello<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEST_MODULE_LOCATION=3D/kernel/drivers/scsi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUILT_MODULE_LOCATION=3Dsrc/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGE_NAME=3Dhello<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGE_VERSION=3D0.1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AUTOINSTALL=3Dyes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 REMAKE_INITRD=3Dyes<br>
<br>
All files should be in /usr/src/&lt;package-name&gt;-&lt;package-version&gt=
;,<br>
in our case in /urs/src/hello-0.1.<br>
<br>
Signed-off-by: Alexandru Vasiu &lt;<a href=3D"mailto:alexandru.vasiu@ni.com=
" target=3D"_blank">alexandru.vasiu@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/dkms/<a href=3D"http://dkms_2.4.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">dkms_2.4.0.bb</a> | 12 ++++++++++++<br>
=C2=A01 file changed, 12 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/dkms/<a href=3D"http://dkms_2.=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">dkms_2.4.0.bb</a><br>
<br>
diff --git a/meta/recipes-kernel/dkms/<a href=3D"http://dkms_2.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">dkms_2.4.0.bb</a> b/meta/recipes-kernel/d=
kms/<a href=3D"http://dkms_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">d=
kms_2.4.0.bb</a><br>
new file mode 100644<br>
index 0000000000..78b23c43e9<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/dkms/<a href=3D"http://dkms_2.4.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">dkms_2.4.0.bb</a><br>
@@ -0,0 +1,12 @@<br>
+SUMMARY =3D &quot;DKMS Recipe - Adds DKMS tool for target&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/dell/dkms/" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/dell/dkms/</a>&quot;<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c=
317bb3&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/dell/$%7BPN%7D/archive/v$%=
7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/del=
l/${PN}/archive/v${PV}.tar.gz</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;d2e74dd79086c564a924b5763794091b&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;bash kmod gcc make patch&quot;<br>
+</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Perhaps you als=
o need kernel-dev package=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
+inherit autotools-brokensep<br>
--<br>
2.13.3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--94eb2c198834277b3d05551492e9--
