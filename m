Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCB0C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 17:21:53 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web08.802.1643304108252797021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LR5akc0r;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: petr.vorel@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id t14so5315375ljh.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 09:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=JsdtlLFVqoqkuQweszyxHTUFRWbBAWQYKKz5XiDWjx8=;
        b=LR5akc0rNfVCExKVUlvtSHt/pU618qDfaf4mEZknGD45aX+H5QieLr8GOsm2/Hxejd
         vXtuIeiYmjICwrpWbBie4+Wk3mWrvsuIIvGeXkOK+QrWisQKj11IFXTfD2L7K+dR8Q3v
         RvwV01c/Q0PVz/rssAdU9GxCCD0LIgnwshDNi4rD3Sdx0LS3wF9CO6qonSr1XZtkUA/b
         Yvh8uFDmZj8B0dQ6nnw20+RnjYSVL7h+Q039pLI/ZcBoXBSWCcB9mMLeQE6mQOD421zb
         wKbxBbXihKWp7XWS0VadikfnjQ7GEoTbhGnkaG9EIsHFIYF43vj3HawQjjZ1F+BUIvdE
         P88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=JsdtlLFVqoqkuQweszyxHTUFRWbBAWQYKKz5XiDWjx8=;
        b=SuAqBuhnG9ZREw6+0Y5wycRZqy+wCXpgv06vxAXnzeDdLdMFqMCNQXyEXPt6WJ/uhT
         jsAbMZS+bd+KgC3BD99P1YwWQM3xg0iwXldmekYXp8N5n8WUaGMLgwKxqc0urCAnu2MS
         nPMMUMfhdA4cbHIAOUGyi4kriuh9JkZ6wmLKwGq8cttWsWy+GSLtJ+HU+ja02DWww4Ls
         GhexcQa3odRDxqEVc9mF1WW/vs/XFrqnXZ+CXgXtf4ApMPqkE2Y7xbucjrHqGO0bfi56
         M0ul41R5Df9hqTnCLdTQpxvxGcd7gKWgvMDWJXu6iGPia5ExVsk4jwqxursbAcXldq3i
         ooBA==
X-Gm-Message-State: AOAM5337X59tpdPqNpiOufGXXX5J08JWKp4s2Nnui4bdBjxqAKTaKE0Q
	7DkAtYEsJCkQALOKcyojShw=
X-Google-Smtp-Source: 
 ABdhPJxoimMjNzx8zBsQs9PksMTq7bpnHLURQJUnteSLqJU1BhjXBcwexVXX3gGIIuyKMr/H1UAPOA==
X-Received: by 2002:a05:651c:2116:: with SMTP id
 a22mr3558110ljq.86.1643304106352;
        Thu, 27 Jan 2022 09:21:46 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id
 z27sm257166lfg.31.2022.01.27.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 09:21:45 -0800 (PST)
Date: Thu, 27 Jan 2022 18:21:42 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Li Wang <liwang@redhat.com>
Subject: Re: [PATCH 14/17] ltp: update 20210927 -> 20220121
Message-ID: <YfLUpiy5XbI24E6G@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220127102005.3050843-1-alex@linutronix.de>
 <20220127102005.3050843-14-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127102005.3050843-14-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 17:21:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161042

Hi Alexander,

> The ltp compliancy parser is rewritten to actually
> match the logs: they seem to be unstructured, test case names
> are not printed and the only indication of failure is appearance of
> FAIL[ED] somewhere.

I'd split meta/lib/oeqa/utils/logparser.py change into separate commit.
It's not related at all to the update.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
to the update part only.

> +do_compile() {
> +    oe_runmake HOSTCC="${CC_FOR_BUILD}" HOST_CFLAGS="${CFLAGS_FOR_BUILD}" HOST_LDFLAGS="${LDFLAGS_FOR_BUILD}"
> +}

This would take me some time to figure out (actually that's why I was postponing
to do the update myself). Thanks!

Kind regards,
Petr

