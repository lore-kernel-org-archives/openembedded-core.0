Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDFk-00023F-N9 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:46:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FgDgo021400
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:42:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20817-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:42:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Fg5Di021394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:42:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
Date: Fri, 08 Jul 2011 16:41:26 +0100
Message-ID: <1310139686.20015.897.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/8] Bug Fixes for M2 Rc2
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
X-List-Received-Date: Fri, 08 Jul 2011 15:46:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 16:31 -0700, Saul Wold wrote:
> Richard,
> 
> This address the bash, xcb missing from libx11, locale issue and
> the lack of space due to zypper eating space.
> 
> Sau!
> 
> 
> The following changes since commit f1fc6d084b079dea21ff1a30b815496452042490:
> 
>   pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (8):
>  
>   image.bbclass: add LINGUAS_INSTALL to depends list
>   gnome-doc-utils: Add RDEPENDS on bash
>   quilt: Add RDEPENDS on bash
>   console-tools: Add RDEPENDS on bash
>   usbutils: Add RDEPENDS on bash

I've taken these (rewording the image.bbclass commit).

>   rootfs_rpm: Add 50Meg to image size for zypper

This needs tweaking as per the discussion

>   eglibc: Add RDEPENDS on bash

We should likely take OE's ldd patch here and then this can go in.

>   libx11: enable xcb support

and this needs a revised commit message.

Cheers,

Richard



