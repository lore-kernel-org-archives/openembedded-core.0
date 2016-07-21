Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id CCA3D605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 21:40:35 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id f6so30574453ith.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 14:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vDzTy0NKEfj3NzELO4m1h/AKhs2ZHrDhItzMcnlNIfI=;
	b=jUVM246keyw3/dGYAK/J6uy8WzfNAmGcFpieF8sXAu5RigdAyaPVQJT1hoTbhsQJBO
	c8DHkw/1JkPUaIuJ6mtggDlCekV1NUGbIj38/VLhoU9Y2QwDyph/8oAfz0SMl+PPQccs
	rc1AViv5RhuvuFJMOKoEZVpTeD+tvWgAhrzCtinMDhayREwG/wi6gASHbkw49fXtD6c+
	PyUp/Y1GquIkraWPwZMUUy6tS0DuOGYEb909R55NQTTH5t/6fBCULmw4/m7B86DJ5IcS
	CBSVH94A/egTtRc/L/E8wj8xG6KdE2Mr9VsoOABJL6dCcRE1b19XNED0lHWlNsjL1JNL
	xmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vDzTy0NKEfj3NzELO4m1h/AKhs2ZHrDhItzMcnlNIfI=;
	b=fGmyPxjTcqCRMbDFm4Su3HrK4RmIlXk0STUDdwHTlCiMwR9VbYfkJUzy7XoY8Xol7r
	taRvcaBKJkgmo3Mxx2OdBwqOzWg00xAYKFx4Dss43jtHFkhhnth8WrpAzpU+LfgupE6g
	SiGLdqicWe+xNuIBzs/rPHrOYKDYTm6cNuhXFD+9p823eScFBv1mrePDNp4WroP7ldjG
	qQF7sT9uYsUzZ0vJBNSswZ/RVsfAF4/gbFVwdMnJx/HqRe3jzuamK5OWfLFKKNJEwdrm
	iSSbxjVMYo/WW96ozw291G76gLDRLKqTrMIrl/HBC3epYMvJXEF0XsynflSGRkiYhKCi
	Dt3Q==
X-Gm-Message-State: AEkooutRGageivdf+d/FHb1AtNGbqNpkMk8R0v4ZoqpqdrrewlzKOv2m9Wq5AUCNAt814FIYkpMSQvfrcNmaPMCE
X-Received: by 10.36.19.75 with SMTP id 72mr579677itz.83.1469137235705; Thu,
	21 Jul 2016 14:40:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 21 Jul 2016 14:40:16 -0700 (PDT)
In-Reply-To: <e6dc6baf0f850853605319815acc19cb14de189c.1468935802.git.liezhi.yang@windriver.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<e6dc6baf0f850853605319815acc19cb14de189c.1468935802.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jul 2016 22:40:16 +0100
Message-ID: <CAJTo0LbWf5q40LQmEZQxPF0wLNVmoi=J7HXjtJNwCxgMU2WtOQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] e2fsprogs: 1.43 -> 1.43.1
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
X-List-Received-Date: Thu, 21 Jul 2016 21:40:38 -0000
Content-Type: multipart/alternative; boundary=001a1145180a0f999c05382c2bb4

--001a1145180a0f999c05382c2bb4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 July 2016 at 14:44, Robert Yang <liezhi.yang@windriver.com> wrote:

> There is a new confgure option --enable-hardening:
>
> http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43.1
>
> Enable it by default, for target. The native can't be built with it:
> | checking for uuid_generate in -luuid... no
> | configure: error: external uuid library not found
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

This isn't generating any translations:

packages/corei7-64-poky-linux/e2fsprogs: PACKAGES: removed
"e2fsprogs-locale-sv e2fsprogs-locale-ca e2fsprogs-locale-es
e2fsprogs-locale-it e2fsprogs-locale-de e2fsprogs-locale-eo
e2fsprogs-locale-uk e2fsprogs-locale-nl e2fsprogs-locale-cs
e2fsprogs-locale-fr e2fsprogs-locale-pl e2fsprogs-locale-da
e2fsprogs-locale-tr e2fsprogs-locale-vi e2fsprogs-locale-zh-cn
e2fsprogs-locale-id" added "e2fsprogs-locale"

