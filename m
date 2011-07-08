Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfJ70-0001Hl-RQ for openembedded-core@lists.openembedded.org;
	Sat, 09 Jul 2011 00:01:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68LvYjA024042
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 22:57:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22752-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 22:57:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68LvQNR024036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 22:57:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310154519.18564.17.camel@lenovo.internal.reciva.com>
References: <1310154519.18564.17.camel@lenovo.internal.reciva.com>
Date: Fri, 08 Jul 2011 22:56:47 +0100
Message-ID: <1310162207.20015.919.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc: avoid copying ${libdir} twice if it's the same as ${base_libdir}
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
X-List-Received-Date: Fri, 08 Jul 2011 22:01:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 20:48 +0100, Phil Blundell wrote:
> Otherwise the following "mv ${libdir}/gconv" fails because the destination
> has already been created.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



