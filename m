Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qy1fQ-0001Am-B0 for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 15:14:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TD9Pcd003125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:09:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03060-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:09:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7TD9Jrc003119
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:09:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314358878-22817-1-git-send-email-Martin.Jansa@gmail.com>
References: <20110826113143.GG5081@jama.jama.net>
	<1314358878-22817-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 29 Aug 2011 14:09:12 +0100
Message-ID: <1314623352.5939.292.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc: fix gconv packaging after 5486cac29db6e67051fff7637a0abc9aeab661e5
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
X-List-Received-Date: Mon, 29 Aug 2011 13:14:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-26 at 13:41 +0200, Martin Jansa wrote:
> * gconv is directory so test -f was always false as reported by Phil Blundell in
>   http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/008973.html
> * -e used also for localedef which is file, just to be more consistent
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    4 ++--
>  meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard



