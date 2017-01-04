Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 84B3A71985
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 18:29:59 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 04 Jan 2017 10:30:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,459,1477983600"; d="scan'208";a="45728033"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga004.jf.intel.com with ESMTP; 04 Jan 2017 10:29:59 -0800
To: Moritz Fischer <moritz.fischer@ettus.com>,
	openembedded-core@lists.openembedded.org
References: <1483512355-27961-1-git-send-email-moritz.fischer@ettus.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <740a7531-d635-8191-d901-ffaa0deffae4@linux.intel.com>
Date: Wed, 4 Jan 2017 12:36:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1483512355-27961-1-git-send-email-moritz.fischer@ettus.com>
Cc: koen@dominion.thruhere.net, mdf@kernel.org
Subject: Re: [meta-oe][PATCH v3] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 04 Jan 2017 18:30:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


> +}
> diff --git a/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch b/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
> new file mode 100644
> index 0000000..46e8cad
> --- /dev/null
> +++ b/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
> @@ -0,0 +1,26 @@
> +From 56ffeeffea735a6a8f69fc111278ebabe3c7e2d8 Mon Sep 17 00:00:00 2001
> +From: Moritz Fischer <moritz.fischer@ettus.com>
> +Date: Tue, 27 Dec 2016 22:24:07 -0800
> +Subject: [PATCH] build Add HOST_LDFLAGS
> +

what is the Upstream Status of this patch? At least for oe-core, you 
need to provide it. More info at 
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines



> +Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> +---
> + Makefile.rules | 2 +-
>


