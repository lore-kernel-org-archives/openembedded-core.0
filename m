Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q26bH-0000hD-BH
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 19:46:41 +0100
Received: by iyb26 with SMTP id 26so8027167iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2011 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=SJ2jxAt4rbraQedeEaSQpNS8V0p70tGhpY+JHkIfeTQ=;
	b=M/6Bwje/P1xYz6kF7jBWF/ajvn6aJYbA+aKZ6ZXtMCTjBR7s8Trn2HDu4Oj6/Ba283
	40WNLS45ghVqeBTnVE6ZfkQJwQbSArSx/A/jVaWbvR0Rk7oJmM/baYnLROuAT5rxtt5F
	8hCERgnc37hsrKXcCoT45fZP09zhiWsBoxzi0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fHJqZ6d/g7QHq+iNvnS4iiq4PYYJg0KTVI56oom4+Hu/hLkGwfZt42vo/F9/RWLXcc
	RW5Tw7qNG0rz/fN7rYSQSgXKDgHlTL0fljNIgFqVg5V4+a9+kuj3G/18AA8AlV26bSZD
	2FjNXz9YY2NFOqpXYuVMiQ+CkTqXlOfKV6hmk=
Received: by 10.231.54.100 with SMTP id p36mr5706824ibg.162.1300819485305;
	Tue, 22 Mar 2011 11:44:45 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id u9sm4554460ibe.53.2011.03.22.11.44.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 11:44:43 -0700 (PDT)
Date: Tue, 22 Mar 2011 11:44:59 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110322184459.GE26336@sakrah.homelinux.org>
References: <20110322181037.GA26336@sakrah.homelinux.org>
	<8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: MIPS rootfs creation failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2011 18:46:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/11 19:42), Koen Kooi wrote:
> 
> Op 22 mrt 2011, om 19:10 heeft Khem Raj het volgende geschreven:
> 
> > Hi
> > 
> > I did an update of oe-core yesterday and now mips is failing with this
> > error. It was not there 2 days back.
> > 
> > | Configuring sysvinit.
> > | Collected errors:
> > |  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> > for task-base:
> > |  *    kernel-misc *
> > |  * opkg_install_cmd: Cannot install package task-base.
> > NOTE: package console-image-1.0-r0: task do_rootfs: Failed
> > 
> > I have not bisected but if anyone else is seeing it I would like to know
> 
> I think thats fallout from the kernel.bbclass change:
> 
> meta/classes/kernel.bbclass:FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel
> 
> I don't know what purpose that package has, but try rebuilding the kernel and see what happens. We might need to blacklist it from being included in the kernel-modules meta-package.
> 

I have already build everything from scratch even deleted sstate cache

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


