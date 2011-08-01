Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QnuzA-0006yl-Jj
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 18:04:56 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Qnuv0-0001yI-Im; Mon, 01 Aug 2011 18:00:38 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 01 Aug 2011 17:00:37 +0100
In-Reply-To: <1312206102-16094-1-git-send-email-koen@dominion.thruhere.net>
References: <1312206102-16094-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312214438.30326.523.camel@phil-desktop>
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2] arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case
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
X-List-Received-Date: Mon, 01 Aug 2011 16:04:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-01 at 15:41 +0200, Koen Kooi wrote:
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
> index ce9cee5..704f86b 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -14,9 +14,9 @@ TUNE_FEATURES_tune-armv7a ?= "armv7a vfp"
>  TUNE_FEATURES_tune-armv7at ?= "armv7a vfp thumb"
>  TUNE_FEATURES_tune-armv7a-neon ?= "armv7a vfp neon"
>  TUNE_FEATURES_tune-armv7at-neon ?= "armv7a vfp neon thumb"
> -PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7a = "${PACKAGE_EXTRA_ARCHS_tune-armv7} armv7a armv7a-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-armv7a-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7a} armv7a-vfp-neon"
> -PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a-vfp armv7at2-vfp"
> +PACKAGE_EXTRA_ARCHS_tune-armv7at = "${PACKAGE_EXTRA_ARCHS_tune-armv7t} armv7a armv7a-vfp armv7at2-vfp"
>  PACKAGE_EXTRA_ARCHS_tune-armv7at-neon = "${PACKAGE_EXTRA_ARCHS_tune-armv7at} armv7a-vfp-neon armv7at2-vfp-neon"

Shouldn't this be getting handled in pkgarch_mapping() at the point
where the renaming happens?  In this particular case it seems harmless
(if a bit fragile) to name both possibilities in PACKAGE_EXTRA_ARCHS_...
but I'm not certain that this will always be safe in general.

p.




