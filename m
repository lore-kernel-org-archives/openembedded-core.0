Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdLb-0005di-U1 for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:50:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDjvpp020754;
	Tue, 12 Jul 2011 14:45:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19843-03; Tue, 12 Jul 2011 14:45:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDjpS9020748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Jul 2011 14:45:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310470064-22366-2-git-send-email-koen@dominion.thruhere.net>
References: <1310470064-22366-1-git-send-email-koen@dominion.thruhere.net>
	<1310470064-22366-2-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 12 Jul 2011 14:45:50 +0100
Message-ID: <1310478350.20015.1048.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/2] pulseaudio 0.9.15: delete, but keep 0.9.22 and 0.9.23
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
X-List-Received-Date: Tue, 12 Jul 2011 13:50:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 13:27 +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../pulseaudio/pulseaudio-0.9.15/alsaerror.patch   |  527 --------------------
>  .../pulseaudio-0.9.15/autoconf_version.patch       |   15 -
>  .../pulseaudio/pulseaudio-0.9.15/buildfix.patch    |   15 -
>  .../pulseaudio/pulseaudio-0.9.15/fallback.patch    |  340 -------------
>  .../pulseaudio-0.9.15/gcc4-compile-fix.patch       |   20 -
>  .../pulseaudio/pulseaudio-0.9.15/periodfix.patch   |   75 ---
>  .../pulseaudio-0.9.15/volatiles.04_pulse           |    2 -
>  .../pulseaudio/pulseaudio_0.9.15.bb                |   21 -
>  8 files changed, 0 insertions(+), 1015 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.15/alsaerror.patch
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.15/autoconf_version.patch
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.15/buildfix.patch
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.15/fallback.patch
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.15/gcc4-compile-fix.patch
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.15/periodfix.patch
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.15/volatiles.04_pulse
>  delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.15.bb

Merged to master, thanks.

Richard



