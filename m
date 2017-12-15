Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id C476178829
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 08:51:03 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id r143so9604258lfe.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 00:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aX1DK37ArJnqRMDS6xQTMCVhK+GczE0ddPtoYv9ET0Y=;
	b=nSrzxWz2Ei7/6wtwBzrAm12Xsv2MBS4CjQxA0qyjB/mhtwjTJtrOv9UAKGov9htarv
	BpmyJybJXhvMn2fKRXWl6Kd5Y2aYDPO+qUl2kLuZfCujw4gnzG08xXUYEjcZPZ/9EOP4
	e6vU0kZX9HQLzqCHwaMYWY4yoGHl1jAuLFb+fusoAcNZzD4dAMx9+wWvBrhAhK6uKH5f
	7osiyRhlU9SYsfU2c6mZt0isuZL6twP7gc5T4kthg3Zy5VoUMNIFWc6Jwi/wuEOz3O2e
	9XLK8tpOCvmNmVKPdfXsnsRsaSrvtCeJsS14t2E53C0Pe2hU4llzXSg4IaCZeM2gdZ4G
	1uwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aX1DK37ArJnqRMDS6xQTMCVhK+GczE0ddPtoYv9ET0Y=;
	b=UD+NH+PvNwLz9stUthVNQX5uVAGwbjrzoR1bVW33/mVeNM3LIPxIbRsiMfIL/pSJwA
	xITvC29LAIcvqmpPgfMB2EZXcrO1jKjXui9j1G9ssg4gxgQGkPTU96Uw3Hm2iUqEV0ft
	aF52EBBKskqNfNWaJtmkzawXysENpjltnDuL7ag1ue5e6pkuWxfGa9RTYpLoz7l1chnX
	rF0MuKoPOViJKMNr8hgzfgNVK+pygxi/9MhDSoePxnN63gjSoutf9Fd9jj6WFwsuXPaW
	qNDpmbS+AIbBnd8wemPCNcy/8ikhcEWi7NAJqjyAIEYJ7PGXsqPkBC+k491ShjLMuiYW
	6LWw==
X-Gm-Message-State: AKGB3mIFhkN8gm6TNMLHIQUjzn9SVelG5pQVuE7fNHu8uUiCG77TJmcI
	p+0sjR6529Sn16cTpEI9yVchhW+pzAA=
X-Google-Smtp-Source: ACJfBotYqaPnZ7mN1B9Bj66ayhhjaGVU6h2mJM4zdldEGTsFJOTxGXYusTtYhp/JIV+zt7dfOpNpcA==
X-Received: by 10.25.16.96 with SMTP id f93mr4583301lfi.133.1513327863779;
	Fri, 15 Dec 2017 00:51:03 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	r66sm1249354lfe.48.2017.12.15.00.51.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Dec 2017 00:51:03 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org,
	Denys Dmytriyenko <denis@denix.org>
Date: Fri, 15 Dec 2017 09:50:51 +0100
Message-Id: <1513327852-23896-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAP9ODKqOpuhz-EOTY8bMj-x7s4gr7wY=FY_WhjwXpCgB0c7dnQ@mail.gmail.com>
References: <CAP9ODKqOpuhz-EOTY8bMj-x7s4gr7wY=FY_WhjwXpCgB0c7dnQ@mail.gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [PATCH v3] u-boot-fw-utils: Fix broken makefile in v2017.11.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Dec 2017 08:51:04 -0000


>> Isn't it "Upstream-Status: Backport [URL]"?
>> 
>> Also, what were the changes in v2 and v3 of this patch?
> 
> Yes, it should be backport and the header is to be included in the
> patch file, not on the commit log

Sorry, I thought it was Accepted because there is not (yet) any official
upstream version with the patch. And my v2 and v3 patches were the
attempts at fixing my initially botched Upstream-Status reference. I
guess that wasn't clear from the context.

Patch v4 in next message. I switched to Backport and removed it from the
commit message.

-- 
Kristian

