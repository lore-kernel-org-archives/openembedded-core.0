Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRNso-00015Y-Nk for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 14:17:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VBjI6Y013123;
	Tue, 31 May 2011 12:45:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12651-08; Tue, 31 May 2011 12:45:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VBj9AG013113
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 31 May 2011 12:45:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306833544-5211-1-git-send-email-koen@dominion.thruhere.net>
References: <1306833544-5211-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 31 May 2011 12:44:53 +0100
Message-ID: <1306842293.27470.351.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [Patch v2] sysvinit: make pidof usuable in a standalone setting
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
X-List-Received-Date: Tue, 31 May 2011 12:17:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 11:19 +0200, Koen Kooi wrote:
> Currently it's a symlink to killall5:
> 
> $ dpkg-deb -c sysvinit-pidof_2.88dsf-r1_armv7a.ipk  | grep pidof
> lrwxrwxrwx root/root         0 2011-05-27 11:05 ./bin/pidof.sysvinit -> /sbin/killall5
> 
> The point of the pidof subpackage was to have a pidof without needing sysvinit, this restores that behaviour.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



