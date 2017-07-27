Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A03F977E83
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jul 2017 21:14:20 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6RLEFWv004933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 27 Jul 2017 22:14:17 +0100
Message-ID: <1501190055.22282.171.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>, "Wold, Saul" <saul.wold@intel.com>
Date: Thu, 27 Jul 2017 22:14:15 +0100
In-Reply-To: <20170727162010.GB26163@bill-the-cat>
References: <1501012696-2666-1-git-send-email-trini@konsulko.com>
	<1501171718.27323.389.camel@intel.com>
	<20170727162010.GB26163@bill-the-cat>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 27 Jul 2017 22:14:17 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types
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
X-List-Received-Date: Thu, 27 Jul 2017 21:14:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-07-27 at 12:20 -0400, Tom Rini wrote:
> On Thu, Jul 27, 2017 at 04:08:40PM +0000, Wold, Saul wrote:
> > 
> > On Tue, 2017-07-25 at 15:58 -0400, Tom Rini wrote:
> > > 
> > > The vmdk/vdi/qcow2 IMAGE_FSTYPEs predate wic.  As such, they
> > > provide
> > > some similar underlying functionality in order to produce a
> > > "disk"
> > > image
> > > that in turn can be converted into different formats that various
> > > hypervisor types work with.  They do not however provide the
> > > ability
> > > for
> > > other disk image types to be converted into these same output
> > > types.
> > > Furthermore, they are less flexible than what wic does
> > > provide.  This
> > > drops the old style vmdk/vdi/qcow2 types and re-introduces them
> > > under
> > > the CONVERSION_CMD framework.  The equivalent of vmdk is now
> > > wic.vmdk
> > > and so forth for the other types.
> > > 
> > I like this also!  Strong work!
> > 
> > Would this allow us to further collapse the live-vm-common.bbclass
> > back
> > to just image-live.bbclass.  I know that the magic mapping that
> > happens
> > in set_live_vm_vars() has caused confusion in the past and removing
> > that mapping would be pretty awesome.
> Yes, with this there is only one user of live-vm-common.bbclass, so
> it could be folded back.

This patchset looks to have caused a number of selftest failures:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/409/steps/Running%20oe-selftest/logs/stdio

I suspect there are some testcases which need updating with this
change, would you be able to take a look please?

Cheers,

Richard




