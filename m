Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4641C727D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 14:38:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 16 Feb 2015 06:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,588,1418112000"; d="scan'208";a="686374085"
Received: from unknown (HELO jupiter.iwi.intel.com) ([172.28.33.58])
	by orsmga002.jf.intel.com with ESMTP; 16 Feb 2015 06:38:44 -0800
Date: Mon, 16 Feb 2015 14:38:43 +0000
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: Sven Ebenfeld <sven.ebenfeld@gmail.com>
Message-ID: <20150216143842.GD9950@jupiter.iwi.intel.com>
References: <1424085509-25433-1-git-send-email-brendan.le.foll@intel.com>
	<1424085509-25433-2-git-send-email-brendan.le.foll@intel.com>
	<20150216131003.GG2297@jama>
	<20150216135119.GC9950@jupiter.iwi.intel.com>
	<54E20034.9030402@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54E20034.9030402@gmail.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: disable SSLv3 by default
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
X-List-Received-Date: Mon, 16 Feb 2015 14:38:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 16, 2015 at 03:35:32PM +0100, Sven Ebenfeld wrote:
> Am 16.02.2015 um 14:51 schrieb Brendan Le Foll:
> > 
> > No real reason, was trying to keep it as simple as possible whilst
> > making it clear it was not a good idea to re-enable it. I can make it
> > a PACKAGECOUNFIG[ssl3] = "--no-ssl3" if you think that's best.
> 
> Shouldn't it be PACKAGECOUNFIG[nossl3] ?
> This makes it more clear that one is actually disabling SSLv3 instead of
> trying to enable it.

The idea is to disable ssl3 by default and making enabling optional.

I'm thinking this, which means people have to enable SSLv3 to get it.
PACKAGECONFIG[ssl3] = "--enable-ssl3, --no-ssl3"

Cheers,
Brendan

