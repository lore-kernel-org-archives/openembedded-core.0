Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QS8OC-0007vU-Qn for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 15:56:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52DrXW7013420
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:53:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13073-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 14:53:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p52DrST5013412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 14:53:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307012406-11055-1-git-send-email-Martin.Jansa@gmail.com>
References: <1307007513.27470.473.camel@rex>
	<1307012406-11055-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 02 Jun 2011 14:53:09 +0100
Message-ID: <1307022789.27470.544.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gnutls: add --with-libdl-prefix and --with-libpthread-prefix
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
X-List-Received-Date: Thu, 02 Jun 2011 13:56:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-02 at 13:00 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-support/gnutls/gnutls.inc |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 9f8d81b..03aed6a 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -22,6 +22,8 @@ inherit autotools binconfig pkgconfig gettext
>  EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
>                --with-libtasn1-prefix=${STAGING_DIR_HOST}${prefix} \
>                --with-libgcrypt --with-libgcrypt-prefix=${STAGING_DIR_HOST}${prefix} \
> +              --with-libdl-prefix=${STAGING_DIR_HOST}${prefix} \
> +              --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
>                --with-lzo --disable-guile \
>                "
>  do_configure_prepend() {

Merged to master, thanks.

Richard



