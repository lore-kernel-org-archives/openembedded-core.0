Return-Path: <shubhabrata.sen@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id F383E606B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 09:09:23 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id b15so29593439qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=M56Ieh7qd/irlORyvdmfdoQQEbBxkH/goOTXILc/554=;
	b=SAbABgeao8ba0QxaW24lWbwTRjvhtAY4BrO7nMz18ZfiQ5kkf4Aob0VzfbgrIA2tOu
	AXlJ5q1Q+x8mKwiUpzNccOTDOXmf49y6c5Fe9RnzUNab18hpyJm817PvgEAHM1DPV/a/
	cX1kUxIAECUBVl37yg9PoDAnT8dzOVMn43X8X/EzRo7O+Ka81yY6dvRyZ3RvAFH1Hzb2
	VCxflpS/9ItYgEXNOA2nBBTlFlah3Z9/mpyyX5Oxd7h525xQrwpyLmvq6HP8+ToL+Lf8
	3WiL62GEl+4lqpDpPHcYboSvdsJv9tjmPg6O/1kPNDf8EJHRvFhtfWRBTTS7/B/c4PaG
	6CPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=M56Ieh7qd/irlORyvdmfdoQQEbBxkH/goOTXILc/554=;
	b=lJezUs1Okk+b6igVsQvht0XRphUSvT9OCeU2Sxt1DleDSCsz40xoJ9DQ9ExvyPLD0r
	oXXgB9BlQ/YxceUdwOew38dZqpAriHQh2Iat/DAgd0qEPC0YY/UhDA0JBBjh+qRFdioZ
	BLNBx3ABXnfZcmJRQPAit3k/71BXHqmPOpuH3ZcMQcqOZULpU2Qaq/hIxFXxAjz2yJOg
	ztHcsbBHWCTdmX6oIoefhMVrnM0/z4VAjDM848YzZjvwmadwVo6S6RGlzg1mnSQOwYTf
	NPGCGYOuNnIn0H67tC9m6LXOC6fAAgArd7DkwoBgdtaJjezIKStPcMUoSxjHFnn7jNar
	q+aQ==
X-Gm-Message-State: AMCzsaWBXQ4u/GaEVKfNFboH7brwK8zSVjkjD0Knq1CQwDFJb6H+i6s9
	mKauqLVXMynJLpQynsbr4vKiAhr4BRin5VcnvTV4+w==
X-Google-Smtp-Source: ABhQp+T09gR5FPCjl1yLijfQPueYozVRtRsdKR0qRdaydsIU4RBId/sziAmQZRXTuMKj7t5DcMkJkRJuevb+o74cEtc=
X-Received: by 10.55.212.80 with SMTP id l77mr2009362qki.82.1508922564770;
	Wed, 25 Oct 2017 02:09:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.35.52 with HTTP; Wed, 25 Oct 2017 02:09:24 -0700 (PDT)
From: shubhabrata sen <shubhabrata.sen@gmail.com>
Date: Wed, 25 Oct 2017 11:09:24 +0200
Message-ID: <CA+jxWbeubv1tSJLXs5v6wP0do_+jzgepSMc2okvj4imip=+yjA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Swig dependency error while building firmware with apparmor
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
X-List-Received-Date: Wed, 25 Oct 2017 09:09:24 -0000
Content-Type: multipart/alternative; boundary="001a1147999c778010055c5b6901"

--001a1147999c778010055c5b6901
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to build a firmware with the apparmor recipe and I keep getting
the following error

*checking for swig... no*
| checking whether the libapparmor debug output should be enabled... no
| checking whether the libapparmor man pages should be generated... yes
| checking for podchecker... podchecker
| checking for pod2man... pod2man
| checking whether python bindings are enabled... yes
*| configure: error: swig is required when enabling python bindings*
| WARNING:
/home/shubhabs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/temp/run.do_configure.8464:1
exit 1 from 'PERL="${PERL}"
PYTHON="/home/shubhabs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/recipe-sysroot-native/usr/bin/python-native/python"
./configure --build=x86_64-linux --host=arm-poky-linux-gnueabi
--target=arm-poky-linux-gnueabi --prefix=/usr --libdir=/usr/lib
--mandir=/usr/share/man --includedir=/usr/include --with-perl --with-python'

I've included the SWIG recipe in the build and I can successfully build the
firmware including swig with the bitbake command but somehow the apparmor
recipe can't find the swig package. Any help regarding this would be
appreciated.

Thanks

Shubh

--001a1147999c778010055c5b6901
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to build a firmware =
with the apparmor recipe and I keep getting the following error</div><div><=
br></div><div><div><b>checking for swig... no</b></div><div>| checking whet=
her the libapparmor debug output should be enabled... no</div><div>| checki=
ng whether the libapparmor man pages should be generated... yes</div><div>|=
 checking for podchecker... podchecker</div><div>| checking for pod2man... =
pod2man</div><div>| checking whether python bindings are enabled... yes</di=
v><div><b>| configure: error: swig is required when enabling python binding=
s</b></div><div>| WARNING: /home/shubhabs/dists/cvp/builds/p1367/tmp/work/c=
ortexa9hf-neon-poky-linux-gnueabi/apparmor/2.10.95-r0/temp/run.do_configure=
.8464:1 exit 1 from &#39;PERL=3D&quot;${PERL}&quot; PYTHON=3D&quot;/home/sh=
ubhabs/dists/cvp/builds/p1367/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/a=
pparmor/2.10.95-r0/recipe-sysroot-native/usr/bin/python-native/python&quot;=
 ./configure --build=3Dx86_64-linux --host=3Darm-poky-linux-gnueabi --targe=
t=3Darm-poky-linux-gnueabi --prefix=3D/usr --libdir=3D/usr/lib --mandir=3D/=
usr/share/man --includedir=3D/usr/include --with-perl --with-python&#39;</d=
iv></div><div><br></div><div>I&#39;ve included the SWIG recipe in the build=
 and I can successfully build the firmware including swig with the bitbake =
command but somehow the apparmor recipe can&#39;t find the swig package. An=
y help regarding this would be appreciated.</div><div><br></div><div>Thanks=
</div><div><br></div><div>Shubh</div></div>

--001a1147999c778010055c5b6901--
