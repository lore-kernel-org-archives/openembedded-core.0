Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RP8fQ-0000YB-Jr for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 09:10:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAC847Mi025525
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 08:04:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22841-09 for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 08:04:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAC83v5E025519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 08:03:58 GMT
Message-ID: <1321085039.26881.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 12 Nov 2011 08:03:59 +0000
In-Reply-To: <1321083345-29399-1-git-send-email-Martin.Jansa@gmail.com>
References: <5050804@linux.intel.com>
	<1321083345-29399-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] default-providers: add alsa to resolve multiple runtime providers
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
X-List-Received-Date: Sat, 12 Nov 2011 08:10:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-12 at 08:35 +0100, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/distro/include/default-providers.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index afea5e7..79785fb 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -19,6 +19,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
>  #
>  # Default recipe providers
>  #
> +PREFERRED_PROVIDER_alsa-lib ?= "alsa-lib"
>  PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
>  PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
>  PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"

What else is providing "alsa-lib"? This sounds like a bug :/

Cheers,

Richard



