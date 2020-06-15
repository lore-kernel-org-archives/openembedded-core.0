Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.22934.1592240250846515141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 09:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hAlq0lgu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id q25so301564wmj.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 09:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Xra1LLOYOLMBrZoItnd2rQaejgu3kB8WGb7hYL25m+s=;
        b=hAlq0lgu2lDXbV8UKVVLRuW/0+ZpAnuslxNFkLxQI7dohIZO8yniiSOmfdSmPyVqbL
         rNfXU0pxJU7wNtcgQEvrsS+XfZDqVsxc8pAY0USKhvf9P3zA8JVxWf8kQLtbGQJuGq3m
         1ygKtv4C+VMt/cH/0bxoNWsWZK2QbJRhh7HNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Xra1LLOYOLMBrZoItnd2rQaejgu3kB8WGb7hYL25m+s=;
        b=iAb0siTMZu3XgOSnN6VGaYGM6xpjc4El4jbeYpkHuzk1nKspAjBIw7SZTzRiAtDwAA
         msJWpeT+oDLYlq+rfk9y5wYHZFUdSGk2gd0/wL7KdIaO5j+ae07kjD5rysgHSo+2FQlQ
         o8boC4kn59MrMQa4P14lYfet1GlGU4JYQ1UFeRSg8AvnfqtZD9v9g1Imm+9XnwhDo+YN
         oA4Ah+NlwjdmMzavSWcAZe392SViwviT5XQ9QlyKeow5KH4YMO6z2gduwF0gvzQ7HDEE
         vClB/Z4ojfMHXhmNDLBJFzQrO6cbGIithkNcUU4lrZGRUmXfuZhq+lijmv0TP+yci5Sr
         QSZQ==
X-Gm-Message-State: AOAM533u97O9oX86yrQ6QtO+P/quDugyRfScmtedrMwlrWF0M7bDsOlq
	XgKgGnrz865Dlkj8JwkUTjD4cQ==
X-Google-Smtp-Source: ABdhPJwq3AvJr7z5wgIVus7oM8jOOglrFD4/Uic5WkZh/IuPUlaAkFZOhNam9UBS3Eo3SicvvRKnmw==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr286647wmc.142.1592240249230;
        Mon, 15 Jun 2020 09:57:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c5sm178568wmb.24.2020.06.15.09.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 09:57:28 -0700 (PDT)
Message-ID: <f44e978a683576e167cc3140b793910c8aac6b4d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime: Add OERequirePackage decorator
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jun 2020 17:57:27 +0100
In-Reply-To: <CANNYZj_78C2rnc=Q3k=4kuU=bocYd9ipH0-59S3pa36qzsJNrQ@mail.gmail.com>
References: 
	<AM7PR05MB68814488723D88530BBC17E2A89E0@AM7PR05MB6881.eurprd05.prod.outlook.com>
	 <8c4f219514c2d9ca3d29b3f452dfb00df65109aa.camel@linuxfoundation.org>
	 <CANNYZj_78C2rnc=Q3k=4kuU=bocYd9ipH0-59S3pa36qzsJNrQ@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-15 at 18:41 +0200, Alexander Kanavin wrote:
> On Mon, 15 Jun 2020 at 16:02, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > I can see the use case, I'm a bit torn on whether we should fail in
> > these cases, or whether we should enourage people to check the
> > tests
> > they expected to run really did.
> > 
> > With the complexity on the autobuilder we've had to rely on the
> > latter,
> > comparing that all tests that ran previously, still run.
> 
> Do we have some kind of tooling to check that tests that are expected
> to run, did run, and were not skipped? 
> This patch came from our internal situation where due to debian
> renaming, @OEHasPackage started skipping tests
> that it should not have. It wasn't immediately noticed - test logs
> are hidden inside the build logs, and the build logs are not
> usually looked at if the overall build does not fail.
> 
> People were very baffled by that, and it took 'yocto experts' (Konrad
> :) to sort the issue.

We have "resulttool regression" which is meant to cover this. We're
struggling a little to get the automated comparisons right (its hard to
know what to compare against exactly) but if you have a known correct
set of tests it should work.

Cheers,

Richard

