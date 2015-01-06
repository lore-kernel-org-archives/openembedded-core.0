Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC7C7201A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 11:09:12 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id dc16so15807695qab.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 03:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=y15joRo4Ac068iCXih462U5mEwUR0mcI5heg5nCr/Wc=;
	b=N/lPLGvh1WeRXUaymaNS9H1Zr/3ZgAxT4G1dhXSxd5vEBPQQMuN77/i2SM3Y+7GjSn
	I3idBQgtdd9qvPOlaDnB2FX5OWWS0UtlXD859v3OVkBFvH8v1UaDCd/Y1dYPvc9b+IXN
	LiAfHxOk2fBaMM0XwUV4DASOlIQWm1jvNf1LESfxKPV6f7q1r/VQ/IGkSeF9PpHT0QWs
	jo60k8MvZ50EX3WGqGop9yqUCpH7G2JHmtv3LJgrP5TsCxtfjyThcsZ2bOyy/cmGn0BI
	lQwpSGI4T5u6eVXsGpqYl/el8BVUMz7hhl9Ugo2JQCzVnPzaF0ft9WxXzt9eEk8rpEiY
	XlyA==
X-Gm-Message-State: ALoCoQk3+sVORPrshOtseY46oAEWXquL/Os4nf+akk85390P9xSTFSKUk7Nmf4dOirpZr1jZXMZo
X-Received: by 10.140.92.138 with SMTP id b10mr15139432qge.59.1420542553423;
	Tue, 06 Jan 2015 03:09:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 6 Jan 2015 03:08:53 -0800 (PST)
In-Reply-To: <20150106085731.GC19402@jama>
References: <54AA4536.7030101@topic.nl> <54AA4B86.9040905@topic.nl>
	<CADkTA4MgqEASmHgGunCkTUR=1qdgxP6dqW90PmgYmZ2HHTUWPg@mail.gmail.com>
	<54AB8B59.7080702@topic.nl> <20150106085731.GC19402@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jan 2015 11:08:53 +0000
Message-ID: <CAJTo0LaW2JLjqHCDEMggAb2QLM+Ns14qQWGq=BG5jLFu4HVRow@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: What is expected of a kernel recipe nowadays?
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
X-List-Received-Date: Tue, 06 Jan 2015 11:09:18 -0000
Content-Type: multipart/alternative; boundary=001a113a5d5e491b5f050bf9d6de

--001a113a5d5e491b5f050bf9d6de
Content-Type: text/plain; charset=UTF-8

On 6 January 2015 at 08:57, Martin Jansa <martin.jansa@gmail.com> wrote:

> 2) do_configure failing:
>
> ERROR: Function failed: do_configure (log file is located at
> /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498)
> ERROR: Logfile of failure stored in:
> /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function do_configure
> | NOTE: make oldconfig
> | make: *** No rule to make target `oldconfig'.  Stop.
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /home/jenkins/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498)
> NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task
> do_configure: Failed
> ERROR: Task 491
> (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-smartphone/meta-lg/recipes-kernel/linux/
> linux-lg-mako_git.bb, do_configure) failed with exit code '1'
>

I'll Me Too here, often hitting this on rebuilds:

DEBUG: Executing shell function do_configure
NOTE: make -C /data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel
O=/data/poky-master/tmp/work/qemuarm64-poky-linux/linux-yocto/3.14.24+gitAUTOINC+a227f20eff_902f34d361-r0/linux-qemuarm64-standard-build
oldnoconfig
make: Entering directory
`/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel'
make: *** No rule to make target `oldnoconfig'.  Stop.
make: Leaving directory
`/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel' ERROR: Task 77
(/home/ross/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.14.bb,
do_configure) failed with exit code '1'

Ross

--001a113a5d5e491b5f050bf9d6de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2015 at 08:57, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div id=3D":2p6" class=3D"" style=3D"=
overflow:hidden">2) do_configure failing:<br>
<br>
ERROR: Function failed: do_configure (log file is located at /home/jenkins/=
workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnuea=
bi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.1749=
8)<br>
ERROR: Logfile of failure stored in: /home/jenkins/workspace/luneos-unstabl=
e/webos-ports/tmp-glibc/work/mako-webos-linux-gnueabi/linux-lg-mako/3.4.0+g=
itrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17498<br>
Log data follows:<br>
<span class=3D"">| DEBUG: Executing python function sysroot_cleansstate<br>
| DEBUG: Python function sysroot_cleansstate finished<br>
| DEBUG: Executing shell function do_configure<br>
</span>| NOTE: make oldconfig<br>
| make: *** No rule to make target `oldconfig&#39;.=C2=A0 Stop.<br>
| ERROR: oe_runmake failed<br>
| WARNING: exit code 1 from a shell command.<br>
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/workspace/luneos-unstable/webos-ports/tmp-glibc/work/mako-webos-linux-gnu=
eabi/linux-lg-mako/3.4.0+gitrAUTOINC+38bdbfe224-r0/temp/log.do_configure.17=
498)<br>
NOTE: recipe linux-lg-mako-3.4.0+gitrAUTOINC+38bdbfe224-r0: task do_configu=
re: Failed<br>
ERROR: Task 491 (/home/jenkins/workspace/luneos-unstable/webos-ports/meta-s=
martphone/meta-lg/recipes-kernel/linux/<a href=3D"http://linux-lg-mako_git.=
bb" target=3D"_blank">linux-lg-mako_git.bb</a>, do_configure) failed with e=
xit code &#39;1&#39;</div></blockquote></div><br>I&#39;ll Me Too here, ofte=
n hitting this on rebuilds:</div><div class=3D"gmail_extra"><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">DEBUG: Executing shell fun=
ction do_configure</div><div class=3D"gmail_extra">NOTE: make -C /data/poky=
-master/tmp/sysroots/qemuarm64/usr/src/kernel O=3D/data/poky-master/tmp/wor=
k/qemuarm64-poky-linux/linux-yocto/3.14.24+gitAUTOINC+a227f20eff_902f34d361=
-r0/linux-qemuarm64-standard-build oldnoconfig</div><div class=3D"gmail_ext=
ra">make: Entering directory `/data/poky-master/tmp/sysroots/qemuarm64/usr/=
src/kernel&#39;</div><div class=3D"gmail_extra">make: *** No rule to make t=
arget `oldnoconfig&#39;.=C2=A0 Stop.</div><div class=3D"gmail_extra">make: =
Leaving directory `/data/poky-master/tmp/sysroots/qemuarm64/usr/src/kernel&=
#39;<span class=3D"" style=3D"white-space:pre">			</span>ERROR: Task 77 (/h=
ome/ross/Yocto/poky/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto=
_3.14.bb">linux-yocto_3.14.bb</a>, do_configure) failed with exit code &#39=
;1&#39;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra"><span style=3D"white-space:pre">Ross</span></div></div></div>

--001a113a5d5e491b5f050bf9d6de--
