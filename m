Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SeTJL-0002q3-9p for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 17:47:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CFafvD012149
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:36:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11576-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:36:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5CFaU2x012138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:36:31 +0100
Message-ID: <1339515389.8065.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2012 16:36:29 +0100
In-Reply-To: <1339514135-23891-1-git-send-email-sgw@linux.intel.com>
References: <1339514135-23891-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] curl: enable ssl support
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
X-List-Received-Date: Tue, 12 Jun 2012 15:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-06-12 at 08:15 -0700, Saul Wold wrote:
> This patch enables ssl support for curl to allow git to clone from
> https / ssl sites.
> 
> [YOCTO #2532]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-support/curl/curl_7.24.0.bb |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.24.0.bb
> index 12e95c9..0a16750 100644
> --- a/meta/recipes-support/curl/curl_7.24.0.bb
> +++ b/meta/recipes-support/curl/curl_7.24.0.bb
> @@ -5,10 +5,10 @@ SECTION = "console/network"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
>  
> -DEPENDS = "zlib gnutls"
> -DEPENDS_virtclass-native = "zlib-native"
> -DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
> -PR = "r0"
> +DEPENDS = "zlib gnutls openssl"
> +DEPENDS_virtclass-native = "zlib-native openssl"

openssl-native?

> +DEPENDS_virtclass-nativesdk = "zlib-nativesdk openssl"

openssl-nativesdk?

Cheers,

Richard



