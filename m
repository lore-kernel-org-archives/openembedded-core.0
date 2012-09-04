Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8vda-00058d-0p for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:06:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84FrYMj018570;
	Tue, 4 Sep 2012 16:53:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17582-05; Tue,  4 Sep 2012 16:53:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84FrP1k018563
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 16:53:26 +0100
Message-ID: <1346773997.21985.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 04 Sep 2012 16:53:17 +0100
In-Reply-To: <cover.1346771668.git.bruce.ashfield@windriver.com>
References: <cover.1346771668.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, dvhart@linux.intel.com,
	saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto-rt: update and boot fixes
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
X-List-Received-Date: Tue, 04 Sep 2012 16:06:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-04 at 11:19 -0400, Bruce Ashfield wrote:
> Richard/Saul,
> 
> This is an update to the -rt branches that fixes up some merge
> issues which were preventing the -rt boards from sucessfully
> booting (hangs in the timekeeping code).
> 
> Built and booted here, so it's better than before, and it's
> worth updating this ASAP, even while more testing happens, since
> any issues can be dealt with via incremental patches.
> 
> Cheers,
> 
> Bruce
> 
> cc: Kishore Bodke <kishore.k.bodke@intel.com>
> cc: Darren Hart <dvhart@linux.intel.com>
> 
> The following changes since commit e731ff2881ef13e742889ef6e535f1cf89bbc1ef:
> 
>   udev: Remove files moved to udev-extraconf (2012-09-04 15:41:16 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel-rt
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-rt
> 
> Bruce Ashfield (1):
>   linux-yocto-rt: update to 3.4.9-rt17

Merged to master, thanks.

Richard



