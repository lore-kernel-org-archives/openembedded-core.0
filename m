Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2832C60557
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 12:28:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Sep 2017 05:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,450,1500966000"; d="scan'208";a="156546615"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Sep 2017 05:28:34 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 661B15802A4;
	Thu, 28 Sep 2017 05:28:33 -0700 (PDT)
Date: Thu, 28 Sep 2017 15:26:51 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20170928122651.q6lstr5olso22gcr@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<CAP9ODKquj79BCNcRg66C+GSbDeoAeO6nb61Nk2FQG75w_CCTjg@mail.gmail.com>
	<a6131189-f150-5383-6858-5d296e2389ed@windriver.com>
	<20170921212144.GM30205@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20170921212144.GM30205@bill-the-cat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Thu, 28 Sep 2017 12:28:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2017 at 05:21:44PM -0400, Tom Rini wrote:
> On Thu, Sep 21, 2017 at 04:20:30PM -0500, Mark Hatle wrote:
> > On 9/21/17 4:15 PM, Otavio Salvador wrote:
> > > On Thu, Sep 21, 2017 at 2:46 PM, Tom Rini <trini@konsulko.com> wrote:
> > >> When we have been told to use the UUID we should also update the fstab
> > >> to make use of PARTUUID instead of hard-coding the device in question.
> > >> This will make the resulting image much more portable.
> > >>
> > >> Signed-off-by: Tom Rini <trini@konsulko.com>
> > > 
> > > Adding more features which changes the fstab goes to the opposite
> > > direction of reproducible builds; is it desirable?
> > 
> > There should be a corresponding way to specify the UUID for a generated
> > partition.  This would allow someone to pre-allocate the UUID and use it for
> > their generated image, and thus the reproducible build.
> 
> WIC does not today, but the underlying tools do, allow you to specify
> the UUID to use, yes.
> 

It does at least partly:

$ wic help kickstart |grep -A4 '\-\-uuid:'
         --uuid: This option is specific to wic. It specifies partition UUID.
                 It's useful if preconfigured partition UUID is added to kernel command line
                 in bootloader configuration before running wic. In this case .wks file can
                 be generated or modified to set preconfigured parition UUID using this option.

--
Regards,
Ed

