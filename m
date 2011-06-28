Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbWOG-00063Q-WD for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 13:23:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SBJuIS022211
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:19:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22165-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:19:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SBJnoQ022205
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:19:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7abf11041890a833e554fb85ae2c958314ff1256.1309243115.git.liezhi.yang@windriver.com>
References: <cover.1309243115.git.liezhi.yang@windriver.com>
	<7abf11041890a833e554fb85ae2c958314ff1256.1309243115.git.liezhi.yang@windriver.com>
Date: Tue, 28 Jun 2011 12:19:36 +0100
Message-ID: <1309259976.20015.241.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/4 V4] bitbake: share source directory
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
X-List-Received-Date: Tue, 28 Jun 2011 11:23:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 17:05 +0800, Robert Yang wrote:
> This patch is derived from Richard, it is a quick proof of concept to
> show how source code could be shared between recipes which use ${B} to
> have a separate build directory compared to source directory ${S}.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  bitbake/lib/bb/build.py    |    4 ++--
>  bitbake/lib/bb/cache.py    |    3 +++
>  bitbake/lib/bb/runqueue.py |   10 ++++++++++
>  3 files changed, 15 insertions(+), 2 deletions(-)

Since this is a bitbake patch it should really have gone to the
bitbake-devel list. Its been posted around enough times for review
though so I've merged it into bitbake. I did massively reword the commit
message though to reflect what the changes mean from a bitbake
perspective.

Cheers,

Richard



