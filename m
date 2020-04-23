Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.6018.1587648195188211028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 06:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TSVtgaHK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id d15so5221356wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GxGgxJBIpyQO+yWcjNwLBIEJlgDTeNApw7EDmLYMamQ=;
        b=TSVtgaHKeqG3F8/RlGedVwG1QE8RasNIkl2tDloSWYpCqYzLUae2NH2CIoD72Ah6tR
         GS3Th11JbRtTGs6QBb5fiPG+bAfpX6QIUhR3vhL2TiQC4Bf0mxfjPvfCMUii1rZA126Z
         Hgyq0dGFHHbBC8Fp9o/mwDtS3kKcUzuH4CWaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GxGgxJBIpyQO+yWcjNwLBIEJlgDTeNApw7EDmLYMamQ=;
        b=mitvVo2bEPFJ9ou7a8aKwXQzCaII6WO4TgIGqes315PwAkuHNaz+GNKGPzb1sw43DG
         GELX8OTXleil15jnMIndsXwouSTTUn+8diZAawNiuZe1w3hNHU+SzhfWtbXmkdStr0DL
         gdsBdieHg0EEoPDnlcb75YVxVqbXU+0CODhuyoqeYizC0YsmXex3U1DVyIY/XQXoL/YV
         eCM5ZDZteL79jlFSQVqDxLMWcE81AXCAUdegv5YQRKX5xBEao+N2fkBcxWy7fV3wVTGj
         0XV6WsoCxGe63Dlv6l+JkaicSZrE85ZIWjZlev89SAt2ckC3bOjZibJmHAQUd5YFyQWo
         bybg==
X-Gm-Message-State: AGi0PuYFIyBQxEV837kMffxRHQA9UVLUSEH7MS1gogKg67YJpz0b1aVV
	x0ZwmZW+f5+w689QbvxYng/WrA==
X-Google-Smtp-Source: APiQypKYyDFC6W2lwAfFrxdXiorxDxZUPj+WQbe/+A279jWqYxC7zXWV2FtFvyaDvGPgwDhcglYfcA==
X-Received: by 2002:adf:f8c7:: with SMTP id f7mr4818126wrq.125.1587648193708;
        Thu, 23 Apr 2020 06:23:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g25sm3607704wmh.24.2020.04.23.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 06:23:13 -0700 (PDT)
Message-ID: <9db9f846d38b2818be760caf590cb036531c4799.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, Paul
 Barker <pbarker@konsulko.com>
Date: Thu, 23 Apr 2020 14:23:11 +0100
In-Reply-To: <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
References: <20200419063539.1467641-1-ricardo@ribalda.com>
	 <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
	 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
	 <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org>
	 <16086D1E57B63D5A.14079@lists.openembedded.org>
	 <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-23 at 15:17 +0200, Ricardo Ribalda Delgado wrote:
> On my setup, using debian crops the error is even different :(
> 
> If you want I can keep trying, otherwise I will leave it to the
> experts ;)

Buried in there I think you have a setup problem:

Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

I'm trying to narrow down the failing patch but its looking like it may
take me a while as its not immediately obvious :(

Cheers,

Richard

