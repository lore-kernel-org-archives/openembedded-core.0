Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 408DA6BD47
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 05:48:41 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so453070pad.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 22:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=hYYAFBg5shQL6GYuR0CW3cqRtVHp1wdwmef5VRxA+eI=;
	b=rcXdsO+qWtz6QR36HLYV2o60YDJyabUKdA9ttN9vwEmAhWxANlTAEvzqtErbE8cewj
	1LEXuUz0dhNT65XV2bAY9LI7oeSXCT7sC79eXLERrOJWcAXk81EwKGSjNU1UkI8CGAmI
	HbeAknRTJPLjIea5hFabREvU20e4FVJtw6ehAvhHmGGKKo/Bx7c7ywf12VipBLSULirt
	SiPgLG87uCIeqb6gmPQAys3eIYoXT9jjZnsqv6rp1IJeDxXByoAh2Z5EIq+RRxjDUvo9
	05w76MSsu2SBHNJwiQBqcDp8okrGeuvACre8I3mSqxrXMpmQqBGNkAoHvJBB2ArIqh2m
	DrSA==
X-Received: by 10.67.1.228 with SMTP id bj4mr2282903pad.157.1377755321902;
	Wed, 28 Aug 2013 22:48:41 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	ha10sm12140370pbc.23.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 22:48:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
Date: Wed, 28 Aug 2013 22:48:46 -0700
Message-Id: <A3529AF4-7650-4866-A83B-5D948D733723@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
	<7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
	<521AD896.3000503@windriver.com>
	<6324D287-2CA2-4A88-AFF4-58CABE82B2CC@gmail.com>
	<521BA7CB.7070206@windriver.com>
	<2D33FB6A-9F7F-4E8E-8B1A-CED1D571A82C@gmail.com>
	<521D0622.6090802@windriver.com>
	<2AC87191-8D2B-4972-A249-2043B68A0A7B@gmail.com>
	<521E7D2E.6060404@windriver.com>
	<E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 05:48:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 28, 2013, at 9:36 PM, Elvis Dowson <elvis.dowson@gmail.com> =
wrote:

>=20
> On Aug 29, 2013, at 2:43 AM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:
>=20
>> On 13-08-28 11:16 AM, Elvis Dowson wrote:
>>> Hi,
>>>       I get the following error while running the bitbake =
linux-yocto
>>> command for a qemu machine conf that I'm building. The build system =
is
>>> unable to find the dtc binary:
>>>=20
>>> | make: Leaving directory
>>> =
`/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/=
3.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/image/usr/src/kernel'
>>> | NOTE: make -j 6 vexpress-v2p-ca9.dtb
>>> |   DTC     arch/arm/boot/vexpress-v2p-ca9.dtb
>>> | /bin/sh:
>>> =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/linux-qemuarma9-standard-build=
/scripts/dtc/dtc:
>>> No such file or directory
>>> | make[3]: *** [arch/arm/boot/vexpress-v2p-ca9.dtb] Error 1
>>> | make[2]: *** [vexpress-v2p-ca9.dtb] Error 2
>>> | make[1]: *** [sub-make] Error 2
>>> | make: *** [all] Error 2
>>> | ERROR: oe_runmake failed
>>> | WARNING:
>>> =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/run.do_install.10606:1
>>> exit 1 from
>>> |   exit 1
>>> | ERROR: Function failed: do_install (log file is located at
>>> =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/log.do_install.10606)
>>> ERROR: Task 4
>>> (/tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.4.bb,
>>> do_install) failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 598 tasks of which 597 didn't need to =
be
>>> rerun and 1 failed.
>>=20
>> Did you ever get past this ? It looks like the recent device tree
>> changes where we use the kernel dtc versus an external dtc are =
causing
>> you a problem.
>=20
> I did get past this, after I updated the SRCREV_meta with the correct =
commit,
> which resulted in the correct kconfig fragment being picked up, with =
enabled
> the device tree option in the kernel.
>=20
> However, I'm unable to get qemu to boot correctly, for both ARM Cortex =
A9
> and ARM Cortex A* (beagle). Maybe this has to do with the fact that it =
needs
> xload+uboot in addition to the kernel, using an SD card image.
>=20
> Any suggestions on how I can do this?
>=20
> I'd like to know how qemuarmv6, qemuarmv9 and qemuarma9 were tested
> earlier.
>=20
> I think its important to get atleast the A8 and A( QEMU platforms up =
and running
> in oe-core, since they represent a bunch of the current targets used =
for actual
> development.

also take a look at meta-linaro, they test armv7+ qemu regularly.

>=20
> Best regards,
>=20
> Elvis Dowson
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


