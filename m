Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UjM-0003hA-SX
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:37:49 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 09:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77007576"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 09:29:03 -0700
Message-ID: <4F5F75CE.3010803@linux.intel.com>
Date: Tue, 13 Mar 2012 09:29:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331310044.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1331310044.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/6] Pending patches on O.S. Systems' tree
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
X-List-Received-Date: Tue, 13 Mar 2012 16:37:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2012 08:21 AM, Otavio Salvador wrote:
> The following changes since commit 50dc8bfbac42b9a9b52a2f7d0568740c41790c13:
>
>    rpm 5.4.0: Add rpmdeps-oecore to replace rpmdeps for package.bbclass (2012-03-09 06:39:52 -0800)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (6):
>    run-postinsts: fix opkg data path
>    image.bbclass: fix rootfs generation without package management tools
>    rootfs_rpm.bbclass: rename postinst trigger script
>    opkg: rename postinst trigger script
>    dpkg: rename postinst trigger script

Already replied as merged

>    connman: update to 0.79
>
Merged connman into OE-Core

Thanks
	Sau!


>   meta/classes/core-image.bbclass                    |    2 --
>   meta/classes/image.bbclass                         |    7 +++++--
>   meta/classes/rootfs_rpm.bbclass                    |    6 +++---
>   .../connman/add_xuser_dbus_permission.patch        |   12 +++++++-----
>   .../connman/connman/disable_alg-test.patch         |   18 +++++++++---------
>   .../connman/{connman_0.78.bb =>  connman_0.79.bb}   |    6 ++----
>   meta/recipes-devtools/dpkg/dpkg.inc                |    6 +++---
>   .../dpkg/run-postinsts/run-postinsts               |    4 ++--
>   .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
>   meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
>   meta/recipes-devtools/opkg/opkg.inc                |    8 ++++----
>   11 files changed, 37 insertions(+), 36 deletions(-)
>   rename meta/recipes-connectivity/connman/{connman_0.78.bb =>  connman_0.79.bb} (79%)
>


