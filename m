Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88B9C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 12:54:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.6027.1654174471980043279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 05:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dx4YOnzR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id s24so6337568wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 05:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=6Pv4Ho8k+R3g9FrkRdio4GWuVLNgjIaivViqKq10Y+I=;
        b=dx4YOnzRI0MWATkdQWBFyQ2ZxgJ24KnVBQWm1S8ajC6POdLu5P4Sm1xz4Mqx5SiqkQ
         Of2DPxA+sx86K4ZAEMbauDnsMZ2kokS5ia9+3bLYdzdGHraLWwFgf3+rADeRQP5dKto0
         WsK56guWj5b6sdB98hned9HkNX2XKpyncjB3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=6Pv4Ho8k+R3g9FrkRdio4GWuVLNgjIaivViqKq10Y+I=;
        b=B53nDHFzV+8xVayPBlVCQKA/RwtB439KENKOm00L7cB87D9U9JnRP2ihRV5Bz4qSjf
         b098HmGQfig3K+/hxNgDj4kceHNQ+RJWO/NaqL0k7v+j8ETSNo3JA21buDSvHxl0Iu5N
         8ys7fnOb0Gf9Rq1BmwNwgj37oPfyg2k5lZCzC9RROX2k2f+YEOWUIZKeomxPmunFlUy4
         YzGyg3sf1zRdqOYQBaU4YtQxridaG1MN7aNotLtU7SPu01g/oGMUJ6iIRRmDs+kWV385
         8cz+3wn7fkjFdyItXbPhJP7eJG2l9F3+hOwPYiFX91V/v8F1f2AATKrZ6T1qkgWli1jq
         RpjQ==
X-Gm-Message-State: AOAM532FaSxfEK5eDlf4OGQmH6j/I/O/EJdXkGS/PBdUHclLMjgHsul1
	qTaiiGRYClXWfvbeeKxA67mqlA==
X-Google-Smtp-Source: 
 ABdhPJyzM513T4kl7w1TAK6G6OVuW82oFkQqH/B40JyFOnbwJ7XhvwWMlZQv0Dvd9k+nGLYv0pSCMg==
X-Received: by 2002:a5d:6787:0:b0:210:3470:13dd with SMTP id
 v7-20020a5d6787000000b00210347013ddmr3498201wru.279.1654174470290;
        Thu, 02 Jun 2022 05:54:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:171c:95a:9d1d:26d3?
 ([2001:8b0:aba:5f3c:171c:95a:9d1d:26d3])
        by smtp.gmail.com with ESMTPSA id
 z7-20020a5d6547000000b0021020517639sm4336615wrv.102.2022.06.02.05.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 05:54:29 -0700 (PDT)
Message-ID: 
 <32e9fa8dc4a9be5fd0442f78d30492a8874e6b7c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [honister][PATCH 00/12] Pull request (cover letter
 only)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Jun 2022 13:54:29 +0100
In-Reply-To: <cover.1654049055.git.anuj.mittal@intel.com>
References: <cover.1654049055.git.anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 12:54:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166471

On Wed, 2022-06-01 at 10:09 +0800, Anuj Mittal wrote:
> The branch has reached EOL and will not be actively maintained after
> this merge.

Thanks for your help in looking after it, very much appreciated!

Cheers,

Richard

