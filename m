Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id C35A7748DE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 12:39:35 +0000 (UTC)
Received: from [10.1.14.248] (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 688EF3F3E5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 14:39:35 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20180503081758.4661-1-anuj.mittal@intel.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <9e7c2d23-7836-fee3-47e5-1a9ae8c93054@pseudoterminal.org>
Date: Mon, 7 May 2018 14:39:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180503081758.4661-1-anuj.mittal@intel.com>
Subject: Re: [PATCH 01/12] gstreamer1.0: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Mon, 07 May 2018 12:39:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Is this based on my updates in meta-gstreamer1.0 ?

I did not yet have the time to push them to the mailing list, but it 
would be good to try and not have duplicate work.


On 2018-05-03 10:17, Anuj Mittal wrote:
> * For changes, please see: https://gstreamer.freedesktop.org/releases/1.14/
> * Merge inc and bb file since we only have one version now.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>   meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb   | 14 --------------
>   .../gstreamer/{gstreamer1.0.inc => gstreamer1.0_1.14.0.bb} | 12 +++++++++++-
>   2 files changed, 11 insertions(+), 15 deletions(-)
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0.inc => gstreamer1.0_1.14.0.bb} (84%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
> deleted file mode 100644
> index 01b2396513..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require gstreamer1.0.inc
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
> -                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
> -
> -SRC_URI = " \
> -    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
> -"
> -SRC_URI[md5sum] = "9d268f2e891cce1ac0832f1cc467d4ea"
> -SRC_URI[sha256sum] = "5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674"
> -
> -S = "${WORKDIR}/gstreamer-${PV}"
> -
> -CVE_PRODUCT = "gstreamer"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> similarity index 84%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> index c2df1f3258..b4398c8111 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
> @@ -14,11 +14,19 @@ inherit autotools pkgconfig gettext upstream-version-is-even gobject-introspecti
>   # (it has a custom INTROSPECTION_INIT macro, and so must be used instead of our common introspection.m4 file)
>   acpaths = "-I ${S}/common/m4 -I ${S}/m4"
>   
> -SRC_URI_append = " \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
> +                    file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
> +
> +S = "${WORKDIR}/gstreamer-${PV}"
> +
> +SRC_URI = " \
> +    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
>       file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
>       file://gtk-doc-tweaks.patch \
>       file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
>   "
> +SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
> +SRC_URI[sha256sum] = "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
>   
>   PACKAGECONFIG ??= ""
>   
> @@ -59,3 +67,5 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
>   do_compile_prepend() {
>           export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
>   }
> +
> +CVE_PRODUCT = "gstreamer"


