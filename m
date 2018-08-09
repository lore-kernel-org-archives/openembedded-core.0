Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id B518A74743
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 16:16:10 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id w126-v6so10772628oie.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ImfE0wLM36Tgh4W0QRH0VG8JSWoAdHiidGRsswiyr7w=;
	b=WMagAdiwk3QGA4WQkil/jxrML/DDELyS5skz0z+GJQUYYKXwxcWZRXhHqCeoa28H1O
	ZsSR5e4iFNYe0HSyeyZpWxsr9xwWLcUobC707HtyITNBWmDACXUeLT/CmcuLddhep5Um
	SJOQYb34lz0AgnYT2DGEZkxDbh8zLqsWyQR3dEhZ/IDMeItTLTCpugL+sFX5r2S6oUSK
	cxi0eIJqdaEPaIxCHk3+HhhkAxS/PmEuClyiVNdw8NSOg+Mrlla7U7AhCDJ2mtrnXRrg
	6dUxZiOD4skUPpvkvFOsKB5dJGaQEV/lcCzbGKI06FJgV4B7PHMMeZSzimNah3wpnY28
	s0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ImfE0wLM36Tgh4W0QRH0VG8JSWoAdHiidGRsswiyr7w=;
	b=Lw3KJHzl1Mnv9m2F6NIhSvshN2LpwOchz6v6vjdrYkXJlxouoyPoCzPIsN9fIOpnzW
	c97maLxH3ktTmQJW93MOMyyofThWtOrymkWE1qQL4Hghe565MZHyA/fccX9mTPecJ5Dc
	JAPpv/VrDb+HntLshKmMtnZt5gZmMwT3H+xcV6jzIqiVT8/9BGLc44grJgLsyX1SkBxz
	onITUSw3YnhENgngFl56Gc8Pm6RbA7tSFe2Dy8d1AxuhwOSThbUDvCxxpwAn/ARJP2oq
	pb3CpDcBmEvSlE+Ucbv901PNwBknc/2zbw47rryKqwMXK2y7bLF4Fa4LFHRo7Y/ySXO3
	CXfQ==
X-Gm-Message-State: AOUpUlG3K/WVYId1ylc3ArEi12ooPMMsTcrNunqlRuCHqSV7xXQI2NhR
	YBLWDTGV9UGGdrcc9LqQ9Kq7WU0B4uJrRDh6n3g=
X-Google-Smtp-Source: AA+uWPxiu0ZW7drOZsLzza0qSxb8Ej4GQ8WGOa5eZA9VxsbBUBDDkIgMMHk016b2+2RO+sdTzcI4cSBhJNNi2D+YZ80=
X-Received: by 2002:aca:4fd1:: with SMTP id
	d200-v6mr2980146oib.224.1533831371556; 
	Thu, 09 Aug 2018 09:16:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:590c:0:0:0:0:0 with HTTP;
	Thu, 9 Aug 2018 09:16:10 -0700 (PDT)
In-Reply-To: <CA+chaQc0jpZx+43G-1SGQuahPksikGQteo4c=c9dDTsspBQM9w@mail.gmail.com>
References: <CADySD0EZ05doNyBhkT6v3K4ibTVp5wtXJ2zY9YwYWGri_n5QOw@mail.gmail.com>
	<CA+chaQc0jpZx+43G-1SGQuahPksikGQteo4c=c9dDTsspBQM9w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 Aug 2018 18:16:10 +0200
Message-ID: <CALbNGRRpOXtZXgnJWAx2Ut5V3TM_LZx6LYokqOfzhW_G5vX3Ew@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: ankur.tyagi85@gmail.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to upgrade Qt modules in daisy branch
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
X-List-Received-Date: Thu, 09 Aug 2018 16:16:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 9, 2018 at 2:40 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> For daisy you probably don't have support for PACKAGECONFIG_CONFARGS which
> was added in Yocto 2.1 krogoth.
>
I remember doing similar for other reasons. We have images based on
jethro (ok - daisy is a bit older) with later Qt's. Our builds are
based on [1] but I created branches up to Qt5.9 (stable release - but
not updated to latest) [2] for jethro.

It's not daisy - not Qt5.11 - no guarantees - but maybe a start.

[1] https://github.com/schnitzeltony/meta-qt5/tree/jethro+5.7
[2] https://github.com/schnitzeltony/meta-qt5/tree/jethro+5.9

Andreas

