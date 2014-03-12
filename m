Return-Path: <matt@arkanian.console-pimps.org>
Received: from arkanian.console-pimps.org (arkanian.console-pimps.org
	[212.110.184.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3BB006F790
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 09:39:49 +0000 (UTC)
Received: by arkanian.console-pimps.org (Postfix, from userid 1002)
	id D332E6C075; Wed, 12 Mar 2014 09:39:46 +0000 (GMT)
Received: from localhost (unknown [94.8.38.236])
	by arkanian.console-pimps.org (Postfix) with ESMTPSA id 858B56C050;
	Wed, 12 Mar 2014 09:39:43 +0000 (GMT)
Date: Wed, 12 Mar 2014 09:39:42 +0000
From: Matt Fleming <matt@console-pimps.org>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20140312093942.GD5834@console-pimps.org>
References: <cover.1394128875.git.stefanx.stanacar@intel.com>
	<23d446488f4304516b483a2293bd34c86a23bdff.1394128875.git.stefanx.stanacar@intel.com>
	<CF3E3767.74FE9%dvhart@linux.intel.com>
	<1394186245.29948.5.camel@firebird.rb.intel.com>
	<CF44C1BC.76A1B%dvhart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <CF44C1BC.76A1B%dvhart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] classes: Add gummiboot class
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
X-List-Received-Date: Wed, 12 Mar 2014 09:39:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 11 Mar, at 01:38:08PM, Darren Hart wrote:
> 
> I'm surprised gummiboot requires STUB... Since STUB is there to allow the
> kernel to be booted directly, no bootloader required. I guess gummiboot is
> slightly less than a boot loader :-)

Gummiboot is an EFI application loader.

Since CONFIG_EFI_STUB sticks a PE/COFF header at the front of the
bzImage, it appears as an EFI application which gummiboot knows how to
load and run. This is also the reason you can execute the bzImage from
the EFI shell (or Boot Manager).

-- 
Matt Fleming, Intel Open Source Technology Center

