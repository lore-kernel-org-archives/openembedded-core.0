Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkEDR-0006Tx-7Y for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 13:48:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MAtgx8027624
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:55:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27374-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:55:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MAtZ1C027618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 11:55:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311326212-10672-1-git-send-email-galak@kernel.crashing.org>
References: <1311326212-10672-1-git-send-email-galak@kernel.crashing.org>
Date: Fri, 22 Jul 2011 11:55:31 +0100
Message-ID: <1311332131.2344.130.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/4] site/powerpc: Pull all powerpc config options into powerpc32-linux
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
X-List-Received-Date: Fri, 22 Jul 2011 11:48:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 04:16 -0500, Kumar Gala wrote:
> powerpc-common was really Linux PPC32 specific.  So move all the options
> in it to powerpc32-linux and we can refactor out common bits shared
> between into powerpc-linux and powerpc-common.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
>  meta/classes/siteinfo.bbclass |    4 +-
>  meta/site/powerpc-common      |  328 ---------------------------------------
>  meta/site/powerpc-linux       |    9 -
>  meta/site/powerpc32-linux     |  338 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 340 insertions(+), 339 deletions(-)
>  create mode 100644 meta/site/powerpc32-linux

I've merged patches 1-4 to master, thanks.

Richard



