Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYnhR-0008Cz-4n for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 00:48:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8NfZQs013189
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 23:41:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08226-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 23:41:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB8NfQoo013171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 23:41:27 GMT
Message-ID: <1323387698.5309.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 23:41:38 +0000
In-Reply-To: <cover.1323246565.git.xiaofeng.yan@windriver.com>
References: <cover.1323246565.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/10]gtk+-directfb: The patches to run gtk over directfb
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
X-List-Received-Date: Thu, 08 Dec 2011 23:48:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Just to summarise where we are with this patch set:

On Wed, 2011-12-07 at 16:58 +0800, Xiaofeng Yan wrote:
> Xiaofeng Yan (10):
>   qemu-config: Disable dbus-x11 when no x11 in DISTRO_FEATURES
>   gconf: Disable dbus-x11 when x11 isn't in DISTRO_FEATURES
>   gtk.inc: ship gtk-demo to independent package

I pulled in the first three of these patches since they look fine.

>   gtk.inc: add feature based on directfb

I think this one is ready to go in, I'm just going to wait a few hours
to see if there is any further discussion.

>   gtk: add demos to the configuation of gtk+

I had a question on this one.

>   cairo: add directfb DISTRO_FEATURE

This is fine to go in (but why the added whitespace?)

>   pango: add directfb DISTRO_FEATURE

Phil had some comments on this, I agree we don't need directfb there.

>   directfb-examples: add package directfb-examples to OE-core

This is fine to go in.

>   task-core-gtk-directfb.bb: Add task list to run gtk over directfb

dropbear looks out of place here

>   core-image-gtk-directfb.bb: add an image for gtk over directfb

This is probably ok.

Cheers,

Richard



