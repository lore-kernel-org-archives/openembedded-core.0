Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 42590782BE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 08:20:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6M8KGCi032334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 22 Jul 2017 09:20:19 +0100
Message-ID: <1500711616.22282.110.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: swee.aun.khor@intel.com, openembedded-core@lists.openembedded.org
Date: Sat, 22 Jul 2017 09:20:16 +0100
In-Reply-To: <82e8a77a71e50e2cc00318226a42ced7d6a0909c.1500495522.git.swee.aun.khor@intel.com>
References: <cover.1500495522.git.swee.aun.khor@intel.com>
	<82e8a77a71e50e2cc00318226a42ced7d6a0909c.1500495522.git.swee.aun.khor@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sat, 22 Jul 2017 09:20:19 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/2] openssl: Support musl-x32 build
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
X-List-Received-Date: Sat, 22 Jul 2017 08:20:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-07-19 at 13:29 -0700, swee.aun.khor@intel.com wrote:
> From: sweeaun <swee.aun.khor@intel.com>
> 
> Support musl-x32 build which to build openssl with 32 bits.
> 
> Signed-off-by: sweeaun <swee.aun.khor@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc
> b/meta/recipes-connectivity/openssl/openssl.inc
> index ce295e8..a56bd6e 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -66,7 +66,8 @@ do_configure () {
>  	case $os in
>  	linux-gnueabi |\
>  	linux-gnuspe |\
> -	linux-musl*)
> +	linux-musleabi |\
> +	linux-muslspe)
>  		os=linux
>  		;;
>  		*)

I think there is a bug here if os=linux-musl which likely caused:

https://autobuilder.yocto.io/builders/nightly-musl/builds/364

Cheers,

Richard


