Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1T2MDQ-0005JM-0A
	for openembedded-core@lists.linuxtogo.org;
	Fri, 17 Aug 2012 15:03:52 +0200
Received: by lban1 with SMTP id n1so1967918lba.6
	for <openembedded-core@lists.linuxtogo.org>;
	Fri, 17 Aug 2012 05:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=BuQtcB9zclxUt92JWrZz7fWQpmmfYs3XdG1/ocjHDMQ=;
	b=Gj4IKhbfjBPooql/eOVmzvQH1EKc+nzaFbbUocevljD5RDSNVtPDXwgT+TU+QX7YSR
	yO+dygLL7GrBRR1tSirr1G/EnhqBKw9b2OTcyuzMpDOqvEzN+4z8jWIZoAnBNh7Cpy4c
	+5QYTY9uUg+9YWuDXJ4iCN+JjsuLI2R5pg9cBL/eboCf0I9Y3XYD1lkKHYiij1USePkf
	7pU3FF8/w8oP7HHZQrXgyDSBYfthxtZw4jk5mJHbBMuMBM7FDwQpvgbpY9U4ws49SoN4
	vWQR36JFupJdQWMwneBr6Hi1a+ABhCuzPnWBV+Rz1ju+Mae3CLYqhFQV89w1UZFknXSJ
	DPUQ==
MIME-Version: 1.0
Received: by 10.152.102.137 with SMTP id fo9mr4807193lab.35.1345207913284;
	Fri, 17 Aug 2012 05:51:53 -0700 (PDT)
Received: by 10.112.85.196 with HTTP; Fri, 17 Aug 2012 05:51:53 -0700 (PDT)
Date: Fri, 17 Aug 2012 08:51:53 -0400
Message-ID: <CAOd_LFz6abBqUcMvOVBudGF_ec_ezs_=y5e3qKyC5c0Js0J=7A@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-core@lists.linuxtogo.org
Subject: DEPEND on an image recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 13:03:52 -0000
Content-Type: multipart/alternative; boundary=f46d0407160bd202b604c7759f77

--f46d0407160bd202b604c7759f77
Content-Type: text/plain; charset=ISO-8859-1

I would like to add a DEPEND to a kernel recipe that causes an initramfs
image to be built every time before the kernel is built.  It seems that a
DEPEND on the rootfs recipe triggers the rootfs build, however it appears
that the kernel recipe does not wait for the image recipe to finish before
it builds.  What is the best way to accomplish this?

Thanks,
Cliff

-- 
=================
http://bec-systems.com

--f46d0407160bd202b604c7759f77
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I would like to add a DEPEND to a kernel recipe that causes an initramfs im=
age to be built every time before the kernel is built. =A0It seems that a D=
EPEND on the rootfs recipe triggers the rootfs build, however it appears th=
at the kernel recipe does not wait for the image recipe to finish before it=
 builds. =A0What is the best way to accomplish this?<div>
<br></div><div>Thanks,</div><div>Cliff<br clear=3D"all"><div><br></div>-- <=
br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><a href=3D"http:/=
/bec-systems.com" target=3D"_blank">http://bec-systems.com</a><br>
</div>

--f46d0407160bd202b604c7759f77--
