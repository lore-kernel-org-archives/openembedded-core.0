Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrARd-0001U1-92
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:16:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 09:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178853575"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 09:04:41 -0700
Message-ID: <50058D19.5090109@linux.intel.com>
Date: Tue, 17 Jul 2012 09:04:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342020803-4197-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1342020803-4197-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] python-dbus: upgrade to 1.1.0
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
X-List-Received-Date: Tue, 17 Jul 2012 16:16:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2012 08:33 AM, Bogdan Marinescu wrote:
> Tested by compiling core-image-basic
>
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   .../{python-dbus_1.0.0.bb => python-dbus_1.1.0.bb} |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-devtools/python/{python-dbus_1.0.0.bb => python-dbus_1.1.0.bb} (82%)
>
> diff --git a/meta/recipes-devtools/python/python-dbus_1.0.0.bb b/meta/recipes-devtools/python/python-dbus_1.1.0.bb
> similarity index 82%
> rename from meta/recipes-devtools/python/python-dbus_1.0.0.bb
> rename to meta/recipes-devtools/python/python-dbus_1.1.0.bb
> index 1b174eb..a10fda3 100644
> --- a/meta/recipes-devtools/python/python-dbus_1.0.0.bb
> +++ b/meta/recipes-devtools/python/python-dbus_1.1.0.bb
> @@ -4,12 +4,12 @@ HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f5612614133e9a2f2dad527d97554670"
>   DEPENDS = "expat dbus dbus-glib virtual/libintl python-pyrex-native"
> -PR = "r1"
> +PR = "r0"
>
>   SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "775a8235736bf760cdd96e2d76546469"
> -SRC_URI[sha256sum] = "9e46f97d739dde8a5ab33ec6b11da58794c4c20804aacdad2880b7d3bc05187a"
> +SRC_URI[md5sum] = "41a459bbbb5fd92eeebd632623af0bd7"
> +SRC_URI[sha256sum] = "2dc30b53cdb2e20f8d0265af3be878e9da68745cf9ccc72f75de869094c4fc60"
>   S = "${WORKDIR}/dbus-python-${PV}"
>
>   inherit distutils-base autotools pkgconfig
>

Merged into OE-Core

Thanks
	Sau!



