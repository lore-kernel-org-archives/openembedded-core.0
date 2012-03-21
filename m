Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAQjj-0006tl-6P
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:58:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 11:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80065410"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Mar 2012 11:48:20 -0700
Message-ID: <4F6A2273.2010602@linux.intel.com>
Date: Wed, 21 Mar 2012 11:48:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331914572.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331914572.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] e2fsprogs and manual recipe checks updates
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
X-List-Received-Date: Wed, 21 Mar 2012 18:58:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2012 09:19 AM, Scott Garman wrote:
> Hello,
>
> This pull request includes an upgrade for our e2fsprogs recipe, and
> updates for all of my recipes which require manual checks.
>
> e2fsprogs was build tested successfully on all 5 of our qemu
> architectures, and I did a visual comparison of the image and
> package output between this and the previous version to check
> for unusual discrepancies.
>
> Scott
>
> The following changes since commit 9950163c91412eb58c3475354cc7f87a7be33c2b:
>
>    python-imaging: bring in fixes from meta-oe (2012-03-16 10:56:31 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades3-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades3-oe
>
> Scott Garman (2):
>    e2fsprogs: upgrade to 1.42.1
>    distro_tracking: updates for upgraded recipes and manual checks
>
>   .../conf/distro/include/distro_tracking_fields.inc |   26 ++++++++++----------
>   .../acinclude.m4                                   |    0
>   .../fallocate.patch                                |    4 +-
>   .../mkdir.patch                                    |    1 +
>   .../remove.ldconfig.call.patch                     |   11 ++++++--
>   .../{e2fsprogs_1.42.bb =>  e2fsprogs_1.42.1.bb}     |    6 ++--
>   6 files changed, 27 insertions(+), 21 deletions(-)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 =>  e2fsprogs-1.42.1}/acinclude.m4 (100%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 =>  e2fsprogs-1.42.1}/fallocate.patch (100%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 =>  e2fsprogs-1.42.1}/mkdir.patch (99%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs-1.42 =>  e2fsprogs-1.42.1}/remove.ldconfig.call.patch (76%)
>   rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.42.bb =>  e2fsprogs_1.42.1.bb} (93%)
>

Merged into OE-Core

Thanks
	Sau!


