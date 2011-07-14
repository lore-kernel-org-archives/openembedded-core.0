Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhMiL-0005o0-0G for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 16:16:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EECUcN008137
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:12:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06949-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:12:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6EECNPq008131
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:12:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310575653.2378.33.camel@phil-desktop>
References: <1310575653.2378.33.camel@phil-desktop>
Date: Thu, 14 Jul 2011 15:12:19 +0100
Message-ID: <1310652739.20015.1159.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc: fix packaging of thread_db
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
X-List-Received-Date: Thu, 14 Jul 2011 14:16:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 17:47 +0100, Phil Blundell wrote:
> Similarly to libnss*, if ${libdir} and ${base_libdir} were the same path then
> libthread_db would land in ${PN}-dev rather than the intended place.  As before,
> fix this by moving eglibc-thread-db earlier in PACKAGES and adjusting its FILES
> to not capture the .so symlink.
> 
> Bump PR for both 2.12 and 2.13.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    4 ++--
>  meta/recipes-core/eglibc/eglibc_2.12.bb     |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard



