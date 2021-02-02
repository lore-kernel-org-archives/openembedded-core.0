Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.49719.1612258386527778747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 01:33:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BR7uifS9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id 7so19678345wrz.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 01:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Rp3zBMJjNI9nvxAytFrNCT/f2+lzNqltOScxtYmUbq4=;
        b=BR7uifS9bGTczpxde5mfbE8cSWH9kAQLs/b2bbNoo3tBVjsCWK0tozZG0R2rDr4ruq
         2eFKt60GNFSDOMKrRtulAO5sFc1WQ0YMU1Xab2QGXtYFanjqhb3UuuraQkyXC9yBLqVs
         XS8leSxpcKZrpcjcWIhV+cJ7iOR4k7Y6HjprI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Rp3zBMJjNI9nvxAytFrNCT/f2+lzNqltOScxtYmUbq4=;
        b=IVTcG9qcxRH0DlRKJbmWbZ+/Ue/zlzzJ217l9ByQCmfV7xzrt5nn8e8YX4T5sEteKl
         JGC7jcY3e49tcJqL9uhLHtR/PTf6JHfJv+wg14SHCvYRvdrU6NOUGGO80uir3TkHJ9pu
         /fXiazzsPIl29rh7hnT6t7tQF4Jb4p7hycRs/+MtqXD10jcpYEA3b3djBURZ+rMkh2tt
         B0nlE78reJTVu4jy06QAAGvSLCu3gkEYxW6eSKiFSSwO5Q1ydEgJDD0zptRQekT3uz7w
         J9nNCHSJL4Tll9CM9b7tFn/2bmg73oQjSc2Oa/DFVvndhoEh6TDl++4ky4xTU63Z+0M+
         9QsQ==
X-Gm-Message-State: AOAM5315UhihjOMr6F3a+Bn4UcFSo0Na1vGYvF1PL5GD3X1Mi38lgL+o
	1lUP0/6g9mIQ1feeXsuZFdHLJw==
X-Google-Smtp-Source: ABdhPJzPTqRJ5weztck8DgeoVGZg4GV7od5zxyytxRjFYdQwHk11JmZY0xQ1Q3tnHlPQvmb64eSKaQ==
X-Received: by 2002:a05:6000:188b:: with SMTP id a11mr22299053wri.151.1612258384941;
        Tue, 02 Feb 2021 01:33:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1d48:268:5d93:58e4? ([2001:8b0:aba:5f3c:1d48:268:5d93:58e4])
        by smtp.gmail.com with ESMTPSA id p12sm2010327wmq.1.2021.02.02.01.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 01:33:04 -0800 (PST)
Message-ID: <456f2eb44ad30da1e4422d06267c07e7c57595aa.camel@linuxfoundation.org>
Subject: Re: [yocto] [OE-core] Let me tell you how I really feel. Zero filter. If you need meta-python2, you need to become a maintainer. Immediately. Period.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	 <Openembedded-devel@lists.openembedded.org>, Anibal Limon
	 <anibal.limon@linaro.org>
Date: Tue, 02 Feb 2021 09:33:03 +0000
In-Reply-To: <CA+chaQeJnDzgusQvqEWkkNwkoDxR1fMhrb0kM3932D71yWTMRw@mail.gmail.com>
References: 
	<CANx9H-DFtcdnZwDqHEPg4t5ySyJe++KS8hO9QDFX5r31KLz3Ww@mail.gmail.com>
	 <16406E32EA0586FD.712@lists.yoctoproject.org>
	 <CA+chaQeJnDzgusQvqEWkkNwkoDxR1fMhrb0kM3932D71yWTMRw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-02-01 at 15:40 +0100, Martin Jansa wrote:
> can I get the write access to meta-python2 as mentioned above?
> 
> I have 2 fixes to make it parse able with latest oe-core:
> https://lists.openembedded.org/g/openembedded-devel/message/89201
> https://lists.openembedded.org/g/openembedded-devel/message/89200
> 
> to fix issues discussed in:
> https://github.com/openembedded/openembedded-core/commit/fd6a007efa7cb45101a66f294af81d9d33bb3fab#commitcomment-46565284
> https://lists.openembedded.org/g/openembedded-core/message/147477
> https://lists.openembedded.org/g/openembedded-core/message/147514

This sounds like a good idea to me and I have admin right so I've given
you access :)

Cheers,

Richard

