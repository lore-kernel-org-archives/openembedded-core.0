Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTjNy-00074t-3X for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 01:11:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP04nLO032517
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:04:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31842-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:04:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAP04g96032511
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 00:04:43 GMT
Message-ID: <1322179488.10928.42.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 00:04:48 +0000
In-Reply-To: <ad4d06cb79983b6a1a06b5cdd83e565af031b05f.1321528387.git.xiaofeng.yan@windriver.com>
References: <cover.1321528387.git.xiaofeng.yan@windriver.com>
	<ad4d06cb79983b6a1a06b5cdd83e565af031b05f.1321528387.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] gtk+: Have gtk+ pick up ${NM} from the environment
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
X-List-Received-Date: Fri, 25 Nov 2011 00:11:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-11-17 at 19:16 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> hen gtk+ configures, it should pick up ${NM} from the environment \
> if it is defined, instead of just looking for "nm".
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  .../gtk+/gtk+-2.24.6/configure-nm.patch            |   14 ++++++++++++++
>  meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |    3 ++-
>  2 files changed, 16 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk+-2.24.6/configure-nm.patch

Merged to master, thanks.

Richard



