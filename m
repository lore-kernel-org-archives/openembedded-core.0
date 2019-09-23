Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id BDCAF6C193
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 13:04:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n14so13843151wrw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 06:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LF5ooQ0zWrYjoDTd4l1gbEacTvGfzvtw+G/QIw8Xgp8=;
	b=KjybNl8nVrWrLLCACfpNkrVYtEXp1f4J3BrvQcT2ofWGfJ0naxH8thzQfQOdX5BXnJ
	Uq8wqIW9wq6SsM1frhVhci5kaIShZVm9G3Kfz6Mr7vbwxhz34o7AZ+179FjUHo1kouqG
	iP/uGtV/taBNeX0C9K3c9mGoc0kGOsXNpHm4RkUqXJPs+hM+s05TOfqb/KAbIekz8UVW
	0PHtfEYQBmA0yo7cUUTWPh08yM2WLqgumqdzQk1tgMMR8IUSGHzuDho87Z8LT4YHUUql
	XS58MkETOLMyYWdTmh41qna1rjoujEXE3h02FsUTOFgzeZ5QRBibMvoRBbYzMRtwExVg
	pSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LF5ooQ0zWrYjoDTd4l1gbEacTvGfzvtw+G/QIw8Xgp8=;
	b=KNwVKWT6tj40wHJ+T5qrba5CLbzMYzFUp8o7hWhQjLuoPWCVoPpVy6B+tT99QUQ2y3
	uJ34phcKUPRNrqxXuRrtV200WvSE4BeOxCz2qo+CDh+iA4pKBAoRG+Kr+d8JAH8Ywesc
	Ucz7iiZTVx7spw0fW0lwyZn7UQ29KNUlutP8fHFGsA4Kz4CrBtIgFrD5Nh1hAfh6Viqw
	M8xDcgkAFJkdy59acLh+ldxMCM2njGAB7TTqXzLzcTYynED28O0pN+ja6ORR1Q7SNQ45
	RYHpamwIuHty7zXbpZk4hNvRtpIJ/zrhHm6Ng32GN1KXXRJ4XBXVIzo947pyANG7OOsN
	TqIA==
X-Gm-Message-State: APjAAAWopW3udD1rvtAWDT1sjirxTGPlKadMd5rLRznSSjvHR8NQk/zN
	yR8h4U2beBO9FPPRpQ5/IE0gfLi0f1jufjJQaKs=
X-Google-Smtp-Source: APXvYqxgcwcll2o/YC74KE1l6fNuMnM71FCPyepu4aQUmg4krYUCNRGmFPCcKLFHuy16JZ5YlHe8TdaniNHtRBN1GOA=
X-Received: by 2002:adf:ab57:: with SMTP id r23mr20746918wrc.222.1569243840818;
	Mon, 23 Sep 2019 06:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190917184947.2244823-1-raj.khem@gmail.com>
	<CAHtQpK4svi46b06dzCfCX7R-i6uiooQ0hi0mmdcOuoY+Ccm+MQ@mail.gmail.com>
	<20190920133829.GW6154@hiutale>
	<CAHtQpK5cHSYFRr_Uck96fXDHZftV0ZEDeQz4K8SR3fO8zVjFtA@mail.gmail.com>
In-Reply-To: <CAHtQpK5cHSYFRr_Uck96fXDHZftV0ZEDeQz4K8SR3fO8zVjFtA@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 23 Sep 2019 15:03:49 +0200
Message-ID: <CAHtQpK6V+tQYiak_rtaNqvwcM3D1cxygFgF0zxCqDdg6GaxQ0A@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Mon, 23 Sep 2019 13:04:01 -0000
Content-Type: text/plain; charset="UTF-8"

> ...

Just as a follow-up on this issue, if someone else would stumbled upon the same:

I've built cyclone5 machine off the master and it was 100% operable.
Then I looked at the i.MX8M configuration and found out that openssl
recipe was overlaid for me with the option --with-rand-seed=devrandom,
which effectively cause this erratic behavior. Changing the compile
option to --with-rand-seed=os,devrandom made an SSHD fully operable
again, so indeed this is the right option to use for devices which are
not properly seeding /dev/urandom.

Mikko/Adrian, thank a lot for your advises here in the direction to look into!


-- andrey

