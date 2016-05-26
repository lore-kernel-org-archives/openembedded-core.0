Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9A5470100
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4QEFtZ2031028; Thu, 26 May 2016 15:15:55 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6rpp8YaX7PPv; Thu, 26 May 2016 15:15:55 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4QEFq6P031025
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 May 2016 15:15:53 +0100
Message-ID: <1464272152.19134.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Khem Raj
	<raj.khem@gmail.com>
Date: Thu, 26 May 2016 15:15:52 +0100
In-Reply-To: <1464185744.9570.101.camel@linuxfoundation.org>
References: <fa9c2d513cff678eebb231d4cf5991ea37061b34.1463157783.git.raj.khem@gmail.com>
	<2cc568062314cdddd5ff2f60dd6d9685b3b12831.1463157783.git.raj.khem@gmail.com>
	<1463295824.9746.152.camel@linuxfoundation.org>
	<1464101499.9570.59.camel@linuxfoundation.org>
	<CAMKF1sr9bM8pE+DRt=-08sGp4ZA8U3csYezo+NAB49UsyYz0yw@mail.gmail.com>
	<1464158362.9570.87.camel@linuxfoundation.org>
	<9a16a18f-9178-231d-6c78-ccdc4cdf51a2@windriver.com>
	<7091d7d0-b03c-2dfd-eee9-d160f3a944a2@windriver.com>
	<1464185744.9570.101.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 26 May 2016 14:15:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-25 at 15:15 +0100, Richard Purdie wrote:
> Just realised the failure is in mpc8315e_rdb so its meta-yocto-bsp
> bumps we're missing?

To update on this, python-pyqt broke once qt4 was building. This was
due to webkit in qt4 being silently disabled. I've merged a patch to
meta-qt4 to handle that and the python-pyqt issue is then fixed.

We were also still having linux-yocto-4.1 issues on meta-yocto-bsp,
which looked like the same problem as we were having with 4.4, a lack
of a SRCREV bump.

Bruce: I took the liberty of testing:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=c87f
66e1b8f4eced3da1b7aaeceb2341674fa61c

which bumps the SRCREVs for 4.1 in meta-yocto-bsp. This is looking
greener on the autobuilder, I'm hoping if this works we could finally
merge gcc6. Can I merge that SRCREV bump?

Sadly all this debugging/testing is holding up the rest of the patch
queue :(.

Cheers,

Richard



