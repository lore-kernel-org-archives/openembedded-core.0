Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 398E3610D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 11:30:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3TBTiGD008392; Tue, 29 Apr 2014 12:29:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QjPHkcQK0yq4; Tue, 29 Apr 2014 12:29:44 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3TBTfv4008385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 29 Apr 2014 12:29:42 +0100
Message-ID: <1398770975.16672.421.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Apr 2014 12:29:35 +0100
In-Reply-To: <1398761378.16672.363.camel@ted>
References: <1398761378.16672.363.camel@ted>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: Status Update
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
X-List-Received-Date: Tue, 29 Apr 2014 11:30:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-29 at 09:49 +0100, Richard Purdie wrote:
> Master
> ======
> 
> I've started merging patches in so this has opened for changes. Of note
> so far:
> 
> GCC - I did find a few moments to write most of the patches needed to
> rework our parts of our gcc recipes and continue to improve the
> toolchain which will be valuable as we more forward. The first part of
> these has merged. The second part is out there for review and there are
> some bugs there I need to fix before it merges (meta-ide-support in
> particular). There is a third set of patches I've not cleaned up and
> sent out yet which standardise the toolchain hashes.
> 
> Bitbake - The task scheduling algorithm has a couple of bugs in it which
> I found after noticing some strange behaviour with low numbers of
> threads. This was worth a 7% speedup of our benchmark image build test.
> Unfortunately it was too late to get that into 1.6 but it may make the
> next point release. I also found that git 1.8 is slow for some
> operations and we really want to use 1.9+ (worth around 1 minute on
> linux-yocto kernel build time). Chris has also found what looks like a
> nasty bug in the codeparser cache which is a good thing to find.

B != S - I meant to add here that I merged the B != S patch for
autotools which does have impact for other layers. I did work a while
back to fix up oe-core and the layers the yocto autobuilder tests. We've
held off this for a while and the hope was other layers would get tested
and fixed up. I'm not sure that has happened, particularly in meta-oe as
yet unfortunately. The benefits to B != S are significant in build
accuracy and determinism and I did say I'd merge it after release so
that has now happened.

PRINC - I have dropped the removal of PRINC for this cycle since there
were concerns about that and its probably a little aggressive.

contains - I also have concerns about the contains() changes being a
touch too aggressive and needing a little more soak time. I had assumed
they just standardised references to the function, not removal of the
functions themselves yet. I'm therefore holding off some of the bitbake
side of those changes.

Cheers,

Richard


