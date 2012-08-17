Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2TmZ-00007K-1O
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:08:39 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 13:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135534360"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 13:56:38 -0700
Message-ID: <502EB006.9060308@linux.intel.com>
Date: Fri, 17 Aug 2012 13:56:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344877359-12997-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1344877359-12997-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH] wpa-supplicant: fix paths in dbus/systemd *.service files
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
X-List-Received-Date: Fri, 17 Aug 2012 21:08:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/13/2012 10:02 AM, Andreas Müller wrote:
>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>   .../wpa-supplicant/wpa-supplicant-1.0.inc          |    2 ++
>   .../wpa-supplicant/wpa-supplicant_1.0.bb           |    2 +-
>   2 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> index 0c18b30..873e923 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
> @@ -29,6 +29,8 @@ do_configure () {
>   }
>
>   export EXTRA_CFLAGS = "${CFLAGS}"
> +export BINDIR = "${sbindir}"
> +
>   do_compile () {
>   	unset CFLAGS CPPFLAGS CXXFLAGS
>   	oe_runmake
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
> index 8ede3e5..a60cd86 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
> @@ -1,6 +1,6 @@
>   require wpa-supplicant-1.0.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI[md5sum] = "8650f6aa23646ef634402552d0669640"
>   SRC_URI[sha256sum] = "91d41d473a5aafa2e25dd6577ebda975c4d4a3188850a53e31feaf7c04482b9c"
>

Merged into OE-Core

Thanks
	Sau!



