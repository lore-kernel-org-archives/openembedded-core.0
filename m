Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8DCC25B67
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 07:44:04 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.2012.1698392638679467953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 00:43:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cV3D+HWl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F5F1C0002;
	Fri, 27 Oct 2023 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698392637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tus2sRQz2TG8RVCHsAn15az9XDUlxmiwv7lpHx4XmNY=;
	b=cV3D+HWlvcjuQNrcqR1quzeSpTBzG0Nic8Pszo+Lasq7EBgwnXbmnPvVx5jkh3yIzKTVFb
	W8k867L11X8J5G5ygKWpxHFGUc2qGgFqU6fIjnaYOfSrYWWUmf/okaUnqfbcEdeQvwwd9O
	3GMh6rOMXQb1l4A8xoaJLRXYcu98++9V3MKeiAy33AP11mnlJuA045FwOvUlWLj+QOBb5X
	x/68CO2B9cU+oMGIsmrcgRGgPTuu2FNL65gnczOnqhuAoiuWLsCU0k7Ruj+pmMGY1EtYAN
	ziRhuVVIQBNVCvkh5Gkb8NoaP8cXcJowymatFLV/uXTM31wXkcubsL+3aJHuDA==
Date: Fri, 27 Oct 2023 09:43:55 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
Message-ID: <20231027094355.1a43f67b@booty>
In-Reply-To: <CANNYZj_6kh4bXP_bunqy1s178ZtArCgy=ms7+eTTYVY0G1H8jA@mail.gmail.com>
References: <20231026103320.2751277-1-alex@linutronix.de>
	<20231026220221.23f75433@booty>
	<CANNYZj_6kh4bXP_bunqy1s178ZtArCgy=ms7+eTTYVY0G1H8jA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 07:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189741

Hello Alex,

On Fri, 27 Oct 2023 07:29:28 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> On Thu, 26 Oct 2023 at 22:02, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > Is this different from the series you sent on the 23rd? There is no
> > vN tag and no ChangeLog, so it's not obvious.  
> 
> Only the third patch should be different, and it has core-image-weston
> removed (as it was causing missing objects, as reported by you). I'll
> try to include changes under --- in each commit going forward.

That will be useful here, thanks! Without it, at least a v<N> in the
subject would be good to help keeping track of the current iteration.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

