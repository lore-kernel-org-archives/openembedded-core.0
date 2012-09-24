Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG5zb-0004jA-GI for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:34:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OALNuG027720;
	Mon, 24 Sep 2012 11:21:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27527-08; Mon, 24 Sep 2012 11:21:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OALEt4027714
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:21:15 +0100
Message-ID: <1348482075.4654.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 24 Sep 2012 11:21:15 +0100
In-Reply-To: <1348320319.4444.212.camel@x121e.pbcl.net>
References: <1348320319.4444.212.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap: respect ${base_sbindir}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 10:34:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-22 at 14:25 +0100, Phil Blundell wrote:
> Need to pass the path explicitly to "make install" to ensure that the binaries end up
> in the right locations.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-support/libcap/libcap.inc     |    2 +-
>  meta/recipes-support/libcap/libcap_2.22.bb |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



