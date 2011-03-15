Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PzSIQ-0004zy-Qr for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 12:20:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FBIT27017560;
	Tue, 15 Mar 2011 11:18:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17450-03; Tue, 15 Mar 2011 11:18:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2FBINCK017493
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 15 Mar 2011 11:18:23 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1300184701-23833-1-git-send-email-koen@dominion.thruhere.net>
References: <1300184701-23833-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 15 Mar 2011 11:18:15 +0000
Message-ID: <1300187895.30423.1565.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH] kernel bbclass: split do_compile into do_compile and do_compile_modules
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
X-List-Received-Date: Tue, 15 Mar 2011 11:20:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-15 at 11:25 +0100, Koen Kooi wrote:
> This allows recipes to insert a custom task in between building *Image and modules
> 
> From OE .dev revision 615876fe218dc3feb4a3df9e6546a7b1a6376800
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> Acked-by: Graeme Gregory <dp@xora.org.uk>
> ---
>  meta/classes/kernel.bbclass |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



