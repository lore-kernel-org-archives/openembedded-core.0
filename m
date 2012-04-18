Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKYKc-0006Y5-PN for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 19:06:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IGulO9004053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 17:56:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03001-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 17:56:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3IGubv2004046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 17:56:39 +0100
Message-ID: <1334768201.24091.152.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2012 17:56:41 +0100
In-Reply-To: <1334765562-27101-1-git-send-email-jonas.danielsson@lundinova.se>
References: <1334765562-27101-1-git-send-email-jonas.danielsson@lundinova.se>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] opkg-utils: extend to nativesdk
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
X-List-Received-Date: Wed, 18 Apr 2012 17:06:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-18 at 18:12 +0200, Jonas Danielsson wrote:
> Signed-off-by: Jonas Danielsson <jonas.danielsson@lundinova.se>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 4fe4038..eb42eae 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>                      file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
>  RDEPENDS_${PN} = "python"
>  RDEPENDS_${PN}_virtclass-native = ""
> +RDEPENDS_${PN}_virtclass-nativesdk = "python-nativesdk"

Doesn't this happen automatically?

>  SRCREV = "16665959c330b5958c0f0f4624a9ca7f823f98de"
>  PV = "0.1.8+git${SRCPV}"
>  PR = "r1"
> @@ -27,5 +28,5 @@ do_install() {
>  	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
>  }
>  
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
>  TARGET_CC_ARCH += "${LDFLAGS}"

Cheers,

Richard



