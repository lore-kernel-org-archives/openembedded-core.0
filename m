Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuWoJ-0006Mx-G3 for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 00:45:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QMY5uK027718
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 23:34:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26762-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 23:34:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QMXuYx027711
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 23:33:58 +0100
Message-ID: <1343342035.9574.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 23:33:55 +0100
In-Reply-To: <alpine.DEB.2.02.1207261800480.15478@oneiric>
References: <alpine.DEB.2.02.1207261800480.15478@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: is "export IMAGE_BASENAME" currently supported or not?
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
X-List-Received-Date: Thu, 26 Jul 2012 22:45:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-26 at 18:02 -0400, Robert P. J. Day wrote:
> from image.bbclass:
> 
> # "export IMAGE_BASENAME" not supported at this time
> IMAGE_INSTALL ?= ""
> IMAGE_INSTALL[type] = "list"
> IMAGE_BASENAME[export] = "1"

I suspect back in time this looked like:

# "export IMAGE_BASENAME" not supported at this time
IMAGE_BASENAME[export] = "1"

and what the person wanted to do was:

export IMAGE_BASENAME

i.e. export and already set variable. At that time, the syntax was not
supported, I believe that it now is and has been for a while.

So a nice cleanup would be to change it to the above and remove the
comment.

> but there's this:
> 
> meta/recipes-core/images/core-image-minimal-initramfs.bb:export IMAGE_BASENAME = "core-image-minimal-initramfs"

so we can drop the "export" from there since the core does it.

Whether the export is needed at all these days, I don't know.

Cheers,

Richard



