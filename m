Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.1500.1613001083383911156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Feb 2021 15:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fo1/wegM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id n10so1589341wmq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Feb 2021 15:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UwlzLGJQQfFYPQ9i+ZNxl70W9zWtpiuBbd2htiaMIPc=;
        b=fo1/wegM3rCHUchFB4MT8Q/QJHb4M/e9QgeuO/t94NZJ/VH9DPRD6cuqn8nHynfScP
         pCpITbaScrnYqE1tajwz/zckNy9FDvdJL1kTtxW6X0CI654qmibcTZWYrqsDTse9KQld
         +jlJpFujqPsGvZ9JHTENd7r7jZZzoPudjcKnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UwlzLGJQQfFYPQ9i+ZNxl70W9zWtpiuBbd2htiaMIPc=;
        b=tzhF4L2FUI1VuaVqu5QLF+TC7IbUCWb6sOs1RjkmH8Wcm6nFlHgP9eunhCcqF7Lq3i
         Lm0r2Js+PCrmxvzQVU5K2nzJUVMLWvOdqcNVdvflFBTa3NuWDFkKVol+PwLbmB5EvSnZ
         x0jZHBf/SHoMpEEA8r0GNwDUx4nwclVjCqc3uJMfWDmaxDhON1cdz42sxhxGakAucnAP
         p7yEMFUYWNz+nREgXnLMK3yxyZ00Vf7QYnxMyvaR/+Tv9tS4rrDXXd6mKU7aEIEebzX7
         eHzMbpltpAvcS3lwchxaifblxGOaLpFp7FFs1PATiqTU03OP5g7zTTIxhKZcvmOACDdB
         oKhQ==
X-Gm-Message-State: AOAM530Eu/yRfHTMEQPPOWrRn9JrG93LvVtuzDomAVbCvSfDOOjVU4OT
	SQJpOWOD1NBbTbhLGB6RQep/Ew==
X-Google-Smtp-Source: ABdhPJxbrmwXJI5JKXJMoLpfQXNj0ngCWjsJqh6lVQD0OfMg2iqCuFF2wautpoBJczbN6EE22AvWXg==
X-Received: by 2002:a1c:9a12:: with SMTP id c18mr1618587wme.146.1613001081790;
        Wed, 10 Feb 2021 15:51:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1f44:6379:818:1e61? ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id 16sm4958268wmi.43.2021.02.10.15.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 15:51:21 -0800 (PST)
Message-ID: <f9c6c66a3f2478aa060ffe7b8cf4d7838227b4b3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] connman: update to 1.39
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2021 23:51:20 +0000
In-Reply-To: <20210210043207.3141102-1-akuster808@gmail.com>
References: <20210210043207.3141102-1-akuster808@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-02-10 at 04:32 +0000, akuster wrote:
> [Yocto #14231]
> 
> Bug fix only and includes two security fixes:
> 
> CVE-2021-26676
> CVE-2021-26676

Copy and paste error?

Cheers,

Richard

