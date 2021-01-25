Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.1624.1611605587328372620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 12:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SzlzGtYk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f54.google.com with SMTP id ox12so19918755ejb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 12:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=acXX4Bzo0DlMD5N6VCIoAIyggF2yWyZCe9izr7oTKyk=;
        b=SzlzGtYkWOUgs9ZuVuygnTVnLSY4WmnlMubDXBZZ9lVQ2wvWXPo3f5s3CFwF+l+lQp
         w9rMj5EJyCH1nVMywGTZh2kyX0+uTUd2UW2jioUR5e8gt5+zCvtnsd+/TpqxtUP1lUbj
         HjpNTx6PSN/V3EsYe/K4uZuyDo8Girlv91j7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=acXX4Bzo0DlMD5N6VCIoAIyggF2yWyZCe9izr7oTKyk=;
        b=Y1GKmIddhnqEQzC+k3gkqnuoSrhVzXP5axJaOUoVGRzNpME17jfzkqOTMwzXXJapbU
         /OSva9Pi3Ol1nRPa/dZyAov17sd5b1MNAuCzvMC5H9MfIDHpM2tV+I8Ot/Nd9WgZlmn8
         togZTXPzkOB+JWk6Z8zlWCwkjrdwQdKxblxQ8+uwGE4JuqZo6K7gg9SQzm1wsYVyVkBi
         hTmVVsfKgrucLlC+uTsiT/LNpWbZTcMQLN3B4sLjPlTUZCsmd5vAy1hRqAea6/sj25cy
         qWo27UD1UIV7jNSPWROHVjy5S8eof5y9+eLL7ZqThQXyzgOKPB3yCcUedTmA6oNJHuXL
         eMdg==
X-Gm-Message-State: AOAM533wlrpNY1QnepX4ydXGuk2DmgG90LBfXI1re9flyrpSkGB2VcTE
	gNsQMUV9OB2A9qjLVRkykDYSfQ==
X-Google-Smtp-Source: ABdhPJxyylLR4qqGIcBimDdUMN6HBS3AvTn4XjUqE5EDNuNBb2zmL62Abt8tqvZV8Dq/8XKIPgl+OQ==
X-Received: by 2002:a17:907:1119:: with SMTP id qu25mr1376971ejb.268.1611605585757;
        Mon, 25 Jan 2021 12:13:05 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cbb3:266e:4b67:be20? ([2001:8b0:aba:5f3c:cbb3:266e:4b67:be20])
        by smtp.gmail.com with ESMTPSA id p26sm11274070edq.94.2021.01.25.12.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 12:13:05 -0800 (PST)
Message-ID: <37e34b2d593317b1910784a988fe14de1d32c232.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] selftest/reproducible: remove spirv-tools-dev from exclusion list
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Mon, 25 Jan 2021 20:13:02 +0000
In-Reply-To: <20210124182647.1613511-3-quaresma.jose@gmail.com>
References: <20210124182647.1613511-1-quaresma.jose@gmail.com>
	 <20210124182647.1613511-3-quaresma.jose@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-01-24 at 18:26 +0000, Jose Quaresma wrote:
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index eee494e5cc..deddf6e50b 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -65,7 +65,6 @@ exclude_packages = [
>  	'quilt-ptest',
>  	'rsync',
>  	'ruby',
> -	'spirv-tools-dev',
>  	'swig',
>  	'syslinux-misc',
>  	'systemd-bootchart',

Thanks for looking at this, unfortunately in testing it shows there is
still some kind of issue:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210125-8161_obd/packages/diff-html/

Looks like it shouldn't be too hard to fix though!

Cheers,

Richard



