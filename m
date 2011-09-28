Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1R8wcW-0000ob-3s
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 18:04:28 +0200
Received: from mail-yw0-f52.google.com ([209.85.213.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 28 Sep 2011 08:57:46 -0700
Received: by ywp31 with SMTP id 31so13821734ywp.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 08:57:46 -0700 (PDT)
Received: by 10.101.86.11 with SMTP id o11mr8544986anl.101.1317225466089;
	Wed, 28 Sep 2011 08:57:46 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id h20sm89652601ann.7.2011.09.28.08.57.45
	(version=SSLv3 cipher=OTHER); Wed, 28 Sep 2011 08:57:45 -0700 (PDT)
Message-ID: <4E8343F8.5000002@intel.com>
Date: Wed, 28 Sep 2011 08:57:44 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316673078-22962-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1316673078-22962-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] avahi: fix avahi-systemd dependencies
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
X-List-Received-Date: Wed, 28 Sep 2011 16:04:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/21/2011 11:31 PM, Koen Kooi wrote:
> During the avahi-ui split the RDEPENDS line got dropped leading to: http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=yocto&id=ae0db0eb51bde42f09b9513842c3b745c37c60d5
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index c3c9c71..5ad9db0 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -14,7 +14,7 @@ SECTION = "network"
>   # python scripts are under GPLv2+
>   LICENSE = "GPLv2+&  LGPLv2.1+"
>
> -INC_PR = "r7"
> +INC_PR = "r8"
>
>   DEPENDS = "expat libcap libdaemon dbus glib-2.0"
>
> @@ -78,6 +78,8 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
>   FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
>   FILES_avahi-utils = "${bindir}/avahi-*"
>
> +RDEPENDS_avahi-systemd = "avahi-daemon"
> +
>   RDEPENDS_avahi-daemon = "sysvinit-pidof"
>
>   # uclibc has no nss

Merged into OE-Core

Thanks
	Sau!



