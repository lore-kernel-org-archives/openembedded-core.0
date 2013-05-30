Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2215D608CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 16:13:16 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ui5TV-0002jm-9E; Thu, 30 May 2013 18:13:13 +0200
Message-ID: <1369930392.8846.58.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 30 May 2013 17:13:12 +0100
In-Reply-To: <51A7751E.9060102@windriver.com>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
	<51A71980.30802@communistcode.co.uk> <51A74370.3030700@windriver.com>
	<51A74CFA.5090609@balister.org> <51A7751E.9060102@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4]Add FUSE: File system in Userspace
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
X-List-Received-Date: Thu, 30 May 2013 16:13:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-30 at 10:49 -0500, Mark Hatle wrote:
> It has 413 recipes (and 2 bbappends).  Of the 413, likely many of those should 
> really be in one of the other meta-openembedded layers (or even other project 
> layers).  But my customers are not willing to bring in 413 packages just for '1' 
> package they might need out of the set.
> 
> (Similarly, we don't just "bring in" meta-openembedded either.. we break out the 
> layers so only the ones we're willing to support, and our customers need are 
> provided to them.)  There is no such thing as an "unsupported" package when you 
> are a commercial vendor.

I'm not entirely sure what you mean by "bring in" in this context or
what the underlying rationale for your reluctance is.  But some general
comments:

It's entirely possible to have a copy of meta-oe on hand and only
include a subset of the recipes in the parse.  You can do that either by
adding the layer and then BBMASKing out everything you don't want, or by
not adding the layer as such but just admit individual recipes by adding
them to BBFILES specifically.  Either of those approaches would avoid
the risk of accidentally introducing dependencies on recipes from
meta-oe without realising that this is what you are doing.

Also, I think the toxicity of meta-oe nowadays is much less than it used
to be (thanks mostly to excellent work by Paul in cleaning up
the .bbappends and overlapping recipes) and, as far as I know, the act
of including meta-oe in your layer list no longer leads to the sort of
random changes to recipe versions and behaviour that you might have
gotten burned by in the past.  So if your previous experience is from
some time ago then you might want to give it another try.

p.



