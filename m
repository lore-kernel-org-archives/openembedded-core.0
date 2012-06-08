Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ScwrE-000886-Rm for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 12:55:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q58AjNo2014431
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jun 2012 11:45:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13414-05 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2012 11:45:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q58AjGH8014425
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jun 2012 11:45:17 +0100
Message-ID: <1339152317.27075.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jun 2012 11:45:17 +0100
In-Reply-To: <cover.1338994308.git.mark.hatle@windriver.com>
References: <cover.1338994308.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] Misc package fixes
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
X-List-Received-Date: Fri, 08 Jun 2012 10:55:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-06 at 09:53 -0500, Mark Hatle wrote:
> A small collection of misc package fixes...
> 
> The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b3568:
> 
>   perl: Allow perl to cross build and native build in a directory named "t" (2012-06-05 23:02:20 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/misc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc
> 
> Jesse Zhang (1):
>   beecrypt: disable java
> 
> Joe Slater (2):
>   shared-mime-info: fix build race condition
>   gettext: install libgettextlib.a before removing it

These had patches missing Upstream-Status fields. I've fixed it up this
time but please pass the message back to include them in future.

Cheers,

Richard



