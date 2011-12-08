Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYmLr-0001K3-Uy for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 23:22:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8MFEZL007436
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 22:15:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02430-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 22:15:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8MF7j4007424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 22:15:08 GMT
Message-ID: <1323382518.5309.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 22:15:18 +0000
In-Reply-To: <56c99ff60e262f1f704158aaf7a293a8bc26d163.1323327959.git.xiaofeng.yan@windriver.com>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<56c99ff60e262f1f704158aaf7a293a8bc26d163.1323327959.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 05/10] gtk: add demos to the configuation of gtk+
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
X-List-Received-Date: Thu, 08 Dec 2011 22:22:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-08 at 17:34 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Add demos for checking whether gtk+ run over directfb successfully or not.
> 
> [YOCTO #1674]
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+_2.24.8.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Why can't we build the demos unconditionally? I'd like to think we could
just build these everywhere and drop the patch. Does that cause some
kind of problem on X?

Cheers,

Richard

> diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
> index fb88979..9119d16 100644
> --- a/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
> +++ b/meta/recipes-gnome/gtk+/gtk+_2.24.8.bb
> @@ -9,12 +9,14 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>             file://run-iconcache.patch \
>             file://configure-nm.patch \
>             file://hardcoded_libtool.patch \
> -           file://no-demos.patch \
> +           ${@base_contains('DISTRO_FEATURES', 'directfb', '','${NODEMOS_SRC_URI}', d)} \
>             file://cellrenderer-cairo.patch;striplevel=0 \
>             file://toggle-font.diff;striplevel=0 \
>             file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
>             file://doc-fixes.patch \
>  	  "
> +NODEMOS_SRC_URI = "file://no-demos.patch"
> +
>  # TO MERGE
>  #           file://entry-cairo.patch;striplevel=0
>  #           file://filesystem-volumes.patch
> @@ -27,7 +29,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.bz2 \
>  #        file://combo-arrow-size.patch;striplevel=0
>  #            file://configurefix.patch
>  
> -PR = "r0"
> +PR = "r1"
>  
>  SRC_URI[md5sum] = "0413187f7e596aef00ccd1b54776ff03"
>  SRC_URI[sha256sum] = "ac2325a65312922a6722a7c02a389f3f4072d79e13131485cc7b7226e2537043"




