Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TbE4e-0005WJ-DO for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 18:26:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qALHChrH017559;
	Wed, 21 Nov 2012 17:12:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14440-02; Wed, 21 Nov 2012 17:12:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qALHCWFM017553
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 21 Nov 2012 17:12:34 GMT
Message-ID: <1353517951.10459.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Nov 2012 17:12:31 +0000
In-Reply-To: <20121121162051.GK12637@jama.jama.net>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
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
X-List-Received-Date: Wed, 21 Nov 2012 17:26:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-21 at 17:20 +0100, Martin Jansa wrote:
> On Wed, Nov 14, 2012 at 03:21:10PM +0200, Laurentiu Palcu wrote:
> > This new recipe is needed because the old driver is unmaintained. This
> > new recipe will follow the new repo.
> 
> On which MACHINE did you test this? Here it fails in do_configure with:
> | configure:18796: result: yes
> | configure:18808: checking whether to include DRI support
> | configure:18812: checking for /usr/include/xorg/dri.h
> | configure:18818: error: cannot check for file existence when cross compiling
> 
> So I'm wondering if it was tested at all.
> 
> With xf86-video-omapfb not ported to xserver-1.13 video API it makes new
> default xserver from oe-core unusable on many armv7a machines..

/usr/include/xorg/dri.h probably existed on the machine it was tested
on. I appreciate this needs to get fixed but I know it was tested.

Cheers,

Richard



