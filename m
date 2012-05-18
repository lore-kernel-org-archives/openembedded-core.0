Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SVOIl-0001C5-6p for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:37:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IER3gJ017484
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:27:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02892-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:26:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4IEQt0d017478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 15:26:57 +0100
Message-ID: <1337351215.28145.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 18 May 2012 15:26:55 +0100
In-Reply-To: <1337203583-27729-1-git-send-email-gary@mlbassoc.com>
References: <1337203583-27729-1-git-send-email-gary@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v4] xserver-kdrive: Fix X server on PowerPC when built with GCC 4.7.x
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
X-List-Received-Date: Fri, 18 May 2012 14:37:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-16 at 15:26 -0600, Gary Thomas wrote:
> Newer versions of GCC uncovered illegal code practice which can cause
> runtime failures in the Xext/xace.c code.  This problem has been fixed upstream:
>   http://cgit.freedesktop.org/xorg/xserver/patch/Xext/xace.c?id=6dae7f3792611aace1df0cca63bf50c50d93de43
>   Subject: xace: Invalid reference to out-of-scope data.
> 
> Incorporate this patch into the recipe, with a PR bump.
> 
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>  .../fix-bogus-stack-variables.patch                |  231 ++++++++++++++++++++
>  .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |    3 +-
>  2 files changed, 233 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch

Merged to master, thanks.

Richard



