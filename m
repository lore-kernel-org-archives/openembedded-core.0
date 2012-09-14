Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCRvR-0008KK-Ih for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 11:11:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8E8wPFm009736;
	Fri, 14 Sep 2012 09:58:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06256-10; Fri, 14 Sep 2012 09:58:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8E8wHp2009730
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 09:58:18 +0100
Message-ID: <1347613099.9456.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 14 Sep 2012 09:58:19 +0100
In-Reply-To: <5f0da99ea0b685191dc7b8fd5fd633783ed92664.1347597967.git.bruce.ashfield@windriver.com>
References: <cover.1347597967.git.bruce.ashfield@windriver.com>
	<5f0da99ea0b685191dc7b8fd5fd633783ed92664.1347597967.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux-yocto/3.4: make uprobes select perf events
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
X-List-Received-Date: Fri, 14 Sep 2012 09:11:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 00:57 -0400, Bruce Ashfield wrote:
> uprobes depends on functionality provided by perf events. After
> uprobes was enabled in the standard kernel the mpc8315 board showed
> link errors due to missing perf event functions.
> 
> This problem isn't isolated to the board or powerpc arch, but all
> other boards have PERF_EVENTS enabled. To fix this, we make UPROBE_EVENT
> select PERF_EVENTS, and any new boards will be protected from the
> same failure.
> 
> We also update the configuration fragments since CONFIG_UPROBES depends on
> CONFIG_PERF_EVENTS being set, so PERF_EVENTS needs to be added whenever
> uprobes are enabled.
> 
> [YOCTO #3111]
> 
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++++-------
>  2 files changed, 10 insertions(+), 10 deletions(-)

Merged to master, thanks.

Richard



