Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8A46A464
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 09:43:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jul 2013 02:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1027,1363158000"; d="scan'208";a="342635308"
Received: from unknown (HELO helios.localnet) ([10.252.121.245])
	by orsmga001.jf.intel.com with ESMTP; 09 Jul 2013 02:43:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
Date: Tue, 09 Jul 2013 10:43:20 +0100
Message-ID: <7987269.Ko1Y7S2dO1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Fix typos
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
X-List-Received-Date: Tue, 09 Jul 2013 09:43:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Emilia,

On Tuesday 09 July 2013 11:57:37 Emilia Ciobanu wrote:
> The following changes since commit dc86293f0444384e8ae5131fdd10b6cb077164b0:
> 
>   bitbake: HOB:Proper handle of SIGINT (2013-07-05 15:52:48 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib emac/typo_fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/typo_fixes
> 
> Emilia Ciobanu (4):
>   chkconfig-alternatives-native: add git token in package version
>   lttng-modules: rename recipe
>   unzip: rename recipe
>   zip: rename recipe
> 
>  .../chkconfig-alternatives-native_1.3.59.bb        |    2 +-
>  .../unzip/{unzip_6.0.bb => unzip_60.bb}            |    0
>  .../recipes-extended/zip/{zip_3.0.bb => zip_30.bb} |    0
>  ...lttng-modules_2.2.0.bb => lttng-modules_git.bb} |    2 +-
>  4 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/unzip/{unzip_6.0.bb => unzip_60.bb} (100%)
>  rename meta/recipes-extended/zip/{zip_3.0.bb => zip_30.bb} (100%)
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.2.0.bb =>
> lttng-modules_git.bb} (97%)

Unfortunately the unzip and zip version changes are not correct - the upstream 
versions are 6.0 and 3.0 respectively, and these are the versions we want to 
be going into the final packages. However, if it would help with the package 
reporting system, the recipes could be changed to convert PV of "6.0" into 
"60" in SRC_URI using some inline python.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

