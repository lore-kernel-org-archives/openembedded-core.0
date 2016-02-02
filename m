Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 54E946E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:05:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2016 07:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="41046022"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 02 Feb 2016 07:04:46 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id DE9806A4002;
	Tue,  2 Feb 2016 07:52:38 -0800 (PST)
Date: Tue, 2 Feb 2016 14:55:11 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160202125511.GA10780@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1454397260.git.ed.bartosh@linux.intel.com>
	<4a80d3209aa669db75e6343646ddb6a127ad8fc2.1454397260.git.ed.bartosh@linux.intel.com>
	<1454424619.27087.80.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1454424619.27087.80.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH 02/15] runqemu: don't use virtio for wic images
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
X-List-Received-Date: Tue, 02 Feb 2016 15:05:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 02, 2016 at 02:50:19PM +0000, Richard Purdie wrote:
> On Tue, 2016-02-02 at 09:27 +0200, Ed Bartosh wrote:
> > qemu hands with 'waiting for root device' message during the
> > boot of wic images if '-drive if=virtio' option is used.
> > 
> > Removed if=virtio from qemu command line for wic images. This
> > should fix above mentioned boot issue.
> 
> Does this not change the command for other image types too?
No, it doesn't. This patch changes qemu command line only for wic images.

--
Regards,
Ed

