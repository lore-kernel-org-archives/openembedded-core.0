Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6DE7D6FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 10:03:32 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id v84so7478300oif.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N5iLt0J6vDgzjM33+Aw1jo4KPf6y7AWe6QmG4zpcST0=;
	b=YgI5a8ZWjEiUZaZ91l5oko2gAdhwuHWSh0IUUf/9nV8VIAogkJWe4iIp7jbsyy3qMI
	u4J+4H7ZGo56K6Zc8IjZjJi7aiFyt+8DraJdrf/IBPffVFCCjGEdGu1wutu70t/MPDR9
	wziodcYOLz0zwTZCsz5O4aSU+DkbBYhdGZLjEAmXqv5JxxHysR0ivY1LmhztFCqKiccQ
	8cY8RpsOLo6K3uUsQmQCgTYqgcqBFw8tjMkhc8uqGl1TGHdA1y3U7NLjv8Xn6b7lymJK
	Jf9KM0DUuu6AHQPU0s3Xt+QfK9QasMZ7KkLBiU+WGaMrw5PRl4EYlYzs0YLMfIRR9RSz
	YbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N5iLt0J6vDgzjM33+Aw1jo4KPf6y7AWe6QmG4zpcST0=;
	b=hBIZ+KFZaY/7cB65QK5g1GiVM4A7AhF6pFUxuVimN2t5vhByF5EO7qzBbkAi+YAXeC
	ThWcs/P0wMXVq3JxV4mSU8xLPN5bS06uNU4DLfUclMWN85uCWrGinZ10PLYQ9rEEuJau
	DXpoBlXRLHWUXS9D+xZli4QVB0SbEsk+OUGoZjF5lDM9xT4Ms1NEtch5oCvsZuJ1xPV+
	8GIzRgp6HsphqCg4KeZqcJ9+UoCj1xiFa/3PYu87Y3b+IcpZMl61kpsctDZjGUhizNsc
	1+CxazU/OetZ+i+whAUkOe5nY+OrII7JyUM3IsPLzEfemtMvfb1Aaj8vRikq6rK6v0Nc
	QvLg==
X-Gm-Message-State: APjAAAXodjy4nzUDfdfZDygMV+OCNnr6OjFe6VG7V2C2W2rgxmAgddSt
	01x2tebO2nZephBVd2W/7Yle+05cqevbknMlm6KRzPamYH8ITA==
X-Google-Smtp-Source: APXvYqwZRQREyfv1QO7UUE5yExPoYobWA+IY5WGKkliJFcBkCg6ncD9fNBlPscTqyN4VFbinGak7vXUDSDjhePqEnxM=
X-Received: by 2002:aca:ed88:: with SMTP id l130mr8281522oih.70.1555063413105; 
	Fri, 12 Apr 2019 03:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <1554995545-20943-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj_rYwg3Y5uDxKiwzJZrzMsmjLCNXOU2TMpgmB5Ydgt2sw@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C131E8@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C131E8@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Apr 2019 12:03:21 +0200
Message-ID: <CANNYZj8iuzGHWnvYRUvmjVVUR1ZOxjAYtTxPxMbd3KzY3Ab8Yw@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf: Enable nativesdk
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
X-List-Received-Date: Fri, 12 Apr 2019 10:03:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Apr 2019 at 10:57, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com> wrote:
> > >         echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >>
> > > $script
> > > +       echo 'export MACHINE_ARCH=${MACHINE_ARCH}' >> $script
> > > Please explain why this change in the commit.
>
> Dnf is based on rpm and rpm need to read the arch info, but $script did not provide it. So I added it.

Please make a separate commit for this then.

> > > Do not copy-paste large chunks like this please. Assign the
> > > dependencies to a variable, and use it where needed.
>
> If so, how about this way?
>
> BBCLASSEXTEND = "native nativesdk"
>
> RDEPENDS_${PN} += " \
>    python3-core \
>    ......
>    "
>
> RDEPENDS_${PN}_class-native = ""

Yes, this should work. There is an issue with class-native RDEPENDS,
where you can put recipe names in it, but not package names (because
there are no packages created for -native). I wrote about it here:
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280618.html

Alex

