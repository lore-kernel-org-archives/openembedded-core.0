Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgdZ3-0008L0-RH for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 16:03:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDxv7G020880
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:59:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19843-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:59:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6CDxncg020874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 14:59:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310368636.git.ke.yu@intel.com>
References: <cover.1310368636.git.ke.yu@intel.com>
Date: Tue, 12 Jul 2011 14:59:48 +0100
Message-ID: <1310479188.20015.1054.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/10] [RFC] patch for non /usr/lib libdir - V2
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
X-List-Received-Date: Tue, 12 Jul 2011 14:03:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 15:23 +0800, Yu Ke wrote:
> This is the V2 patches. the changes compared to V1 are:
> - revise python patch to make the sys.lib deriving from libdir, instead of hardcode to lib64
> - add two more fixes: sat-solver and libzypp, with these two more fixes, i can build
>   qemux86-64 core-image-sato and core-image-sato-sdk with libdir=/usr/lib64
> 
> Next step, I will do through test to make sure it does not impact normal libdir=/usr/lib case
> 
> The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
>   Tom Zanussi (1):
>         systemtap: remove non-core COMPATIBLE_MACHINES
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib kyu3/libdir-fix-v2
>   http://git.pokylinux.org/cgit.cgi//log/?h=kyu3/libdir-fix-v2
> 
> Yu Ke (10):
>   native.bbclass: generate libdir from libdir_native
>   openssl: fix for non /usr/lib libdir case
>   libc-package.bbclass: fix for non /usr/lib libdir case
>   python: fix for libdir=/usr/lib64 case
>   python-native: fix for non /usr/lib libdir case
>   perl: fix for non /usr/lib libdir case
>   libcap: fix for non /usr/lib libdir case
>   rpm: fix for non /usr/lib libdir case
>   sat-solver: fix for non /usr/lib libdir case

I merged these apart from the libc-package.bbclass change which doesn't
apply against master and isn't needed since a different patch was
already applied.

FWIW, these were hard to apply as they're based against an older tree :(

>   libzypp: fix for non /usr/lib libdir case

This one didn't make it to the mailing list, please resend.

Cheers,

Richard



