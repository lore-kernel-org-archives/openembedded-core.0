Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id EB09965EB4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 03:11:00 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 May 2014 20:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,864,1392192000"; d="scan'208";a="433762498"
Received: from unknown (HELO [10.255.12.101]) ([10.255.12.101])
	by azsmga001.ch.intel.com with ESMTP; 18 May 2014 20:10:27 -0700
Message-ID: <53797623.3040906@linux.intel.com>
Date: Sun, 18 May 2014 20:10:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: rongqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <cover.1400219191.git.rongqing.li@windriver.com>
In-Reply-To: <cover.1400219191.git.rongqing.li@windriver.com>
Subject: Re: [PATCH 0/6] subversion: backport 6 CVE patches
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
X-List-Received-Date: Mon, 19 May 2014 03:11:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2014 11:00 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:
>
>    gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib roy/subversion-1
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/subversion-1
>
> Yue Tao (6):
>    subversion: fix for Security Advisory CVE-2013-1849
>    subversion: fix for Security Advisory CVE-2013-4505


>    subversion: fix for Security Advisory CVE-2013-4131
>    subversion: fix for Security Advisory CVE-2013-1845
>    subversion: fix for Security Advisory CVE-2013-1847 and CVE-2013-1846
>    subversion: fix for Security Advisory CVE-2013-4277
>
>   .../subversion-CVE-2013-4131.patch                 |   42 +++++
>   .../subversion-CVE-2013-4277.patch                 |   15 ++
>   .../subversion-CVE-2013-4505.patch                 |  130 +++++++++++++++


>   .../subversion/subversion-CVE-2013-1845.patch      |  171 ++++++++++++++++++++
>   .../subversion-CVE-2013-1847-CVE-2013-1846.patch   |   53 ++++++
>   .../subversion/subversion-CVE-2013-1849.patch      |   25 +++
>   .../subversion/subversion-CVE-2013-4277.patch      |   13 ++

Needs an Upstream-Status tag in .patch file

>   .../subversion/subversion-CVE-2013-4505.patch      |  125 ++++++++++++++
Needs an Upstream-Status tag in .patch file

>   .../subversion/subversion_1.6.15.bb                |    8 +-
>   .../subversion/subversion_1.7.10.bb                |    3 +
>   10 files changed, 583 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch
>   create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch
>

