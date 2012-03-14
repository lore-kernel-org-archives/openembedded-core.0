Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S7niQ-00029H-Lu for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 13:54:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2ECjM3s007653
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:45:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06829-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:45:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2ECjF9j007647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 12:45:16 GMT
Message-ID: <1331729114.18586.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 12:45:14 +0000
In-Reply-To: <83725ac25080b6c3a15fe016300bf1bad7908561.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
	<83725ac25080b6c3a15fe016300bf1bad7908561.1331713807.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 14/14] bitbake.conf: Modify PACKAGE list ordering to insert -staticdev file before PN
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
X-List-Received-Date: Wed, 14 Mar 2012 12:54:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-14 at 01:33 -0700, Saul Wold wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/bitbake.conf |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 216da75..d4357d1 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -253,7 +253,7 @@ SOLIBSDEV_darwin = ".dylib"
>  SOLIBSDEV_darwin8 = ".dylib"
>  SOLIBSDEV_darwin9 = ".dylib"
>  
> -PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-locale"
> +PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
>  PACKAGES_DYNAMIC = "${PN}-locale-*"
>  FILES = ""
>  
> @@ -277,7 +277,7 @@ SECTION_${PN}-dev = "devel"
>  ALLOW_EMPTY_${PN}-dev = "1"
>  RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
>  
> -FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a"
> +FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
>  SECTION_${PN}-staticdev = "devel"
>  RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"


This is a major change at this point in the release cycle. I'd at least
want to see a "bitbake world" compared before and after using
buildhistory.

There are reasons we might want to do this with other packages such as
the -dbg and -dev too. It is a serious change though and we've never
dared with the other packages due to not knowing exactly what we were
changing.

Cheers,

Richard





