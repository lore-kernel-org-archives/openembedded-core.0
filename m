Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVsPu-0000O9-40 for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:14:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUM7XVs006016
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 22:07:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05242-09 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 22:07:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUM7PXc006010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 22:07:26 GMT
Message-ID: <1322690854.17484.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 22:07:34 +0000
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/8] Recipes upgrade for gtk+, busybox, Nov30, 2011
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
X-List-Received-Date: Wed, 30 Nov 2011 22:14:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 07:24 +0800, edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> All,
> These are recipes upgrade for gtk+, busybox, libsoup-2.4... pls. help to review
> and pull.
> 
> Thanks,
> Edwin
> 
>   bitbake: Update users of getVar/setVar to use the data store functions directly (2011-11-27 10:35:30 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib gzhai/master2
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master2
> 
> Zhai Edwin (8):
>   gtk+: Upgrade to 2.24.8
>   xz: Upgrade to 5.0.3
>   polkit-gnome: Upgrade to 0.102
>   libsoup-2.4: Upgrade to 2.36.1
>   libcroco: Upgrade to 0.6.3
>   x11perf: Upgrade to 1.5.4
>   eee-acpi-scritps: Upgrade to 1.1.12 via git tag
>   busybox: Upgrade to 1.19.3

I merged all these except busybox which I'm going to defer to Ander's
patch for.

Cheers,

Richard



