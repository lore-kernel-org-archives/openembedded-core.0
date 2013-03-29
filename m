Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ULcOK-0004A3-7m for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 17:43:01 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2TGZsB7014872; Fri, 29 Mar 2013 16:35:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EUps1al7viPF; Fri, 29 Mar 2013 16:35:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2TGZnC6014853
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 29 Mar 2013 16:35:52 GMT
Message-ID: <1364574336.28471.194.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Fri, 29 Mar 2013 16:25:36 +0000
In-Reply-To: <1364566362-16292-1-git-send-email-cristian.iorga@intel.com>
References: <1364566362-16292-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] lsb: distro codename info added
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
X-List-Received-Date: Fri, 29 Mar 2013 16:43:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-03-29 at 16:12 +0200, Cristian Iorga wrote:
> Poky distro codename info added to /etc/lsb-release file.
> lsb_release script will not complain anymore about
> the incompleteness of /etc/lsb-release file by
> returning an error code.
> Increases LSB compliance.
> 
> Partial fix for [YOCTO #4071].
> 
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/recipes-extended/lsb/lsb_4.1.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

What about people who haven't set DISTRO_CODENAME?

Cheers,

Richard

> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
> index 01368b3..b28e9b6 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "LSB support for OpenEmbedded"
>  SECTION = "console/utils"
>  HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
>  LICENSE = "GPLv2+"
> -PR = "r1"
> +PR = "r2"
>  
>  # lsb_release needs getopt
>  RDEPENDS_${PN} += "util-linux"
> @@ -41,6 +41,7 @@ do_install(){
>  	echo "\"" >> ${D}${sysconfdir}/lsb-release
>  	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
>  	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release
> +	echo "DISTRIB_CODENAME=${DISTRO_CODENAME}" >> ${D}${sysconfdir}/lsb-release
>  	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
>  
>  	if [ "${TARGET_ARCH}" = "i586" ];then




