Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id DCB9A7DD6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 12:54:23 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id m24so1309053ioo.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 05:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3hbW3yb+b7Zw8wyqig6D0j9728O33RjoSyJLy1EmBOA=;
	b=ujIAqI9YtbhoqKk929gLd9dfXSbcYd/CF6V+yJqqfbLNiA/5/uQEGtPlZf9FJ4X77Z
	Pz+hyPbCQ6ivyGhsnAJOKIgqmUyebEwY3GfSp+m7bSOSc3MTFOGZs9d6UNt06zev+mzp
	kediPyKHgvMZUa/dzvbPhxjP2nixWg4AZFr6l8IX+WyOiseF1o3gDgoVCB+PxMBCSgMU
	bp5yaoU6WvRdi5UdqONHhnLr32F/eoy1wKVHN0WwPSPP/kSN7Z8FQsn6qq888tKiMj9B
	QKHJtvfJZx/1gipUIZfV95TYu+Bgqphj5ewBYy5v1FBue1iMj2sUBoMK+nV7Fr7zWlIS
	4oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3hbW3yb+b7Zw8wyqig6D0j9728O33RjoSyJLy1EmBOA=;
	b=G8T9CRY6jD5TYW+0PGj9nJMdPLf2mGoxUtyggbOMDR6Zqf6y2Q7VEgvZctPGF7C/XE
	JlGyMwKjXj5PalVY1jB2WPtEmPyrJUjZW4j5tlL8YnaXVIBrlCmsvD0X4XSHg6e6tmyO
	62UQly+/Sl9iDFCNVfTCQnAUvHQ6gdElZZ5mo3Qzk+3J+1qKWHTowrLBkKy3ePPEXRWM
	0869UONYk0sZGPKtAsZ7i/TTz4vYl3y+39NWvZAt3GfRRv+mc2LBbnHSbps2WXFQVpfB
	1zZfk58O/fvntrxdrNVba4Tcai09O0vtrXpovyIAfTbpj4yxAlXRqX+hHWrRLZi9vZEP
	Jxkg==
X-Gm-Message-State: APjAAAWgpOW0tPz8pERTN7bNr97ZL0/wTkthurkwXNCdIQojGBNhk9x8
	Vpo2cUVP+c8h+njM4XATmfiBanhk3dyKWDTjwtGyQg==
X-Google-Smtp-Source: APXvYqw2MXp60kh9tmLYBoUtv/v1VhrFsT0Q/pDojIWt+dV9c9MkO/lqzyzd8gV9Oe0SLGj0TXdBKkjxibqF9pYh/jc=
X-Received: by 2002:a02:3093:: with SMTP id
	q141mr31971069jaq.128.1561467264741; 
	Tue, 25 Jun 2019 05:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
	<CAJTo0LZNdM8zb7E4r++zWY44RC2y2PebWsA4CBY7c6CGA-FfQg@mail.gmail.com>
	<20190621130128.GU3459@hiutale>
	<CAEz4NHqhdZstEKcXWE2z1gG=257kGdX00y4m95umQ9FsDyXOSw@mail.gmail.com>
In-Reply-To: <CAEz4NHqhdZstEKcXWE2z1gG=257kGdX00y4m95umQ9FsDyXOSw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Jun 2019 13:54:13 +0100
Message-ID: <CAJTo0LaMwXvS0xo=MVVJcDLrFQGxd-cjz2T9+b4Qx=nk68bQ9A@mail.gmail.com>
To: Pierre Le Magourou <lemagoup@gmail.com>
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
X-List-Received-Date: Tue, 25 Jun 2019 12:54:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Jun 2019 at 09:49, Pierre Le Magourou <lemagoup@gmail.com> wrote:
> > Also, the CVE db is updated using this custom task without link to
> > do_fetch, which means a fetchall task would not update the database for
> > off line NO_NETWORK builds.
> >
> > Could the task be added as dependency to do_fetch() or are there some other
> > side effects?
> >
>
> Yes I can do that, I don't think this will cause side effects.

Oh, you'll also want to set the proxies appropriately.

Ross

