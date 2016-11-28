Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 98C396E64F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 10:52:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 28 Nov 2016 02:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,563,1473145200"; d="scan'208";a="906237258"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 28 Nov 2016 02:52:45 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3EF5D6A4080;
	Mon, 28 Nov 2016 02:52:01 -0800 (PST)
Date: Mon, 28 Nov 2016 12:52:36 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161128105236.GB15660@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
	<e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
MIME-Version: 1.0
In-Reply-To: <e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Mon, 28 Nov 2016 10:52:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 28, 2016 at 08:15:26AM +0100, Kristian Amlie wrote:
> > 
> > What's the reason of insisting that path must be absolute?
> > May be it's just me, but I find it a bit scaring to use absolute path in .wks
> > The patch is relative to the rootfs directory from my point of view.
> > 
> > It also looks quite strange in the code to insist on absolute path
> > +                if not os.path.isabs(path):
> > +                    msger.error("Must be absolute: --exclude-path=%s" %
> > 
> > and then immediately making it relative:
> > +
> > +                while os.path.isabs(path):
> > +                    path = path[1:]
> 
> Not really any strong reason. I just thought it was a logical thing to
> do from a user perspective: When you're making an image you're thinking
> about paths in the final image, and the path after "part" is absolute,
> so I thought this one should be too.
> 
> The fact that it's made relative in the code is just an implementation
> detail to make join() work correctly.
> 
> I'm fine either way, so just let me know which you prefer.
> 
I'd prefer relative path as I think about --exclude-path as a path in
the source rootfs directory that we want to exclude from copying to
the target partition. However, I agree that that it can be also treated
as a path to the target directory.

--
Regards,
Ed

