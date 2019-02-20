Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 159227CA4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:02:11 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id n71so39922542ota.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 05:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=QYMMcA26yIaNCf0PKOMbYgLAa84tLTN/m1v87alfvuA=;
	b=VZkseZwc5dTYhAGYx+OonBqHBSCDvpUrwrgfLnCI7+nV+hz4h4480HZY2WlXso2fpy
	xOerIQZuDbkCUwxvRXWjXueFGKYqnQJSYJrglmO3NSbKQCcBkbP8nvlMihR6HnjzbTny
	vsL97ugYKDMQJ7llt6IwVTgsNksa0ESdFJg+Y0Wy3xs1pG7UQjLAq66y40uhfIfaqpTh
	vVujdwTwEpCnSSDXnV8CCYbJLAdsS+4kXvpkH2VcUO/oBgXGw95GP4B/MPZE0i4M48Fj
	I21x8ka9OkzBVhJuQqhvLlB/cNN0TILtN9YUmtF9rYzvtbvE7AE02nRWdCfz6iJ/jP+M
	7+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=QYMMcA26yIaNCf0PKOMbYgLAa84tLTN/m1v87alfvuA=;
	b=JDQGjBEFjzse987zx5y6uawrf/hNwOUP5SsS7JYPibank7VRDCGZFLyO1VEboLLecd
	MYxIrEGHVSe4BeVaciaK14zQCFMym+53E1wK5MX+YhCkZMpYKziwgYx8o9hfd0JwdITK
	67GBiaKv43BeW4QzGc3Eo7EnWHAyHjwvWkt+w+FQt3inzEwWAca2SMMjjnzQ7WKRTVuu
	vpbcsUAHKwKUxF7dXCeESnQAT7j2yM0Wl+DH0xV5UNVF4H47k2FzReNzfybrOgzMlZjc
	1RKr+oPkNwm4zLCfa2yGhl6FlW+0F7zc/CqqyhshPzUzTepHdhxtVTGeIhHhV5XSc+nG
	797Q==
X-Gm-Message-State: AHQUAuaxBmgY7CAo4rFS++B31wB1+GQPn2zDSGKzhFGzg7QVM9ErPIXE
	4ED2jyj0lQ/1kYBTSFp+/2V1/ovaT+nLLA==
X-Google-Smtp-Source: AHgI3Ia7t4tosvCgjQm/hgzS9akVfSHMq7Ob9gg/xwohw4JGePRy/GDV25C7JLisY1GvmOjI0bEFEw==
X-Received: by 2002:a9d:19a8:: with SMTP id k37mr21733285otk.283.1550667732412;
	Wed, 20 Feb 2019 05:02:12 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
	[209.85.210.45]) by smtp.gmail.com with ESMTPSA id
	e125sm108501oia.18.2019.02.20.05.02.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 05:02:11 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f45.google.com with SMTP id i5so39920253oto.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 05:02:11 -0800 (PST)
X-Received: by 2002:a9d:70d4:: with SMTP id w20mr11896667otj.253.1550667730974;
	Wed, 20 Feb 2019 05:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
	<CAMKF1souMyUMczQ+-s_+W2Tomi=Q-7dj7Us1bwQ23rDS5CPx=Q@mail.gmail.com>
	<CANNYZj9Abo0ZeUVq7jgkHLc6rENns=GptXNHq9eN-j_rJ20noA@mail.gmail.com>
	<bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
	<CANNYZj98LDCmKD2va9zX26OJCFhTS-jNs6=aikLrAx8VW-CNeA@mail.gmail.com>
	<CAP9ODKoQFi=UbZHQPXmTCw5Sqb2oVcB9GxsrVk0Bet5GdL7gUA@mail.gmail.com>
	<CANNYZj8hjgxiN6O+9xe5sHzy2307y8bRkxAbXshc7PY_auVVag@mail.gmail.com>
In-Reply-To: <CANNYZj8hjgxiN6O+9xe5sHzy2307y8bRkxAbXshc7PY_auVVag@mail.gmail.com>
Date: Wed, 20 Feb 2019 10:01:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrD=QuY4M8HNCzXXZ1JqkjGZ+XJX_9u2K6v92Z78-iQhQ@mail.gmail.com>
Message-ID: <CAP9ODKrD=QuY4M8HNCzXXZ1JqkjGZ+XJX_9u2K6v92Z78-iQhQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Wed, 20 Feb 2019 13:02:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 20, 2019 at 9:32 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 20 Feb 2019 at 12:57, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > > On Wed, 20 Feb 2019 at 08:58, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > I guess xrandr needs to be in X11_DEPS, this was added in the
> > > > > original
> > > > > mega-patch, but overlooked in the split version.
> > > >
> > > > There were failures all over the autobuilder from this as well :(
> > >
> > > That's why I still think it would've been better just to test and
> > > merge the original all-in-one patch, with follow up patches if
> > > necessary. Doing this split and delaying meson into 19.0 is just more
> > > overhead and work for everyone.
> >
> > Patches should be logical units and a "do all once" is wrong. We are
> > doing the fixes so it is not adding overhead.
>
> By the way, can you send in the libdrm upgrade as well please? You
> should have the patch from AUH.

Sure; will cook it now.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

