Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8181D6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 22:02:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5BM1KEM031072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 11 Jun 2017 23:01:22 +0100
Message-ID: <1497218480.6630.280.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 11 Jun 2017 23:01:20 +0100
In-Reply-To: <20170611195928.GR28053@denix.org>
References: <20170611165839.26175-1-net147@gmail.com>
	<CAJTo0LaXFGX118Og439zY9vpv5J1R76DBhA_ttuhLeEp6EUE_g@mail.gmail.com>
	<20170611195928.GR28053@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 11 Jun 2017 23:01:23 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][pyro][PATCH] bitbake.conf: Add whoami to HOSTTOOLS
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
X-List-Received-Date: Sun, 11 Jun 2017 22:02:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2017-06-11 at 15:59 -0400, Denys Dmytriyenko wrote:
> On Sun, Jun 11, 2017 at 08:17:09PM +0100, Burton, Ross wrote:
> > 
> > On 11 June 2017 at 17:58, Jonathan Liu <net147@gmail.com> wrote:
> > 
> > > 
> > > The whoami command is used when building the Linux kernel in
> > > scripts/mkcompile_h to embed the build user that is visible
> > > in /proc/version.
> > > 
> > Not if you have oe-core a5a14edb5573e33667b63b1e34cb4e19d075e8e8,
> > in theory
> > at least.  Unless you have an entirely from-scratch recipe that
> > doesn't use
> > kernel.bbclass, I guess.
> Not in pyro - care to backport?

I've backported this onto the pyro branch.

Cheers,

Richard

