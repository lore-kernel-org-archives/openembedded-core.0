Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2DCC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 10:55:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.5442.1641898503521825531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 02:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MP5enRTl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso1557424wme.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 02:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=w0k0Fcto+HDCkFgVL6CzEgsCivzpqr9+nXR9g0Vz+wg=;
        b=MP5enRTl6+lzhO+nbSrmzoSGcbAtRDwekbwxKj7TIyoGOyZRxkwjpeqnAjTAJypi8V
         VOXMJ1binEoYQgoqPWY1s2TafTyYnBrLu1HtPcbtl0rotGUPD2fcQsiQE1ESo7lFWTce
         CBrVRFF6MMurftmWNQTkc6MikdBq8ekhGq9Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=w0k0Fcto+HDCkFgVL6CzEgsCivzpqr9+nXR9g0Vz+wg=;
        b=L972/t2dSfeL3R6IsQn2H1QtcBpzDEzBE5yGb7DFGsg6yXnGg3hsNLvft4rluItEiP
         m0abOzl1LFfFr624sdvbrt3MfaV3PBiKL7lj6f2KEAnaL6cYOmJaSZ2hsWXA/eo7Q7eU
         ptIoc4w6qrnrgRUtgmHlz6sbI+i5xm+nygOmOTulkV4tbUjO+lGlyenhpPJkzGRCy1oN
         QNbmoZ88AZZcnTypAL/uL2s4HRAMBFYKEPytif5eCSWcrPqOL6r5TfxVQBAs0QIwHfKC
         W4SG8Z8TZP1DQqnxwFyoI/VveUga3P6ZfHHmeWSZI9gRErwb2UhDjNKSkWFdpR2R856f
         TEoA==
X-Gm-Message-State: AOAM532vUt4ndqP/Ukifwyin74DoALyGZr+HB1DIioTLW8DWcQW7JoKt
	HwORHW8/TA86vAZdFMJP+UB7/Q==
X-Google-Smtp-Source: 
 ABdhPJy7ajyQyJG9rJF7QKxVlYkBzCLxXv+ddJmHfc5yeY4aF8aqnrxlHRLMhSlGbBqjdGgAgKDIlw==
X-Received: by 2002:a05:600c:20d3:: with SMTP id
 y19mr1908002wmm.151.1641898501907;
        Tue, 11 Jan 2022 02:55:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4?
 ([2001:8b0:aba:5f3c:895c:c4eb:1cfa:d3e4])
        by smtp.gmail.com with ESMTPSA id
 e13sm4104310wrw.3.2022.01.11.02.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 02:55:01 -0800 (PST)
Message-ID: 
 <b13cebc769646dffce33ee9b675375d4c22ef7bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 13/14] connman: do nothing in qemu, do not
 touch eth0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 11 Jan 2022 10:54:59 +0000
In-Reply-To: <20220109222732.2252416-13-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
	 <20220109222732.2252416-13-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 10:55:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160391

On Sun, 2022-01-09 at 23:27 +0100, Alexander Kanavin wrote:
> qemu kernel itself is nowdays perfectly capable of setting up
> what was passed in via ip=:
> 
> [    1.676847] IP-Config: Complete:
> [    1.677768]      device=eth0, hwaddr=52:54:00:12:34:02, ipaddr=192.168.7.2, mask=255.255.255.0, gw=192.168.7.1
> [    1.679933]      host=192.168.7.2, domain=, nis-domain=(none)
> [    1.681201]      bootserver=255.255.255.255, rootserver=255.255.255.255, rootpath=
> [    1.681203]      nameserver0=8.8.8.8
> 
> connman-conf only does the same thing again by (badly and incompletely)
> parsing those parameters with sed.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> 
[...]

> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 748eefa748..07049fbf21 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -101,6 +101,12 @@ do_install:append() {
>      fi
>  }
>  
> +# Kernel IP-Config is perfectly capable of setting up networking passed in via ip=
> +do_install:append:qemuall() {
> +    mkdir -p ${D}${sysconfdir}/default
> +    echo "export EXTRA_PARAM=\"-I eth0\"" > ${D}${sysconfdir}/default/connman
> +}
> +
>  # These used to be plugins, but now they are core
>  RPROVIDES:${PN} = "\
>  	connman-plugin-loopback \

This means connman becomes machine specific, you can't do that. This would need
to be done in the connman-conf recipe.

Cheers,

Richard




