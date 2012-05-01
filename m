Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SPHyi-0003MO-U1
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 20:39:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 May 2012 11:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137542961"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 01 May 2012 11:29:28 -0700
Message-ID: <4FA02B87.6050508@linux.intel.com>
Date: Tue, 01 May 2012 11:29:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120429084538.GA350@jama.jama.net>
	<1335689202-30557-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1335689202-30557-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] ofono: upgrade to 1.6
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
X-List-Received-Date: Tue, 01 May 2012 18:39:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/29/2012 01:46 AM, Martin Jansa wrote:
> * 1.5 is not compatible with glib-2.32 and newer
>    | In file included from gisi/client.h:30:0,
>    |                  from gisi/client.c:33:
>    |/OE/shr-core/tmp-eglibc/sysroots/spitz/usr/include/glib-2.0/glib/gtypes.h:28:2: error: #error "Only<glib.h>  can be included directly."
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-connectivity/ofono/ofono_1.5.bb |   14 --------------
>   meta/recipes-connectivity/ofono/ofono_1.6.bb |   15 +++++++++++++++
>   2 files changed, 15 insertions(+), 14 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.5.bb
>   create mode 100644 meta/recipes-connectivity/ofono/ofono_1.6.bb
>
> diff --git a/meta/recipes-connectivity/ofono/ofono_1.5.bb b/meta/recipes-connectivity/ofono/ofono_1.5.bb
> deleted file mode 100644
> index dad813f..0000000
> --- a/meta/recipes-connectivity/ofono/ofono_1.5.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -require ofono.inc
> -
> -PR = "r1"
> -
> -SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${BPN}-${PV}.tar.bz2 \
> -	          file://ofono"
> -
> -EXTRA_OECONF += "\
> -    --enable-test \
> -    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
> -"
> -
> -SRC_URI[md5sum] = "a54935a2a86b90300410c6c033284f6c"
> -SRC_URI[sha256sum] = "3a70608c17f3dca34c1e057aacdf836021322dfdcaf9edc777119eafe48076b3"
> diff --git a/meta/recipes-connectivity/ofono/ofono_1.6.bb b/meta/recipes-connectivity/ofono/ofono_1.6.bb
> new file mode 100644
> index 0000000..386ffee
> --- /dev/null
> +++ b/meta/recipes-connectivity/ofono/ofono_1.6.bb
> @@ -0,0 +1,15 @@
> +require ofono.inc
> +
> +SRC_URI  = "\
> +  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.bz2 \
> +  file://ofono \
> +"
> +SRC_URI[md5sum] = "d863b2b650a525cf75056085398bc8ef"
> +SRC_URI[sha256sum] = "63e38ea1cf35b00ecbab7611c6caa2adcd33eb10495f7a9f72013d4ab7a14c98"
> +
> +
> +EXTRA_OECONF += "\
> +    --enable-test \
> +    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
> +"
> +

Merged into OE-Core

Thanks
	Sau!


