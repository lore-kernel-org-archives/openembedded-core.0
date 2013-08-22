Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BF9D46B3B1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 22:12:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2013 15:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,936,1367996400"; d="scan'208";a="385149976"
Received: from unknown (HELO [10.255.14.105]) ([10.255.14.105])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2013 15:12:17 -0700
Message-ID: <52168CC1.5050906@linux.intel.com>
Date: Thu, 22 Aug 2013 15:12:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
In-Reply-To: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: World build on OE-Core
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
X-List-Received-Date: Thu, 22 Aug 2013 22:12:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/22/2013 02:24 PM, Khem Raj wrote:
> Hi
>
> In spare cycles my box ran world build for all eglibc/qemus, arm, ppc, mips looks all fine however I see errors on mips64,x86 and x86_64
> I am looking into the mips64 one.
>
> x86_64
> ======
>
> Summary: 17 tasks failed:
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.1.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/cairo/cairo_1.12.14.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/bluez/bluez4_4.101.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/curl/curl_7.32.0.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.14.0.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/mesa/mesa_9.1.6.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/enchant/enchant_1.6.0.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/neon/neon_0.30.0.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.0.9.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-support/taglib/taglib_1.8.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-extended/parted/parted_3.1.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-extended/libuser/libuser_0.59.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/neard/neard_0.10.bb, do_compile
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.7.bb, do_compile
>
I do regular builds on my local machine of world and qemumips (not 
mips64) with MUT, I wonder what your failures are.  I will do a scratch 
build right now.

What's your exact setup?  any other settings in your local.conf?

Sau!


>
> x86
> ====
>
> Summary: 1 task failed:
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb, do_compile
>
This is strange because we do world builds regularly.

>
> mips64
> ======
>
> Summary: 1 task failed:
>    /builds1/angstrom/sources/openembedded-core/meta/recipes-devtools/dpkg/dpkg_1.17.1.bb, do_configure
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

