Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2158365CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 23:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UN1i2p024933; Wed, 31 Aug 2016 00:01:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QoJgu9qK2few; Wed, 31 Aug 2016 00:01:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7UN1cw9024930
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 00:01:39 +0100
Message-ID: <1472598098.29583.61.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Randle, William C" <william.c.randle@intel.com>, "Yang, Liezhi (Wind
	River)" <liezhi.yang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Aug 2016 00:01:38 +0100
In-Reply-To: <1472162353.11000.34.camel@intel.com>
References: <cover.1472120966.git.liezhi.yang@windriver.com>
	<CAJTo0LbNHqJB4ipWdmtSJ1vDT_pEJHFS1J2+ZtxiVsecrL86xQ@mail.gmail.com>
	<1472162353.11000.34.camel@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V5 00/10] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Tue, 30 Aug 2016 23:01:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-08-25 at 21:59 +0000, Randle, William C wrote:
> On Thu, 2016-08-25 at 22:45 +0100, Burton, Ross wrote:
> > Hi Robert,
> > 
> > So close!  qemuarm64 is breaking on the AB:
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/bu
> > ilds/536/steps/Running%20Sanity%20Tests/logs/stdio
> > 
> > I suspect we're passing some options to runqemu that you didn't
> > cover in your testing.
> > 
> > Ross
> > 
> It looks like it's just a missing space between the -m arg and 
> -device:
>   -m 512-device

I added an attempt at a fix for this into -next FWIW

Cheers,

Richard

