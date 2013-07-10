Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C08BF60686
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 18:50:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jul 2013 11:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1037,1363158000"; d="scan'208";a="367984362"
Received: from unknown (HELO [10.255.13.73]) ([10.255.13.73])
	by orsmga002.jf.intel.com with ESMTP; 10 Jul 2013 11:50:18 -0700
Message-ID: <51DDACEA.1080503@linux.intel.com>
Date: Wed, 10 Jul 2013 11:50:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: eu@felipetonello.com
References: <1373303785-8508-1-git-send-email-eu@felipetonello.com>
In-Reply-To: <1373303785-8508-1-git-send-email-eu@felipetonello.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: Added consolekit dependency for pulseaudio-module-console-kit package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Jul 2013 18:50:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2013 10:16 AM, eu@felipetonello.com wrote:
> From: "Felipe F. Tonello" <eu@felipetonello.com>
>
> When installing pulseaudio-module-console-kit package in an image the
> consolekit dependecy cannot be find. This patch makes sure that the consolekit
> recipe will be build.
>
Is this really a build-time dependency or a runtime dependency specific 
to the pulseaudio-module?

Sau!

> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index e4fc648..f925e7d 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>                       file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
>   DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool"
>   # optional
> -DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
> +DEPENDS += "udev alsa-lib glib-2.0 dbus gconf consolekit"
>
>   SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.gz \
>              file://gcc4-compile-fix.patch \
>

