Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SAMQq-00006d-U9 for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:22:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LEDdfB002530
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:13:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02161-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:13:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LEDWW8002524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:13:33 GMT
Message-ID: <1332339214.9740.159.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 14:13:34 +0000
In-Reply-To: <001944ced2e6b01e387bf129a4c95ebbb46f5bdb.1332315222.git.lianhao.lu@intel.com>
References: <cover.1332315222.git.lianhao.lu@intel.com>
	<001944ced2e6b01e387bf129a4c95ebbb46f5bdb.1332315222.git.lianhao.lu@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] lttng-2.0/lttng-ust: Change recipe name to lttng2-ust.
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
X-List-Received-Date: Wed, 21 Mar 2012 14:22:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 17:41 +0800, Lianhao Lu wrote:
> Change the recipe name lttng-ust from lttng-2.0 to lttng2-ust so that
> that both the lttng-ust of the old framework and of the new framework
> lttng-2.0 can coexist.
> 
> Fixed bug [YOCTO #2062].
> 
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  .../lttng-2.0/lttng-tools_2.0-pre16.bb             |    2 +-
>  .../{lttng-ust_1.9.4.bb => lttng2-ust_1.9.4.bb}    |    0
>  2 files changed, 1 insertions(+), 1 deletions(-)
>  rename meta/recipes-kernel/lttng-2.0/{lttng-ust_1.9.4.bb => lttng2-ust_1.9.4.bb} (100%)

Merged to master, thanks.

Richard



