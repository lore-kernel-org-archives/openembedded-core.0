Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 39C31705E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 19:34:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jul 2014 12:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,759,1400050800"; d="scan'208";a="577274714"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO [10.255.12.249])
	([10.255.12.249])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jul 2014 12:34:08 -0700
Message-ID: <53D7F730.3040102@linux.intel.com>
Date: Tue, 29 Jul 2014 12:34:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Max Eliaser <max.eliaser@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1406657048.git.max.eliaser@intel.com>
In-Reply-To: <cover.1406657048.git.max.eliaser@intel.com>
Subject: Re: [PATCH 0/2] Upstream recipe for bootchart2 from WebOS
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
X-List-Received-Date: Tue, 29 Jul 2014 19:35:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2014 11:07 AM, Max Eliaser wrote:
> Hello list,
>
> This series adds a recipe for the bootchart2 daemon (a fork of the original
> bootchart.) It's based on a recipe from Meta-WebOS, but with extensive
> modifications.
>
> It is intended that bootchart2 will supersede the other bootchart daemons
> kicking around in oe-core/meta-oe. See bug 5893. [1]
>
Once this is merged, will you be sending another patch around to remove 
bootchart from OE-Core and possibly move it into meta-oe if appropriate?

You should also add the [YOCTO #5893] to the 2/2 patch commit message.

Thanks

Sau!

> Regards,
> -Max Eliaser
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=5893
> The following changes since commit 5452824960e8e77005a25ac11fd069d927523d3e:
>
>    default-distrovars.inc: Remove unused variable 'LIMIT_BUILT_LOCALES' (2014-06-13 13:08:44 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib meliaser/bootchart2
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=meliaser/bootchart2
>
> Max Eliaser (2):
>    python: python-pycairo: add python-pycairo-native
>    bootchart2: create recipe for bootchart2
>
>   .../bootchart2/bootchart2/bootchartd_stop.sh       |  18 +++
>   meta/recipes-devtools/bootchart2/bootchart2_git.bb | 135 +++++++++++++++++++++
>   .../python/python-pycairo_1.10.0.bb                |   2 +
>   3 files changed, 155 insertions(+)
>   create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchartd_stop.sh
>   create mode 100644 meta/recipes-devtools/bootchart2/bootchart2_git.bb
>

