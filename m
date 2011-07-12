Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdL6-0005cI-Jc for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:49:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDjRXL020745;
	Tue, 12 Jul 2011 14:45:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20598-02; Tue, 12 Jul 2011 14:45:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDjJvj020739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Jul 2011 14:45:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310470064-22366-1-git-send-email-koen@dominion.thruhere.net>
References: <1310470064-22366-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 12 Jul 2011 14:45:18 +0100
Message-ID: <1310478318.20015.1047.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/2] pulseaudio: try harder to disable HAL
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
X-List-Received-Date: Tue, 12 Jul 2011 13:49:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 13:27 +0200, Koen Kooi wrote:
> This disables linking against (lib)hal but enables the udev-hal compat layer so the hal-detect plugin keeps working. The hal-detect plugin is removed from the default dependencies to discourage its usage, but can be installed manually if needed.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    3 +--
>  .../pulseaudio/pulseaudio_0.9.15.bb                |    2 +-
>  .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
>  .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
>  4 files changed, 4 insertions(+), 5 deletions(-)

Merged to master, thanks.

Richard



