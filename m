Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA48731C0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 17:31:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 06 May 2016 10:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,587,1455004800"; d="scan'208";a="974227571"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 06 May 2016 10:31:59 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BE5746A4007;
	Fri,  6 May 2016 11:19:32 -0700 (PDT)
Date: Fri, 6 May 2016 18:12:08 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20160506151208.GA32046@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1462216694.git.chris_larson@mentor.com>
MIME-Version: 1.0
In-Reply-To: <cover.1462216694.git.chris_larson@mentor.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [for-master][RFC PATCH 0/3] Support template files for wic wks
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
X-List-Received-Date: Fri, 06 May 2016 17:32:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 02, 2016 at 12:23:54PM -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This adds support for .wks.in files as WKS_FILE.
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
> It's been suggested that the name should better reflect how its contents are
> used, i.e. .bbin or so. I've also considered including something like 'bbv' or
> similar, to indicate its contents are that of a bitbake value. I think this
> should be discussed.
> 
> I'd love to hear questions or comments on this. I think the value is clear,
> and it's something we need to solve, but I'd like to hear if others agree or
> disagree on that, and whether this implementation is appropriate.
> 
The patchset looks good to me, but I'd also like to hear opinions of
people more experienced in image creation internals.

> 
> The following changes since commit 1a0e56630c5c27d8899dd0979ae0b86bbe227881:
> 
>   utils.bbclass: note for deprecated base_contains (2016-04-29 07:53:58 +0100)
> 
> are available in the git repository at:
> 
>   git://github.com/kergoth/openembedded-core wks.in
>   https://github.com/kergoth/openembedded-core/tree/wks.in
> 
> Christopher Larson (3):
>   image.bbclass: append to prefuncs/postfuncs for do_image_*
>   image_types.bbclass: add intermediate var for WKS_FILE_CHECKSUM
>   image_types.bbclass: support template .wks.in files for wic
> 
>  meta/classes/image.bbclass       |  4 ++--
>  meta/classes/image_types.bbclass | 38 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 39 insertions(+), 3 deletions(-)
> 
> -- 
> 2.8.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

