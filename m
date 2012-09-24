Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG63V-0004rc-2b for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:38:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAPD5U027754;
	Mon, 24 Sep 2012 11:25:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27712-01; Mon, 24 Sep 2012 11:25:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OAP4s8027742
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:25:05 +0100
Message-ID: <1348482304.4654.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
Date: Mon, 24 Sep 2012 11:25:04 +0100
In-Reply-To: <788ce6395c57aae824d913c5c9073801a9732c69.1348265025.git.scott.a.garman@intel.com>
References: <cover.1348265025.git.scott.a.garman@intel.com>
	<788ce6395c57aae824d913c5c9073801a9732c69.1348265025.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] runqemu: work with tap device names that end with a colon
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
X-List-Received-Date: Mon, 24 Sep 2012 10:38:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-21 at 15:06 -0700, Scott Garman wrote:
> On Fedora systems (and likely others), ifconfig returns interface
> names that end with a colon. Make sure we strip the colon off the
> tap device name before using it.
> 
> This fixes [YOCTO #3028]
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  scripts/runqemu-gen-tapdevs |    2 +-
>  scripts/runqemu-internal    |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



