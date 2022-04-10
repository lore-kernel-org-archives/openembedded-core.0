Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9859C6377C
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.15202.1649576116370072091
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 00:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BvpQ6KoB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id r13so18627185wrr.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UCFrJpLKaSXcPyOV/FJ7Of++BEKSF6PVcvpNoPcAfpQ=;
        b=BvpQ6KoBflCXPiTN7FDh7FZljc8oF2Gzyk1xf/fd8Dm8JnlYOhDWdqeiFYNmi/IEWO
         7N6W01JeM6m/2cqEoTd8GTacwR83qn346WGkL2vsvuiMAZpzB2561locNcAgW9pahQj9
         gsQq38Dx++ZyXJVmQzrTUOtm4nAptSD0pIoV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UCFrJpLKaSXcPyOV/FJ7Of++BEKSF6PVcvpNoPcAfpQ=;
        b=MJLkQSLi3mnpVF7a3RZbxY/oj3VH1nhApN2MyzFhU2/tyhuQ5+5lQ8E0aJPq9BKAL8
         beZcInSWEbAnXS5lFZU1TINln7ynGDj1F1+mSm4bLb6HxBN9xaX1genQ9Burr4k0fWqJ
         Clfb7BMmNgMuXPGoNZzdRw3DYeVzekzLTBfFODrl+pbQ5mEJPS/WvH5p1QZ3IgwZz5Sg
         4l7dt1wRsRdYLqoJePyB+VQevSgWMwAsD1IDlyLL5d6bDQmNlljFgxKssigNoxdE9DfR
         tTAFPwjhhA/EH835EPfC9YmsBw/miHqvH0UDBKe1vQU7fDwa2W4sBmXnNjAhF0wKSNe8
         1BYQ==
X-Gm-Message-State: AOAM533TYRbB828zS8a6ImEsZDzkvQuuDwhaNMWtlzfIbh6/Y5i3Dvbj
	AZs1xtkz1y8lTUdrR8a4EbIQhg==
X-Google-Smtp-Source: 
 ABdhPJwB0kavxbK7lbMN65SkS0dCRpzaDKbmYfIFdw1GJpIBx4nSdYFUvSNDB7Xg1emlXvhITurKsA==
X-Received: by 2002:adf:8063:0:b0:205:e19e:2bc1 with SMTP id
 90-20020adf8063000000b00205e19e2bc1mr20596404wrk.177.1649576114581;
        Sun, 10 Apr 2022 00:35:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1d9b:707d:8b0b:b1df?
 ([2001:8b0:aba:5f3c:1d9b:707d:8b0b:b1df])
        by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c155200b0038e992eaa64sm9090112wmg.33.2022.04.10.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 00:35:13 -0700 (PDT)
Message-ID: 
 <043546157ea8f6945e878decd7c28e2ae6a2c984.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libbsd: upgrade 0.11.5 -> 0.11.6
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Sun, 10 Apr 2022 08:35:01 +0100
In-Reply-To: <1649011540-28857-5-git-send-email-wangmy@fujitsu.com>
References: <1649011540-28857-1-git-send-email-wangmy@fujitsu.com>
	 <1649011540-28857-5-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164195

On Mon, 2022-04-04 at 02:45 +0800, wangmy wrote:
> License-Update:
>     year updated to 2022
>     license file changed

Changed how?

Do we need to update LICENSE?

We need to be more specific than just "license file changed".

Cheers,

Richard


