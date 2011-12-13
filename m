Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaRai-0001ge-MH for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:36:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCTLU8008718
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:29:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07989-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:29:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCTBiV008712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:29:12 GMT
Message-ID: <1323779351.2731.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 12:29:11 +0000
In-Reply-To: <cover.1323688579.git.xiaofeng.yan@windriver.com>
References: <cover.1323688579.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/7] gtk+-directfb: The patches to run gtk over directfb
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
X-List-Received-Date: Tue, 13 Dec 2011 12:36:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-12 at 19:28 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Hi Phil, Koen & Richard,
> 
> Thanks for your good suggestion. I have modified my patches according to your suggestion.
> 1 Remove patch no-demo.patch from gtk+_2.24.8(Richard's suggestion)
> 2 Use gtk-directfb in DISTRO_FEATURES(Koen's suggestion)
> 3 Remvoe PACKAGECONFIG[directfb] for pango(Phil's suggestion)
> 
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: xiaofeng/gtk-directfb
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk-directfb
> 
> Thanks,
>     Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
> 
> 
> Xiaofeng Yan (7):
>   cairo: add directfb DISTRO_FEATURE
>   pango: Disable x11 when pango doesn't run over x11
>   gtk.inc: add feature based on directfb
>   gtk: add demos to the configuation of gtk+
>   directfb-examples: add package directfb-examples to OE-core
>   task-core-gtk-directfb.bb: Add task list to run gtk over directfb

I've merged these, thanks.

>   core-image-gtk-directfb.bb: add an image for gtk over directfb

I think this one needs a piece of anonymous python as mentioned in my
reply.

Cheers,

Richard



