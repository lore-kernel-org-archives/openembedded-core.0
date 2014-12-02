Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 05D8B601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 22:52:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2014 14:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,503,1413270000"; d="scan'208";a="617584251"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO [10.255.13.114])
	([10.255.13.114])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2014 14:52:43 -0800
Message-ID: <547E42BB.6010604@linux.intel.com>
Date: Tue, 02 Dec 2014 14:52:43 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1417134564.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1417134564.git.anibal.limon@linux.intel.com>
Subject: Re: [PATCH 00/12] Usage bitbake fetcher latest_versionstring in distrodata_class
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
X-List-Received-Date: Tue, 02 Dec 2014 22:52:51 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/27/2014 05:09 PM, Aníbal Limón wrote:
> Since Bitbake fetcher has latest_versionstring method that support search last version
> of package in upstream sites, distrodata class should use it instead of do itself,
>
> Summary of changes,
>
> distrodata_class: Re-implement upstream version detection using Bitbake fetcher methods.
> package_regex.inc: Update regex because Bitbake fetcher already provides support for search
> in HTML href's tags instead of RAW lines.
> bitbake: Improvements in fetcher wget latest_versionstring method based on [1] and clean code.
>
> Compatibility testing was made running distrodata class and the result files can be found at [1].
>
> The code has DEPENDENCIES the Bitbake changes should be MERGE first then package_regex.inc
> and finally distrodata_class.
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=1813
>
> The following changes since commit 0bc03af7ee6112fa0af0608b02f715ec8495e4ff:
>
>    maintainers.inc: update maintainers (2014-11-26 17:06:10 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib alimon/fetcher-distrodata
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/fetcher-distrodata
>
> Aníbal Limón (12):
>    distrodata_class: checkpkg make usage of latest_versionstring methods
>      in bitbake fetcher
>    package_regex.inc: Update REGEX'es in order to find upstream versions
>      correctly
>    fetch2/wget.py: latest_versionstring create _init_regex method for
>      have one place when regex'es are defined
>    fetch2/wget.py: _init_regexes rename variables to be more consistent
>      and move dirver_regex into it
>    fetch/wget.php: latest version string only try to find latest
>      directory when REGEX_URI isn't specified to avoid unnecessary
>      processing and makes code easier
>    fetch2/wget.py: latest_versionstring add package_custom_regex_comp
>    fetch2/wget.py: latest_versionstring improvments in searching
>    fetch/wget.py: latest_versionstring remove unnecessary usage for name
>      in version comparision
>    fetch2/wget: latest_versionstring add support for search in RAW html
>      lines
>    fetch/wget.py: latest_versionstring remove newuri set because is
>      previous set
>    tests/fetch.py: Update wget latest_versionstring cups case
>    fetch2/wget.py: latest_versionstring clean improvments minor
>
>   bitbake/lib/bb/fetch2/wget.py                    | 146 ++++---
>   bitbake/lib/bb/tests/fetch.py                    |   2 +-
>   meta-yocto/conf/distro/include/package_regex.inc | 400 +++++++++---------
>   meta/classes/distrodata.bbclass                  | 492 ++---------------------
>   4 files changed, 337 insertions(+), 703 deletions(-)
>
I know you are using the create-pull-request script, but you should to 
it once per repo that you are doing it with, for example here in bitbake 
repo and a second one in the oe-core repo, so that does not people 
looking for the other 11 patches in oe-core vs bitbake.

Sau!


