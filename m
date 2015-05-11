Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE016013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4BDvLn7022813; Mon, 11 May 2015 14:57:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Sz3w38cg9RIj; Mon, 11 May 2015 14:57:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4BDv57Y022797
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 May 2015 14:57:17 +0100
Message-ID: <1431352625.30971.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 11 May 2015 14:57:05 +0100
In-Reply-To: <5550B3DB.3030109@windriver.com>
References: <1431350446.30971.56.camel@linuxfoundation.org>
	<5550B3DB.3030109@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto and gcc 5.x
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
X-List-Received-Date: Mon, 11 May 2015 13:57:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-05-11 at 09:51 -0400, Bruce Ashfield wrote:
> On 2015-05-11 09:20 AM, Richard Purdie wrote:
> > Hi Bruce,
> >
> > One of the things we're looking at in 1.9 is gcc 5.x support by default.
> > One of the areas this has significant impact is on the kernels,
> > linux-yocto in particular. I'm starting to see a potential problem here
> > since the kernels don't appear to work well with gcc 5.x:
> >
> > http://errors.yoctoproject.org/Errors/Search/?items=10&query=1426e31f0bcd19f066931d2ecbdec3752b14e88e&limit=150&order_by=RECIPE
> >
> > (this is a test build I ran just to see how bad things were).
> >
> > Are we going to be in a position to get 5.x support backported into 3.14
> > (and maybe 3.10)? Or was we going to have to wait for later versions?
> 
> I should be able to bring gcc5 support back to the previous LTSI
> kernel (3.14), but need to poke at the breakage myself to know
> for sure.

Sorry, I was confused with versions, I of course mean 3.17 and 3.14
above, we dropped 3.10! I think 3.17 is ok so its 3.14 that we're having
the problems with by the looks of it.

> What's the incantation to configure gcc5 into a test build ?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=d72ca3dca225a4801e595c95e98aacbe738d8303

or just set

GCCVERSION = "5.1%"

Cheers,

Richard


