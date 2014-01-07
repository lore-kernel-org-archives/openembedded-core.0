Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by mail.openembedded.org (Postfix) with ESMTP id ACA6C6CEB3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 20:32:27 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id DCA577FA; Tue,  7 Jan 2014 21:32:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
	shortcircuit=ham autolearn=disabled version=3.3.2
Received: from [192.168.1.65] (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 9E4A17BD;
	Tue,  7 Jan 2014 21:32:33 +0100 (CET)
Message-ID: <52CC645A.5040107@free-electrons.com>
Date: Tue, 07 Jan 2014 21:32:26 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Organization: Free Electrons
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Hart, Darren" <darren.hart@intel.com>, 
	Martin Jansa <martin.jansa@gmail.com>
References: <1389104317-11042-1-git-send-email-alexandre.belloni@free-electrons.com>	
	<20140107143558.GQ3709@jama> <52CC1B45.9010808@free-electrons.com>	
	<20140107155432.GS3709@jama>
	<1389118253.5785.25.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1389118253.5785.25.camel@dvhart-mobl4.amr.corp.intel.com>
X-Enigmail-Version: 1.5.2
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: use oldnoconfig instead of yes '' | make oldconfig
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
X-List-Received-Date: Tue, 07 Jan 2014 20:32:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/01/2014 19:11, Hart, Darren wrote:
> 
> Please check for the functionality, not KERNEL_VERSION. The
> KERNEL_VERSION doesn't allow for backports and such which might add this
> ability. Grep the Makefile for the target, for example, if the above OR
> statement isn't adequate.
> 

I guess the OR is perfectly fine then. For whatever reason make
oldnoconfig fails, we'll fall back to the old behavior.

> As Bruce stated, it seems that the fix would be to use the updated
> Kconfig, not default to setting things to NO. The problem with that
> approach is it doesn't accept defaults for non-specified options (which
> when updating kernel versions, is often the preferred approach).
> 

I think you got it wrong:
 - I am already using an updated kconfig (I even backported it on the
older kernel version)
 - make oldnoconfig is NOT setting things to NO but to the default value
of the unspecified options (exactly what we need). The choice of the
name was not wise and It has been renamed olddefconfig since 3.7


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

