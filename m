Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id B829E71144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 21:23:18 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIL00J8HKQUOVB0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 22 Jan 2015 15:23:19 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=PYxIXZlY c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=lWCPPXvwfZmZfRXisigA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7ABFF202A1; Thu,
	22 Jan 2015 16:23:16 -0500 (EST)
Date: Thu, 22 Jan 2015 16:23:16 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Raphael Philipe <rapphil@gmail.com>
Message-id: <20150122212316.GU20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org>
	<CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Thu, 22 Jan 2015 21:23:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 22, 2015 at 07:50:28AM -0200, Raphael Philipe wrote:
> Hey Denys, I tested u-boot-fw-utils-cross_2014.07.bb in Ubuntu 12.04
> and got the same error .
> 
> Can you confirm that this recipe works for you?

Ok, trying to bisect the breakage of the current 2014.07 version of 
fw-utils-cross now:

Poky snapshot from mid-September, when 2014.07 update patch was submitted and 
when it was validated by the autobuilder - still works fine.

Since it was a feature freeze time before the release, the patch was not 
accepted and was queued for later.

Poky snapshot from mid-November, when the patch was finally applied - the 
build breaks. Again, it may not be showing the issue on the autobuilder due to 
an earlier successful sstate.

So, somewhere in between a change was introduced that breaks fw-utils-cross. 
BTW, neither 2014.07 update nor 2015.01 change anything to the way 
fw-utils-cross gets built.

-- 
Denys

