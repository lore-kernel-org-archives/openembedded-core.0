Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B11E96B6F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 23:01:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Nov 2016 15:01:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,459,1473145200"; d="scan'208";a="1056522795"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2016 15:01:30 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 1A1D76A4006;
	Mon,  7 Nov 2016 15:00:51 -0800 (PST)
Date: Tue, 8 Nov 2016 01:00:47 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20161107230047.GA7754@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1477910801-9169-1-git-send-email-ed.bartosh@linux.intel.com>
	<CD1ACFFA-619F-4C36-99AC-76D6A6068E74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CD1ACFFA-619F-4C36-99AC-76D6A6068E74@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 07 Nov 2016 23:01:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 03, 2016 at 02:42:39PM -0700, Khem Raj wrote:
> 
> > On Oct 31, 2016, at 3:46 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > 
> > mkefidisk.sh will soon be deprecated in favor of .wic images.
> > 
> > Added deprecation warning to the script to inform users that
> > this script will soon be removed from the codebase.
> > 
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > ---
> > scripts/contrib/mkefidisk.sh | 5 +++++
> > 1 file changed, 5 insertions(+)
> > 
> > diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> > index d8db3c0..a175895 100755
> > --- a/scripts/contrib/mkefidisk.sh
> > +++ b/scripts/contrib/mkefidisk.sh
> > @@ -20,6 +20,11 @@
> > 
> > LANG=C
> > 
> > +echo
> > +echo "WARNING: This script is deprecated and will be removed soon."
> > +echo "Please consider using wic EFI images instead."
> > +echo
> > +
> 
> is .wic image dd’able directly ?
Yes, they are.

> We should also document, the wic steps in wiki pages e.g. http://wiki.minnowboard.org/Yocto_Project
It's already documented in README.hardware: https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/README.hardware

And in Yocto manual:
http://www.yoctoproject.org/docs/2.2/mega-manual/mega-manual.html#building-an-image-for-hardware

--
Regards,
Ed

