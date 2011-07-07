Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qeo1Z-000491-W4 for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 14:49:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67CjqAL027956;
	Thu, 7 Jul 2011 13:45:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27869-03; Thu,  7 Jul 2011 13:45:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67Cjiu4027950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 7 Jul 2011 13:45:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309951628-11896-1-git-send-email-koen@dominion.thruhere.net>
References: <1309951628-11896-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 07 Jul 2011 13:45:08 +0100
Message-ID: <1310042708.20015.829.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] pulseaudio: add 0.9.23
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
X-List-Received-Date: Thu, 07 Jul 2011 12:49:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-06 at 13:27 +0200, Koen Kooi wrote:
> Older version have been retained to allow more testing of this release
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../pulseaudio-0.9.23/autoconf_version.patch       |   17 ++++++++++
>  .../pulseaudio/pulseaudio-0.9.23/buildfix.patch    |   17 ++++++++++
>  .../pulseaudio-0.9.23/configure_silent_rules.patch |   33 +++++++++++++++++++
>  .../pulseaudio-0.9.23/gcc4-compile-fix.patch       |   22 +++++++++++++
>  .../pulseaudio/pulseaudio-0.9.23/tls_m4.patch      |   34 ++++++++++++++++++++
>  .../pulseaudio-0.9.23/volatiles.04_pulse           |    2 +
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
>  .../pulseaudio/pulseaudio_0.9.23.bb                |   25 ++++++++++++++
>  8 files changed, 151 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/autoconf_version.patch
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/buildfix.patch
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/configure_silent_rules.patch
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/gcc4-compile-fix.patch
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/tls_m4.patch
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/volatiles.04_pulse
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb

I've merged this, thanks.

One question though: How/when do we remove the old version?

Cheers,

Richard



