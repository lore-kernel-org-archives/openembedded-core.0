Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C909273204
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 20:55:12 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y134so4247748pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 13:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=IRl0FCMj8QK2FHkEbw8243clvhf0iAZLnGc274u27L4=;
	b=jl2EM6Z3vzPYkdYOIjCEA5PRYBvOO8LQaGWJoPD2wQyDDnIuqrnPt69YB9lFs7LNLz
	oaiBUB2Z/PxoEMZtT5aWqTvuhpgDVj/XtvUy37gGfNePJuRpHga9uqFXq6aGNOsvu8K1
	HXJplqNJLaT7Sbqd66/2+Y15ilSb6hmwQ3mo+eD2r3FZKXZuw93vKgwDIWBlXQZ0l/gx
	L8ytfvAJatKyUdB95z4gf8sE9T9R7T5hKiNsydN9oydzyqYYQIH5jV6yiL0ptDkEqxOy
	5rSYsCnBWJxPFAfudjrkrUOOgoyQzh4UYTl/gBFj4UxcrNBjHqJPGrI4pd3yRGBtpGQp
	2E7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=IRl0FCMj8QK2FHkEbw8243clvhf0iAZLnGc274u27L4=;
	b=iX2RRSUFCn/rzgbpPvbojITSTW+YxhUxnN7tzEARzy7Zl7N45ZNfYAbZxtDtnVB93+
	07cW2FLioxETSZetOsGexRNDJ5iwAps85EghKxhMaZv/VFgVNprc7mI6akwTmStCqGmp
	4VuH2VR75npN9q7RBV+FvHrU2h0Nuc0o/s3D1leiJw2AnrdFC5GzKP4gi5rHxFVMaHS8
	GBOepGTb+o3is63RlUKAAX3eN6vx1TqAH1NXOPezPvs6ecSPvtSMPoOXhhHKLIigVFeg
	Sz6w0INKPXA4OT9wH2Eb+32p6Kr97+/U2slXQV4ZXbWtBiT6POb5npx6nkx1a6HonOMB
	FMIA==
X-Gm-Message-State: AEkoouvrYWHHaj8mQP3++GvY4JmCHQibCpryFFJtdf6v+H0YfuerCmeizmAQm7ta5LTPNw==
X-Received: by 10.98.12.200 with SMTP id 69mr57299484pfm.15.1471294512366;
	Mon, 15 Aug 2016 13:55:12 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:94d9:eae7:71b3:4646?
	([2601:202:4001:9ea0:94d9:eae7:71b3:4646])
	by smtp.googlemail.com with ESMTPSA id
	b64sm33522297pfa.82.2016.08.15.13.55.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 13:55:10 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
	<CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
	<ddcae3ee-b5a1-c9b8-b53d-50a4001f3eeb@mender.io>
	<CAJTo0LbauTnzYsW=fVkM5zG4BqsYShDhwr0=d5HNX=XPSi8zFw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57B22C24.2070604@gmail.com>
Date: Mon, 15 Aug 2016 13:55:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbauTnzYsW=fVkM5zG4BqsYShDhwr0=d5HNX=XPSi8zFw@mail.gmail.com>
Subject: Re: [krogoth] systemd network service fails to start on boot
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
X-List-Received-Date: Mon, 15 Aug 2016 20:55:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 08/15/2016 02:24 AM, Burton, Ross wrote:
> On 15 August 2016 at 07:38, Kristian Amlie <kristian.amlie@mender.io> wrote:
> 
>> So, I did what you asked. Is there anything else missing?
>>
> 
> No, just wait for the krogoth maintainer to pick up the patches.

pulling to staging.

thanks armin


> 
> Ross
> 
> 
> 

