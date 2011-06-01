Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRpMf-0003wH-GH for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 19:37:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51HYhqi015733
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 18:34:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15651-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2011 18:34:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51HYagl015727
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 18:34:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Date: Wed, 01 Jun 2011 18:34:18 +0100
Message-ID: <1306949658.27470.445.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/32] 1-June-2011 Request
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
X-List-Received-Date: Wed, 01 Jun 2011 17:37:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 23:21 -0700, Saul Wold wrote:
> This contains a few patches from the community, along with a batch of updates
> and bug fixes from me. 
> 
> This includes the patch I submitted for the beagleboard qt4-x11-free failure.
> 
> This has been built via world.
> 
> The following changes since commit 26e5e5feb695864b11e47e24017e254c28f14494:
> 
>   Improve handling of 'all' architecture recipes and their interaction with sstate (2011-05-31 12:56:38 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

I merged this apart from:


> Saul Wold (27):
>   libiconv: update to 1.13.1

Due to feedback from Khem.

>   update-alternatives-dpkg update to 1.16.0.3
>   chkconfig: update to 1.3.52
>   mailx: update to 12.5
>   mc: update to 4.7.5.2
>   msmtp: update tof 1.4.24
>   gthumb: update to 2.12.3
>   alsa-tools: update to 1.0.24.1
>   qmmp: update to 0.5.1
>   rxvt-unicode: update to 9.11
>   gnutls: update to 2.12.5
>   distro tracking: updates
>   bitbake.conf: Create static-dev pacakge for static libraries

Due to feedback from me.

>   tcmode-default: disable ARMv7 Optimization for qt4-x11-free

Again, I'm not sure this is the right approach and it sounds like there
is a patch around for this issue for gcc.

Cheers,

Richard



