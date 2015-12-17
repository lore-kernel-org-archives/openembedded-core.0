Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7731C73180
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHF2MR2000693; Thu, 17 Dec 2015 15:02:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3t58VfGXJkVg; Thu, 17 Dec 2015 15:02:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHF2H4J000685
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Dec 2015 15:02:18 GMT
Message-ID: <1450364537.13505.213.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Istrate <daniel.alexandrux.istrate@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 15:02:17 +0000
In-Reply-To: <1450363100-17478-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1450363100-17478-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv3 1/2] scripts/oe-selftest: Allow to run tests on random/all architecture
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
X-List-Received-Date: Thu, 17 Dec 2015 15:02:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-12-17 at 16:38 +0200, Daniel Istrate wrote:
> Add an option for random arch into oe-selftest:
> --arch [random/all]
> 1. random: will set a random MACHINE for each test
> 2. all: will run tests for all architectures
> 
> Custom arch sets only weak default values (??=) for MACHINE in
> local.conf.
> This let test cases that require a specific MACHINE to be able to
> override it, using (?= or =).
> 
> e.g.:
> oe-selftest --run-tests signing --arch random -->
> will run all tests switching MACHINE randomly for each test
> 
> oe-selftest --run-tests signing --arch all -->
> for each arch will run all tests
> 
> oe-selftest --run-all-tests --arch random
> 
> Also update oeqa/selftest/base.py to accomodate this feature.
> 
> Fix for [YOCTO #5880].

This is actually incredibly confusing since "arch" means something
quite different in the OE sense and this is really "machine". I
therefore have concerns about this option name.

I also strongly dislike hardcoded lists of machines. That *cannot* go
in as it stands I'm afraid.

Cheers,

Richard



