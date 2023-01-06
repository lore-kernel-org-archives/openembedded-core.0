Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98489C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 17:43:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.321.1673026990921612432
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 09:43:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SbksdzHC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id bs20so1950317wrb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 09:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vj8JgvyGY6PCiLNayfrmHlL2dkU41jqGHeAGq88tZN4=;
        b=SbksdzHCr3rsc+vCVP4EudlMVhAobH2cqgak39ngGMSDbJijhH0Wy/AClJU+wMxdTJ
         cOosXcXYuWMvRtRBA4o62BdfSveik1fq4InG/9k186T4Ci7bEqQzDjouDVJxI+lsJuQ5
         99d669i8eRYhccrASi1QhQXT7z8kpH25MhIxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vj8JgvyGY6PCiLNayfrmHlL2dkU41jqGHeAGq88tZN4=;
        b=bDaL162aGJHnZ4J8kpoWdTwmoFMUs6KZJTfPMQ6wIQTa3Ul9DvAXRZSEtyQE4DtOyd
         r/2q4Sf57EsQKVKSmf3mhfTR8RARhGzruImDRmxcNnlWRZ4Z18QC3Z07M6OY7yEnKuoS
         VCS9zGETbqn6fpJqQpLQ4MRx9FPc/wPieQ7QL7XpP6T2b1tHidm9qMzXRGOMQgUHJ/W/
         PfVgpHI7x7T+EulLFUNyx2YOG/5UrkbWK4WhZDx2r6xyS7CiBj42Std89Oa2ACFZwN+z
         nVr9IIjQN67742E+/ptZ0fIeaEJd1E2EXn4yn+8OIoVV7+kE4ScNxolV9weLZ1kXS6ej
         5nOg==
X-Gm-Message-State: AFqh2kqpYlJrwPsovaXHl7haX4DtP5shMmvgl2zeXuc9672inwmWzPgq
	b/G1o3Lh1Z/0uTajBkbnoOizfpiRta9vjCze
X-Google-Smtp-Source: AMrXdXvAb+eVj8dkMO5B7IUIiycGzX+BPg+sXDCrRJyIxwO77otWzUakxcM9SPwfzfD2kghN9miEZQ==
X-Received: by 2002:adf:dd88:0:b0:242:ac4:4a0c with SMTP id x8-20020adfdd88000000b002420ac44a0cmr42352548wrl.32.1673026989380;
        Fri, 06 Jan 2023 09:43:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:49cf:c46d:e32d:e951? ([2001:8b0:aba:5f3c:49cf:c46d:e32d:e951])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d508b000000b002779dab8d85sm1731826wrt.8.2023.01.06.09.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 09:43:08 -0800 (PST)
Message-ID: <fe3e76df0154434f52285cfcf813b06e277352e5.camel@linuxfoundation.org>
Subject: Re: [OE-core][langdale 00/22] Pull request (cover letter only)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Jan 2023 17:43:08 +0000
In-Reply-To: <CAOSpxdYmgB33V_TcvRkqXSrB-4SzoDqyYNwMjZuujOdzZCokyg@mail.gmail.com>
References: <cover.1672843046.git.steve@sakoman.com>
	 <CAOSpxdYmgB33V_TcvRkqXSrB-4SzoDqyYNwMjZuujOdzZCokyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 17:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175608

On Fri, 2023-01-06 at 04:33 -1000, Steve Sakoman wrote:
> I neglected to add a comment that this is the final pull request for
> the langdale 4.1.2 build on Monday.
>=20

Thanks. I think I've pulled in all the right pieces and I pushed a ba
bump too so we're hopefully ready to build. I'll check with Michael on
when we can best run that.

Cheers,

Richard

