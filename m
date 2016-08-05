Return-Path: <ncrypticus@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E19C77040
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 19:03:34 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id s7so6133627uas.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 12:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=opc+AyqW1lHtk/0re6i8RpafB87BpwZ1WgnYa54mF8o=;
	b=qqnBr3a4Z3GnJ2iJomXyt7/Su5aToGdHVga57QL0VMsfiJPOB2HgP70jkjp2O4jC5T
	8gC2VPkzQ8fP8yfPwboebXF8hnNfJbLoY24y5qa7wf3vVC3UziWOrjpx199+tK4CX1iZ
	8w2iiNBQ2yUwDx9JgNW9MdycnzX+oYBiuxMHnZn2lyKlfL37kyg+vdEQKefIEis5jz2K
	fH0yQTvq8RfE9vf46el3tiNni8pWwa0bO3KYn+qdKOMtSM8RY03EUg2Exqcqb/tWrVB7
	wX4aUcnrI5lRa7fRhL/mq+Byls24Vv2lr2ImPh6EMC/uEwNl8u+HUueoTmuQVHEzjPqV
	OiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=opc+AyqW1lHtk/0re6i8RpafB87BpwZ1WgnYa54mF8o=;
	b=kM0nU/K051zrPV3DJXlNSQlMUiuwZeh501v2rGvT8ZcU5bSRQEynzHa0k8CQMX4+eS
	Hr4t7aMNmoKCRC55v2xAlk3ilNnFd/bEZSpZ1dNNTVhTm00bSTljiChIwv6JrkYz9fUV
	evlKfH28Fm2Q8+N9abWAslaATTVlfkU72TsKORQ6rCY5ESGawJoGXg3qeT+6vhfPEDIJ
	oqzzzcdebT0YC9fZ5+nI0DSd/e0eZmY+e/10LtaHDc837tOw/SYS6++GZunLlIuCwSPw
	9Orrq1duYmFxyFhnzHaSOx62oN9ctlcXoG+fomvTjqyzTquw/CN1l+UAwU4TUlJHSQDq
	ToAg==
X-Gm-Message-State: AEkooutEuOrVUb/vKyaaFYI1mArjBoXCk6DP2zBX2PMhcrr15Qa3wI+JgtCN1ANMdj+CCUuc7O5SKaRy0g450g==
X-Received: by 10.176.82.219 with SMTP id w27mr6190702uaw.121.1470423813051;
	Fri, 05 Aug 2016 12:03:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.112.2 with HTTP; Fri, 5 Aug 2016 12:03:30 -0700 (PDT)
From: Nemicolopterus Crypticus <ncrypticus@gmail.com>
Date: Fri, 5 Aug 2016 12:03:30 -0700
Message-ID: <CAMSG=xVz80Wrz+wGddR6Np7SVdf44rHn+=10U1+szY-E2Uh1Aw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Kernel headers in SDK
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
X-List-Received-Date: Fri, 05 Aug 2016 19:03:38 -0000
Content-Type: multipart/alternative; boundary=94eb2c1915ee0bdacb053957b9a9

--94eb2c1915ee0bdacb053957b9a9
Content-Type: text/plain; charset=UTF-8

Hi all,

I need the kernel headers to show up in my SDK.

I'm running

$ bitbake <image name> -c populate_sdk

I've tried both of these, separately and together:
IMAGE_INSTALL += "kernel-devsrc"
TOOLCHAIN_TARGET_TASK_append = " kernel-devsrc"

It always fails with this:
|
/local/mnt/workspace2/mollyn/platform/1aug/poky/build/tmp/work/qcom_bsp-poky-linux/kernel-devsrc/1.0-r0/image/usr/src/kernel/arch/arm64/boot/Makefile:17:
/local/mnt/workspace2/mollyn/platform/1aug/poky/build/tmp/work/custom_bsp-poky-linux/kernel-devsrc/1.0-r0/image/usr/src/kernel/arch/arm64/boot/dts/qcom/Makefile:
No such file or directory
| make[2]: *** No rule to make target
`/local/mnt/workspace2/mollyn/platform/1aug/poky/build/tmp/work/custom_bsp-poky-linux/kernel-devsrc/1.0-r0/image/usr/src/kernel/arch/arm64/boot/dts/qcom/Makefile'.
Stop.

The virtual kernel is set like this in the machine conf file:
PREFERRED_PROVIDER_virtual/kernel = "linux-msm"

It's the exact issue described here:
https://lists.yoctoproject.org/pipermail/yocto/2015-July/025453.html

But the fix doesn't work for me.
Is there something we need to add to our kernel?

--94eb2c1915ee0bdacb053957b9a9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>Hi all,<br><b=
r></div>I need the kernel headers to show up in my SDK.<br><br></div>I&#39;=
m running<br><br></div>$ bitbake &lt;image name&gt; -c populate_sdk<br><br>=
</div>I&#39;ve tried both of these, separately and together:<br>IMAGE_INSTA=
LL +=3D &quot;kernel-devsrc&quot;<br>TOOLCHAIN_TARGET_TASK_append =3D &quot=
; kernel-devsrc&quot;<br><br></div>It always fails with this:<br>|=20
/local/mnt/workspace2/mollyn/platform/1aug/poky/build/tmp/work/qcom_bsp-pok=
y-linux/kernel-devsrc/1.0-r0/image/usr/src/kernel/arch/arm64/boot/Makefile:=
17:
=20
/local/mnt/workspace2/mollyn/platform/1aug/poky/build/tmp/work/custom_bsp-p=
oky-linux/kernel-devsrc/1.0-r0/image/usr/src/kernel/arch/arm64/boot/dts/qco=
m/Makefile:
 No such file or directory<br>
| make[2]: *** No rule to make target=20
`/local/mnt/workspace2/mollyn/platform/1aug/poky/build/tmp/work/custom_bsp-=
poky-linux/kernel-devsrc/1.0-r0/image/usr/src/kernel/arch/arm64/boot/dts/qc=
om/Makefile&#39;.=C2=A0
 Stop. <br><br>The virtual kernel is set like this in the machine conf file=
:<br>PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-msm&quot; <br><br></=
div>It&#39;s the exact issue described here:<br><a href=3D"https://lists.yo=
ctoproject.org/pipermail/yocto/2015-July/025453.html">https://lists.yoctopr=
oject.org/pipermail/yocto/2015-July/025453.html</a><br><br></div>But the fi=
x doesn&#39;t work for me.<br></div>Is there something we need to add to ou=
r kernel?<br><br></div></div>

--94eb2c1915ee0bdacb053957b9a9--
