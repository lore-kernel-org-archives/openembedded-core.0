Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id A4CB86C230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 08:32:49 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k20so514650ios.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 01:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vA57CPFBt76bh+rcd0rA7An6eIJaLFOEISitiqzJ6L0=;
	b=U/n0c8ZOn707YRGc3uFRiSs/5ZBgVkDuL9mJv5Nkg9AIZEiZTyVm9mdi1vwndNwkde
	u5+Yt+V5v5ChxAYkxcjScDXtdT31KNjhounp0QMsHZ2bPTzqdZ0SR48/A+pZ0Ky9xkMe
	BosYVg91eWLkzG9cIcpZ1DYujyu+uBOGsH1f7X5lJXPUCNC57QXW9sumpGKXBmR7yjqf
	guHJgI0UUrb3Yz3K+tHEoRlhqkz+3JPjqxcBnFvQ5womAU3FoFQEtLL6chBK9KVZhIic
	ngJMt18rIUxcCYpptx+JT33mMoK6hT6pakZlmWN9p1/F40K9cUPJQ16U/miPBPwA7+UH
	4NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vA57CPFBt76bh+rcd0rA7An6eIJaLFOEISitiqzJ6L0=;
	b=VJYZ1kc0k2LAG2VT0wnLDMu7IQJvjPh4i66BuTHD1U54NnXWF2OFRV/F2KyV+y7amp
	ST1QWj+p00B7a8+FXuJGVUtPbMyVQfz15V+arT7sk7Ey49NBk5T8wPjVQx8VkB8mN6aE
	IBovHydFgt+3G1t2xYAZteXFQWR9o6ZMxZnll2J51AncAFJ89htcXjhQ+/lPWq50khYK
	EzCSpCNlDW/YpucI3TVtRUfII3VPTkYrsOjQvpD06tTTS8uo7J72Br0/USfPAUzt1fZb
	abfIQE3Shwv9PkQcPiU+6vEd4ZWR95ipMJi9YFME33Y1WvmbBsz7SgdG8mOYIXfxxrzd
	Kyjg==
X-Gm-Message-State: APjAAAU7xoIDuyiGfNt92aeTlnjtOfCqthk8xib4TUcJtN+egvHlmAAy
	ZkH8D/LKGeoV8HS+2oCxcTcA9wCfB7wn2nP7YV8=
X-Google-Smtp-Source: APXvYqz4PbtZusaUVIbbw9onymIUx/d4dx2ZJ37unBfuUW6VIGatAxVg0K6P6fEWlvhNwVAo8DIg7ZmIkO/I8PVWphM=
X-Received: by 2002:a6b:e702:: with SMTP id b2mr33946837ioh.175.1561365170598; 
	Mon, 24 Jun 2019 01:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
	<CAJTo0LZNdM8zb7E4r++zWY44RC2y2PebWsA4CBY7c6CGA-FfQg@mail.gmail.com>
In-Reply-To: <CAJTo0LZNdM8zb7E4r++zWY44RC2y2PebWsA4CBY7c6CGA-FfQg@mail.gmail.com>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Mon, 24 Jun 2019 10:32:39 +0200
Message-ID: <CAEz4NHqwLd1kSnKhANnvgC3JuUTQst0gcGdjZzC+NQDebTj_2g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Mon, 24 Jun 2019 08:32:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

> > This adds python3 urllib3 (python3-urllib3 in Debian) to build environment
> > dependencies. It's the first user of urllib3 in poky, AFAIK. Maybe
> > documentation could be updated too, e.g.
> > https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#brief-build-system-packages
>
> Somehow I didn't notice it, thanks.
>
> Pierre, can you rewrite this to use standard library instead of urllib3?

Yes of course,
I only need urrlib to fetch the NVD json feeds, so I don't need
urllib3, I can use standard library.

Pierre

