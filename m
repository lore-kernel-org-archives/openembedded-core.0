Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA2679C59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:11:48 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id p64-v6so13162578itp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l/9o9IAeUugyhT9lptzPCrAb9S8T1hXamtYRfg6Fd7Q=;
	b=JMWX9R4HCzIKjMkAKakS72y75aZdNa4936a0+h6QeUGB1gpXMW8tSuVpc4A/1+xuUf
	FC5wPVEeu0kEPaJ7CBGeZzBwIx1iifNNZ765FUs39ZKM2qe38ahKxbWncYxFX0r1KnFE
	8le0oq0nPbX+XEyolkYYQ3hDSsS1E0Daf4xlmo/Dt2vmma7IblE5XDQckA/TwRw6GhuL
	mB+UocaAiT6VyGl9Nm61aFS00sD+xuYMvB4MRLhiS0jwPxtZXyXvUcsyZsvNChtbqPBF
	UAXB9ssVFKaw46QLtjSCHMTsfCN0cg28GPgh+FLE3FqhSIsgMj5Q14ptWAcGN1cBrr15
	8PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l/9o9IAeUugyhT9lptzPCrAb9S8T1hXamtYRfg6Fd7Q=;
	b=DyOeeo04MOORPFmaTLI3IHVO/VdKUjmGiZs9Qq8lG7iUoOQ/31XpAbMn0qYXJabRA8
	HPmvdgLBezJgXX5trykherMFE5LSKMSWU5Cbzbbd4FvpJIhx29w1wzqbbIGMa0UcSIS3
	VymFFDV0vx0Vw4ZsIMgKKeRsjEMbdBROj7jOLcHz701eWhb0PSyYp4oxiQopbG5WwdRX
	HvMwjcvpkoMIsmqwNTV05iGGLuLntH1fjvWZx49JdfZxVs66w/xJOWzdKJQWigRzd1be
	e56gU2g0tH/tKKy42euOp/c9w0U4Yj7Fdqkxhj7NPIvrGFHtdJNXECtcLocPFW63VrkX
	zstw==
X-Gm-Message-State: AGRZ1gIB5UX1XPw9ScD+aulbcqw6prsSxJ1KOsVADXPmPZ7sNrZOJ+y4
	zM07u9zatmQpa/dLMSNSYlbNWA6/YC6kKHU1Equk2A==
X-Google-Smtp-Source: AJdET5f5X1r+Y59U5H0WKYia3R/g1AIj3vd7n0eVMhs2Hcpc8kLkfcfFRUEPfBCRC+c9oA8/ZFM1R7gxN9lvySC0gLQ=
X-Received: by 2002:a24:9287:: with SMTP id
	l129-v6mr910928itd.26.1540897909656; 
	Tue, 30 Oct 2018 04:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <1540456759-247805-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYq4aJAp8cUFbmGDer3t9cswKoeVZ3FYgWjUxC19LKA2Q@mail.gmail.com>
	<a17b1fae-4e22-35eb-3602-3a3725fd60e4@windriver.com>
In-Reply-To: <a17b1fae-4e22-35eb-3602-3a3725fd60e4@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:11:37 +0000
Message-ID: <CAJTo0LY2a=xMjxNziaHtWnrN46biVQKXC9uMGwn5W-G=_eW1rw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] python: add tk support
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
X-List-Received-Date: Tue, 30 Oct 2018 11:11:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Oct 2018 at 04:53, Randy MacLeod <randy.macleod@windriver.com> wrote:
> I think what started us down this path is a FACE [1] compliance test.
> If there's resistance to moving the package to oe-core, can we
> enable python-tk even if tk stayed in meta-oe, Grace?
> Also, this should be done using using PACKAGECONFIG?
> Finally, what about python3-tk ?

I'd happily add a PACKAGECONFIG but tcl/tk is fairly dead so I do have
instinctive opposition to adding it into oe-core.

Ross

