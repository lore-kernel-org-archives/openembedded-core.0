Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6B2C433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 08:50:09 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.70172.1656924600958409657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 01:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J07yfZ75;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id v14so12419902wra.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jul 2022 01:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=SWP/KL2Qef+5XBcLESaPdu1E6Pao1NRAinUlKGJhiZQ=;
        b=J07yfZ75pR+Z9E7hppkXBSCfDmxPIi3kUL3dGHPSHvZcP6pCGLQ1jVG2vL3GycHJ8z
         EpIDo8ZuD2H+oap5EakyOn7h9LruoAggOiDED4QH+0lVOEXffXn9S0B3oYxA6/9xwZ1r
         240YE2gZXr3lzHo0SQ4vznnIXI1TRc3zaza9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=SWP/KL2Qef+5XBcLESaPdu1E6Pao1NRAinUlKGJhiZQ=;
        b=N4dOiGEtE/KOqKHXL3mxQ9OKREeWuAY+c1VgDv5cQ2vUm0n9P04NqIl/8ykXIaPNga
         MXAobg013uVww2LXNmkH6HteBcEAWSgKnDFA9AtFy3zChQ0ilEFPrtvg4xfe4v/PYG4g
         F0ecicxmNv//8FIgsRfjHDjHPyVYPI9cvxA7py5UmkU4bU1vcLJ5X0JZ9iCnm9m5EX40
         2BeiCxO6KouwGudfQmmFwaz9lP94cz1JGzRd4H0s8ALFXVBudMakMV8GhGcAMqd9m35T
         7XcWKaSX3qjRJ/MqDlNJEPsPxStyE6fg5m3+q6mOAHOw1Gl+MxgzvnFqS6JUo0CLoizi
         hOHw==
X-Gm-Message-State: AJIora+58fFijjJxK2RRwQRfIgMyTyyEJR/MNa16AqHPtQaqJC2728aP
	YFfwfj5p8iyp9M2xzqMOt+VrSw==
X-Google-Smtp-Source: 
 AGRyM1sIAklwpHxZOzvyFpHrI4VVDsWqop9N3TebMOf8g/hsQPkjwZ8LZwf2FTvqFMhjgKJ9O4xOZQ==
X-Received: by 2002:adf:e702:0:b0:21d:6900:ea1c with SMTP id
 c2-20020adfe702000000b0021d6900ea1cmr4961442wrm.620.1656924599144;
        Mon, 04 Jul 2022 01:49:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2?
 ([2001:8b0:aba:5f3c:fa18:c075:6c8f:aaa2])
        by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c4ece00b0039c99f61e5bsm16602335wmq.5.2022.07.04.01.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 01:49:58 -0700 (PDT)
Message-ID: 
 <9e541f91d002db8ef50b187ea8a6ad470e6dc49a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone] Binutils, Glibc: Updated with latest
 commits
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Jul 2022 09:49:58 +0100
In-Reply-To: <26024.1656921064972068793@lists.openembedded.org>
References: <20220704071832.3400931-1-sundeep.kokkonda@gmail.com>
	 <26024.1656921064972068793@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Jul 2022 08:50:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167599

On Mon, 2022-07-04 at 00:51 -0700, Sundeep KOKKONDA wrote:
> The regression test for Binutils and Glibc is performed.
> =C2=A0
> 1) Binutils test shows no regression after update.
> =C2=A0
> 2) Glibc test result:
> Test summary before glibc update on Kirkstone:
> =C2=A0 =C2=A0 204 FAIL
> =C2=A0 =C2=A04320 PASS
> =C2=A0 =C2=A0 =C2=A043 UNSUPPORTED
> =C2=A0 =C2=A0 =C2=A012 XFAIL
> =C2=A0 =C2=A0 =C2=A0 6 XPASS
> =C2=A0
> Test summary after glibc update on Kirkstone:
> =C2=A0 =C2=A0 204 FAIL
> =C2=A0 =C2=A04339 PASS
> =C2=A0 =C2=A0 =C2=A041 UNSUPPORTED
> =C2=A0 =C2=A0 =C2=A012 XFAIL
> =C2=A0 =C2=A0 =C2=A0 6 XPASS
> =C2=A0
> Test results analysis:
> Total 4585 test cases before Glibc update & Total 4602 test cases
> after Glibc update.
> 17 new test cases added (out of those 16 PASS & 1 FAIL)
> 12 new FAIL test cases after glibc update
> 14 new PASS test cases after glibc update

Do we know why some of the failing test cass now pass and why some of
the passing test cases now fail? Is this some issue with the way we're
testing things? I'm wondering if this is "normal" noise between test
runs and if there is some underlying instability or glibc changes do
cause changes in pass/fails of tests like this in general?

Cheers,

Richard





