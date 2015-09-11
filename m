Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7685A73CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 14:51:20 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZaPfb-0005S8-2o; Fri, 11 Sep 2015 16:51:19 +0200
Message-ID: <1441983077.31676.17.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Date: Fri, 11 Sep 2015 15:51:17 +0100
In-Reply-To: <1441975783-21782-1-git-send-email-clopez@igalia.com>
References: <1441975783-21782-1-git-send-email-clopez@igalia.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-keyboard: Fix build failure with ld-is-gold
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
X-List-Received-Date: Fri, 11 Sep 2015 14:51:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-11 at 14:49 +0200, Carlos Alberto Lopez Perez wrote:
>   * When ld-is-gold is enabled in DISTRO_FEATURES, matchbox-keyboard
>     will fail to build with this error:
> 
>     ld: error: matchbox-keyboard-image.o: requires unsupported dynamic
>                reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC

This is only an issue for ARM (and only for Thumb2 at that).  I don't
think it's necessarily appropriate to force -fPIC on all targets.

Also, before adding this sort of hack it would be worth verifying
whether this is in fact a toolchain bug and, if it is, fixing it there.

p.



