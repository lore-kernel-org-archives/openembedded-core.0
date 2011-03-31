Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q5J0X-00075H-O9 for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 16:37:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VEZtFM026860;
	Thu, 31 Mar 2011 15:35:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26434-07; Thu, 31 Mar 2011 15:35:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VEZpeg026854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 31 Mar 2011 15:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1301516765.git.mark.hatle@windriver.com>
References: <cover.1301516765.git.mark.hatle@windriver.com>
Date: Thu, 31 Mar 2011 15:35:47 +0100
Message-ID: <1301582147.24596.109.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky@yoctoproject.org
Subject: Re: [PATCH 0/3] Fix zypper integration
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
X-List-Received-Date: Thu, 31 Mar 2011 14:37:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-30 at 15:29 -0500, Mark Hatle wrote:
> Fix the zypper integration on Bernard (Poky).  This is also be necessary 
> in master/OE-core as well!  (I have not verified that the C++ workaround 
> is needed on OE-Core, but the same change for MIPS -is- needed due to 
> namespace collision.)
> 
> Fixes [YOCTO #827] Zypper not working on ARM.  (Note, one of the issues 
> resolved actually affects all host types..)
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: mhatle/bernard/zypper
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/bernard/zypper
> 
> Thanks,
>     Mark Hatle <mark.hatle@windriver.com>
> ---
> 
> 
> Mark Hatle (3):
>   Fix sat-solver & RPM5 integration issue
>   Fix integration of zypper and sat-solver
>   Workaround for Global C++ Constructor problem on ARM

Merged to master, thanks.

Richard



