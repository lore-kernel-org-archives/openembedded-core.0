Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 889CA65D00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 08:46:46 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 30 Sep 2016 01:46:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,271,1473145200"; d="scan'208";a="14927040"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 30 Sep 2016 01:46:47 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id AC2E46A4006;
	Fri, 30 Sep 2016 01:46:19 -0700 (PDT)
Date: Fri, 30 Sep 2016 11:35:54 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160930083554.GA18706@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1475138332-514-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAJTo0LY7q-=+5Dyj+CMv2Z6ujZZutDM_R5E0uexeDbF1BpZ5PQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY7q-=+5Dyj+CMv2Z6ujZZutDM_R5E0uexeDbF1BpZ5PQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: selftest: add test for mksystemd-bootdisk
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
X-List-Received-Date: Fri, 30 Sep 2016 08:46:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 29, 2016 at 03:48:59PM +0100, Burton, Ross wrote:
> On 29 September 2016 at 09:38, Ed Bartosh <ed.bartosh@linux.intel.com>
> wrote:
> 
> > +    def test_mksystemd_bootdisk(self):
> > +        """Test creation of mksystemd-bootdisk image"""
> > +        image = "mksystemd-bootdisk"
> > +        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
> > +                                   % image).status)
> > +        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" %
> > image)))
> >
> 
> Jianxun sent a patch to rename this image to just systemd-bootdisk, do you
> agree with this rename (so can you update the patch) or do you think we
> should not rename?
> 

I agree with rename. I'll send updated patchset after Jianxun patch is
merged.

-- 
Regards,
Ed

