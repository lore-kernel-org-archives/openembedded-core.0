Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id ED70C6C3B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 20:26:19 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id 188so494273itb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 12:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1QYqb2O2IBh3YdHjFa6qmwSVilg2GkOKIUSaSaQ+Tg0=;
	b=Wn1MRe4Oo7YY8l84oMKB7stTOhx5VEuuqQEW+gg3cytFrGqr5EPlp4iRyqZ/RzHkCI
	zKt2qrdmQRAGcJx9x73nM99VOGfapKsxG3xXpjO3Bx+mFHzKMOgKmCII3MS+UfFIkn+K
	QwB6dyqtkPywR6kWd35dNs2Mwnxldiz6xrtfl0OFJ1smv89cfdE615r+8EfFSuDMXKw6
	3+Px2gvhOSFEY7/JzVjjITUoaOWqiVWW2SIV1M96NjUM77k9Bn/w8XM2xJyf/ciQDIN1
	HSrP0Hez4JaucMfKXHNFQ5tt/nighckxyo6ABdUR2c2t4uAqu39x2n+gmDO0mFqkJGer
	JzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1QYqb2O2IBh3YdHjFa6qmwSVilg2GkOKIUSaSaQ+Tg0=;
	b=Jbq9MLH0NldM45bp7cBjQJXsXaohkUMvEVz13r2/nNJL+FmKX6KW3BU3GBRsrsyQOJ
	gxo7hAxrXLVu+NsWHE7deSltZyn1k4s6IVLmIt4xcMX2C3rxxx2ffZJk6zXPX27dn8ff
	/kFvVppwdO9MFYMLkMoHDnki3fZHQA3CdTTrNicvAFJMI4U1U2mNJEzuBFNw95c3ahX6
	KY/xGwUH3V6dUxUwObzCQ9SZEUl8+y15Bq1oFMDzFKco+971bxHtLrvTimSFs8hagD2P
	vA/phvCPJaKQtMEz82SWzQg6qJyMiJJJJrsFk/Y0+OlACmLZLapL2OyrsJTuWW4MhunI
	M4SQ==
X-Gm-Message-State: APjAAAUmy+X3lYksAuvGhsLqLvS0Epg0MDpUdfdr+19r/a07hYtnK1D5
	YXu+U7tBkc58MRNj8p1DNahYZ6I1EKg7qDBJ7uknRphDhVY=
X-Google-Smtp-Source: APXvYqwWg9LAot5oHJy+ouXZR202ce5C74nyAqQXBrr6VlJcOiTvXBk8HzKmRSCS2crKOI/RMVM3rmDXdMH4YBt8NM8=
X-Received: by 2002:a24:13c4:: with SMTP id 187mr452892itz.130.1551126380880; 
	Mon, 25 Feb 2019 12:26:20 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
	<CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Feb 2019 20:26:09 +0000
Message-ID: <CAJTo0Lah677v4+3Q+acN8WEOF-r9bopn0OVw+icfCX5Jy7pxvQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Feb 2019 20:26:20 -0000
Content-Type: text/plain; charset="UTF-8"

I'm also not convinced this was right and have submitted
https://lists.freedesktop.org/archives/mesa-dev/2019-February/215791.html.
When that is reviewed we'll know whether this change is fine, or we
should pick a the patch.

Ross

On Mon, 25 Feb 2019 at 19:04, Burton, Ross <ross.burton@intel.com> wrote:
>
> So far:
>
> <dcbaker>rburton: according to this commit it's intentional:
> cc15460e182148292be877bec5a8a61cec57377d
> <dcbaker>although I'm not sure that patch was correct now, it looks
> like autotools has generated a 1.1.0 since 2014
>
> On Mon, 25 Feb 2019 at 18:54, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > packages/corei7-64-poky-linux/mesa/libgles1-mesa: FILELIST: removed
> > "/usr/lib/libGLESv1_CM.so.1.1.0", added
> > "/usr/lib/libGLESv1_CM.so.1.0.0"
> >
> > Is that intentional?  Looks like a version mistake in the meson.build.
> >
> > Ross

