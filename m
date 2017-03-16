Return-Path: <ravikiran.j@mistralsolutions.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 54C9A730E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 12:17:00 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id w124so69032800itb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 05:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=dkim;
	h=mime-version:from:date:message-id:subject:to;
	bh=KWCBW8LzcnJ9HlXhpAHa2osIxg1o4YXV81mA0tz+ltk=;
	b=hMMX0h5Q9vhBOJoRGBKhtD9I3Gj7V00EO3PwQuufmL9YgtSn0ofQMxVL3vXa58s/oE
	1ZXoTfx+U52KO05p4T66tqOpFnjyqBh6rNwvRJFkxfCsjyfdoJM3P7xKQLcfHTTmQ6j2
	NzzCvB/TciSOt4aPaESuDTxWogajeaG6l97tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=KWCBW8LzcnJ9HlXhpAHa2osIxg1o4YXV81mA0tz+ltk=;
	b=piCrZRFxSIuiFee5UoHmKoHCEwIp8TPfYF10vjrK1EjzxICcY143mDSj/4S3kl9hrI
	TeuiNQTHlyJCLa88HhZWlCwmimaeggdOXMBhDFY4GMqn2mGWa56MludOVPuSukJEMCVC
	Yrjoy1LJRR+W62kBRfyAd7WJXRNVAC4ngdAmkBgNZYCbzXytVLC8HhpDplyiLqIgsvlr
	csFcAzwrPhJ89LJEmttYtrNSNla16OnRx4jzewyWuSVtJ7TPj0bTbTM469Kj0s3TBtzs
	b90Y05sjvzUhZukPyVGkRVpVuhLA1qztu/mMfuQsGM0BCnUi+JKXL5w+ODSsweOlUhYN
	KxGw==
X-Gm-Message-State: AFeK/H314tmFKbTQcPl1BJCM+2G63Ob165MVfTsWOiDedCysBPDntSRv6C/MdtcURmdC8qXxw7SxRaJiaY3B8A==
X-Received: by 10.36.134.65 with SMTP id u62mr24937062itd.34.1489666582227;
	Thu, 16 Mar 2017 05:16:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.121.197 with HTTP; Thu, 16 Mar 2017 05:16:21 -0700 (PDT)
From: ravikiran j <ravikiran.j@mistralsolutions.com>
Date: Thu, 16 Mar 2017 17:46:21 +0530
Message-ID: <CALDHXtejQOFf+GgqPJ64bVz=prf1gBxWyUbMpTfpr0dbkc7fVA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: ERROR: core-image-minimal-xfce-1.0-r0 do_rootfs:
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
X-List-Received-Date: Thu, 16 Mar 2017 12:17:02 -0000
Content-Type: multipart/alternative; boundary=94eb2c088fb877c1a3054ad807f4

--94eb2c088fb877c1a3054ad807f4
Content-Type: text/plain; charset=UTF-8

Hi everybody,

I am able to build the* core-image-minimal-xfce* image with *rpm *package
management but ,
if i change the package-management from* rpm to deb* in local.conf file  i
am getting followling errors.




*ERROR: core-image-minimal-xfce-1.0-r0 do_rootfs: Unable to install
packages. Command '/home/kamama-yocto/yocto/**poky/build-xfce-deb/tmp/*
*sysroots/x86_64-linux/usr/bin/**apt-get  install --force-yes
--allow-unauthenticated packagegroup-xfce-base packagegroup-core-boot
run-postinsts kernel-modules packagegroup-core-x11' returned 100:*
Reading package lists...
Building dependency tree...
Reading state information...
Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:



*The following packages have unmet dependencies: packagegroup-core-x11 :
Depends: packagegroup-core-x11-utils but it is not going to be installedE:
Unable to correct problems, you have held broken packages.*

ERROR: core-image-minimal-xfce-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in: /home/kamama-yocto/yocto/poky/
build-xfce-deb/tmp/work/odroid_xu3-poky-linux-gnueabi/
core-image-minimal-xfce/1.0-r0/temp/log.do_rootfs.162762
ERROR: Task (/home/kamama-yocto/yocto/poky/meta-openembedded/meta-
xfce/recipes-core/images/core-image-minimal-xfce.bb:do_rootfs) failed with
exit code '1'



How to solve this problem ?


Thanks and Regards,
Ravikiran

--94eb2c088fb877c1a3054ad807f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi everybody,<br></div><div><br>I am able t=
o build the<b> core-image-minimal-xfce</b> image with <b>rpm </b>package ma=
nagement but ,<br></div><div>if i change the package-management from<b> rpm=
 to deb</b> in local.conf file=C2=A0 i am getting followling errors.<br><br=
><br><br><br><b>ERROR: core-image-minimal-xfce-1.0-r0 do_rootfs: Unable to =
install packages. Command &#39;/home/kamama-yocto/yocto/</b><wbr><b>poky/bu=
ild-xfce-deb/tmp/</b><wbr><b>sysroots/x86_64-linux/usr/bin/</b><wbr><b>apt-=
get=C2=A0
 install --force-yes --allow-unauthenticated packagegroup-xfce-base=20
packagegroup-core-boot run-postinsts kernel-modules=20
packagegroup-core-x11&#39; returned 100:</b><br>Reading package lists...<br=
>Building dependency tree...<br>Reading state information...<br>Some packag=
es could not be installed. This may mean that you have<br>requested an impo=
ssible situation or if you are using the unstable<br>distribution that some=
 required packages have not yet been created<br>or been moved out of Incomi=
ng.<br>The following information may help to resolve the situation:<br><br>=
<b>The following packages have unmet dependencies:<br>=C2=A0packagegroup-co=
re-x11 : Depends: packagegroup-core-x11-utils but it is not going to be ins=
talled<br>E: Unable to correct problems, you have held broken packages.</b>=
<br><br>ERROR: core-image-minimal-xfce-1.0-r0 do_rootfs: Function failed: d=
o_rootfs<br>ERROR: Logfile of failure stored in: /home/kamama-yocto/yocto/p=
oky/<wbr>build-xfce-deb/tmp/work/<wbr>odroid_xu3-poky-linux-gnueabi/<wbr>co=
re-image-minimal-xfce/1.0-<wbr>r0/temp/log.do_rootfs.162762<br>ERROR: Task =
(/home/kamama-yocto/yocto/<wbr>poky/meta-openembedded/meta-<wbr>xfce/recipe=
s-core/images/core-<wbr>image-minimal-xfce.bb:do_<wbr>rootfs) failed with e=
xit code &#39;1&#39;<br><br><br><br></div>How to solve this problem ?<br><b=
r><br></div>Thanks and Regards,<br></div>Ravikiran<br></div>

--94eb2c088fb877c1a3054ad807f4--
