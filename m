Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sou8D-0003tP-Dy for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 12:26:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAFc2A002770
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:15:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01796-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:15:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAFTJE002764
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:15:30 +0100
Message-ID: <1342001730.7934.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 11:15:30 +0100
In-Reply-To: <1341992994-7193-1-git-send-email-dennis.yxun@gmail.com>
References: <1341992994-7193-1-git-send-email-dennis.yxun@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] directfb: disable imlib2 explicitly
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
X-List-Received-Date: Wed, 11 Jul 2012 10:26:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-11 at 07:49 +0000, Dennis Lan wrote:
> When HOST machine installed imlib2, compiling directfb in OE will
> direct this library, and try to use it. This is wrong, since there is
> no imlib in OE, so we should disable it explicitly here.
> 
> Error as following:
> | idirectfbimageprovider_imlib2.c:64:20: fatal error: Imlib2.h: No such
> file or directory
> 
> Config.log as following (which is wrong):
> configure:19602: checking for imlib2-config
> configure:19620: found /usr/bin/imlib2-config
> configure:19633: result: /usr/bin/imlib2-config
> 
> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> ---
>  meta/recipes-graphics/directfb/directfb_1.6.1.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



