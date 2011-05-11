Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKClC-0007Zm-FU for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 18:59:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BGuus0022251
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 17:56:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22185-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 17:56:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4BGulJK022245
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 17:56:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305028634-27912-1-git-send-email-Martin.Jansa@gmail.com>
References: <1305028634-27912-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 11 May 2011 17:56:41 +0100
Message-ID: <1305133001.30391.422.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] nativesdk.bbclass: define empty PACKAGES/PACKAGES_DYNAMIC
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
X-List-Received-Date: Wed, 11 May 2011 16:59:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-10 at 13:57 +0200, Martin Jansa wrote:
> * we had similar patch for native.bbclass
>   41d77ac37f606e54293826ba1e94a4254bddbfa6
>   I have no idea if the same could be used for nativesdk, because I'm
>   not using generated SDKs at all, that's why it's RFC and if there are
>   better ways to hide such errors, please let me know
> 
> * maybe PACKAGES just don't get extra prefix -nativesdk like
>   glib-2.0-utils-nativesdk
> 
> * those errors are shown like this:
>   ERROR: Trying to resolve runtime dependency glibc-charmap-utf-8 resulted
>   in conflicting PREFERRED_PROVIDER entries being found.
>   The providers found were: ['/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.12.bb', 'virtual:nativesdk:/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.12.bb']
>   The PREFERRED_PROVIDER entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/libc = eglibc', 'PREFERRED_PROVIDER_virtual/libc-nativesdk = eglibc-nativesdk']
> 
>   NOTE: multiple providers are available for runtime glibc-charmap-utf-8 (eglibc-nativesdk, eglibc, glibc, glibc-nativesdk)
>   NOTE: consider defining a PREFERRED_PROVIDER entry to match glibc-charmap-utf-8
>   NOTE: multiple providers are available for runtime glib-2.0-utils (glib-2.0-nativesdk, glib-2.0)
>   NOTE: consider defining a PREFERRED_PROVIDER entry to match glib-2.0-utils

This patch is certainly incorrect as we expect nativesdk to be packaged
and use the resulting packages. It sounds like some value in PACKAGES is
using a hardcoded reference to glibc instead of ${PN}.

Cheers,

Richard





