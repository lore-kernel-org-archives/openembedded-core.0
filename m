Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW5je-0004ro-Hu for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:27:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1CKnAc014802
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:20:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14354-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 12:20:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1CKfam014796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 12:20:42 GMT
Message-ID: <1322742050.17484.117.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 12:20:50 +0000
In-Reply-To: <cover.1322740824.git.Martin.Jansa@gmail.com>
References: <cover.1322740824.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH][oe-core 0/4] Small fixes for sysstat, shadow, coreutils, gconf
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
X-List-Received-Date: Thu, 01 Dec 2011 12:27:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 13:01 +0100, Martin Jansa wrote:
> sysstat and gconf are fixed version of previous patches (which were also sent
> to ML, resending now just to be clear that they are also in branch and pull-request).
> 
> The following changes since commit 6ef79ede361c42e11e78d4afcff11295a3144055:
> 
>   pulseaudio 1.1: add filter-apply and filter-heuristics to pulseaudio-server RDEPENDS, it won't start without (2011-12-01 10:53:27 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/pull
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
> 
> Martin Jansa (4):
>   sysstat: don't run populate-volatile.sh update in do_rootfs or
>     without populate-volatile.sh
>   gconf: add polkit to DEPENDS only for target recipe and disable
>     default-service for native
>   shadow: use u-a for /usr/bin/groups
>   coreutils: fix u-a for base64, mktemp and df

I have a question on the sysstat change, I merged the others, thanks.

Richard



