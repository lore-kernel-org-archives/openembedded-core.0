Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TNruG-0002SW-EC for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 23:09:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9FKtioD004234;
	Mon, 15 Oct 2012 21:55:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01428-02; Mon, 15 Oct 2012 21:55:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9FKtajF004212
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 15 Oct 2012 21:55:37 +0100
Message-ID: <1350334543.2185.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Mon, 15 Oct 2012 21:55:43 +0100
In-Reply-To: <decff650be8ca9f3938423a38e869fb1d13baaec.1350300631.git.kai.kang@windriver.com>
References: <cover.1350300631.git.kai.kang@windriver.com>
	<decff650be8ca9f3938423a38e869fb1d13baaec.1350300631.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] nativesdk-packagegroup-sdk-host: add perl modules
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
X-List-Received-Date: Mon, 15 Oct 2012 21:09:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-15 at 19:32 +0800, Kang Kai wrote:
> nativesdk-perl is required to cross compile iptables when use
> meta-toolchain-gmae, and perl modules are needed too.
> Package nativesdk-perl-modules depends on nativesdk-perl, so just add
> nativesdk-perl-modules only.
> 
> [Yocto 3100]
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  .../nativesdk-packagegroup-sdk-host.bb             |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index 63fea28..383820a 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -3,7 +3,7 @@
>  #
>  
>  SUMMARY = "Host packages for the standalone SDK or external toolchain"
> -PR = "r11"
> +PR = "r12"
>  LICENSE = "MIT"
>  
>  inherit nativesdk packagegroup
> @@ -20,6 +20,7 @@ RDEPENDS_${PN} = "\
>      nativesdk-libtool \
>      nativesdk-autoconf \
>      nativesdk-automake \
> +    nativesdk-perl-modules \
>      "

This doesn't feel right. Which tool has the perl dependency and why
doesn't that tool depend on (xxx-)perl-modules?

Cheers,

Richard



