Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1CA60797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 14:16:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2015 06:15:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,364,1444719600"; d="scan'208";a="609955143"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2015 06:15:39 -0800
Date: Mon, 30 Nov 2015 11:27:56 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20151130092756.GA24511@mbabyjoh-mobl.fi.intel.com>
References: <1448874081-23745-1-git-send-email-maxin.john@intel.com>
	<1448874081-23745-2-git-send-email-maxin.john@intel.com>
	<20151130140922.GB2250@jama>
MIME-Version: 1.0
In-Reply-To: <20151130140922.GB2250@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libjpeg-turbo: import the recipe from meta-oe
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
X-List-Received-Date: Mon, 30 Nov 2015 14:16:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Mon, Nov 30, 2015 at 03:09:22PM +0100, Martin Jansa wrote:
> On Mon, Nov 30, 2015 at 11:01:21AM +0200, Maxin B. John wrote:
> > Moving the package from meta-oe as a replacement for libjpeg
> > package. libjpeg-turbo has same API/ABI as libjpeg. It is relatively
> > faster in JPEG compression/decompression than libjpeg.
> 
> Please squash them or apply in opposite order, otherwise you break
> bisect-ability without good reason.

Thanks for the comment. I will squash them and send the updated patch soon.

> > [YOCTO #8628]
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
<snip> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Best Regards,
Maxin


