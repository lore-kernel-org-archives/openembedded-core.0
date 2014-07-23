Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 499B76A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:13:20 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6NHDLGd026913; Wed, 23 Jul 2014 12:13:21 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072312132105-145966 ;
	Wed, 23 Jul 2014 12:13:21 -0500 
Date: Wed, 23 Jul 2014 12:13:12 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140723171312.GA6118@bshelton-desktop>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 12:13:21 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/23/2014 12:13:21 PM,
	Serialize complete at 07/23/2014 12:13:21 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-23_06:2014-07-23, 2014-07-23,
	1970-01-01 signatures=0
Subject: util-linux hwclock ALTERNATIVE_PRIORITY set to 10 for meta-nslu2 -- still needed?
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
X-List-Received-Date: Wed, 23 Jul 2014 17:13:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In meta/recipes-core/util-linux/util-linux.inc, there exists the
following:

# There seems to be problem, atleast on nslu2, with these, untill they are
# fixed the busybox ones have higher priority
ALTERNATIVE_PRIORITY[hwclock] = "10"

Is this still necessary?  Right now, we're carrying a commit in our
local repo to change this to ALTERNATIVE_PRIORITY[hwclock] ?= "100" so
we can use the util-linux version of hwclock rather than the busybox one
(as Saul had proposed at one point, so meta-nslu2 could override it).

Thanks,
Ben

