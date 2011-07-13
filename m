Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgxhV-0004cB-94 for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 13:33:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBTvuL028751;
	Wed, 13 Jul 2011 12:29:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28111-08; Wed, 13 Jul 2011 12:29:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DBTn3w028745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 13 Jul 2011 12:29:49 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310502258.git.scott.a.garman@intel.com>
References: <cover.1310502258.git.scott.a.garman@intel.com>
Date: Wed, 13 Jul 2011 12:29:47 +0100
Message-ID: <1310556587.20015.1110.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] distro tracking updates
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
X-List-Received-Date: Wed, 13 Jul 2011 11:33:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 13:25 -0700, Scott Garman wrote:
> Hello,
> 
> This adds the RECIPE_MANUAL_CHECK_DATE field for various recipes
> that the upstream tracking webapp can't figure out automatically.
> 
> The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:
> 
>   insane.bbclass: skip rdepends QA checks for kernel / modules (2011-07-12 15:22:09 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib sgarman/distro-tracking
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/distro-tracking
> 
> Scott Garman (1):
>   distro-tracking: add RECIPE_MANUAL_CHECK_DATE for various recipes
> 
>  .../conf/distro/include/distro_tracking_fields.inc |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



