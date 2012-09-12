Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBrKk-0004YL-FY
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 20:06:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2012 10:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="191945475"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by azsmga001.ch.intel.com with ESMTP; 12 Sep 2012 10:54:06 -0700
Message-ID: <5050CC3E.7070004@linux.intel.com>
Date: Wed, 12 Sep 2012 10:54:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <cover.1347376068.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1347376068.git.constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Package upgrades
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
X-List-Received-Date: Wed, 12 Sep 2012 18:06:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 08:19 AM, Constantin Musca wrote:
> This is another set of package upgrades compiled on all architectures
> and tested using core-image-sato.
> The following changes since commit 7250638ec895bc89508711831083d43b9e1e9826:
>
>    upstream_tracking: Fix format issues (2012-09-10 23:21:12 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib cmuscax/upgrades
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=cmuscax/upgrades
>
> Constantin Musca (5):
>    boost: upgrade to 1.51.0
>    glew: upgrade to 1.9.0
>    libexif: upgrade to 0.6.21
>    sysstat: upgrade to 10.1.1
Merged the above 4 into OE-Core

>    openssl: upgrade to 1.0.1c

I had some trouble with this one, there are a number of other recipes 
that depend on openssl and need PR bumps and more testing, particularly 
git had an issue with this patch. It's probably a good thing to have but 
might be just a little to late in the cycle given it's used by other tools.

Thanks
	Sau!

>
>   .../openssl-1.0.0j/debian/debian-targets.patch     |   54 -----
>   .../openssl/openssl-1.0.0j/debian/pic.patch        |  242 --------------------
>   .../configure-targets.patch                        |    0
>   .../debian/block_digicert_malaysia.patch           |   29 +++
>   .../openssl-1.0.1c/debian/block_diginotar.patch    |   67 ++++++
>   .../debian/c_rehash-compat.patch                   |   15 +-
>   .../openssl-1.0.1c/debian/c_rehash-multi.patch     |   89 +++++++
>   .../debian/ca.patch                                |    1 +
>   .../openssl-1.0.1c/debian/config-hurd.patch        |   18 ++
>   .../openssl-1.0.1c/debian/debian-targets.patch     |   67 ++++++
>   .../openssl-1.0.1c/debian/default_bits.patch       |   14 ++
>   .../openssl/openssl-1.0.1c/debian/dgst_hmac.patch  |   54 +++++
>   .../openssl/openssl-1.0.1c/debian/gnu_source.patch |   27 +++
>   .../debian/libdoc-manpgs-pod-spell.patch           |  239 +++++++++++++++++++
>   .../openssl-1.0.1c/debian/libssl-misspell.patch    |   14 ++
>   .../debian/make-targets.patch                      |   13 +-
>   .../debian/man-dir.patch                           |    1 +
>   .../debian/man-section.patch                       |    1 +
>   .../debian/no-rpath.patch                          |    1 +
>   .../debian/no-symbolic.patch                       |    1 +
>   .../debian/openssl-pod-misspell.patch              |  125 ++++++++++
>   .../openssl/openssl-1.0.1c/debian/pic.patch        |  178 ++++++++++++++
>   .../openssl/openssl-1.0.1c/debian/pkcs12-doc.patch |   39 ++++
>   .../openssl-1.0.1c/debian/pod_ec.misspell.patch    |   14 ++
>   .../debian/pod_pksc12.misspell.patch               |   14 ++
>   .../openssl-1.0.1c/debian/pod_req_misspell2.patch  |   15 ++
>   .../debian/pod_s_server.misspell.patch             |   14 ++
>   .../debian/pod_x509setflags.misspell.patch         |   14 ++
>   .../openssl/openssl-1.0.1c/debian/rehash-crt.patch |   36 +++
>   .../openssl/openssl-1.0.1c/debian/rehash_pod.patch |   63 +++++
>   .../openssl-1.0.1c/debian/renegiotate_tls.patch    |   13 ++
>   .../openssl-1.0.1c/debian/shared-lib-ext.patch     |   17 ++
>   .../openssl/openssl-1.0.1c/debian/stddef.patch     |   15 ++
>   .../openssl/openssl-1.0.1c/debian/valgrind.patch   |   23 ++
>   .../debian/version-script.patch                    |  203 ++++++++++++++--
>   .../engines-install-in-libdir-ssl.patch            |    0
>   .../{openssl-1.0.0j => openssl-1.0.1c}/find.pl     |    0
>   .../oe-ldflags.patch                               |    0
>   .../openssl-fix-link.patch                         |    0
>   .../openssl_fix_for_x32.patch                      |   38 ++-
>   .../shared-libs.patch                              |   33 +--
>   .../{openssl_1.0.0j.bb => openssl_1.0.1c.bb}       |   37 ++-
>   meta/recipes-extended/sysstat/sysstat_10.0.5.bb    |    8 -
>   meta/recipes-extended/sysstat/sysstat_10.1.1.bb    |    8 +
>   .../glew/{glew_1.7.0.bb => glew_1.9.0.bb}          |    6 +-
>   .../boost/{boost_1.50.0.bb => boost_1.51.0.bb}     |    4 +-
>   .../{libexif_0.6.20.bb => libexif_0.6.21.bb}       |    4 +-
>   47 files changed, 1465 insertions(+), 403 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/debian-targets.patch
>   delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/debian/pic.patch
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/configure-targets.patch (100%)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_digicert_malaysia.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/block_diginotar.patch
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/c_rehash-compat.patch (77%)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/c_rehash-multi.patch
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/ca.patch (93%)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/config-hurd.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/debian-targets.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/default_bits.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/dgst_hmac.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/gnu_source.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libdoc-manpgs-pod-spell.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/libssl-misspell.patch
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/make-targets.patch (46%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/man-dir.patch (86%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/man-section.patch (95%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/no-rpath.patch (91%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/no-symbolic.patch (91%)
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/openssl-pod-misspell.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pic.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pkcs12-doc.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_ec.misspell.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_pksc12.misspell.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_req_misspell2.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_s_server.misspell.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/pod_x509setflags.misspell.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash-crt.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/rehash_pod.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/renegiotate_tls.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/shared-lib-ext.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/stddef.patch
>   create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1c/debian/valgrind.patch
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/debian/version-script.patch (95%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/engines-install-in-libdir-ssl.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/find.pl (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/oe-ldflags.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/openssl-fix-link.patch (100%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/openssl_fix_for_x32.patch (63%)
>   rename meta/recipes-connectivity/openssl/{openssl-1.0.0j => openssl-1.0.1c}/shared-libs.patch (43%)
>   rename meta/recipes-connectivity/openssl/{openssl_1.0.0j.bb => openssl_1.0.1c.bb} (53%)
>   delete mode 100644 meta/recipes-extended/sysstat/sysstat_10.0.5.bb
>   create mode 100644 meta/recipes-extended/sysstat/sysstat_10.1.1.bb
>   rename meta/recipes-graphics/glew/{glew_1.7.0.bb => glew_1.9.0.bb} (80%)
>   rename meta/recipes-support/boost/{boost_1.50.0.bb => boost_1.51.0.bb} (53%)
>   rename meta/recipes-support/libexif/{libexif_0.6.20.bb => libexif_0.6.21.bb} (74%)
>


