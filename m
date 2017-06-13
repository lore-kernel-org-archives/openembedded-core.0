Return-Path: <ross.burton@intel.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2C8F67830D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:52:42 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id l75so53977338ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C3Mpah2CmXknHX40oW5Ji5pq5BGttGEBn1Cb3tq2GM4=;
	b=CzffT+rSuSbTp1faUF72W5N93iG1VMBeEYUZZFKgtRvc1FoWFYJtjsG2y64nPWDfAu
	aJhFG8ZIjjGxUXDDh6GyTzjwGs9ucf5ibtB9+DVeD1IL2l6jwPwGdftYEEBBeVgYTBpd
	EPTc1axkrtixnmSjZtRe1tT9ek+CCIQrO+swsbGavHL9rHXoDoWgQ6PQUbFYkV+qT8bo
	vwc7UCGiaG7hrouGYt/uRUWnEkKBUVe4ql2w6H3mYFqcc+2Bl3/wQvtbQr6uVEER+fas
	NRoecExQGpwYAEJ59QwNd14fYicWHBwH74QQ4QoK7Fgvt7+uz+1tFnsmTb20HYxLVkys
	NLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C3Mpah2CmXknHX40oW5Ji5pq5BGttGEBn1Cb3tq2GM4=;
	b=HclmDkyJgpVacmaqFc2zGAQVmz9wYhfYMZ+55e0Q+UujfaT+n0H9pBtOcjjy+HAVW6
	x4bmXfsnyYSqizoSkaewQ+7sjeA+N9Mipjv6rp/AGNNrltkJk1I8d4fz1C62T9T4BfD/
	pmtV/DiCe4V2x9snSoBgxZMNqq0HKc5p4WaOOzAWel635LoEgvcOokOzmN5t9w0er8h0
	isFjBTI88nknap/kQ+UA1cDevGQDupfHq4X2LCoI8G9Lnv/eqmhKRc0xdELWlvy8pARN
	goqbA2e40wEYfcBEDBS1oWqpafOwouCHouDt9Kj4tclyV367fzg+udmxgcF4elXnxbNE
	FQVg==
X-Gm-Message-State: AKS2vOwEb620q9rk4Nl2fYujcWRhNM51vCDg1KuIJoSV9/UMm8vOjuZs
	72VtYwUhWaSi39WXMEGmjl4WUvIJrjKm
X-Received: by 10.55.120.1 with SMTP id t1mr825497qkc.171.1497372764197; Tue,
	13 Jun 2017 09:52:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Tue, 13 Jun 2017 09:52:23 -0700 (PDT)
In-Reply-To: <2e4ffef7-2375-f9d6-4789-919858b88272@xevo.com>
References: <3bd366a6-a31c-e4c8-688c-e24e84f1520c@web.de>
	<2af19119-fac3-8ce3-fb36-c4aaf64163b7@xevo.com>
	<4e18dc00-1800-f2dd-797a-7e0a380467c4@xevo.com>
	<b51b0f8b-e21b-087b-5225-38fb8040479f@siemens.com>
	<8098d7e7-b887-4c4f-6dba-db9065c97571@xevo.com>
	<CAJTo0LbrkS8oG1s05KcMu6mREZwd-+h2aGwo7cLXjJc08XrMeA@mail.gmail.com>
	<f64173c1-2746-06cc-d283-6d42c670cb69@xevo.com>
	<CAJTo0LbpaXG07FouMMN5qa7zVUqkgxAG5OciFXQmhCzoSxrrEQ@mail.gmail.com>
	<55c25692-acb4-01d7-5c6d-c180508b8729@xevo.com>
	<CAJTo0Lagk3XBDGYsCb0UpjmYDNWPQwjqnTsAMDPd9DSP5Xq7Uw@mail.gmail.com>
	<2e4ffef7-2375-f9d6-4789-919858b88272@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Jun 2017 17:52:23 +0100
Message-ID: <CAJTo0LY-DNCoMce9XEqeVTjUyxbUiiPQ-txoY0LY9Rd+KdjCsg@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcf-agent: Fix daemon termination
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
X-List-Received-Date: Tue, 13 Jun 2017 16:52:43 -0000
Content-Type: multipart/alternative; boundary="94eb2c06686ab4e7710551da430d"

--94eb2c06686ab4e7710551da430d
Content-Type: text/plain; charset="UTF-8"

On 13 June 2017 at 17:46, Martin Kelly <mkelly@xevo.com> wrote:

> Ah, I was checking meta-openembedded by mistake. Thanks.
>

The Best Known Method is to have a oe-core clone that you use for pushing
stuff upstream, and then you can just rebase to see what has been merged or
what hasn't yet merged and needs rebasing.

Ross

--94eb2c06686ab4e7710551da430d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 June 2017 at 17:46, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div id=3D":209" class=3D"a3s aXjCH m15=
ca25a0f28b2894">Ah, I was checking meta-openembedded by mistake. Thanks.</d=
iv></blockquote><div><br></div><div>The Best Known Method is to have a oe-c=
ore clone that you use for pushing stuff upstream, and then you can just re=
base to see what has been merged or what hasn&#39;t yet merged and needs re=
basing.</div><div><br></div><div>Ross</div></div></div></div>

--94eb2c06686ab4e7710551da430d--
