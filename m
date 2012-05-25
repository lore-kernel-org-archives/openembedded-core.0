Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxUG-0004S8-4Y
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:35:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2012 09:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157277333"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2012 09:25:22 -0700
Message-ID: <4FBFB272.7090800@linux.intel.com>
Date: Fri, 25 May 2012 09:25:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337892697-5489-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1337892697-5489-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] wpa-supplicant: don't let postinst fail when dbus-1 reload fails
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
X-List-Received-Date: Fri, 25 May 2012 16:35:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 01:51 PM, Martin Jansa wrote:
> * e.g. when upgrading in chroot
>    Configuring wpa-supplicant.
>    Reloading system message bus config: Failed to open connection to system message bus: Failed to connect to socket /var/run/dbus/system_bus_socket: Connection refused
>    but that shouldn't be fatal
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
>   .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> index efd1a66..6c84202 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
> @@ -74,6 +74,6 @@ pkg_postinst_wpa-supplicant () {
>   	DBUSPID=`pidof dbus-daemon`
>
>   	if [ "x$DBUSPID" != "x" ]; then
> -		/etc/init.d/dbus-1 reload
> +		/etc/init.d/dbus-1 reload || true
>   	fi
>   }
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> index 7bbb8c0..6f6378b 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
> @@ -1,6 +1,6 @@
>   require wpa-supplicant-0.7.inc
>
> -PR = "r11"
> +PR = "r12"
>
>   SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
>   SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"

Merged into OE-Core

Thanks
	Sau!


