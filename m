Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RPIHE-0002nr-L3 for openembedded-core@lists.openembedded.org;
	Sat, 12 Nov 2011 19:26:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pACIJjns029092
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 18:19:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25600-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 18:19:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pACIJZLa029086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2011 18:19:36 GMT
Message-ID: <1321121979.26881.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 12 Nov 2011 18:19:39 +0000
In-Reply-To: <B6E31C49-661D-493B-9AA1-9499B35ED9AC@dominion.thruhere.net>
References: <5050804@linux.intel.com>
	<1321083345-29399-1-git-send-email-Martin.Jansa@gmail.com>
	<1321085039.26881.14.camel@ted>
	<B6E31C49-661D-493B-9AA1-9499B35ED9AC@dominion.thruhere.net>
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
X-List-Received-Date: Sat, 12 Nov 2011 18:26:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-12 at 09:06 +0100, Koen Kooi wrote:
> Op 12 nov. 2011, om 09:03 heeft Richard Purdie het volgende geschreven:
> 
> > On Sat, 2011-11-12 at 08:35 +0100, Martin Jansa wrote:
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >> ---
> >> meta/conf/distro/include/default-providers.inc |    1 +
> >> 1 files changed, 1 insertions(+), 0 deletions(-)
> >> 
> >> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> >> index afea5e7..79785fb 100644
> >> --- a/meta/conf/distro/include/default-providers.inc
> >> +++ b/meta/conf/distro/include/default-providers.inc
> >> @@ -19,6 +19,7 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
> >> #
> >> # Default recipe providers
> >> #
> >> +PREFERRED_PROVIDER_alsa-lib ?= "alsa-lib"
> >> PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
> >> PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
> >> PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
> > 
> > What else is providing "alsa-lib"? This sounds like a bug :/
> 
> According to Sau!:
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for runtime libasound (alsa-lib, alsa-lib-nativesdk)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libasound

Which is a bug. alsa-lib-nativesdk should provide libasound-nativesdk,
not libasound.

>NOTE: multiple providers are available for runtime alsa-conf-base (alsa-lib, alsa-lib-nativesdk)
>NOTE: consider defining a PREFERRED_PROVIDER entry to match alsa-conf-base

ditto.

Lets fix the underlying bug please :)

Cheers,

Richard



