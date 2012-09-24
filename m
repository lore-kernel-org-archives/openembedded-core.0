Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG5pj-0004En-SL for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 12:24:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OABKmS027524;
	Mon, 24 Sep 2012 11:11:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24783-10; Mon, 24 Sep 2012 11:11:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OABBcI027517
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 11:11:12 +0100
Message-ID: <1348481471.4654.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Ertsaas <mertsas@cisco.com>
Date: Mon, 24 Sep 2012 11:11:11 +0100
In-Reply-To: <1348039015-27100-1-git-send-email-mertsas@cisco.com>
References: <1348039015-27100-1-git-send-email-mertsas@cisco.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bash: Make it possible to run bash 3.2.48 instead of 4.2.
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
X-List-Received-Date: Mon, 24 Sep 2012 10:24:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-19 at 09:16 +0200, Martin Ertsaas wrote:
> bash-3.2.48 did not provide the linking from sh to bash, making it unusable.
> Moving the license part out of the bash.inc file, and into bash_4.2.bb file makes
> us able to use that file also for bash_3.2.48.bb, which makes maintaining both
> at the same time a lot easier.
> 
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>  meta/recipes-extended/bash/bash.inc       |    3 --
>  meta/recipes-extended/bash/bash_3.2.48.bb |   31 +---------------------------
>  meta/recipes-extended/bash/bash_4.2.bb    |    6 ++++-
>  3 files changed, 7 insertions(+), 33 deletions(-)

Merged to master, thanks.

Richard



