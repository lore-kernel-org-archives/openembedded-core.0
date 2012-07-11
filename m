Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sou7t-0003rB-FH for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 12:26:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAFMFe002761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:15:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00772-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:15:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAF9Gc002755
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:15:10 +0100
Message-ID: <1342001710.7934.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 11:15:10 +0100
In-Reply-To: <1341992537-22179-1-git-send-email-b19537@freescale.com>
References: <1341992537-22179-1-git-send-email-b19537@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] valgrind: fix default.supp missing issue
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
X-List-Received-Date: Wed, 11 Jul 2012 10:26:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 15:42 +0800, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
> 
>     When run valgrind, following error appears:
>     ==2254== FATAL: can't open suppressions file "/usr/lib/valgrind/default.supp"
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



