Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 621BE77E71
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 23:16:12 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id b23so2098021qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 16:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YB/MmOZCEn/srjPuAoMoL9vY98h2hTeTLoytGOKDbQU=;
	b=Wa7ec33SpHdArewkuV6pE2YpcqZ4pKZw2xIhJHu86uKDdGhBQctt3CRgMy2Ya25aq0
	FVQ+cL0VyyU2oGV4ytHWpJVvQEiPGoyRp+ayoEvoRWIqqS0z0MGPihVWMiEbGh7EBt4k
	/79XSxn/BEcYf1jlKuwfSRfUjfmfnSaf5j53wxp+LVLD4nXDD5S7EuU2HAc1UXSvPqM4
	RZNA+wfquBMBJCzpF9PBHuEAZL5IbL/h+b1z1hkLMmShyKcLwXYYBsHDpkPqwnPRvO3j
	mxANP+Ty/uyyXUofUl88/rkl7rGNenZvK1IdafJh0y2cMk4j3EybeYD4uypoMLbyXplD
	pjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YB/MmOZCEn/srjPuAoMoL9vY98h2hTeTLoytGOKDbQU=;
	b=gMnGdpN5LrYD9U+NYNg1Zn5UQL1KQDs4CWIgCXo0TRwcUD6opkjuoVwq0c412KIWGV
	7raZnqO+IHF1tTUWEqtWt9nzQ5mAFbhZ6z7VK5iu1Ial/t0A/5SiykaKXF1rYwA0GIas
	ZxALpvYvZt85vil+FRl0Rxc8CNezB3k9Q0AhAIn5FUWc7Hod1SCKVKahroduPGSlKsPc
	uyFT9wOihGlDiD+xhtwWaDcnfoW8YHBW+CZ1b0XGjpbK14DUZKkFQGGYjp0LTmZ/W78y
	mFbnNZXLuwdZheeRpaNVNZJZiklnVj50GxiXC+EJkLY471B7vpfTquMAMYwEoEHKTj6k
	B8Og==
X-Gm-Message-State: AHPjjUiCIdUrMcbn058smTw94+TR/7R8wvdvIxgp0MJYm6e1+YbIJTTj
	HSrvCvF0BwW/WdxObUuDTl+9Wr2bRQYrWoTgyvrtRw==
X-Google-Smtp-Source: AOwi7QBxgUy5vJJdRMgXfljWMhQwGq36fBREAysCeALgeyM66n54ZxKDq/pcZfJLV/1hieZyxfdqxdz8omLBEUl8NV4=
X-Received: by 10.233.244.5 with SMTP id y5mr22039190qkl.162.1505776574214;
	Mon, 18 Sep 2017 16:16:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Mon, 18 Sep 2017 16:16:13 -0700 (PDT)
In-Reply-To: <20170918133410.31388-1-alexander.kanavin@linux.intel.com>
References: <20170918133410.31388-1-alexander.kanavin@linux.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 18 Sep 2017 19:16:13 -0400
Message-ID: <CAHUNapTtXFnCurGoVtWKL=7v7Spxj4Hg2JqGh530ktRGgVgOyg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] pseudo: use epoll API on Linux
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
X-List-Received-Date: Mon, 18 Sep 2017 23:16:13 -0000
Content-Type: text/plain; charset="UTF-8"

It doesn't make sense to carry these large patches against pseudo in
OE itself. Isn't pseudo one of the tools under The Yocto Project
umbrella? Adding patches to a recipe is what happens when upstream
isn't under our control, isn't responsive, or isn't cooperating.

Can someone volunteer to be the active maintainer of it and get commit
access? I'll volunteer, if nobody else does. But if I become the
maintainer, I'll need some time to get up-to-speed, or some potential
support from the current maintainer.

