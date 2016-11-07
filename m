Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BE59E71A03
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 23:03:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 07 Nov 2016 15:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,459,1473145200"; 
   d="scan'208";a="860960"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2016 15:03:06 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CFDF86A4006;
	Mon,  7 Nov 2016 15:02:28 -0800 (PST)
Date: Tue, 8 Nov 2016 01:02:58 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20161107230258.GB7754@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1477910801-9169-1-git-send-email-ed.bartosh@linux.intel.com>
	<CD1ACFFA-619F-4C36-99AC-76D6A6068E74@gmail.com>
	<CABcZANkm7CbH8pOHi5Wo3oN=usiCfX9kmOr6fPp9j9-M7E0AMg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANkm7CbH8pOHi5Wo3oN=usiCfX9kmOr6fPp9j9-M7E0AMg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mkefidisk.sh: add deprecation warning to the output
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
X-List-Received-Date: Mon, 07 Nov 2016 23:03:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 03, 2016 at 07:23:24PM -0700, Christopher Larson wrote:
> On Thu, Nov 3, 2016 at 2:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > > On Oct 31, 2016, at 3:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com>
> > wrote:
> > >
> > > mkefidisk.sh will soon be deprecated in favor of .wic images.
> > >
> > > Added deprecation warning to the script to inform users that
> > > this script will soon be removed from the codebase.
> > >
> > > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > > ---
> > > scripts/contrib/mkefidisk.sh | 5 +++++
> > > 1 file changed, 5 insertions(+)
> > >
> > > diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> > > index d8db3c0..a175895 100755
> > > --- a/scripts/contrib/mkefidisk.sh
> > > +++ b/scripts/contrib/mkefidisk.sh
> > > @@ -20,6 +20,11 @@
> > >
> > > LANG=C
> > >
> > > +echo
> > > +echo "WARNING: This script is deprecated and will be removed soon."
> > > +echo "Please consider using wic EFI images instead."
> > > +echo
> > > +
> >
> > is .wic image dd’able directly ?
> >
> 
> Yes, that’s the point :) Though I prefer bmaptool w/ IMAGE_FSTYPES +=
> “wic.bmap” personally, don’t have to rely on the file keeping its
> sparseness when scp’ing it around and whatnot.

Recommending bmaptool as a preferred way of flashing is in the plans :)

--
Regards,
Ed

