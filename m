Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qbv09-0003HR-G3 for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:40:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDae48004595
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:36:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04497-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:36:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5TDaVP9004589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 14:36:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309311666.git.mark.hatle@windriver.com>
References: <cover.1309311666.git.mark.hatle@windriver.com>
Date: Wed, 29 Jun 2011 14:36:15 +0100
Message-ID: <1309354575.20015.376.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] Fix prelink to avoid first boot script
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
X-List-Received-Date: Wed, 29 Jun 2011 13:40:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 20:42 -0500, Mark Hatle wrote:
> In most cases the user will have the image-prelink enabled, which will
> prelink the target image at image creation time.  If this is enabled
> we want to avoid prelinking at first boot.  We do this by setting the
> script exit status to '0' if we detect we're on the host.
> 
> Also fixes a small bug found in sstate.bbclass: do_cleansstate
> 
> The following changes since commit 8a5c20417d4d6bee6dd0bcdbeb8d4f9e0696a216:
> 
>   [PATCH] u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:12 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/prelink
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/prelink
> 
> Mark Hatle (2):
>   sstate.bbclass: Fix an issue if the config changes
>   prelink_git.bb: Only block the postinst script when no image-prelink

Merged to master, thanks.

Richard



