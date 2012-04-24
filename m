Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMbZ6-0005SY-5L for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 10:57:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3O8m2SE005386;
	Tue, 24 Apr 2012 09:48:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04928-02; Tue, 24 Apr 2012 09:47:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3O8lqXj005379
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Apr 2012 09:47:53 +0100
Message-ID: <1335257270.12692.108.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Tue, 24 Apr 2012 09:47:50 +0100
In-Reply-To: <4F95772B.2080007@linux.intel.com>
References: <1334872962.3028.2.camel@ted> <4F95772B.2080007@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bootimg.bbclass: Tweak iso images to become hybrid images
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
X-List-Received-Date: Tue, 24 Apr 2012 08:57:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-23 at 08:37 -0700, Darren Hart wrote:
> 
> On 04/19/2012 03:02 PM, Richard Purdie wrote:
> > From: Damien Lespiau <damien.lespiau@intel.com>
> > 
> > This allows iso images to be written to usb keys and booted on systems which
> > have a BIOS which support this. There is no real down side to tweaking the iso
> > images in this way.
> 
> I like the idea, but there does appear to be one potential downside.
> From the syslinux isolinux.txt documentation:
> 
> "The ISO 9660 filesystem is encapsulated in a partition (which starts
> at offset zero, which may confuse some systems.)"
> 
> How many different systems and firmware has this been tested on?
> 
> I think it is a worthwhile patch, but we should be aware of the above in
> case a regression is reported. In such an event, it seems a
> NO_ISO_HYBRID flag could be set by the machine.conf to revert to the
> older behavior.

Agreed, I think we should try this and see if there are any problems
reported. I tested a few machines here and it seemed to work on most of
them but this was with a USB key, not a CD image. This is probably our
more common use case though.

Cheers,

Richard



