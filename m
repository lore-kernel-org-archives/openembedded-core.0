Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 962F471A91
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 13:45:35 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id s62so1247125ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=kyOjrOE7qOP7s2gi2ClmPljkRLgCfqZhTOSAbbJUexk=;
	b=Qo+KIpwsWsvK8LPxYF3XV7uEoVElu23U2K6zfbjujgJ1wjqBT/WknAJVUmptKsqt57
	omQzyb6sojJGN7gSYjJO+b4DP3vncjwM8SiqYIllqmS0f9KZoQLkBRM//qtOKdZ7BBdJ
	0bbg5ZVH3Q6B0yrcUD6xBaYQlX8D8hadDtx62x101klqwKQBkq5X/BHxlMBq9iwTt6HU
	+arBAkAQGYeD3iA0CY+yBKf3ByF2cfVfWMz9eUX5rx2bzlTF4kB8/KuzcTL2qhj+hyyZ
	SwxbNujQtFaL4vavegt+/5CZpY80EgAs+t3I2x3Pxu0xUGIE1WvvUlZJRDkZQcV+rz8w
	BrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=kyOjrOE7qOP7s2gi2ClmPljkRLgCfqZhTOSAbbJUexk=;
	b=D5QYuqSbeeTFFMjihBqm94UBGdSoXgMIDp891CTG5+IZ0852qEQmfxXYHWfATho3yM
	tK/83Aa09k4ZEOvBGxL0SJeK+mNo3jv4iPj684rsqsKj1DETESSjGsTktp9FvcxFSPAS
	i58ySgEfZcRlASsn+WzwYpKBUqTxbnd5lJJC4eEB7vkOckaaloBPPKf0pxcQ2x1li+Bu
	5pfjkYwD8NrvsZJ4X+RN6zbM5IckLwX0+TV5rWMxfKlWjlrRklkeRnX8S0wXqAMoKpS+
	/kNq+IvmmyV1NBnzKXbwsoZuWTNgsLmooO3hY0qysXAZG7Fqp2h5dtGnVqF83xx0A7iJ
	hhkw==
X-Gm-Message-State: AMCzsaXnQop/VslDreO+8r1aeFH1oeJQdr7CoP+AfyQAA8NddOjmIMIy
	UHJmO/7oiVtsQXYaii3+eEGd0zMA
X-Received: by 10.37.210.12 with SMTP id j12mr373822ybg.509.1506779136241;
	Sat, 30 Sep 2017 06:45:36 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	w137sm2718936ywd.9.2017.09.30.06.45.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Sep 2017 06:45:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id c77so1192969oig.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 06:45:34 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCq1fo3OwP21aZwgBxSQ4CSHhlR+9177zAo5jnCfId6bQqvtsQoXlKUHFySKBiG9BjrkasEV22P6JB0rE05DEQ=
X-Received: by 10.157.41.100 with SMTP id d91mr4962433otb.426.1506779134128;
	Sat, 30 Sep 2017 06:45:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Sat, 30 Sep 2017 06:45:33 -0700 (PDT)
In-Reply-To: <1506778986.9509.1.camel@collabora.co.uk>
References: <1506614485-31675-1-git-send-email-fabien.lahoudere@collabora.co.uk>
	<1506614485-31675-2-git-send-email-fabien.lahoudere@collabora.co.uk>
	<CAJTo0LZ+FcABO+WPvQ10qQHuJ8QQzYYbwBbNHMQGEJC3vn62hw@mail.gmail.com>
	<1506778986.9509.1.camel@collabora.co.uk>
Date: Sat, 30 Sep 2017 10:45:33 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrx0ATQ2BB6sn9ggUwH3Fd3KgspCqdODJKxZFMqdbd62A@mail.gmail.com>
Message-ID: <CAP9ODKrx0ATQ2BB6sn9ggUwH3Fd3KgspCqdODJKxZFMqdbd62A@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/3] wayland: Fix installation patch issue
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
X-List-Received-Date: Sat, 30 Sep 2017 13:45:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 30, 2017 at 10:43 AM, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> On Fri, 2017-09-29 at 11:32 +0100, Burton, Ross wrote:
>
> With xserver-xorg I get:
>
> | make[2]: *** No rule to make target
> '//usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml',
> needed by 'relative-pointer-unstable-v1-client-protocol.h'.  Stop.
>
> (in the xwayland directory)
>
>
> I am really surprised, I succeed to build core-image-weston which contains
> xserver-xorg and xserver-xorg-xwayland on a host where wayland is not
> installed.
>
> $ ls
> /usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml
> ls: cannot access
> /usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml:
> No such file or directory
> $
>
> Do you have something specific in your setup to help me to reproduce?

Only way I could reproduce this was using pkgconf instead of
pkgconfig. But AFAIK Ross is using pkgconfig, aren't you Ross?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

