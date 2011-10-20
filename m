Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwOd-0007Ue-Ah
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:27:11 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 10:21:15 -0700
Received: by wyg24 with SMTP id 24so3104587wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:21:14 -0700 (PDT)
Received: by 10.227.5.213 with SMTP id 21mr4153363wbw.40.1319131274342;
	Thu, 20 Oct 2011 10:21:14 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id fi11sm16775933wbb.9.2011.10.20.10.21.11
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:21:12 -0700 (PDT)
Message-ID: <4EA05885.8060408@intel.com>
Date: Thu, 20 Oct 2011 10:21:09 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1318865134-4380-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1318865134-4380-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] bind 9.8.1: fix build after recent update
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
X-List-Received-Date: Thu, 20 Oct 2011 17:27:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2011 08:25 AM, Koen Kooi wrote:
> | checking linking as -lgssapi -lkrb5 -ldes -lcrypt -lasn1 -lroken -lcom_err... no
> | checking linking as -lgssapi -lkrb5 -lcrypto -lcrypt -lasn1 -lroken -lcom_err... no
> | checking linking as -lgss -lkrb5... no
> | configure: error: could not determine proper GSSAPI linkage
> | + bbfatal 'oe_runconf failed'
> | + echo 'ERROR: oe_runconf failed'
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-connectivity/bind/bind_9.8.1.bb |    5 +++--
>   1 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb b/meta/recipes-connectivity/bind/bind_9.8.1.bb
> index 330acdb..af473e9 100644
> --- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
> @@ -6,10 +6,10 @@ LICENSE = "ISC&  BSD"
>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=0fbe2a3ab3c68ac3fea3cad13093877c"
>
>   DEPENDS = "openssl"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
> -	   file://conf.patch \
> +           file://conf.patch \
>              file://cross-build-fix.patch \
>   	   "
>
> @@ -19,6 +19,7 @@ SRC_URI[sha256sum] = "02285dc429cb2a6687a1b2446e9ee22c1df27f2577225b05be5092395e
>   # --enable-exportlib is necessary for building dhcp
>   EXTRA_OECONF = " --enable-ipv6=no --with-randomdev=/dev/random --disable-threads \
>                    --disable-devpoll --disable-epoll --with-gost=no \
> +                 --with-gssapi=no \
>                    --sysconfdir=${sysconfdir}/bind \
>                    --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
>                    --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \


Merged into OE-Core

Thanks
	Sau!



