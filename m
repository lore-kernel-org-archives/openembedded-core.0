Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1StNI7-0005YS-Mj
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 20:23:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Jul 2012 11:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="176155200"
Received: from unknown (HELO [10.255.12.231]) ([10.255.12.231])
	by orsmga002.jf.intel.com with ESMTP; 23 Jul 2012 11:12:07 -0700
Message-ID: <500D93F7.8040400@linux.intel.com>
Date: Mon, 23 Jul 2012 11:12:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342798565.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1342798565.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] openssl upgrade
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
X-List-Received-Date: Mon, 23 Jul 2012 18:23:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2012 08:38 AM, Scott Garman wrote:
> Hello,
>
> This pull request upgrades openssl to 1.0.0j to address a security
> vulnerability.
>
> This pull request is intended for both master and denzil.
>
> It has been build-tested on all 5 of our QEMU architectures and
> run through our buildhistory system without problems.
>
> Thanks,
>
> Scott
>
> The following changes since commit ef637e417ae1c2dff7fc0ad6cb30989e72ac35ab:
>
>    grub-efi-native: remove help2man dependency (2012-07-20 12:32:13 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib sgarman/openssl-upgrade-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/openssl-upgrade-oe
>
> Scott Garman (1):
>    openssl: upgrade to 1.0.0j
>
>   .../configure-targets.patch                        |    0
>   .../debian/c_rehash-compat.patch                   |    0
>   .../debian/ca.patch                                |    0
>   .../debian/debian-targets.patch                    |    0
>   .../debian/make-targets.patch                      |    0
>   .../debian/man-dir.patch                           |    0
>   .../debian/man-section.patch                       |    0
>   .../debian/no-rpath.patch                          |    0
>   .../debian/no-symbolic.patch                       |    0
>   .../debian/pic.patch                               |    0
>   .../debian/version-script.patch                    |    0
>   .../engines-install-in-libdir-ssl.patch            |    0
>   .../{openssl-1.0.0i => openssl-1.0.0j}/find.pl     |    0
>   .../oe-ldflags.patch                               |    0
>   .../openssl-fix-link.patch                         |    0
>   .../openssl_fix_for_x32.patch                      |    0
>   .../shared-libs.patch                              |    0
>   .../{openssl_1.0.0i.bb => openssl_1.0.0j.bb}       |    4 ++--
>   18 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/configure-targets.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/c_rehash-compat.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/ca.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/debian-targets.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/make-targets.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/man-dir.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/man-section.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/no-rpath.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/no-symbolic.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/pic.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/debian/version-script.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/engines-install-in-libdir-ssl.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/find.pl (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/oe-ldflags.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/openssl-fix-link.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/openssl_fix_for_x32.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0i => openssl-1.0.0j}/shared-libs.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl_1.0.0i.bb => openssl_1.0.0j.bb} (90%)
>

Merged into OE-Core

Thanks
	Sau!


