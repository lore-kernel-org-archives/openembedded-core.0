Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTiBH-0003dj-2v for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 23:54:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOMlcdm031609
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:47:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31011-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:47:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOMlUju031603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 22:47:31 GMT
Message-ID: <1322174856.10928.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 22:47:36 +0000
In-Reply-To: <cover.1322027494.git.nitin.a.kamble@intel.com>
References: <cover.1322027494.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Various Fixes
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
X-List-Received-Date: Thu, 24 Nov 2011 22:54:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-22 at 21:55 -0800, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This set has fixes for gmp, at & site/x86-64-linux
> 
> - Nitin
> 
> The following changes since commit 40fe6457d5ca49fe113bc26c60d5add59d85b34f:
> 
>   matchbox-wm: Fix variable type in _NET_WORKAREA setting (2011-11-22 15:13:26 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/misc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
> 
> Nitin A Kamble (3):
>   gmp: also generate the libgmpcxx library

This one needs the C++ piece split into a separate package please.

>   at: update the upstream-status of patches
>   site/x86_64-linux: add cvs config variables

These two have merged, thanks!

Richard



