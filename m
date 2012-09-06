Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9grF-0000gv-5g
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 20:31:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Sep 2012 11:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="189747234"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2012 11:18:51 -0700
Message-ID: <5048E90B.4010502@linux.intel.com>
Date: Thu, 06 Sep 2012 11:18:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1346852521-22320-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1346852521-22320-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: fix pulseaudio-server RDEPENDS
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
X-List-Received-Date: Thu, 06 Sep 2012 18:31:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2012 06:42 AM, Martin Jansa wrote:
> * module-cork-music-on-phone was renamed to module-role-cork
>    http://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=3c5cc345472302b9511c19244b3eceb4a3674d8c
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc    | 2 +-
>   meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 22870ad..315d4dc 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -138,5 +138,5 @@ RDEPENDS_pulseaudio-server = " \
>       pulseaudio-module-suspend-on-idle \
>       pulseaudio-module-console-kit \
>       pulseaudio-module-position-event-sounds \
> -    pulseaudio-module-cork-music-on-phone "
> +    pulseaudio-module-role-cork "
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> index 5359146..97bd4d3 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> @@ -1,6 +1,6 @@
>   require pulseaudio.inc
>
> -PR = "r1"
> +PR = "r2"
>
>   DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>
>

Merged into OE-Core

Thanks
	Sau!