A fragment of the do_install log:

make[1]: Entering directory
'/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/=
build/po'
/bin/sh: 6: @mkdir_p@: not found
/usr/bin/install: cannot create regular file
=E2=80=98/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.=
43.1-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo=E2=80=99:
No such file or directory
installing ../../git/po/ca.gmo as
/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/i=
mage/usr/share/locale/ca/LC_MESSAGES/e2fsprogs.mo
/bin/sh: 6: @mkdir_p@: not found
/usr/bin/install: cannot create regular file
=E2=80=98/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.=
43.1-r0/image/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo=E2=80=99:
No such file or directory
installing ../../git/po/cs.gmo as
/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/i=
mage/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo
/bin/sh: 6: @mkdir_p@: not found
/usr/bin/install: cannot create regular file
=E2=80=98/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.=
43.1-r0/image/usr/share/locale/da/LC_MESSAGES/e2fsprogs.mo=E2=80=99:
No such file or directory

This again. :(

Ross

--001a1145180a0f999c05382c2bb4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 July 2016 at 14:44, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":60w" class=3D"">There =
is a new confgure option --enable-hardening:<br>
<br>
<a href=3D"http://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.43.1" =
rel=3D"noreferrer" target=3D"_blank">http://<span class=3D"">e2fsprogs</spa=
n>.sourceforge.net/<span class=3D"">e2fsprogs</span>-release.html#1.43.1</a=
><br>
<br>
Enable it by default, for target. The native can&#39;t be built with it:<br=
>
| checking for uuid_generate in -luuid... no<br>
| configure: error: external uuid library not found<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><br>This isn&#39=
;t generating any translations:</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">packages/corei7-64-poky-linux/e2fsprogs: PACKAGES=
: removed &quot;e2fsprogs-locale-sv e2fsprogs-locale-ca e2fsprogs-locale-es=
 e2fsprogs-locale-it e2fsprogs-locale-de e2fsprogs-locale-eo e2fsprogs-loca=
le-uk e2fsprogs-locale-nl e2fsprogs-locale-cs e2fsprogs-locale-fr e2fsprogs=
-locale-pl e2fsprogs-locale-da e2fsprogs-locale-tr e2fsprogs-locale-vi e2fs=
progs-locale-zh-cn e2fsprogs-locale-id&quot; added &quot;e2fsprogs-locale&q=
uot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">A fragment of the do_install log:</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra"><div class=3D"gmail_extra">make[1]: Entering=
 directory &#39;/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsp=
rogs/1.43.1-r0/build/po&#39;</div><div class=3D"gmail_extra">/bin/sh: 6: @m=
kdir_p@: not found</div><div class=3D"gmail_extra">/usr/bin/install: cannot=
 create regular file =E2=80=98/data/poky-master/tmp-glibc/work/corei7-64-po=
ky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fsprog=
s.mo=E2=80=99: No such file or directory</div><div class=3D"gmail_extra">in=
stalling ../../git/po/ca.gmo as /data/poky-master/tmp-glibc/work/corei7-64-=
poky-linux/e2fsprogs/1.43.1-r0/image/usr/share/locale/ca/LC_MESSAGES/e2fspr=
ogs.mo</div><div class=3D"gmail_extra">/bin/sh: 6: @mkdir_p@: not found</di=
v><div class=3D"gmail_extra">/usr/bin/install: cannot create regular file =
=E2=80=98/data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.=
43.1-r0/image/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo=E2=80=99: No suc=
h file or directory</div><div class=3D"gmail_extra">installing ../../git/po=
/cs.gmo as /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/=
1.43.1-r0/image/usr/share/locale/cs/LC_MESSAGES/e2fsprogs.mo</div><div clas=
s=3D"gmail_extra">/bin/sh: 6: @mkdir_p@: not found</div><div class=3D"gmail=
_extra">/usr/bin/install: cannot create regular file =E2=80=98/data/poky-ma=
ster/tmp-glibc/work/corei7-64-poky-linux/e2fsprogs/1.43.1-r0/image/usr/shar=
e/locale/da/LC_MESSAGES/e2fsprogs.mo=E2=80=99: No such file or directory</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">This aga=
in. :(</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div></div>

--001a1145180a0f999c05382c2bb4--
