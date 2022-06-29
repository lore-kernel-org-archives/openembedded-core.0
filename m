Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC6AC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 14:11:04 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.12056.1656511855990204699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 07:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WLm+uICG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id i1so18179853wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=D0+TDhyX5izoCLzdgbzMt0+nN1UdC60l9MJ0caSVlX8=;
        b=WLm+uICG79fg3eULbQfrLVowQEcQoQC7wl6SxcCrJ9HLAaubBuY10tHohtEr/Iux6e
         N4yKqU4iiXCuMwRYhTfsLa0eBtCZciHEcYDS5O+abk0EGTMiwduhcT7CQlrqTrJGQCgI
         r1a4sx2PSI03yDFQNUmavv5jYIsf1H3KFDk+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=D0+TDhyX5izoCLzdgbzMt0+nN1UdC60l9MJ0caSVlX8=;
        b=Q54sNTUYlYzN6BRo0s0YTgXWeFxy0iua0HI1hyQeL70PIhaGDXS9Soa/Pnxc/YlVwe
         YuhMUCaC+khdQTHFw17aIqZpPzj8lGGi800lMxkSLUfLawK8LJdDAMdiiKbvJ1xVO4pS
         wumpyheW1JkMjlwBql+qqgQC0lwpBUi1hVYpx+aoVP2W8jpeSKQfIdbVhzhjLnlo17U1
         zulqpBoM+618A3x6qF/DAUb8MYklRSVTvdzcQ6QJ5FaAqDgGCdPTPMkleYdjsmlKTEbt
         Z69ge7+mh6rn5ioooch6fmdKPh5q8Ks3iHpjjb6z9RgwH+nSQaUjdeV8CoAFInEgYcOB
         q3ow==
X-Gm-Message-State: AJIora8+0pRkYb0ySuCzkJ3tOHkggBEjFOx6zY2H7bR93yUX9Gw+hY+f
	pDPwBn/YBJLQ1WwwAuTjG8/kWA==
X-Google-Smtp-Source: 
 AGRyM1vD9VdrTEmtHMtM7Pgu3nOwcbG4k8j0JuEIolVn5oEhredmLN+Np5+GEhEWQnIslYpW6nyS5A==
X-Received: by 2002:a05:6000:1a89:b0:21b:83a9:aa6f with SMTP id
 f9-20020a0560001a8900b0021b83a9aa6fmr3468805wry.33.1656511854346;
        Wed, 29 Jun 2022 07:10:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7688:b75a:a909:895d?
 ([2001:8b0:aba:5f3c:7688:b75a:a909:895d])
        by smtp.gmail.com with ESMTPSA id
 j6-20020adff546000000b0021b862ad439sm20058001wrp.9.2022.06.29.07.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 07:10:53 -0700 (PDT)
Message-ID: 
 <a5da318795d11aeff646b1e5c1f357c00bee1e2c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: 8.2.5083 -> 9.0.0005
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2022 15:10:52 +0100
In-Reply-To: 
 <CANNYZj8mU1djPZBVQHFa_=FBL1tUw6OXH0AJ8VDKPX+bEmqbYg@mail.gmail.com>
References: <20220629132621.581615-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj8mU1djPZBVQHFa_=FBL1tUw6OXH0AJ8VDKPX+bEmqbYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 14:11:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167377

On Wed, 2022-06-29 at 16:57 +0300, Alexander Kanavin wrote:
> Would it be better to stay at 9.0.0000 for now?

I'm not sure it makes a lot of difference. The 5 changes after 9.0 look
relatively harmless, some of them are translation fixes. This change
addresses 4 CVEs and I suspect there will be more to follow so we'll
have to update past 9.0 soon anyway. I was torn but going for the
latest seemed to make the most sense.

Cheers,

Richard





