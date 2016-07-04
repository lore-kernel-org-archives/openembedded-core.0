Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D616F6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 11:36:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jul 2016 04:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="840334754"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Jul 2016 04:36:18 -0700
To: openembedded-core@lists.openembedded.org, peter.seebach@windriver.com
References: <1467401433-2237-1-git-send-email-joshua.g.lock@intel.com>
	<1467401433-2237-2-git-send-email-joshua.g.lock@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d1e04a54-0d95-3add-7f29-5bacff43451f@linux.intel.com>
Date: Mon, 4 Jul 2016 14:36:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <1467401433-2237-2-git-send-email-joshua.g.lock@intel.com>
Subject: Re: [PATCH 2/2] pseudo: upgrade to 1.8.0
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
X-List-Received-Date: Mon, 04 Jul 2016 11:36:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2016 10:30 PM, Joshua Lock wrote:
> * drop patches where the changes exist upstream
> * fetch from git as no tarball is available for 1.8.0

> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb
> new file mode 100644
> index 0000000..08477ff
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.8.0.bb
> @@ -0,0 +1,14 @@
> +require pseudo.inc
> +
> +SRCREV = "786c6d3813622d18e12d36c4aa722af6a417c8fa"
> +PV = "1.8.0+git${SRCPV}"
> +
> +SRC_URI = "git://git.yoctoproject.org/pseudo \

This commit id refers to version 1.7.5, and version 1.8.0 is not tagged 
at all in the git repository. Can you fix that please?


Alex


