Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtQUE-0000d8-2e
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 22:16:02 +0100
Received: by pbbb4 with SMTP id b4so2873594pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 13:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mBqVQE5SM0kFhSAjmyihh8KxHLh43rmouMVLRC89lWs=;
	b=gnNGM9ip3BbaZ6J2sMmzw7wPeVJNe96ByAG2+ydvfmWT5XokG4oBcfP2LXjwcQFV9w
	N0Ox7cHYNtLNyV9BcUNSakNq8lpd1g5cRgD9NmfCTw4Xbui7bYIaU0lAfsg7NT4LtdiQ
	5WjIQqHYOcfqMNGpSWvmvbCcuZHC+Pz/6Sd84=
Received: by 10.68.72.69 with SMTP id b5mr20407973pbv.120.1328303283661;
	Fri, 03 Feb 2012 13:08:03 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id j4sm15568609pbg.12.2012.02.03.13.08.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 13:08:02 -0800 (PST)
Date: Fri, 3 Feb 2012 13:07:53 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120203210753.GC20937@sakrah.homelinux.org>
References: <cover.1328208481.git.josh@linux.intel.com>
	<2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
	<4092F86B-459F-45ED-B7B1-1198B2D6A992@dominion.thruhere.net>
	<4F2ADCF6.4030000@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F2ADCF6.4030000@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/1] netbase: make netbase recipe MACHINE specific for all targets
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
X-List-Received-Date: Fri, 03 Feb 2012 21:16:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (02/02/12 10:59), Joshua Lock wrote:
> On 02/02/12 10:54, Koen Kooi wrote:
> >
> >Op 2 feb. 2012, om 19:51 heeft Joshua Lock het volgende geschreven:
> >
> >>Several BSP's are appending netbase to add MACHINE specific
> >>networking functionality. Rather than BSP creators having to mark
> >>netbase MACHINE specific just default to PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>in netbase.
> >>
> >>This shouldn't be a huge hit as netbase just copies files around.
> >
> >In the past OE would mark things machine specific if something in SRC_URI was fetched using overrides. So it this patches fixed netbase the 'old' mechanism is broken :(
> 
> This patch doesn't fix netbase, I just thought it would be simpler
> to make this change than ensure all BSP's use appropriate OVERRIDEs
> in their netbase bbappends - several I've seen don't.

hmm MACHINE is automatic override. but I think making it explicit is
better for readability
> 
> Cheers,
> Joshua
> -- 
> Joshua Lock
>         Yocto Project "Johannes factotum"
>         Intel Open Source Technology Centre
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


