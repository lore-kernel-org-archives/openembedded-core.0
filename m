Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Srbvy-00022x-OU for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 23:37:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ILQ6Yk029173
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:26:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28111-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:26:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ILPuFX029166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:25:57 +0100
Message-ID: <1342646759.513.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 22:25:59 +0100
In-Reply-To: <1342603039-6608-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120718010511.GH22569@jama.jama.net>
	<1342603039-6608-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] glib-2.0: revert one commit in target recipe
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
X-List-Received-Date: Wed, 18 Jul 2012 21:37:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-18 at 11:17 +0200, Martin Jansa wrote:
> * it was causing staged python to be used as shebang
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...-the-same-Python-as-we-found-in-configure.patch |   39 ++++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |    5 ++-
>  2 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Revert-Use-the-same-Python-as-we-found-in-configure.patch

I've applied a different patch using sed to address the problem. I've
consolidated all the other code doing this and also fixed the nativesdk
case which this version potentially doesn't.

Cheers,

Richard



