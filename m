Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UJT-0007BD-O1
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:11:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2012 09:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="76993520"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 09:02:17 -0700
Message-ID: <4F5F6F89.1090309@linux.intel.com>
Date: Tue, 13 Mar 2012 09:02:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331054558.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331054558.git.otavio@ossystems.com.br>
Subject: Re: [PATCH v2 0/5] Postinst trigger improvements for images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2012 16:11:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 09:24 AM, Otavio Salvador wrote:
> This patchset make consistent and more meanful the name used as
> postinst trigger in rootfs.
>
> The following changes since commit d7b8c247227f3cc82f92292407f548927e9fde78:
>
>    base.bbclass: Fix PACKAGECONFIG handling when no flags are set (2012-03-05 13:03:41 -0800)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (5):
>    run-postinsts: fix opkg data path
>    image.bbclass: fix rootfs generation without package management tools
>    rootfs_rpm.bbclass: rename postinst trigger script
>    opkg: rename postinst trigger script
>    dpkg: rename postinst trigger script
>
>   meta/classes/core-image.bbclass                    |    2 --
>   meta/classes/image.bbclass                         |    7 +++++--
>   meta/classes/rootfs_rpm.bbclass                    |    6 +++---
>   meta/recipes-devtools/dpkg/dpkg.inc                |    8 ++++----
>   .../dpkg/run-postinsts/run-postinsts               |    4 ++--
>   .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
>   meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
>   meta/recipes-devtools/opkg/opkg.inc                |    8 ++++----
>   8 files changed, 20 insertions(+), 19 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


