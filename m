Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.61604.1594052814820469930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PURrIjV2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id f139so42807989wmf.5
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pQbSKw11i+A1rvOncVsgXGAW0FbbE7giR3qLRZW0h3A=;
        b=PURrIjV2NbeyTQczex6TyrMEKYRGYLn/LcH6D9L5l93CS0EWr3TuUrYDLjrDKOaZtA
         QklQTFP6kCeVXDDvjHIn+IGwkvNMQfr3izHkb54ZBRP8gcrZRJWgvHMvWvxLzqYlIZ4C
         HGEnRlcPFk13T3ctyQmv0xDYPjwucwEpQYapk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pQbSKw11i+A1rvOncVsgXGAW0FbbE7giR3qLRZW0h3A=;
        b=goi6C0zFy6rPWMfdiTpJVuf84i8Z+wVbKFFU27SVtVUfPMq8REZcsCmx26TNshqZX6
         XMS6pJeVJxl5YFlijiIRMsDdX7F8bjqYlMUK5ZfepoLNocQw41XhYWEK3r9Fd7F8PORR
         YTByYVZ2osA0sND1d70ZJs/PhmOsR6bkMhV9S2PKegq7YjYOryp2zOvXbaBmhNitvbBV
         sfGjvFBZugZTNGmw0frvDbXgTbzU3hx4/KJF8hRWHdZrzi5KfMDAA9Nr/9XMxfRT+TZZ
         qLQ1+55SSNJWNxsWvfNYScdBqTB+AR8zUSUS+rp0+dITV/nYWqyEwz+qmLq/KMk8urvT
         By5w==
X-Gm-Message-State: AOAM532vuqcz2CRoIDd7tdvUV1YUcGF42xmY36/Pmw47i6eGitVxWbkq
	OtIf3TRvQ/sHEzeor+2Zi9LoGg==
X-Google-Smtp-Source: ABdhPJwISBMpvor4Jur9UrmBHuvHi1P4ZZ+V7KyvFPu5lQ9QzhPIdqroNm1Egtm+olt5emljdS4vLA==
X-Received: by 2002:a1c:1d93:: with SMTP id d141mr1719wmd.14.1594052813309;
        Mon, 06 Jul 2020 09:26:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id q3sm6844331wmq.22.2020.07.06.09.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:26:52 -0700 (PDT)
Message-ID: <03d998dfc621b417b2fb8464cd53827f2421dfac.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Jul 2020 17:26:51 +0100
In-Reply-To: <38bf8144-019d-f9c5-f816-1ad80ed79d8d@googlemail.com>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
	 <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
	 <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
	 <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
	 <5ce01ee5048a9f5c0e11889cd6a9ecb150420f2f.camel@linuxfoundation.org>
	 <38bf8144-019d-f9c5-f816-1ad80ed79d8d@googlemail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-06 at 18:16 +0200, Matthias Schoepfer wrote:
> On 5/26/20 1:37 PM, Richard Purdie wrote:
> > I think we need to be really clear about what the license of ${PN}-lic
> > means.
> > 
> > That leads to a really good question, which license is the license text
> > itself under?
> > 
> > I've asked this on our licensing list to see if anyone knows.
> > 
> > Cheers,
> > 
> > Richard
> 
> I do not mean to annoy you by any means, but what is the status here. 
> What would be a good approach? Adrian said, at least GPL License is free 
> to copy and distribute. So another idea would be, to generally whitelist 
> those license packages instead one by one.

I did eventually get a response from the people on the SPDX-legal
mailing list. There wasn't a 100% clear consensus but for Yocto
Project/OE's situation, I think the LICENSE for these packages needs to
be:

XXX-license-text

which for SPDX identifiers would be exported as:

LicenseRef-XXX-license-text

The idea here is to spell out that it is the license text. People can
then process that accordingly in output data from the build system but
its clear its different from the license itself. It avoids us making
any claims as to what this license actually is, for the FSF licences
its relatively clear, for others it may not be.

We could factor all of the *GPL licenses into "FSF-license-text" since
they're all common as far as I know, but that isn't easily automated so
is probably not worth doing.

Does that help move things forward?

Cheers,

Richard


