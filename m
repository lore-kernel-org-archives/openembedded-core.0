Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PyAki-0001Hz-AB for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 23:24:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2BMMOBa002722;
	Fri, 11 Mar 2011 22:22:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02639-02; Fri, 11 Mar 2011 22:22:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2BMM9mi002712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 11 Mar 2011 22:22:14 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1299809859.git.sgw@linux.intel.com>
References: <cover.1299809859.git.sgw@linux.intel.com>
Date: Fri, 11 Mar 2011 14:22:08 -0800
Message-ID: <1299882128.1445.3002.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>, poky@yoctoproject.org
Subject: Re: [PATCH 00/12] Consolidated Pull Request
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
X-List-Received-Date: Fri, 11 Mar 2011 22:24:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-10 at 18:19 -0800, Saul Wold wrote:
> This contains the openssh/drop IMAGE_FEATURE Code, along
> changes for RPM rootfs generation and a Kernel Update
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: distro/oe-core
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core
>
> 
> Bruce Ashfield (1):
>   linux-yocto: update to 2.6.37.3
> 
> Mark Hatle (3):
>   package.bbclass: Change the debug directory to avoid conflicts
>   package_rpm: Fix rootfs generation
>   gcc-runtime: Fix dbg files
> 
> Paul Eggleton (1):
>   gst-plugins-good: remove dependency on hal
> 
> Scott Garman (7):
>   task-base, task-poky-basic, task-poky: Remove hard-coded references
>     to dropbear
>   openssh: allow the openssh meta package to be empty
>   task-poky-ssh.bb: new task for ssh services
>   poky-image.bbclass: add ssh-server as an IMAGE_FEATURES option
>   poky-image.bbclass: add ssh-server to SATO_IMAGE_FEATURES
>   poky-image-lsb: add ssh-server to IMAGE_FEATURES
>   poky-image-basic: add ssh-server to IMAGE_FEATURES

I took these with the exception of the majority of Scott's changes as we
agreed there was a potential unresolved issue there.

Cheers,

Richard



