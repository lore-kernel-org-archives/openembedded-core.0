Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 22AE96BD11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 04:36:57 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id xa7so7177799pbc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 21:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=1NWrg5qYtO/iNFg2Hd5Zb4+rlf40VQT0lo5XDL/tHQM=;
	b=JcdrVL6JFV9u6W/6KCs7NlzadSIyMxY+JlWqnepoP1KMI5ZAHEKTrQMEpo5fHIA7qn
	gPer58+aJT9YDoVIiVanSGryixxUS8GmWTU3AqXZMONbtQZEUo+149CAJ9AgTNY4+k9o
	/SmyrThMuAphVZcJ8E7vnfK1L/p4RKWaC97qnQG+rEwFVYVSw5vMRSFkbeoqzMBzB/N1
	UIs109xwAwtPs0cMxb2DkMVdyr4UdKLVf7o411JBKRDs2bYWWjtnRE/rYgG+Ue/yAWWJ
	plxP8FrPxzHCmZFkzc6Um2sxbnnx9LZn3Yp8YxJrgz3Svp3/vS0WEaSrgm9Q9eLBQhKB
	RRDA==
X-Received: by 10.67.30.70 with SMTP id kc6mr2195783pad.32.1377751017890;
	Wed, 28 Aug 2013 21:36:57 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	tg7sm32444428pbc.36.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 21:36:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521E7D2E.6060404@windriver.com>
Date: Thu, 29 Aug 2013 08:36:51 +0400
Message-Id: <E66BA9BD-07D4-4A90-BFB9-0908608FBD07@gmail.com>
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
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1498)
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
X-List-Received-Date: Thu, 29 Aug 2013 04:36:57 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 29, 2013, at 2:43 AM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> On 13-08-28 11:16 AM, Elvis Dowson wrote:
>> Hi,
>>        I get the following error while running the bitbake =
linux-yocto
>> command for a qemu machine conf that I'm building. The build system =
is
>> unable to find the dtc binary:
>>=20
>> | make: Leaving directory
>> =
`/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/=
3.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/image/usr/src/kernel'
>> | NOTE: make -j 6 vexpress-v2p-ca9.dtb
>> |   DTC     arch/arm/boot/vexpress-v2p-ca9.dtb
>> | /bin/sh:
>> =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/linux-qemuarma9-standard-build=
/scripts/dtc/dtc:
>> No such file or directory
>> | make[3]: *** [arch/arm/boot/vexpress-v2p-ca9.dtb] Error 1
>> | make[2]: *** [vexpress-v2p-ca9.dtb] Error 2
>> | make[1]: *** [sub-make] Error 2
>> | make: *** [all] Error 2
>> | ERROR: oe_runmake failed
>> | WARNING:
>> =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/run.do_install.10606:1
>> exit 1 from
>> |   exit 1
>> | ERROR: Function failed: do_install (log file is located at
>> =
/tool/yocto/poky/build/tmp/work/qemuarma9-poky-linux-gnueabi/linux-yocto/3=
.4.52+gitAUTOINC+7250de4d4a_4122d6cf3f-r4.5/temp/log.do_install.10606)
>> ERROR: Task 4
>> (/tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.4.bb,
>> do_install) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 598 tasks of which 597 didn't need to =
be
>> rerun and 1 failed.
>=20
> Did you ever get past this ? It looks like the recent device tree
> changes where we use the kernel dtc versus an external dtc are causing
> you a problem.

I did get past this, after I updated the SRCREV_meta with the correct =
commit,
which resulted in the correct kconfig fragment being picked up, with =
enabled
the device tree option in the kernel.

However, I'm unable to get qemu to boot correctly, for both ARM Cortex =
A9
and ARM Cortex A* (beagle). Maybe this has to do with the fact that it =
needs
xload+uboot in addition to the kernel, using an SD card image.

Any suggestions on how I can do this?

I'd like to know how qemuarmv6, qemuarmv9 and qemuarma9 were tested
earlier.

I think its important to get atleast the A8 and A( QEMU platforms up and =
running
in oe-core, since they represent a bunch of the current targets used for =
actual
development.

Best regards,

Elvis Dowson=

