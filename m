Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RPi5q-0001Tm-QR
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Nov 2011 23:00:04 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Nov 2011 13:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="74969091"
Received: from unknown (HELO [10.255.15.217]) ([10.255.15.217])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2011 13:53:40 -0800
Message-ID: <4EC03C64.2010706@linux.intel.com>
Date: Sun, 13 Nov 2011 13:53:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321009557.git.xiaofeng.yan@windriver.com>
	<90a6f8a9052bf7300578e1c51064695efe570697.1321009557.git.xiaofeng.yan@windriver.com>
In-Reply-To: <90a6f8a9052bf7300578e1c51064695efe570697.1321009557.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 1/1] libx11-diet: update to 1.4.4
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
X-List-Received-Date: Sun, 13 Nov 2011 22:00:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2011 03:09 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> I remove patch "nodolt.patch" because it is no use in the new version \
> and change patch "include_fix.patch" to "keysymdef_include.patch" from libx11-1.4.4.
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   .../xorg-lib/libx11-diet-1.3/include_fix.patch     |   25 --------------
>   .../xorg-lib/libx11-diet-1.3/nodolt.patch          |   14 --------
>   .../libx11-diet-1.3/x11_disable_makekeys.patch     |   31 ------------------
>   .../X18NCMSstubs.diff                              |    1 +
>   .../fix-disable-xlocale.diff                       |    1 +
>   .../fix-utf8-wrong-define.patch                    |    2 +
>   .../libx11-diet-1.4.4/keysymdef_include.patch      |   23 +++++++++++++
>   .../libx11-diet-1.4.4/x11_disable_makekeys.patch   |   34 ++++++++++++++++++++
>   meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |   25 --------------
>   .../recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb |   28 ++++++++++++++++
>   10 files changed, 89 insertions(+), 95 deletions(-)
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 =>  libx11-diet-1.4.4}/X18NCMSstubs.diff (99%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 =>  libx11-diet-1.4.4}/fix-disable-xlocale.diff (90%)
>   rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 =>  libx11-diet-1.4.4}/fix-utf8-wrong-define.patch (88%)
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
>   delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
>   create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
>
<SNIP>

> diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
> new file mode 100644
> index 0000000..1762829
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
> @@ -0,0 +1,28 @@
> +require libx11.inc
> +
> +DESCRIPTION += " Support for XCB, UDC, XCMS and XLOCALE is disabled in \
> +this version."
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
> +
> +PR = "r0"
> +
> +SRC_URI += "file://x11_disable_makekeys.patch \
> +            file://X18NCMSstubs.diff \
> +            file://keysymdef_include.patch \
> +            file://fix-disable-xlocale.diff \
> +            file://fix-utf8-wrong-define.patch \
> +           "
> +
> +
> +SRC_URI[md5sum] = "ed7c382cbf8c13425b6a66bcac0ca5d9"
> +SRC_URI[sha256sum] = "7fe62180f08ef5f0a0062fb444591e349cae2ab5af6ad834599f5c654e6c840d"
> +
> +DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
> +            libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
> +
> +FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libx11"
> +
Why did you need to add FILESDIR here?

Sau!

> +EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
> +CFLAGS += "-D_GNU_SOURCE"
> +


