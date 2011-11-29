Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVQ3M-0008Nj-Ow
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 16:57:08 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 07:50:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="80920718"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 07:50:24 -0800
Message-ID: <4ED4FF40.8020503@linux.intel.com>
Date: Tue, 29 Nov 2011 07:50:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1322126292-25928-1-git-send-email-koen@dominion.thruhere.net>
	<1322126292-25928-2-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1322126292-25928-2-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCHv2 2/2] pulseaudio: update to 1.1, delete 0.9.x
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
X-List-Received-Date: Tue, 29 Nov 2011 15:57:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/2011 01:18 AM, Koen Kooi wrote:
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>
> Changes since v1:
> 	* remove pulse from default-versions
> 	* thumb1 has been verified to build
>
> As indicated in the subject, this is an RFC, please review and test.
>
> 1) the ARM_INSTRUCTIONSET workarounds have been removed, so for people using thumb1, please test
> 2) this is only buildtested on armv7a, more buildtests and runtime tests are on their way, so please test
>
>   meta/conf/distro/include/default-versions.inc      |    1 -
>   .../pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch |   61 --------------------
>   .../pulseaudio-0.9.22/autoconf_version.patch       |   17 ------
>   .../pulseaudio/pulseaudio-0.9.22/buildfix.patch    |   17 ------
>   .../pulseaudio-0.9.22/configure_silent_rules.patch |   33 -----------
>   .../pulseaudio-0.9.22/gcc4-compile-fix.patch       |   22 -------
>   .../pulseaudio/pulseaudio-0.9.22/tls_m4.patch      |   34 -----------
>   .../pulseaudio-0.9.22/volatiles.04_pulse           |    2 -
>   .../pulseaudio-0.9.23/autoconf_version.patch       |   17 ------
>   .../pulseaudio/pulseaudio-0.9.23/buildfix.patch    |   17 ------
>   .../pulseaudio-0.9.23/configure_silent_rules.patch |   33 -----------
>   .../pulseaudio-0.9.23/fix_bluez_build.patch        |   26 --------
>   .../pulseaudio-0.9.23/gcc4-compile-fix.patch       |   22 -------
>   .../pulseaudio/pulseaudio-0.9.23/tls_m4.patch      |   34 -----------
>   .../pulseaudio-0.9.23/volatiles.04_pulse           |    2 -
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
>   .../pulseaudio/pulseaudio/volatiles.04_pulse       |    2 +
>   .../pulseaudio/pulseaudio_0.9.22.bb                |   24 --------
>   .../pulseaudio/pulseaudio_0.9.23.bb                |   27 ---------
>   .../pulseaudio/pulseaudio_1.1.bb                   |   19 ++++++
>   20 files changed, 22 insertions(+), 390 deletions(-)
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/armv4+v5asm.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/autoconf_version.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/buildfix.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/configure_silent_rules.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/gcc4-compile-fix.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/tls_m4.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.22/volatiles.04_pulse
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_rules.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
>   create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.22.bb
>   delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>   create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb


Merged into OE-Core

Thanks
	Sau!




