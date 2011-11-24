Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTXIs-00064H-KE for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 12:17:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOBAk5W023888
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 11:10:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23806-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 11:10:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOBAdW7023881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 11:10:39 GMT
Message-ID: <1322133045.24143.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 11:10:45 +0000
In-Reply-To: <cover.1321811216.git.raj.khem@gmail.com>
References: <cover.1321811216.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Fixes for uclibc based builds
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
X-List-Received-Date: Thu, 24 Nov 2011 11:17:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-11-20 at 09:50 -0800, Khem Raj wrote:
> This pull request has patches needed for core-image-sato to build with uclibc
> gcc update needed for fixes qt4 ICE seen on armv7-a
> Fix to matchbox to get core-image-sato building with gold linker
> 
> The following changes since commit 0a9b1f504e685351921e27e42452f51630d64cd3:
> 
>   gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a (2011-11-20 09:39:36 -0800)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-updates
> 
> Khem Raj (5):
>   matchbox-stroke: Fix linking error with gold
>   gettext_0.18.1.1: Fix QA Issue
>   pulseaudio-0.9.23: Fix build on uclibc
>   netbase: Update recipe 4.46 -> 4.47
>   gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a

These have merged to master, apart from the matchbox-stroke change where
I've updated to a new revision of the upstream repo instead which should
fix the problem.

Cheers,

Richard



