Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwoA-00064t-BC
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:35:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Oct 2012 13:21:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="237146801"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2012 13:21:49 -0700
Message-ID: <508064DC.4000104@linux.intel.com>
Date: Thu, 18 Oct 2012 13:21:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1349968730-24071-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1349968730-24071-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: add missing switch-on-port-available dependency to the server
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
X-List-Received-Date: Thu, 18 Oct 2012 20:35:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2012 08:18 AM, Ross Burton wrote:
> The PulseAudio server recently added a dependency by default on the
> switch-if-port-available module, but this was not enforced by the package
> dependencies so the server won't start.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc    |    3 ++-
>   meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb |    2 +-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 3003eaa..46e84c3 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -137,7 +137,8 @@ RDEPENDS_pulseaudio-server = " \
>       pulseaudio-module-always-sink \
>       pulseaudio-module-suspend-on-idle \
>       pulseaudio-module-position-event-sounds \
> -    pulseaudio-module-role-cork "
> +    pulseaudio-module-role-cork \
> +    pulseaudio-module-switch-on-port-available"
>
>   RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
>   RDEPENDS_pulseaudio-server += "\
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> index 1c2c9f7..a10b953 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> @@ -1,6 +1,6 @@
>   require pulseaudio.inc
>
> -PR = "r6"
> +PR = "r7"
>
>   DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>
>

Merged into OE-Core

Thanks
	Sau!



