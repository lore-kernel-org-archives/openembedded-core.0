Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BDF6165C98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 00:51:58 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jNVQQ0Gq0z3hjdH;
	Thu, 23 Oct 2014 02:51:57 +0200 (CEST)
X-Auth-Info: U/g2NxgkcaPAElAtiNoXEk8YoBItGv2VPLGKverdhnM=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3jNVQP56LRzvdWR; 
	Thu, 23 Oct 2014 02:51:57 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 23 Oct 2014 02:45:05 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<201410222239.17111.marex@denx.de>
	<CAP9ODKrOOE5_+=18EyYWHn3WvwbzYBuUZvxKGOHomJHPrchUhw@mail.gmail.com>
In-Reply-To: <CAP9ODKrOOE5_+=18EyYWHn3WvwbzYBuUZvxKGOHomJHPrchUhw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201410230245.05157.marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] kernel: Clean up KERNEL_IMAGETYPE_FOR_MAKE
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
X-List-Received-Date: Thu, 23 Oct 2014 00:52:03 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thursday, October 23, 2014 at 02:32:55 AM, Otavio Salvador wrote:
[...]
> >> > Do you happen to have a suggestion how to improve the patch please ?
> >> > I'm not really a python guru so any help is welcome ...
> >> 
> >> I like the code, just the commit log needs improvement as you did
> >> change the functionality here.
> > 
> > So what do you suggest, just zap the following line from the commit
> > message? "
> > There is no functional change.
> > "
> 
> Works for me :)

OK, thanks

Best regards,
Marek Vasut

