Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG5yz-0004gn-UH for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:33:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAKqYg027709;
	Mon, 24 Sep 2012 11:20:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26940-10; Mon, 24 Sep 2012 11:20:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAKiWl027703
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:20:45 +0100
Message-ID: <1348482045.4654.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 24 Sep 2012 11:20:45 +0100
In-Reply-To: <1348332621.4444.219.camel@x121e.pbcl.net>
References: <1348332621.4444.219.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sqlite3: enable USE_PREAD
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
X-List-Received-Date: Mon, 24 Sep 2012 10:33:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-22 at 17:50 +0100, Phil Blundell wrote:
> This gives a small but measureable performance improvement for
> I/O heavy workloads.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc       |    4 ++++
>  meta/recipes-support/sqlite/sqlite3_3.7.13.bb |    2 +-
>  2 files changed, 5 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



