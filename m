Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UPGbD-0003Ct-Hl
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 20:15:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Apr 2013 10:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="319238465"
Received: from unknown (HELO [10.255.14.17]) ([10.255.14.17])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2013 10:57:36 -0700
Message-ID: <51630510.7080105@linux.intel.com>
Date: Mon, 08 Apr 2013 10:57:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Alex DAMIAN <alexandru.damian@intel.com>
References: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1365425799-25357-1-git-send-email-alexandru.damian@intel.com>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bluez4: add readline dependency
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
X-List-Received-Date: Mon, 08 Apr 2013 18:15:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/08/2013 05:56 AM, Alex DAMIAN wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> bluez4 uses readline to be build, but the dependency is not listed
> This is listed in the configuration log.
> So we add it.
>
As far as I can tell it's needed only for gatttool, is this a tool that 
we need / want to provide for bluez?

This seems to be a tools for viewing the Generic Attribute Profile (GATT).

It can be disabled by setting "ac_cv_lib_readline_main=no"


Sau!


> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>   meta/recipes-connectivity/bluez/bluez4.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
> index bff24d3..42d82b0 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                       file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                       file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
>                       file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
> -DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck"
> +DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline"
>   RDEPENDS_${PN}-dev = "bluez-hcidump"
>
>   PACKAGECONFIG ??= "\
>


