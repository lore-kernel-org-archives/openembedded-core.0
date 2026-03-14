Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C301C107BCFB
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 07:00:15 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5371.1773471613823405775
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 00:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Wf5QQk4k;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D1FD1A2E35;
	Sat, 14 Mar 2026 07:00:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3D3F6003C;
	Sat, 14 Mar 2026 07:00:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FB9010369E83;
	Sat, 14 Mar 2026 08:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773471610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=35CPRftUeGqzK+EunnRhmKgN325+m2/5Gmu/HDstWpc=;
	b=Wf5QQk4kdQDJaX/vf9kYkMTU+YcVKyo4q45Fo9xlFNX0HfSnh7r5ikYvuRbN54V1e3Wuvm
	NaGTUKE9a+6+f8+aHWt1vuGbVpk9martjOnMzNawqvo7mWZcwMK+xvf2a7WN4WETZru4sa
	0ZP/ibk7WCfe8sqFG+ya0PohjK5Y2tPcZ0baQlx5+Ej5I4iXzxxYUu9DICYVMKILuteCje
	fnBa+gFYSvIgKKlSLNhlxNUsw7XGv9Lce6Cm5neY57rXoTr9nMtIkgWFPQWdHP0Bom2qhP
	/QgncHISu0yk5rKc9gsdCG9BQhMjXXBhlIpOVLEomreorNi8fWXN4zby/0/kQA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Mar 2026 08:00:06 +0100
Message-Id: <DH2B7SIOV4KX.3PZ5RW0V6NOSR@bootlin.com>
Subject: Re: [OE-core] [PATCH v8 0/9] rpm: 4.20.1 -> 6.0.1
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Robert Yang" <liezhi.yang@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1773324129.git.liezhi.yang@windriver.com>
 <DH0XA8PQOXXR.12KPIBAF43RZ3@bootlin.com>
 <1f50dc21-bf2a-4b2f-9a39-9ef5137f26c6@windriver.com>
 <189C7BAFC42D9B2E.1443259@lists.openembedded.org>
In-Reply-To: <189C7BAFC42D9B2E.1443259@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 07:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233072

On Fri Mar 13, 2026 at 7:58 PM CET, Mathieu Dubois-Briand via lists.openemb=
edded.org wrote:
> On Fri Mar 13, 2026 at 5:54 AM CET, Robert Yang wrote:
>> Hi Mathieu,
>>
>> On 3/12/26 23:52, Mathieu Dubois-Briand via lists.openembedded.org wrote=
:
>>> On Thu Mar 12, 2026 at 3:09 PM CET, liezhi.yang wrote:
>>>> From: Robert Yang <liezhi.yang@windriver.com>
>>>>
>>>> * V8:
>>>>    - Fix build with systemd (Check patch 7 for detailes)
>>>>    - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pk=
gconfig
>>>>      (Check patch 7 for detailes)
>>>>    - Backport a PULL from git/libarchive to fix oe-selftest failures.
>>>>
>>>> * V7:
>>>>    - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
>>>>      To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 2=
4.04 when
>>>>      pkg-config is installed on host, now the host contamination has b=
een fixed,
>>>>      and the patch has been submitted to upstream:
>>>>      https://github.com/rpm-software-management/rpm/pull/4127
>>>>
>>>> * V6
>>>>    - Fix -cpopulate_sdk error when DISTRO =3D "poky"
>>>>
>>>> * V5
>>>>    - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
>>>>    - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop depende=
ncies
>>>>      between /bin/sh and libc.so.
>>>>
>>>> * V4
>>>>    - Fix loop dependencies issues for libc6 and busybox
>>>>    - Fix issues for can't find pkg-config files (.pc) on qemux86-64.
>>>>
>>>> * V3
>>>>    - Fix Alexender's comments
>>>>      a) Suppot rpm 6
>>>>      b) Move rpm-setup-autosign to rpm-build
>>>>      c) Remove -DLIBELF_FOUND=3DFalse
>>>>
>>>>    - Fix build for nativesdk-rpm
>>>>
>>>>    - Drop patch for createrepo-c since it has been upgraded (rev:
>>>>      804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)
>>>>
>>>> * V1 & V2
>>>>    - Initial version
>>>>
>>>> // Robert
>>>>
>>>=20
>>> Hi Robert,
>>>=20
>>> Thanks for the new version.
>>>=20
>>> I suspect I still need to get some gettext patch with it. Either yours
>>> or the one from the glibc upgrade series. Is that right?
>>
>> I think you meat the following oe-selftest error:
>>
>> ERROR: glib-2.0-1_2.86.4-r0 do_package_qa: QA Issue: glib-2.0-ptest rdep=
ends on=20
>> locale-base-c, but it isn't a build dependency? [build-deps]
>>
>>
>> I can reproduce it with pure master branch: (rev:=20
>> 438afb3ded629408172c4bd7d556c5d2abacd631)
>> PACKAGE_CLASSES =3D "package_rpm"
>> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder'
>> MACHINE =3D 'qemux86-64'
>>
>> IMAGE_INSTALL:append =3D " glibc-utils localedef"
>> GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 fr_FR.UTF-8 en_US.ISO-8859-1 de_=
DE.UTF-8=20
>> fr_FR.ISO-8859-1 zh_HK.BIG5-HKSCS tr_TR.UTF-8"
>> IMAGE_LINGUAS:append =3D " en-us fr-fr"
>>
>> $ bitbake glibc-2.0
>>
>> So I don't think it's caused by rpm 6 or gettext upgrading, and we don't=
 need
>> other patches.
>>
>> I will check how to fix the glib-2.0 issues, but it's not related to rpm=
 6.
>>
>> // Robert
>>
>
> Hi Robert,
>
> So yes, I have this issue, and I'm not having it without your series:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3399
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3290
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3517
>
> And some reproducibility error:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3579
>
> I will try to build just your series on top of master and compare with
> master. Maybe some strange combination with the glibc upgrade.
>

Ok, so here is an a-full build with RPM patches applied directly on top
of master: we have the same issues as yesterday:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3410

selftests:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3526
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3420
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3298

reproducible:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3592

By comparison, here is an a-full build on master:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3414

I there any test I can do to help you?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


