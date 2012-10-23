Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQjmH-0006BV-LC
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 21:04:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2012 11:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="209627888"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2012 11:51:09 -0700
Message-ID: <5086E71D.2000400@linux.intel.com>
Date: Tue, 23 Oct 2012 11:51:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <cover.1350833713.git.andrei@gherzan.ro>
In-Reply-To: <cover.1350833713.git.andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/5] FIX #2431 and other opkg / ipk related fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Oct 2012 19:04:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/2012 08:40 AM, Andrei Gherzan wrote:
> V2:
> Have rootfs_ipk.bbclass formatting changings in a different commit.
> Thanks: Otavio Salvador <otavio@ossystems.com.br>
>
> The following changes since commit caba9cbfce09f19eb27f4c6615c0c5c48e1a2952:
>
>    kernel.bbclass: add kernel-modules to PACKAGES (2012-10-19 23:06:26 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ag/opkg
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/opkg
>
> Andrei Gherzan (5):
>    opkg-utils: Add needed python modules as RDEPENDS
This one was not merged

>    opkg: Add patch to fix removing packages with recommends
>    opkg: Don't print empty PROVIDES
>    rootfs_ipk.bbclass: Don't duplicate remove_packaging_data_files code
>    rootfs_ipk.bbclass: Some extra spaces / tabs were removed / formated
>
Merged into OE-Core

Thanks
	Sau!

>   meta/classes/rootfs_ipk.bbclass                    |    8 +++---
>   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 +--
>   ...t-add-recommends-pkgs-to-depended-upon-by.patch |   26 ++++++++++++++++++++
>   ...n-t-print-provides-if-nothing-is-provided.patch |   24 ++++++++++++++++++
>   meta/recipes-devtools/opkg/opkg_svn.bb             |    4 ++-
>   5 files changed, 59 insertions(+), 7 deletions(-)
>   create mode 100644 meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch
>   create mode 100644 meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch
>


