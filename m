Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id C0EEC7D140
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:05:15 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id e80so15193687ote.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eahEo/ffyfaDK5iZ0vTJBEkFBWVbQnEtbbrK9bkEJq4=;
	b=AGYfsm6rRPpppTTtIdNnXChtwbCVncTUXbS2kIuO24ujv1xLeQ0/EShfho8jVhcoIm
	HQF4nkagaG0zVH0NhXhKAbubrrH9hIENN//BskqysoanwUSd9b+p3x2oy+ZzPBkWUwkS
	fOFt7q9Q9pcQL3lGq9NBNdslxgrnK+eVdnVUIT99Nc8u0V4MMFHOXzYXxayymupid+Up
	H0ewQS90JuRgSN2a+cIwl359jknPdF/6umduaABn+8AJFgtXCfjtGrU3OdYj8VwXjINQ
	0a0YzKJ7LAEX4ZTUpWeqiTBjTqztskKiGl9M77hQkK2OuNzDlr4Z1Z99x7NxvK0Y3YYW
	A6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eahEo/ffyfaDK5iZ0vTJBEkFBWVbQnEtbbrK9bkEJq4=;
	b=EgU1vLj7ZoY2bo7e6//qvyGHTgSQ91K4jfBpD6NTjELTJUMoRsXWJmZYq9cGwgBuC7
	Uozp2K4M8qETzKnsU6wvw7m6FCAxj0qvn+oME/cCgxSe4sf0xiTGhiD1PLCXghtjSrMB
	9BGJbfg4Mwu8OtU3dC3MfcfbhmiA60Z2N4l1smydB+m20Bbu0cfLLpxx/ZZsgiJkjfgC
	X7Jp6VX76QDRCQWJrhFTEgmmTVFSjQwrm9qmxGnYl/wv8P9OmARg3N8m7oAAOYBuIiXZ
	2iV7vATtclPkjOwsENYp+RK9YjNsrEXGlrNT+qfwxAyrJZzVqbXcsnMa8F2EASNGjwRw
	TQwQ==
X-Gm-Message-State: APjAAAVO7OT47KH4mpWYd965IuWdKs6JQa3+o/NHcgQ7sc5KDzDqhVtD
	sfyiw2hGpzDQGd3mHYJmC1Qm7yAvIr4sgbZiszp+Ag==
X-Google-Smtp-Source: APXvYqxerZ59AH2/tDCgfPUDsE0/FqBUOGvAy781c/7F1FprMKGa5VgCaei4FGP5JEhjzxEhSEpZg1tbQihz4T80B8o=
X-Received: by 2002:a05:6830:1c5:: with SMTP id
	r5mr15772647ota.360.1553699116747; 
	Wed, 27 Mar 2019 08:05:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190327140922.109867-1-alex.kanavin@gmail.com>
	<20190327140922.109867-3-alex.kanavin@gmail.com>
	<20190327145110.GA23257@localhost>
In-Reply-To: <20190327145110.GA23257@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Mar 2019 16:05:05 +0100
Message-ID: <CANNYZj__QaM7e7=E1JdSM5vAMTErDpaQq7zyenwefyt5FOmPZQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] blktool: update to 4-7.1
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
X-List-Received-Date: Wed, 27 Mar 2019 15:05:15 -0000
Content-Type: text/plain; charset="UTF-8"

Right, I have sent a followup removing the duplicate.

Alex


On Wed, 27 Mar 2019 at 15:51, Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Mar 27, 2019 at 03:09:17PM +0100, Alexander Kanavin wrote:
> > This update adds a patch from Debian to match the latest version there.
> >...
> > +           file://0004-fix-ftbfs-glibc-2.28.patch \
> >             file://blktool-gnulib-makedev.patch \
> >...
>
> That's 2 patches adding the same #include.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

