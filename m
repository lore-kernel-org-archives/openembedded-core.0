Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 07FD57858E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 04:44:13 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id t5so3917615pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 20:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=e1JOHvWRy1sJ9ASIzixdoJJVHhYORenGajLe4j2bl58=;
	b=G3y4G8BEKqD2yzV+0DD6Dk2ILciThIjTYX+RGKaYYaQFM7VblgmE20QrGp4ShxHj4j
	KWtokvD0/GKEvZQnTCxsWE36mMpY5qlcIEqiPIL6uIxIIEHAB+9MSLIMDfLAImfJDlPm
	CCuwz2ZIpA2KywXg5mYKe0QF7a3FeLS7dReSDcQNtjRdkRQj/bjCankuUKuALKr16WYf
	PkJaWGBx/XW/WmIQ07ak8sTp8U/NPSAShRKicHSVWMjvtkaIQgquEhW+uI4GdxmP/oMd
	k+xSZn3Xa0m4/fQFho7cfsMFId2X1yLXHNGMNqocChSUcB/Dog7n7hBRv1d9ONSiredA
	/zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=e1JOHvWRy1sJ9ASIzixdoJJVHhYORenGajLe4j2bl58=;
	b=cDpt7NTgEkbjoL0DMOQe42jZkF4+NHRA7D78biDDGzED/79tMWR5RmMCOSSkfG3ERc
	WSH64Z3GjakWJ8u9WWEu/TbfbrF1zpqFwGWlaho914NgnxTIfqirpHiXOCejeRdhLPvK
	YEjQjxb/0qPhWRbRBAeoPje2pcCqXgB2LeVgB6kYtF6dYUBBwbIhgm+dyxPDQsD2N6Q4
	UAid8G2Fvhtx0RvTwqv7EY0kVkOLhfn7Y+9g41LiBTtdHIpXjsX6DD1D3uBXcMvvE5Lj
	JNsfgYwGEUPYS9DSi9QEkAhTqO+t66J5GvdhhPlZUH0srmXi+MlgLLw+6KOQnHu6x1HE
	6Q1Q==
X-Gm-Message-State: AKwxyteb8I9firYqLDVGWjcyE16GGJ0zDOaIQ4w5GZL0+yPGrnrrfrq0
	zxRiMxh6eGMVKYqTqiXD+KmYo3YT
X-Google-Smtp-Source: AH8x226w/LU4qbcrgUOkIipgPrJ4EYGH2INrR+XBCCAP3KyCyHNOyoI5L+f3gCJOs4trwu92JgFi5g==
X-Received: by 10.101.71.199 with SMTP id f7mr20413790pgs.91.1517201054716;
	Sun, 28 Jan 2018 20:44:14 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:e45a:97de:ce2:645f])
	by smtp.gmail.com with ESMTPSA id
	z186sm17089325pgb.70.2018.01.28.20.44.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 20:44:14 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1517196242.git.raj.khem@gmail.com>
	<20180129033429.15536.27726@do.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9f7a3161-392c-28d7-7bf2-df7fc6aaeb6a@gmail.com>
Date: Sun, 28 Jan 2018 20:44:03 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180129033429.15536.27726@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFVwZGF0ZSB0byBiaW51dGlscyAyLjMwLCBnbGliYyAyLjI3IGluaXRpYXRlZCBmaXhlcywgbXVzbCB1cGRhdGU=?=
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
X-List-Received-Date: Mon, 29 Jan 2018 04:44:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/28/18 7:34 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: Update to binutils 2.30, glibc 2.27 initiated fixes, musl update
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/10739/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence]
>    Suggested fix    Sign off the added patch file (meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch)
> 
> * Issue             Upstream-Status is Submitted, but it is not mentioned where [test_upstream_status_presence_format]
>    Suggested fix    Include where 0001-build-sys-Check-if-memfd_create-is-already-defined.patch was submitted
>    Current          Upstream-Status: Submitted
>    Standard format  Upstream-Status: Submitted [where]

I have updated the pull branch with above fixed.

