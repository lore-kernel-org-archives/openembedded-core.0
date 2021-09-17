Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.9038.1631860176207779433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 23:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gxr3rQ46;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id i3so6445454wmq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 23:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JRR9PA0sNZfh7RxmUDl0y0Lh8Tu4N/jUHGfj8+ShcyE=;
        b=gxr3rQ46oyORkWvg30pYucziVZn+fKAoiofqyNzde88r0F/Xrgjcp3awY3v6XOqto3
         TqG5+4HyB6kvo6xCknJ9ArST+jBncKY3m+d/uUPi02Ba1onuXYfGegZJ8SmnDzI2wXhE
         Ivn0LXOA7rzoGKjI/PH2ExPyHMADnLEf1lS+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JRR9PA0sNZfh7RxmUDl0y0Lh8Tu4N/jUHGfj8+ShcyE=;
        b=gwv1QCrUYVDXbGbZ83Y3LSDHglU76+DDo3rbwLjnkmpMJKlJmJOFNIDE1h73tvPsTw
         5tdjf7XqWjyvK0Ax32zrC0/22kZhahWpzYL3rD9hxOeeqJoMgLPaRwefrbsjPzedMFms
         EGTzCro/flfxs8UXb3yfbCkrXjRFfQGrV5rPAIl4Ep0PGQBX7meiPPWU886OaCj3LqYg
         QsV0jVXbcZ/oFLiLKEop4z2A+aDsEKQ23S3Omjc4BDux70P8mup7DQkgJM+YIAxXVncU
         qFNYwuEojVmn8tc1huccFp9TPORPk8lWOyzhbhhh8S7dlAnBf1jjrZkv719diHRVtOng
         9ipw==
X-Gm-Message-State: AOAM533ijYlLVcSgbbtthtOi0F+UAzoUumAClhVgoOB5MtXj0UCw878m
	wzxneQBVSlbj9AvmwyhQyhudpw==
X-Google-Smtp-Source: ABdhPJwp0f2ZkcHCggvt2w4WfiJ/wDUXeq/GgNQSH6XOP9YFCIZRsZHgasTketEQRzP86xGWGGS+QQ==
X-Received: by 2002:a05:600c:3586:: with SMTP id p6mr1047565wmq.59.1631860174529;
        Thu, 16 Sep 2021 23:29:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8eaa:e937:fa97:b2fc? ([2001:8b0:aba:5f3c:8eaa:e937:fa97:b2fc])
        by smtp.gmail.com with ESMTPSA id y8sm5557320wrh.44.2021.09.16.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 23:29:33 -0700 (PDT)
Message-ID: <8b09974706df7e612ac152e53b12386697da6ef4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] README: update mailing list address
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Armin Kuster
	 <akuster808@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Sep 2021 07:29:31 +0100
In-Reply-To: <CADkTA4MQNPKpS=hc2U2=PqWDQX4+ZkRXr-G8anuqXdF7HJ+i4Q@mail.gmail.com>
References: <20210916224010.21213-1-jdmason@kudzu.us>
	 <20210916224010.21213-2-jdmason@kudzu.us>
	 <24d4a049-fe3a-f8c0-54e9-e02b8d03289c@gmail.com>
	 <CADkTA4MQNPKpS=hc2U2=PqWDQX4+ZkRXr-G8anuqXdF7HJ+i4Q@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-09-16 at 23:29 -0400, Bruce Ashfield wrote:
> On Thu, Sep 16, 2021 at 8:08 PM Armin Kuster <akuster808@gmail.com> wrote:
> > 
> > If you are updating this, please check with Bruce on which  mail address
> > he prefers.
> > 
> > It may bounce from windriver.
> 
> It definitely will!
> 
> I noticed that when scanning the patch as well. I could have sworn I
> grep'd and fixed all of those old addresses.
> 
> Jon: if you want, you could put in my gmail address, or I'll follow up
> and do that.

Well spotted, I'm also blind to these things. I've sorted Bruce's address.

Cheers,

Richard

