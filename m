Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZPOg-000381-G3 for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 17:31:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFReqf005237;
	Wed, 22 Jun 2011 16:27:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04944-06; Wed, 22 Jun 2011 16:27:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MFRXRl005231
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 22 Jun 2011 16:27:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308558297-1939-1-git-send-email-koen@dominion.thruhere.net>
References: <1308558297-1939-1-git-send-email-koen@dominion.thruhere.net>
Date: Wed, 22 Jun 2011 16:27:16 +0100
Message-ID: <1308756436.20015.66.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] glib-2.0 2.28.x: update to 2.28.8
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
X-List-Received-Date: Wed, 22 Jun 2011 15:31:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-20 at 10:24 +0200, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 ++++++++++++++++++++
>  .../0005-glib-mkenums-interpreter.patch.patch      |   25 +++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb      |   18 ------------
>  meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |   22 +++++++++++++++
>  meta/recipes-core/glib-2.0/glib.inc                |    3 +-
>  5 files changed, 77 insertions(+), 19 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
>  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb

Merged to master but please be a little more verbose in future commit
messages :)

Cheers,

Richard



