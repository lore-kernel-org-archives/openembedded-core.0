Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 294A76FE64;
	Thu, 28 Aug 2014 22:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7SMpWVO012548; Thu, 28 Aug 2014 23:51:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AetZWRoOni8S; Thu, 28 Aug 2014 23:51:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7SMpTxA012545
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 28 Aug 2014 23:51:31 +0100
Message-ID: <1409266291.29296.147.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2014 23:51:31 +0100
In-Reply-To: <20140828064051.GA13139@haswell>
References: <20140828064051.GA13139@haswell>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFT] Moving on from eglibc to glibc 2.20
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
X-List-Received-Date: Thu, 28 Aug 2014 22:51:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-08-27 at 23:41 -0700, Khem Raj wrote:
> Hi All
> 
> As we all know eglibc has been merged back into glibc and 2.19 was the
> last release, here I have put together the recipes for upcoming glibc
> 2.20 release and removed eglibc 2.19 in favor of move.
> 
> I also thought about leaving eglibc in there but then eglibc and glibc
> were pretty much same as they always have been that it would be an
> incremental change with lot more patches this time.
> 
> The tree is here
> 
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/eglibc-to-glibc-2.20
> 
> This has not recieved much testing yet and I am looking out for helping
> hands here, so try it out in your buid environments and machines of
> interest and report back on issues.

We're also seeing:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/15/steps/BuildImages_1/logs/stdio

which turns out to be triggered by the libc change (I confirmed on a
local build). I haven't looked into why. There is also a similar issue
from the synaptics driver.

Cheers,

Richard


