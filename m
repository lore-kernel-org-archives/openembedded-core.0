Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgxSm-0002TL-Vw for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:18:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBEjUD028597;
	Wed, 13 Jul 2011 12:14:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28092-04; Wed, 13 Jul 2011 12:14:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBEfVG028591
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 13 Jul 2011 12:14:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke.yu@intel.com>
In-Reply-To: <cover.1310548638.git.ke.yu@intel.com>
References: <cover.1310548638.git.ke.yu@intel.com>
Date: Wed, 13 Jul 2011 12:14:40 +0100
Message-ID: <1310555680.20015.1098.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] extra fix for non /usr/lib libdir
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
X-List-Received-Date: Wed, 13 Jul 2011 11:18:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 17:22 +0800, Yu Ke wrote:
> sta-solver and libzypp also need fix to pass the build with non /usr/lib libdir
> e.g. libdir=/usr/lib64
> 
> The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:
>   Paul Eggleton (1):
>         insane.bbclass: skip rdepends QA checks for kernel / modules
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib kyu3/libdir-fix-v3
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/libdir-fix-v3
> 
> Yu Ke (2):
>   sat-solver: fix for non /usr/lib libdir case
>   libzypp: fix for non /usr/lib libdir case

Merged to master, thanks.

Richard



