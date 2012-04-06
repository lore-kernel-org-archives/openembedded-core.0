Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFzrr-0007P3-2E
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:29:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 20:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85936745"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 20:20:32 -0700
Message-ID: <4F7E6100.8010809@linux.intel.com>
Date: Thu, 05 Apr 2012 20:20:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333659001.git.andrei@gherzan.ro>
In-Reply-To: <cover.1333659001.git.andrei@gherzan.ro>
Subject: Re: [PATCH 0/6] Add patches to compile some modules and to skip warnings about some other
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
X-List-Received-Date: Fri, 06 Apr 2012 03:29:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 01:54 PM, Andrei Gherzan wrote:
> The following changes since commit 5607729d9901c394b7cd4db6e38fe7fb19116f39:
>
>    self-hosted-image: Increase space for build and allow builder user sudo access (2012-04-04 17:17:55 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib ag/pythonbug2
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/pythonbug2
>
> Andrei Gherzan (6):
>    gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in
>      include/gdbm
Merged into OE-Core

>    python: Add patch for 64bit platform
>    python: Add patch to search for db.h in inc_dirs and remove warning
>    python: Add patch to avoid warning about bsddb module
>    python: Add patch to avoid warning about _tkinter
>    python: Add patch to avoid warning about sunaudiodev module
>
We are going hold these, I will be integrating them into a master-next 
for holding.

Thanks

Sau!


>   .../python/python/avoid_warning_about_bsddb.patch  |   23 ++++++++
>   .../python/avoid_warning_about_tkinter.patch       |   25 +++++++++
>   .../avoid_warning_for_sunos_specific_module.patch  |   23 ++++++++
>   .../python/check-if-target-is-64b-not-host.patch   |   57 ++++++++++++++++++++
>   ...search_db_h_in_inc_dirs_and_avoid_warning.patch |   40 ++++++++++++++
>   meta/recipes-devtools/python/python_2.7.2.bb       |    7 ++-
>   meta/recipes-support/gdbm/gdbm_1.10.bb             |   13 ++++-
>   7 files changed, 186 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python/avoid_warning_about_bsddb.patch
>   create mode 100644 meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
>   create mode 100644 meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch
>   create mode 100644 meta/recipes-devtools/python/python/check-if-target-is-64b-not-host.patch
>   create mode 100644 meta/recipes-devtools/python/python/search_db_h_in_inc_dirs_and_avoid_warning.patch
>


