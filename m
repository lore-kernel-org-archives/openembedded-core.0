Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.60135.1606744827581083943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 06:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gD/bPXaQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id z7so16347379wrn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 06:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ajZAPHKAiLGLw6byMeXQBBaF4KbaOOViR8xzC2grVq8=;
        b=gD/bPXaQ2Nrb+R0b9lalVouUhfpVVcFMQ9b8rukZzONjDTiK4XBOXHmUyvBg4oBI35
         UM/qWSMUrPn2tmQilYFAdSURw/b02ltgT9dTfdEQsfaHCM2NJw6W8/ohJ9IHAQQWqOGi
         y0jQn0XfQUka9DdD6RansQ+u/rcxzVt2g0VNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ajZAPHKAiLGLw6byMeXQBBaF4KbaOOViR8xzC2grVq8=;
        b=GVqkIeIRclGEXcO/cR8yoCZszgpNhubsNaQGwXId6/bS3W7tWllxkOLI5vE8t0iZqT
         NPdiprIiOYi2z7ddxcWY4cRH7ZlsKJlW9LG+oYGX7Gb5ZdqDIIAot4ECOF0pUpHduxtV
         1CygB1mmXOeCJWlLO2kg1B6aX+sZWvHtYZeS0Zdwu+qCvoLH2VWxkCVT54nt/5qDxslj
         YR4yBXF3k2C3MT70J8gI5Y/PpPplVBDVKQdcm9awcsrLii2TJK8CJNCMltn6kU17Ql9p
         NFZ1ArxBuNOX48wPBXKLzd5gIZhkFMhWtOWy1CSFv/QCbY5cLFxFXqac6efLXNL6dAKh
         3CmA==
X-Gm-Message-State: AOAM533AAy+7V2nH9wwJdwO3ltPFhJjaOjiEd0WoV8yBXW0kKf/mlc0i
	IY+RcIJmx5Tbalj5vhIzCUxsOg==
X-Google-Smtp-Source: ABdhPJx9dPJVVdNM886DtNEUH80buywHI4+GfUHabIq4yQROIXqvL4A/qZHxZ8bmKPvmUX7wY92Lvg==
X-Received: by 2002:adf:9144:: with SMTP id j62mr28400211wrj.419.1606744825991;
        Mon, 30 Nov 2020 06:00:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id q12sm26625883wrx.86.2020.11.30.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 06:00:23 -0800 (PST)
Message-ID: <2fb035ec3e4435752754f3b7bd895a52bce18d0a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lz4: Use the new branch naming from upstream
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2020 14:00:22 +0000
In-Reply-To: <20201130135131.5vxtbajvhepxc474@qschulz>
References: <20201130134703.3279682-1-richard.purdie@linuxfoundation.org>
	 <20201130135131.5vxtbajvhepxc474@qschulz>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-30 at 14:51 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On Mon, Nov 30, 2020 at 01:47:03PM +0000, Richard Purdie wrote:
> > Upstream renamed master -> dev, update SRC_URI to match.
> > 
> 
> Wondering if "release" branch does not make more sense?

Good question. Dev had the revision we're using in so I didn't look
further. In practise I'm not sure it matters too much...

Cheers,

Richard

