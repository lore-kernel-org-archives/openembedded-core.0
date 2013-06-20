Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE966AD2B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 06:34:39 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UpYS6-0000Bg-Kr; Thu, 20 Jun 2013 08:34:39 +0200
Message-ID: <1371710061.8611.26.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Jonathan Liu <net147@gmail.com>
Date: Thu, 20 Jun 2013 07:34:21 +0100
In-Reply-To: <1371693296-6834-1-git-send-email-net147@gmail.com>
References: <1371693296-6834-1-git-send-email-net147@gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libx11: enable Xcms by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jun 2013 06:34:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-20 at 11:54 +1000, Jonathan Liu wrote:
> The following do not work if Xcms is not enabled in libx11:
> - starting xterm and doing ls --color / fails to color code the
>   directories:
>   xterm: Cannot allocate color "rgb:5c/5c/ff"
> - xsetroot -solid rgb:5c/5c/ff fails with the following error:
>   xsetroot:  unknown color "rgb:5c/5c/ff"
> - xsetroot -solid rgbi:1.0/1.0/1.0 fails with the following error:
>   xsetroot:  unknown color "rgbi:1.0/1.0/1.0"
> 
> More specifically, applications that pass Xcms color names to
> XParseColor do not work properly.

The comment that you are deleting suggests that this behaviour is by
design:

> -# Let people with incredibly archaic requirements enable Xcms, but disable it by
> -# default.

Since there's already a PACKAGECONFIG option for this, can't you just
enable that in your distro configuration rather than changing the
default?  I don't think it's ever been the expectation that the default
settings will represent "maximum functionality".

p.



