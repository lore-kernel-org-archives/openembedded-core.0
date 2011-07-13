Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgxMs-00021i-18 for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:12:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DB8eeN028562
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:08:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28092-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:08:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DB8YMh028556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 12:08:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310547824.6337.212.camel@phil-desktop>
References: <1310547824.6337.212.camel@phil-desktop>
Date: Wed, 13 Jul 2011 12:08:32 +0100
Message-ID: <1310555312.20015.1096.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc: ensure that NSS libs go into the right package when ${base_libdir} and ${libdir} are the same
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
X-List-Received-Date: Wed, 13 Jul 2011 11:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 10:03 +0100, Phil Blundell wrote:
> Previously, libnss_hesiod et al. could get swallowed by the wildcarded glob in ${PN}-dev.
> Fix it by moving eglibc-extra-nss earlier in the PACKAGES and adjusting its FILES to ensure
> that the devel symlinks don't get caught.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    4 ++--
>  meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Merged to master, thanks.

Richard



