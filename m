Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Mar 2019 04:00:38 UTC
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BA1BA6D5B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 04:00:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2019 19:51:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,442,1544515200"; d="scan'208";a="304418783"
Received: from sdhavala-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.73.52])
	by orsmga005.jf.intel.com with ESMTP; 04 Mar 2019 19:51:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 05 Mar 2019 16:50:58 +1300
Message-ID: <2386661.BVp9O4DdDJ@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <cover.1551735224.git.chris_larson@mentor.com>
References: <cover.1551735224.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/4] Improve logger setup in devtool/recipetool/scriptutils
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
X-List-Received-Date: Tue, 05 Mar 2019 04:00:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 5 March 2019 10:36:07 AM NZDT Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> This improves logger setup in devtool and recipetool to send ERRORs to 
stderr,
> the way bitbake itself does, and also sends WARNINGs there, as those are
> essentially out of band as well. This makes it easier to script with devtool
> and recipetool, as any *real* subcommand output can be more easily captured
> without having to manually filter out the cruft.
> 
> The following changes since commit b11725db2d5549dc45d8ae36fbf94a5c8e342d69:
> 
>   xserver-xorg: Fix build errors with clang (2019-03-04 14:26:41 +0000)
> 
> are available in the Git repository at:
> 
>   git@github.com:kergoth/openembedded-core scriptutils-log-improvements
> 
> for you to fetch changes up to c4f37568236d2e3d8c40d57399d0b275ad5b7c8b:
> 
>   oe.scriptutils: also send WARNING to stderr (2019-03-04 21:31:00 +0000)
> 
> ----------------------------------------------------------------
> Christopher Larson (4):
>       oe.scriptutils: enable color in a more flexible way
>       oe.scriptutils: add logger_setup_filters
>       recipetool, devtool: set up the logging filters
>       oe.scriptutils: also send WARNING to stderr
> 

All of these look good to me.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre



