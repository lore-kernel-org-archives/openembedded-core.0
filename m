Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.10715.1631287335432467414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 08:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BG1sLQwh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t18so3205509wrb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 08:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=L9T3xZKkeZGnqiIdy4z2BsAM5N55kZBEZcALu5ebCH8=;
        b=BG1sLQwhrmN7UHKyrYxUwm45kvhDcKXe3eauccvnwPhL25PfBWYht7+b4JshwCy/8j
         YYBuEbhY79K+DR7D0eq7gDi5iGpCGRmjojOJD2UC2cIPh/dgXUgok0VVc/99CuOu+hSu
         PqfKSNR9r7WdK+so+bG+m4ypr62bdRfgBMtxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=L9T3xZKkeZGnqiIdy4z2BsAM5N55kZBEZcALu5ebCH8=;
        b=eWoTpNXDIr1MUYX37LumOUZszlcF8JIxa/fNEx3faiERWsx+HTuI0s/okH/cWeEUyW
         BsG2qitf4ZJ5xClsRJZMvtmz6XA62hZYb23ZRj9bHv6LGfKmaTmYaZRgBEUjapc9xux2
         tZ4hzSWKI6ZozOAtz16/TP2TW+CHsJo+4pIfsdYiG4NN8FizV4u7AlR/TqnHaH0wA25A
         wR6ggLyveRxaF9CpeoNbYjse9G61O38A4qm6b2wh8RxVY3f5JhcYnom71JixQ42pjmdE
         WkJbEtpZ3sCizw1/Tx8WwkehapXnfTwJOdpcHR5LzPKZM8l7X6uNfEISR/uwmv+RKLlO
         d2SQ==
X-Gm-Message-State: AOAM532KXHrrwx2XwXvfc+iXuTsx7OSie2Wt9sRI0CjgV7nDQQSUzqEY
	THU3YK1kqzODBFw4+hzq2kejQA==
X-Google-Smtp-Source: ABdhPJy9SnWRkWD5d+ij9I9MAk2UY6tGP5cuZb6nTqLONs4z2yK0vsqZ9GjBWOjPqZQ4EuEusUdExw==
X-Received: by 2002:a5d:64e3:: with SMTP id g3mr10665622wri.396.1631287333763;
        Fri, 10 Sep 2021 08:22:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45? ([2001:8b0:aba:5f3c:69c:dc1e:bcce:ea45])
        by smtp.gmail.com with ESMTPSA id o12sm1501416wms.15.2021.09.10.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 08:22:13 -0700 (PDT)
Message-ID: <de62f7897534b9f2098bb199de2ad4f0f878e0fc.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 0/6] Pull request (cover letter only)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Sep 2021 16:22:12 +0100
In-Reply-To: <cover.1631242610.git.steve@sakoman.com>
References: <cover.1631242610.git.steve@sakoman.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-09 at 16:58 -1000, Steve Sakoman wrote:
> The following changes since commit b46b059a306b2823624e64adecded9f76430471a:
> 
>   layer.conf: fix syntax error in PATH setting (2021-09-03 04:05:12 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> 
> Changqing Li (1):
>   gdk-pixbuf: fix CVE-2021-20240
> 
> Martin Jansa (1):
>   default-distrovars.inc: Set BBINCLUDELOGS to empty to disable printing
>     failed task output multiple times

I've merged this apart from the above patch since this was just reverted in
master with better fixes in bitbake.

Cheers,

Richard

