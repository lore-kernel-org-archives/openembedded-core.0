Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZAXW-0007wc-U6 for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:11:43 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBA04qiK007955
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:04:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07544-06 for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:04:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBA04jhF007949
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:04:46 GMT
Message-ID: <1323475496.5309.197.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 10 Dec 2011 00:04:56 +0000
In-Reply-To: <1323460893-30873-1-git-send-email-otavio@ossystems.com.br>
References: <1323460893-30873-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] connman: avoid checking for linux/if_alg.h header
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
X-List-Received-Date: Sat, 10 Dec 2011 00:11:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 20:01 +0000, Otavio Salvador wrote:
> Disable building of 'alg-test' and checking for if_alg.h header.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-connectivity/connman/connman.inc     |    8 ++++++++
>  meta/recipes-connectivity/connman/connman_0.78.bb |    2 +-
>  2 files changed, 9 insertions(+), 1 deletions(-)

Merged to master, thanks.

Longer term I think we need to check into this failure more but for now
it will get people's builds working again which is good.


Richard



