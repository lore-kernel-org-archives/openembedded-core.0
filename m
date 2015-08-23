Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 407 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 23 Aug 2015 21:22:52 UTC
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0736373CF2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Aug 2015 21:22:52 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C6B582096F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Aug 2015 17:16:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Sun, 23 Aug 2015 17:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=8lhxZ5lVv3Tt9qF
	ya7qUUEnCiv4=; b=s6nQ2IinXXfi6F92CWrayaCXt/YjedhTpOyBhYYbenODo1l
	sOXqo/13BkJstx27ARjx4aBY3EH89gtW9VkjqIVB3ny1flNgfvjAd6TrUhvHKnUs
	AUbDHi+NIXtv27aEruduac2f9O8HBsJEP2QmUsZtpXC2uL4gEJA1IrIw7Xis=
X-Sasl-enc: /kohX7q+nYUFiZ8fYEvTTHIvg5T4v3W4a3DIHQh0bvod 1440364563
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3363CC00014;
	Sun, 23 Aug 2015 17:16:03 -0400 (EDT)
Message-ID: <1440364561.5373.19.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 00:16:01 +0300
In-Reply-To: <1440259095-24566-2-git-send-email-raj.khem@gmail.com>
References: <1440259095-24566-1-git-send-email-raj.khem@gmail.com>
	<1440259095-24566-2-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.16.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/6] alsa-lib: Lift the limitation to use gcc only cross compiler
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
X-List-Received-Date: Sun, 23 Aug 2015 21:22:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-08-22 at 08:58 -0700, Khem Raj wrote:
> alsa-lib configure tries to see that if CC variabled doesnt contain
> 'gcc' then it tries to guess and redefine CC to be something gcc, which
> doesnt work with OE since we define CC to have sysroot and options
> attached to it.

Can you give an example of a CC value that you've seen failing? If you
don't plan to send this to upstream yourself, it's probably me who's
going to do that, and I'd like to be able to point out a concrete
example where the removed code has been failing.

-- 
Tanu

