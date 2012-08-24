Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4ywS-00036P-N1
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:49:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2012 11:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="210743159"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2012 11:36:48 -0700
Message-ID: <5037C9BF.8020003@linux.intel.com>
Date: Fri, 24 Aug 2012 11:36:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1345722302-25467-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Fri, 24 Aug 2012 18:49:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2012 04:44 AM, Constantin Musca wrote:
> This is another set of package upgrades compiled on all architectures
> and tested using core-image-sato.
>
> Constantin Musca (3):
>    foomatic-filters: upgrade to 4.0.17
>    libnfsidmap: upgrade to 0.25
>    dbus-glib: upgrade to 0.100
>
>   .../nfs-utils/files/fix-ac-prereq.patch            |    6 ++----
>   .../{libnfsidmap_0.24.bb => libnfsidmap_0.25.bb}   |    6 +++---
>   .../no-examples.patch                              |    0
>   .../test-install-makefile.patch                    |    0
>   .../test-service-glib-include-glib-only.patch      |   20 --------------------
>   meta/recipes-core/dbus/dbus-glib.inc               |    1 -
>   .../dbus/{dbus-glib_0.98.bb => dbus-glib_0.100.bb} |    6 +++---
>   ...ilters_4.0.16.bb => foomatic-filters_4.0.17.bb} |    6 +++---
>   8 files changed, 11 insertions(+), 34 deletions(-)
>   rename meta/recipes-connectivity/nfs-utils/{libnfsidmap_0.24.bb => libnfsidmap_0.25.bb} (74%)
>   rename meta/recipes-core/dbus/{dbus-glib-0.98 => dbus-glib-0.100}/no-examples.patch (100%)
>   rename meta/recipes-core/dbus/{dbus-glib-0.98 => dbus-glib-0.100}/test-install-makefile.patch (100%)
>   delete mode 100644 meta/recipes-core/dbus/dbus-glib-0.98/test-service-glib-include-glib-only.patch
>   rename meta/recipes-core/dbus/{dbus-glib_0.98.bb => dbus-glib_0.100.bb} (13%)
>   rename meta/recipes-extended/foomatic/{foomatic-filters_4.0.16.bb => foomatic-filters_4.0.17.bb} (90%)
>
Merged into OE-Core

Thanks
	Sau!



