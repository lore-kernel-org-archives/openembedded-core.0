Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id A0B28770F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 13:39:44 +0000 (UTC)
Received: from cpc5-cmbg17-2-0-cust97.5-4.cable.virginm.net ([86.30.112.98]
	helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zmikx-0005KQ-Eh; Thu, 15 Oct 2015 15:39:43 +0200
Message-ID: <1444916377.5251.86.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Oct 2015 14:39:37 +0100
In-Reply-To: <20151015120934.GD2588@jama>
References: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
	<1444906192.5251.63.camel@pbcl.net> <20151015113146.GB2588@jama>
	<1444909889.5251.68.camel@pbcl.net> <20151015120934.GD2588@jama>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ARM: handle missing thumb suffix
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
X-List-Received-Date: Thu, 15 Oct 2015 13:39:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-15 at 14:09 +0200, Martin Jansa wrote:
> What about consistency with less specific PACKAGE_ARCHs which use "t" 
> to show if it was built with or without thumb?

For the generic architectures, the trailing "t" does serve a useful
purpose.  There exist ARMv5 CPUs that can't run Thumb code (I think
Marvell had some for example) which means it is useful to be able to
draw a distinction between binaries which require Thumb instructions
(armv5t) and those which require only the ARM base instruction set
(armv5).  There are a few places where the support for this in OE is a
bit rough around the edges (it doesn't get armv4 vs armv4t exactly
right) but in general it is close enough and does the right thing in
all the cases that matter.

To turn your question round, what about consistency with more specific
PACKAGE_ARCHs?  We don't use "qemuarmt" or "om-gta01t" for binaries
that happen to be built with Thumb enabled.

p.


