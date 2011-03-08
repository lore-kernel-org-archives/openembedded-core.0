Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Px26E-0008Kp-6p for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 19:57:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28Iu0hY023307;
	Tue, 8 Mar 2011 18:56:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23224-02; Tue,  8 Mar 2011 18:55:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p28Itlbe023301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 8 Mar 2011 18:55:50 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
Date: Tue, 08 Mar 2011 10:55:44 -0800
Message-ID: <1299610544.602.109.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, poky@yoctoproject.org,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Liping Ke <liping.ke@intel.com>
Subject: Re: [PATCH 0/8] Numerous bug fixes
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
X-List-Received-Date: Tue, 08 Mar 2011 18:57:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-07 at 16:29 -0800, Saul Wold wrote:
> From: Saul Wold <sgw@linux.intel.com>
> 
> This set address a number of bugs found during testing of
> the Bernard release, they may not all be accepeted, I send 
> them here for reference also.
> 
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: distro/oe-dist
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-dist
> 
> Thanks,
>     Saul Wold <sgw@linux.intel.com>
> ---
> 
> 
> Dexuan Cui (1):
>   util-macros: fix DEPENDS in the case of native/nativesdk

I think Joshua Lock is going to come up with a better patch for this as
this patch inadvertently adds in libgpg-error dependencies for native
and nativesdk which we don't want.

> Dongxiao Xu (1):
>   connman: add xuser to the dbus permission list

Merged.

> Koen Kooi (1):
>   libgpg-error: extend to nativesdk to catch up with metadata changes

Not needed with Joshua's patch.

> Liping Ke (1):
>   adt: Update to svn r596 to fix symbolic link issues

Merged.

> Nitin A Kamble (1):
>   gcc-runtime: fix LSB library checks for libstdc++.so.6

Waiting for an updated version based on Khem's comments.

> Saul Wold (3):
>   gst-plugins: Added hal to DEPENDS
>   attr: Added ncurses to depends
>   lsb-live image: add lsb-live and lsb-sdk-live image types

Merged. I'd like to drop the hal dependency if someone can send me a
patch which disables it and everything works.

Cheers,

Richard
 



