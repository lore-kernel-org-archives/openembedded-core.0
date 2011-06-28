Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbWHJ-0005x6-Br for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 13:16:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SB9PE6022126
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:09:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21529-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:09:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SB9GEp022120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 12:09:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308836301.git.lianhao.lu@intel.com>
References: <cover.1308836301.git.lianhao.lu@intel.com>
Date: Tue, 28 Jun 2011 12:09:03 +0100
Message-ID: <1309259343.20015.238.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 0/1] Removing hard coded libdir for libc locale generating
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
X-List-Received-Date: Tue, 28 Jun 2011 11:16:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-23 at 21:43 +0800, Lianhao Lu wrote:
> V2:
> 
> Use base_libdir instead of libdir for ldlibdir.
> ----------------------------------------------------
> V1:
> The patch replaces the hard coded libdir in package_do_split_gconvs() in libc-package.bbclass to meet the requirement of multilib.
> 
> The following changes since commit b04ee632eb06650dde3e3ee8c4788a45cae0aa5e:
>   Richard Purdie (1):
>         multilib: First pass from RP
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib llu/ml
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/ml
> 
> Lianhao Lu (1):
>   libc-package.bbclass: Replace hard coded libdir.

Merged to master, thanks.

Richard



