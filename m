Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1jJt-00074H-MM for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 18:55:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHr9uH026066;
	Mon, 21 Mar 2011 17:53:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25742-08; Mon, 21 Mar 2011 17:53:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LHr07m026060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Mar 2011 17:53:00 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300378309.git.chris_larson@mentor.com>
References: <cover.1300378309.git.chris_larson@mentor.com>
Date: Mon, 21 Mar 2011 17:52:35 +0000
Message-ID: <1300729955.30423.3963.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/4] Pull request - a few misc fixes
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
X-List-Received-Date: Mon, 21 Mar 2011 17:55:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-17 at 09:15 -0700, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> Pull URL: https://github.com/kergoth/oe-core
>   Branch: misc-fixes
>   Browse: https://github.com/kergoth/oe-core/commits/misc-fixes
> 
> Thanks,
>     Chris Larson <chris_larson@mentor.com>
> ---
> 
> 
> Chris Larson (4):
>   poky-init-build-env: unbork for zsh
>   native: empty PACKAGES_DYNAMIC the way we do PACKAGES
>   scripts/bitbake: add -g/--graphviz to NO_BUILD_OPTS
>   Shift a few env bits into scripts/bitbake
> 
>  meta/classes/native.bbclass |    2 ++
>  poky-init-build-env         |    2 +-
>  scripts/bitbake             |    6 +++++-
>  scripts/poky-env-internal   |    4 +---
>  4 files changed, 9 insertions(+), 5 deletions(-)


Merged to master, thanks.

Richard




