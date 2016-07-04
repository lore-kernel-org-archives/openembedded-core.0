Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CE8D66011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 22:35:31 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2016 15:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="133808795"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2016 15:35:31 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 2EF2E6A4080;
	Mon,  4 Jul 2016 15:35:24 -0700 (PDT)
Date: Tue, 5 Jul 2016 01:25:31 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20160704222531.GA19172@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1467408317.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <cover.1467408317.git.chris_larson@mentor.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/2] Support template files for wic
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
X-List-Received-Date: Mon, 04 Jul 2016 22:35:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 01, 2016 at 02:27:00PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This adds support for .wks.in files as WKS_FILE.
> 
> This is a re-send of the RFC PATCH series as a regular PATCH series, to
> attempt to get the feature merged. There's a clear value-add, there were no
> major objections to the RFC series, and further improvements can be added on
> from here.
> 
> These files are treated as the contents of a bitbake variable, so usual
> bitbake variable references are supported. I considered using another
> templating mechanism, for example the one used by yocto-layer, but then we'd
> end up largely mapping metadata variables to template fields anyway, which is
> a pointless indirection. Let bitbake expand the variables directly instead.
> 
> This feature lets us, for example, reference ${APPEND} in --append, and avoid
> hardcoding the serial console tty in the wks file, and let the user's changes
> to APPEND affect wic the way they do the other image construction mechanisms.
> 
> The template is read in and set in a variable at parse time, so changes to the
> variables referenced by the template will result in rebuilding the image.
> 
> 
> The following changes since commit 646c366c2566bd8dd6f73681cea9f5b021589a56:
> 
>   gst-player: upgrade to latest HEAD (2016-06-27 14:08:37 +0100)
> 
> are available in the git repository at:
> 
>   git://github.com/kergoth/openembedded-core wks.in2
>   https://github.com/kergoth/openembedded-core/tree/wks.in2
> 
> Christopher Larson (2):
>   image_types.bbclass: add intermediate var for WKS_FILE_CHECKSUM
>   image_types.bbclass: support template .wks.in files for wic
> 
>  meta/classes/image_types.bbclass | 49 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
> 

Thank you for the patchset!

A bit unrelated note. You seem to know wic functionality in meta/classes/image* better
than anyone else. Would you mind adding this knowledge to wic documentation in development manual?

--
Regards,
Ed

