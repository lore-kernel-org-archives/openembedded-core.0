Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 87FE87C8DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 19:04:54 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id v2so59563ith.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EXoapPOT5JhhESLEQhr1Yq8RddJ9bZpRMCqGGo7Fl2A=;
	b=enengN82VcM4Itbm4iBGt7abKf+iAF7AZUgrUmF8AIE1qpbaFJaIm2v1imWjn/Kgzb
	hXbXQpx4ATg6neayOngQCmoAo9e326RwIRKBzFD/RzYcS8zVZiPkDAonC0awUwR7QqxR
	spOcxwRfjyfocVGnKigP+eDrYQu10+rBk6Z9Dr3XW5XODj/JjwwtiZRC87FQW9K2+6N3
	s5UivYoBcJwnk122bbPtpsu1X+qpzTnXb7NMjTB9RGrPiz4oU5P0nA3nZVxKCaemNzKY
	pWRHbMoHt304qbng4mL3Xeal4IUeS4yCUjOczLjc34BfEp8KU2tEZtJ1KPk1uhVd1yhl
	Pucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EXoapPOT5JhhESLEQhr1Yq8RddJ9bZpRMCqGGo7Fl2A=;
	b=j5roxa1MWzw/VQas1rlUeA5bsbnPw/RTP4uyYYiNDPefJpSp+E5st3UJOC+/QHoITL
	edO+dxI4zZJXdIS8yhSNw8jT/4p8ciMfpIlnY5uv+m0nSDsiN51bEQgImRlPLK6/aRjR
	eSrb5tjJBf6PTQQbqMKl+JR522Yvv1UHBy3W5ugtUEavL9O6AWwtUZ9D73Oy0A5QqGG/
	+QSQuaCcKmBfQfadxr0deCMbFeerZSHv6ewwkK5XIBoLhrWCQaL48t6HgBByZBwqj001
	vbJWqfowlEaf9dWlgThtHCdx8khfwJ7MT3fTW/Fi897Eeo+LtFoxKvXsshMXBUyyBJPR
	osyw==
X-Gm-Message-State: AHQUAuaFt6Hvxvbi3ndJWOamGRVkqeeGEm+6V+R9AjIjZ5drAYUMzly0
	PtJnvTPUos366xqYxASXReCaj08duuFDdQf4poRTYhXqQlM=
X-Google-Smtp-Source: AHgI3Ia+DwpHTeW3nCPnEDzfGHGnfZTq/p0Akj0ZEDIQq75zEGdC61h1TCqHRU/1uFSRM7E6a+Yk6TsTFyrhGP9zwj8=
X-Received: by 2002:a02:cd11:: with SMTP id g17mr10863204jaq.79.1551121495480; 
	Mon, 25 Feb 2019 11:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
In-Reply-To: <CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Feb 2019 19:04:44 +0000
Message-ID: <CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Mon, 25 Feb 2019 19:04:54 -0000
Content-Type: text/plain; charset="UTF-8"

So far:

<dcbaker>rburton: according to this commit it's intentional:
cc15460e182148292be877bec5a8a61cec57377d
<dcbaker>although I'm not sure that patch was correct now, it looks
like autotools has generated a 1.1.0 since 2014

On Mon, 25 Feb 2019 at 18:54, Burton, Ross <ross.burton@intel.com> wrote:
>
> packages/corei7-64-poky-linux/mesa/libgles1-mesa: FILELIST: removed
> "/usr/lib/libGLESv1_CM.so.1.1.0", added
> "/usr/lib/libGLESv1_CM.so.1.0.0"
>
> Is that intentional?  Looks like a version mistake in the meson.build.
>
> Ross

