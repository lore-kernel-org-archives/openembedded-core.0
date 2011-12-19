Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RccGF-00067b-FS for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 13:24:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBJCH2M8013626
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:17:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08999-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:16:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBJCGs5d013620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2011 12:16:55 GMT
Message-ID: <1324297016.4568.164.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 12:16:56 +0000
In-Reply-To: <20d7007632dde53f3a868e8374a45619319213c2.1324121807.git.otavio@ossystems.com.br>
References: <cover.1324121806.git.otavio@ossystems.com.br>
	<20d7007632dde53f3a868e8374a45619319213c2.1324121807.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] connman: disable 'alg-test' building
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
X-List-Received-Date: Mon, 19 Dec 2011 12:24:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-12-17 at 11:36 +0000, Otavio Salvador wrote:
> 'alg-test' requires 'linux/if_alg.h' header enforcing a dependency on
> linux-libc-headers 2.6.39 or newer.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-connectivity/connman/connman.inc      |    8 ---
>  .../connman/connman/disable_alg-test.patch         |   46 ++++++++++++++++++++
>  meta/recipes-connectivity/connman/connman_0.78.bb  |    3 +-
>  3 files changed, 48 insertions(+), 9 deletions(-)
>  create mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch

Merged to master, thanks.

Richard



