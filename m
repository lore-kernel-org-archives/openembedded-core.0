Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQzfF-0004SD-Te for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 14:02:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OBmwNw002425;
	Wed, 24 Oct 2012 12:48:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01410-04; Wed, 24 Oct 2012 12:48:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OBmn7O002418
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 24 Oct 2012 12:48:51 +0100
Message-ID: <1351079329.22340.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Wed, 24 Oct 2012 12:48:49 +0100
In-Reply-To: <cover.1351049433.git.kai.kang@windriver.com>
References: <cover.1351049433.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] V2: Fix (nativesdk-)perl dependency issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2012 12:02:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-24 at 14:09 +0800, Kang Kai wrote:
> V2:
> update dependencies among perl modules and fix dependency rules don't work
> for nativesdk packages.
> add the specified perl modules to autoconf rdepends and remove redundant deps
> from automake.
> 
> The following changes since commit f07be9d2b68ac4e184ce2670bfa65b8d944387aa:
> 
>   yocto-bsp: set branches_base for list_property_values() (2012-10-22 12:15:55 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib kangkai/fix-perl
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/fix-perl
> 
> Kang Kai (3):
>   perl: update dependencies among modules
>   autoconf: update runtime dependencies
>   automake: update dependencies

Looks good, thanks for working through this.

Merged to master, thanks.

Richard



