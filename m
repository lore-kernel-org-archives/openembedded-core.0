Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEzK-0002ei-E9
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:46:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 11:38:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57371746"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 11:38:50 -0800
Message-ID: <4F15CE4A.6030300@linux.intel.com>
Date: Tue, 17 Jan 2012 11:38:50 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326480099.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1326480099.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/3] Recipe upgrades - e2fsprogs and libpam
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
X-List-Received-Date: Tue, 17 Jan 2012 19:46:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2012 03:29 PM, Scott Garman wrote:
> Hello,
>
> NOTE: This pull request needs Enrico Scholz's bitbake.conf commit
> (Subject: bitbake.conf: search /lib for -native builds) to work
> properly. Otherwise tune2fs will complain about an unresolved
> symbol when manipulating the rootfs journal during do_rootfs for
> an ext3 rootfs).
>
> This pull request includes two recipe upgrades, e2fsprogs and libpam.
> They have been build-tested for all of our qemu architectures.
>
> I've also included distro_tracking updates for chrpath and libevent,
> which were upgraded about a week ago, but I had forgotten to include
> with that pull request.
>
> Finally, this also includes a distro_tracking manual check update for
> expat.
>
> Scott
>
> The following changes since commit bd047935305c872b565f30b46c94b7077e5fb3a2:
>
>    patch.bbclass: Ensure the DATE and SRCDATE variable exclusions apply to the correct function (2012-01-13 16:56:20 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades-jan-final
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-jan-final
>
> Scott Garman (3):
>    libpam: upgrade to 1.1.5
>    e2fsprogs: upgrade to 1.42
>    distro_tracking: recipe upgrades and manual check info
>
>   .../conf/distro/include/distro_tracking_fields.inc |   40 ++++++++++--------
>   .../acinclude.m4                                   |    0
>   .../mkdir.patch                                    |    0
>   .../quotefix.patch                                 |   45 +++++++++----------
>   meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |    2 +-
>   .../{e2fsprogs_1.41.14.bb =>  e2fsprogs_1.42.bb}    |    7 +--
>   .../pam/{libpam_1.1.4.bb =>  libpam_1.1.5.bb}       |   27 ++++++------
>   7 files changed, 61 insertions(+), 60 deletions(-)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 =>  e2fsprogs-1.42}/acinclude.m4 (100%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 =>  e2fsprogs-1.42}/mkdir.patch (100%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.41.14 =>  e2fsprogs-1.42}/quotefix.patch (40%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.41.14.bb =>  e2fsprogs_1.42.bb} (92%)
>   rename meta/recipes-extended/pam/{libpam_1.1.4.bb =>  libpam_1.1.5.bb} (85%)
>

Merged into OE-Core

Thanks
	Sau!


