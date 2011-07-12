Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdNA-00064S-UE for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 15:51:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDlbCD020785;
	Tue, 12 Jul 2011 14:47:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20598-03; Tue, 12 Jul 2011 14:47:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDlXMo020779
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Jul 2011 14:47:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310379842-14951-1-git-send-email-koen@dominion.thruhere.net>
References: <1310379842-14951-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 12 Jul 2011 14:47:32 +0100
Message-ID: <1310478452.20015.1049.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC] webkit-gtk: update SRCREV
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
X-List-Received-Date: Tue, 12 Jul 2011 13:51:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 12:24 +0200, Koen Kooi wrote:
> The layout of the repository has changed, so we need to account for that:
> 
> * fixed license checksums
> * fixed SRC_URI
> * fixed SRCREV_FORMAT
> 
> PCRE is gone, so no need for the dftables hack anymore
> 
> But most importantly, this fixes the crash issues when using javascript (e.g. github.com)
> 
> Tested on:
> 
> * usrp-e1xx/angstrom-2011.07
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-sato/webkit/files/GNUmakefile.am   |  107 +++---
>  meta/recipes-sato/webkit/files/Makefile         |    2 +-
>  meta/recipes-sato/webkit/files/Makefile.shared  |    2 +-
>  meta/recipes-sato/webkit/files/autogen.sh       |   51 +---
>  meta/recipes-sato/webkit/files/configure.ac     |  451 ++++++++++++++++++-----
>  meta/recipes-sato/webkit/files/update-webkit.sh |    8 +
>  meta/recipes-sato/webkit/webkit-gtk_svn.bb      |   53 +--
>  7 files changed, 454 insertions(+), 220 deletions(-)
>  create mode 100755 meta/recipes-sato/webkit/files/update-webkit.sh

Merged to master, thanks.

Richard



