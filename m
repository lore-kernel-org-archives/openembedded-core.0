Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPHkh-0007zy-Iu
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:20:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 May 2011 10:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,268,1304319600"; 
   d="scan'208";a="1563026"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by azsmga001.ch.intel.com with ESMTP; 25 May 2011 10:17:01 -0700
Message-ID: <4DDD398D.50307@linux.intel.com>
Date: Wed, 25 May 2011 10:17:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306162757-12769-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1306162757-12769-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] pulseaudio: package udev rules
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
X-List-Received-Date: Wed, 25 May 2011 17:20:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2011 07:59 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
>   .../pulseaudio/pulseaudio_0.9.15.bb                |    2 +-
>   .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 78d790f..e46b716 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -69,7 +69,7 @@ FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la"
>   FILES_${PN}-conf = "${sysconfdir}"
>   FILES_${PN}-bin = "${bindir}/* \
>                      ${sysconfdir}/default/volatiles/volatiles.04_pulse"
> -FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl"
> +FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl ${base_libdir}/udev/rules.d/*.rules"
>   FILES_${PN}-gconf-helper = "${libexecdir}/pulse/gconf-helper"
>   FILES_${PN}-misc = "${bindir}/*"
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
> index 7bac9f9..71e19e9 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb
> @@ -1,7 +1,7 @@
>   require pulseaudio.inc
>
>   DEPENDS += "dbus gdbm speex"
> -PR = "r14"
> +PR = "r15"
>
>   SRC_URI += "\
>     file://buildfix.patch;patch=1 \
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> index 91893d7..863beda 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
> @@ -1,6 +1,6 @@
>   require pulseaudio.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   DEPENDS += "gdbm speex"
>
Merged into oe-core

Thanks
	Sau!



