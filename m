Return-Path: <krirobo@gmail.com>
Received: from mail-vc0-f178.google.com (mail-vc0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id AC3FF6D8F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 18:50:02 +0000 (UTC)
Received: by mail-vc0-f178.google.com with SMTP id ik5so4972723vcb.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 10:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=O9+nukKPabYMvCGj0ZJmokila18Qywtz/YxTB6gpHqQ=;
	b=mdT+9t6jKfPBITs88tiUbAuPR1BqY5XDC6FqLDQnoKHm4ft51fk4Fjs4eHQ6uOgrMu
	GtZ5xmv5Xm0ST4pCtr1TyAwO6MggM9Hyr33otGCYRffRNbgpbrVhd+wueOepgan5FPuK
	yzIU124CbAI+C3XGyAyDO6QFr3l/7asIMMlywXqcBTWtNqwSpi0Jk4qphm2Es/3Ffkq7
	Dw6j7bL33WCJuyoiAPYXBwoVHoL3sUBNwbbqvcrsC5+rmo9Qod8qEKfPYDtaaefPkeAh
	R2JgO04wP0wI1ceEO+Qr85Fg2aLhpzXLuFoDOnT/FVoGX1qZnVfgI1nqUlAX0CnjUAWP
	tulw==
MIME-Version: 1.0
X-Received: by 10.58.161.46 with SMTP id xp14mr25199veb.37.1391453403064; Mon,
	03 Feb 2014 10:50:03 -0800 (PST)
Received: by 10.58.133.233 with HTTP; Mon, 3 Feb 2014 10:50:03 -0800 (PST)
In-Reply-To: <1389452899-633-2-git-send-email-andrei@gherzan.ro>
References: <1389452899-633-1-git-send-email-andrei@gherzan.ro>
	<1389452899-633-2-git-send-email-andrei@gherzan.ro>
Date: Mon, 3 Feb 2014 19:50:03 +0100
Message-ID: <CAFgGSN5skuFQsx_dLEETuO_kq7YCyFr6LbqgXkCAEmBx=8VRdQ@mail.gmail.com>
From: Kristof Robot <krirobo@gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] feature-arm-thumb.inc: Use thumb instruction by default if TUNE_FEATURES thumb
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
X-List-Received-Date: Mon, 03 Feb 2014 18:50:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jan 11, 2014 at 4:08 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Avoid a confusion when including thumb in TUNE_FATURES. In the curent behavior,
> if I include thumb in TUNE_FATURES, ARM_THUMB_M_OPT will be "-marm" which makes
> no sense for me as a default behavior.

I agree that this is confusing, I actually fell for this - thinking I
was using thumb instructions, while apparently I was not...

Any update on this patch?

Thanks,

Kristof

