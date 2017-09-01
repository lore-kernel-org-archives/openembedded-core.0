Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCBD65C5B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 16:08:05 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v81G84Dj031166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 1 Sep 2017 17:08:06 +0100
Message-ID: <1504282084.2175.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 01 Sep 2017 17:08:04 +0100
In-Reply-To: <cover.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 01 Sep 2017 17:08:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] kernel-yocto: conslidated pull request
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
X-List-Received-Date: Fri, 01 Sep 2017 16:08:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-08-31 at 15:30 -0400, Bruce Ashfield wrote:
> Now that 4.12 + headers are in the tree, this is the next (and
> possibly final)
> around of -stable updates for the active kernels.
> 
> I've built and booted them on all four architectures. But as usual,
> this is a lot of combinations to confirm.
> 
> The 4.12 update doesn't specifically address the kernel traces that
> RP has been seeing, but it also doesn't regress things here. I'd be
> interested to know if they help/hinder in the search to find the root
> cause.
> 
> I'll of course continue to track it down myself.
> 
> I also have some functionality fixes as well as configuration updates
> as part of this update.

I ran these on the autobuilder. We did see:

https://autobuilder.yocto.io/builders/nightly-ppc/builds/465

which is the latest 4.12 kernel and the latest qemu hanging with no
boot output (but the pid did appear).

So we're still seeing something odd with ppc occasionally. Why? Don't
know :(

Cheers,

Richard

