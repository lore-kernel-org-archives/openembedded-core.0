Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqPWJ-0006Ow-Vu for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 15:05:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78D10vR002834
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 14:01:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02217-06 for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2011 14:00:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78D0p82002828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2011 14:00:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312790200-7205-1-git-send-email-Martin.Jansa@gmail.com>
References: <4E38336B.8010604@linux.intel.com>
	<1312790200-7205-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 08 Aug 2011 14:00:21 +0100
Message-ID: <1312808421.14274.189.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 10/10] eglibc: remove PACKAGES from eglibc.inc
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
X-List-Received-Date: Mon, 08 Aug 2011 13:05:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 09:56 +0200, Martin Jansa wrote:
> * PACKAGES were defined in eglibc.inc as well as eglibc-package.inc, definition
>   from eglibc.inc was overriden from recipes including eglibc.inc only
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/eglibc/eglibc.inc |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
> index 1b2e630..0f97f82 100644
> --- a/meta/recipes-core/eglibc/eglibc.inc
> +++ b/meta/recipes-core/eglibc/eglibc.inc
> @@ -41,8 +41,6 @@ EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
>  EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
>  PARALLEL_MAKE = ""
>  
> -PACKAGES = "glibc catchsegv sln nscd ldd glibc-utils glibc-dev glibc-doc libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
> -
>  OE_FEATURES = "${@features_to_eglibc_settings(d)}"
>  do_configure_prepend() {
>  	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in

Merged to master, thanks.

Richard



