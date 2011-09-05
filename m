Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0enB-000226-VR for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:25:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JKDVn000930
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:20:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29957-08 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 20:20:09 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JK56E000924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:20:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cae9b6aa44f57843cf9a9575b85ef33350b0a41e.1315237572.git.paul.eggleton@linux.intel.com>
References: <cover.1315237572.git.paul.eggleton@linux.intel.com>
	<cae9b6aa44f57843cf9a9575b85ef33350b0a41e.1315237572.git.paul.eggleton@linux.intel.com>
Date: Mon, 05 Sep 2011 20:20:05 +0100
Message-ID: <1315250405.1243.5.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] git: fix sstate relocation for git-native
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
X-List-Received-Date: Mon, 05 Sep 2011 19:25:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-09-05 at 16:47 +0100, Paul Eggleton wrote:
> Create a wrapper for git to set GIT_EXEC_PATH and GIT_TEMPLATE_DIR so
> that git-native is relocatable.
> 
> Fixes specific example given in [YOCTO #1137]
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-devtools/git/git.inc        |    6 ++++++
>  meta/recipes-devtools/git/git_1.7.5.1.bb |    2 +-
>  2 files changed, 7 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



