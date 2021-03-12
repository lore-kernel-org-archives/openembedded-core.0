Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.903.1615568126940400625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CQbhwiTc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e9so2148378wrw.10
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 08:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7irvLmc56SJBXGyYLOo3P1NKetRk9v4e6bYtjroDt7k=;
        b=CQbhwiTcalHRanbQzFTqy4Q87whnPKtetYci3mmEnCFU8FD4nrmbzG2xIGEiapEOqV
         ki5vqvHXmSoaTcQx2OdmwGKpS+vvhOOZ8E8kEcVj/8HIk4hKBUqMmE5UyLybAD2RJArq
         1u00Ni0qZe6n5Sth4ZmTsctaS5ks5/CLL7wOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7irvLmc56SJBXGyYLOo3P1NKetRk9v4e6bYtjroDt7k=;
        b=CX2zP9X89VUhp4cgey80v844SnF3Xg5DPG/iHxPxVzLgGNNIRtpPz5B5hMuXPw1b90
         REKUaOCB4Hkv8eHCgV2ipjh+j3jJTdNYXe0s/YiLcwXBtLg6P86zMKbzLZ7xLJAW55D/
         JqLdJ90GmSW6ap+eBitIYRa7r/b26Ev200AfZVu++Mw2+8I3nzsr9fRfFvkC9l2eiOXu
         qA9YlslEHlLI2ZJ2pMY1fa5JcOhf4MO6oHn94jrdBwknnkef36PFpVkRVyWZsh9LmS8q
         r/cC44x2Dl/5CXm7v95zexn5jzgisWH5oeN8V7Blaw9sJo6aL+70VBG6tV0aqq+EwFAw
         XTag==
X-Gm-Message-State: AOAM532OA8yp+N4cXfZpbhFyf2lJPstX4/buhusTQCpIObBqLSkQRKIY
	ne33u5qoXSOvaSIqx7IAHM/DNQ==
X-Google-Smtp-Source: ABdhPJz/gfYW4WWp5BJF2W4keYVvEyxoIuHjOdft5n1oHBSYsqjjQjnJzOQEJmtkoKP+X7QJtuo5BQ==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr15464294wra.288.1615568125493;
        Fri, 12 Mar 2021 08:55:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7cc6:73c3:839f:86be? ([2001:8b0:aba:5f3c:7cc6:73c3:839f:86be])
        by smtp.gmail.com with ESMTPSA id p16sm10201212wrt.54.2021.03.12.08.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:55:25 -0800 (PST)
Message-ID: <09f4663de2447ed8a6cf3ca16e1cef921987f368.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-firmware: Package RSI RS911x WiFi firmware
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Date: Fri, 12 Mar 2021 16:55:22 +0000
In-Reply-To: <20210312153049.96411-1-marex@denx.de>
References: <20210312153049.96411-1-marex@denx.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-03-12 at 16:30 +0100, Marek Vasut wrote:
> The RSI 911x WiFi firmware is already part of the linux-firmware
> repository, package it to make it easily available.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Steve Sakoman <steve@sakoman.com>
> ---
>  .../linux-firmware/linux-firmware_20201218.bb         | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Doesn't seem to apply against master?

Cheers,

Richard

