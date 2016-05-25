Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE65F60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 06:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4P6dQ0V009273; Wed, 25 May 2016 07:39:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AvDG1Orn1iwZ; Wed, 25 May 2016 07:39:26 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4P6dMSX009270
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 May 2016 07:39:23 +0100
Message-ID: <1464158362.9570.87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 May 2016 07:39:22 +0100
In-Reply-To: <CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
	<CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] tcmode-default: Bump gcc,glibc,gdb
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
X-List-Received-Date: Wed, 25 May 2016 06:39:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks to the patches from Bruce we're looking better, linux-yocto 4.1
works, just 4.4 has a couple of issues. I also removed a patch which
removed the xdg-utils failure. That leaves us with:

qt4-x11-free:

arm, mips, ppc, world-lsb, x86, x86_64:
https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
ds/767/steps/BuildImages/logs/stdio

qt4-embedded:

https://autobuilder.yoctoproject.org/main/builders/nightly-world-lsb/bu
ilds/520/steps/BuildImages/logs/stdio

linux-yocto-4.4 mips:

https://autobuilder.yoctoproject.org/main/builders/nightly-mips/builds/
795/steps/BuildImages_1/logs/stdio

linux-yocto-4.4 ppc:

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/builds/8
07/steps/BuildImages_1/logs/stdio

diffutils - non-gplv3:

https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/bui
lds/797

Bruce: Looks like 4.4 might also need a patch you merged to 4.1?

Cheers,

Richard

