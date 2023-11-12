Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613D7C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 00:46:28 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.8055.1699749981111369482
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 16:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g2+0eCKK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0084BFF805;
	Sun, 12 Nov 2023 00:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699749978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eKDdfLUagVh1QADJ7EQBQWufqehWZRc9typwGti5+Fc=;
	b=g2+0eCKKFhlLKpwBQWSMKgN52FC/iOGuLbLdjjgvYMHWUI1wLa1hn6D2YDlCias03hqn2l
	7fnv0syhYNKPKjpW8DM/ZfZLZOaCj39o8Ii2BkfOsXdMGM6LnSdfG2tu9HywD9nrlfoqKc
	sWjOz6QJR/Fo+Y8LQmB9ZZZhpB4t2KmuEu7soU5KIGVQpm3g8JV81JfEwlRqh12j46cEbV
	zfSb2QttGwt/fhAcjr3wGRDJdR6WoBI5Jg7/VerEor6Xj8tDs6ccFYQY9FqsJ2RwAje8XJ
	NY+lg1VgbZTap9Ang/rMoJpyENYAXQFvpWO7rKFrCbEw4N1UFeLUPPF6aaelIw==
Date: Sun, 12 Nov 2023 01:46:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RESEND PATCH] qemuboot.bbclass: fix typos in
 documentation
Message-ID: <202311120046176453c8a8@mail.local>
References: <20231111172810.1880050-1-marcus.folkesson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231111172810.1880050-1-marcus.folkesson@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 00:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190441

This was applied on the 23rd of october.

On 11/11/2023 18:28:10+0100, Marcus Folkesson wrote:
> comand -> command
> docuemntation -> documentation
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  meta/classes-recipe/qemuboot.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
> index 5c4bbd6737..ff32aac902 100644
> --- a/meta/classes-recipe/qemuboot.bbclass
> +++ b/meta/classes-recipe/qemuboot.bbclass
> @@ -62,8 +62,8 @@
>  # QB_SLIRP_OPT: network option for SLIRP mode, e.g., -netdev user,id=net0"
>  #
>  # QB_CMDLINE_IP_SLIRP: If QB_NETWORK_DEVICE adds more than one network interface to qemu, usually the
> -#                      ip= kernel comand line argument needs to be changed accordingly. Details are documented
> -#                      in the kernel docuemntation https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
> +#                      ip= kernel command line argument needs to be changed accordingly. Details are documented
> +#                      in the kernel documentation https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
>  #                      Example to configure only the first interface: "ip=eth0:dhcp"
>  # QB_CMDLINE_IP_TAP: This parameter is similar to the QB_CMDLINE_IP_SLIRP parameter. Since the tap interface requires
>  #                    static IP configuration @CLIENT@ and @GATEWAY@ place holders are replaced by the IP and the gateway
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190433): https://lists.openembedded.org/g/openembedded-core/message/190433
> Mute This Topic: https://lists.openembedded.org/mt/102529421/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

