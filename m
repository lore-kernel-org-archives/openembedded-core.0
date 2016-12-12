Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 64EBC71A72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:59:25 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 12 Dec 2016 02:59:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,336,1477983600"; d="scan'208";a="41526301"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 02:59:26 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 76F0A6A4006;
	Mon, 12 Dec 2016 02:58:39 -0800 (PST)
Date: Mon, 12 Dec 2016 12:58:53 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20161212105853.GA21809@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1481305586-11873-1-git-send-email-ed.bartosh@linux.intel.com>
	<CABcZANk5QnzFAWwAjbaHAQvCw=XXViOnh5jg=cvRiD_B=mEpKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANk5QnzFAWwAjbaHAQvCw=XXViOnh5jg=cvRiD_B=mEpKA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] edgerouter.conf: enable generation of wic.bmap
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
X-List-Received-Date: Mon, 12 Dec 2016 10:59:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Dec 10, 2016 at 11:40:38AM -0700, Christopher Larson wrote:
> On Fri, Dec 9, 2016 at 10:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
> 
> > Enabled generation of block map(bmap) files for wic images
> > built for edgerouter machine. This should simplify flashing
> > images with bmaptool.
> >
> > [YOCTO #10621]
> >
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> >
> 
> I think this is more of a distro decision than machine, whether they want
> to support use of bmaptool for their users/customers. It’d be nice if it
> was easier to control compression from the distro, too. For example, if we
> want to distribute wic.bz2+wic.bmap in our installers, it’d be nice to be
> able to switch to that for all machines that use wic. I’m not sure how best
> to pull that off, however. Something to think about for the future.

Thanks for pointing out to it. I did it this way for two reasons:
- IMAGE_FSTYPES was already modified in edgerouter.conf
- I wanted to enable generation of wic.bmap for subset of machines, i.e.
  only for hardware reference BSPs mentioned in README.hardware

If there is a better to do it I'd be happy to update my patch.

--
Regards,
Ed

