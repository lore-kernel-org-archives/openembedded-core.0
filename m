Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWqDv-00087w-Mo for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 15:33:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FDUAOU026979
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 14:30:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26348-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 14:30:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5FDU1kL026961
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 14:30:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308077638-20075-1-git-send-email-raj.khem@gmail.com>
References: <1308077638-20075-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 15 Jun 2011 14:29:58 +0100
Message-ID: <1308144598.15712.416.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc_2.12.bb: Remove already upstreamed fix-for-make-3.82.diff
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
X-List-Received-Date: Wed, 15 Jun 2011 13:33:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 11:53 -0700, Khem Raj wrote:
> This patch is already applied to eglibc 2.12 branch as seen here
> http://www.eglibc.org/cgi-bin/viewcvs.cgi/branches/eglibc-2_12/libc/manual/Makefile?rev=12230&sortby=date&r2=12230&r1=10495
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../eglibc/eglibc-2.12/fix-for-make-3.82.diff      |   27 --------------------
>  meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 +-
>  2 files changed, 1 insertions(+), 29 deletions(-)
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.12/fix-for-make-3.82.diff

Merged to master, thanks.

Richard



