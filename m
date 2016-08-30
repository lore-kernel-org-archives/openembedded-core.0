Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7186373286
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:35:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2016 03:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; d="scan'208";a="1049103572"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2016 03:35:47 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 050C36A4080;
	Tue, 30 Aug 2016 03:35:26 -0700 (PDT)
Date: Tue, 30 Aug 2016 13:35:36 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20160830103536.GA3482@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
	<CAP9ODKrOOs2ofhCzxdV0ZCULDCO9r2RgKZpcNxhH_fe56so0PA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrOOs2ofhCzxdV0ZCULDCO9r2RgKZpcNxhH_fe56so0PA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/18] Provide list of deployment artifacts
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
X-List-Received-Date: Tue, 30 Aug 2016 10:35:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 30, 2016 at 07:21:20AM -0300, Otavio Salvador wrote:
> On Tue, Aug 30, 2016 at 6:29 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > Hi,
> >
> > This is a fix for Bug #9869 - Provide a per-target manifest of files which were, or would have been, produced
> >
> > The list of artifacts produced by deployment tasks (do_deploy, do_image_complete and do_populate_sdk[_ext] is
> > obtained from sstate manifests and fired as a TaskArtifacts metadata event. This should allow Toaster to
> > handle artifacts in simple way and remove a lot of current Toaster code doing guess work.
> >
> > To generate manifests for do_image_complete and do_populate_sdk they have been put under sstate control.
> >
> > To avoid storing big files(images and sdk installer) in sstate new variable SSTATE_SKIP_CREATION has been
> > set in image.bbclass and populate_sdk_base.bbclass and sstate code was modified to avoid adding files
> > to sstate if SSTATE_SKIP_CREATION is set.
> 
> SKIP creation of what?
SKIP creation of SSTATE entity.

> Variable name seems a little vague for me. Even
> needing the manifest, does it makes sense to store the image and SDK
> on sstate?
It doesn't and skipping this is a purpose of introducing SSTATE_SKIP_CREATION variable.

--
Regards,
Ed

