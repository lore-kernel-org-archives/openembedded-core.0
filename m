Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5C35571F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 10:31:03 +0000 (UTC)
Received: from [99.240.204.5] (port=37600 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YQZEu-0007Pi-Nd for openembedded-core@lists.openembedded.org;
	Wed, 25 Feb 2015 05:30:49 -0500
Date: Wed, 25 Feb 2015 05:30:47 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1502250522510.32674@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: efficacy of defining overriding linux-yocto...bb recipe file?
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
X-List-Received-Date: Wed, 25 Feb 2015 10:31:07 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  recently began looking at someone's else layer and noticed that that
layer defined a new kernel recipe by (yeesh) creating its very own
"linux-yocto_3.14.bb" file. not a bbappend file -- its very own .bb
file, which i thought was kind of weird.

  just to make sure i'm not missing any subtleties, there are only two
*recommended* ways i know of to define/extend kernel recipes. first,
just a regular .bbappend file ... nuff said.

  the second is how, say, the meta-fsl people do it (which i like), by
defining totally new, fsl-specific recipes:

linux-fslc_3.18.bb
linux-imx_2.6.35.3.bb
linux-imx_3.10.53.bb
linux-imx-mfgtool_3.10.53.bb
linux-imx-rt_3.10.31.bb
linux-ls1_3.12.bb
linux-timesys_3.0.15.bb

and then having their machine definition files set something like:

PREFERRED_PROVIDER_virtual/kernel ?= "linux-timesys"

  i've just never seen a layer flat out create its own base-level
"linux-yocto" kernel recipe .bb file. am i safe in suggesting that
that's just not the way things are done? (i'm guessing the only way to
guarantee that *that* recipe file is used is to bump up the priority
value of the layer, yes?)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

