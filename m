Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49F7C7F7E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 18:37:33 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d73so15022961wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 10:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=S3LhRMtgJs5rZvEV7G9B+emOybx8C/p6F/2VR7+KPag=;
	b=iXiFSwa2HKLwdWA3Y7AJVdK4nxg1HIvJmXhtWIIwUtwN5Eys+ei/fPpt/CaHVFj6u1
	epIgPWIfeqRzNP70h/kYan4h+QvKyLp59ioOZtRqBSoxLjeJnDsvta5c5cMGs02azz2/
	Onc9UPLlpTzKsnYG/qVGv9+meXNdO2uiht8qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=S3LhRMtgJs5rZvEV7G9B+emOybx8C/p6F/2VR7+KPag=;
	b=ih/ZHeYmsUcKbfCPUSN0XwRsndVq2Jky7d3nzNuzW5X5vrqoOEuC30DUgLvVeXKC6I
	lqTCZzTfJmr2H/yH0T9m7yFs1z5ik+teTFZMXW4zEJD5B+eJnY4695Uq+doHSnvJnqpx
	NjXY1tfAugkIf5BbcubcjGjMsdAv2yCBqaJ3GvW4w525lwqeiB/oXrbr13u5uum9YkRQ
	DdlFAJ2mGH81tAeafNmnu2caQIBLlesLtCAHjhdeaO22WOkgT5+eTLzlfvDw7c4hGAHo
	WIZ/dhnY6PJkhPhRgR88UdTYcVKQ4LZz1SX917Zd/+4WJPvbHGrUHiqG0DZz4Dc43Du4
	rC7w==
X-Gm-Message-State: APjAAAWcoZAWNZzQeYJ8DgurMPMdSvXNNWl9KW93epuBtcVnVqKrgCCH
	TOjSf0A6EuNERyFbMZViCuKqNw==
X-Google-Smtp-Source: APXvYqzpEQcDTgPXoB0HOz8GmT7U+AJ3Tego4fjgBR87gz11uQL1amKRMIHYJEC4Fpg9XcQe2omhEg==
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr28202488wmi.37.1579027053902; 
	Tue, 14 Jan 2020 10:37:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s1sm19614713wmc.23.2020.01.14.10.37.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 10:37:33 -0800 (PST)
Message-ID: <f0c8a17ce2765737f45f6b4b07910cb27d59b1b8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jan 2020 18:37:31 +0000
In-Reply-To: <CANNYZj8JaWrOctDzoG7gXxWUa4TZUBSLo-S-8Xk=xSzin_egMw@mail.gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
	<8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
	<b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
	<CANNYZj96gxDZnxLKzEZUy+qehNQirO87hrUeKOR9KCrPmnWsOQ@mail.gmail.com>
	<bdc3d78fb086561f839d8a6a41d2ed336ef5a793.camel@linuxfoundation.org>
	<CANNYZj-MWCDrwtWDgb5YYUSAY0oxMjKvnA3B=K-b151+mQ51oQ@mail.gmail.com>
	<9ebe5e019aa41e1c79cae9f0657b044687701759.camel@linuxfoundation.org>
	<CANNYZj8JaWrOctDzoG7gXxWUa4TZUBSLo-S-8Xk=xSzin_egMw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/28] python3: update to 3.8.1
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
X-List-Received-Date: Tue, 14 Jan 2020 18:37:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-14 at 13:19 +0100, Alexander Kanavin wrote:
> On Tue, 14 Jan 2020 at 11:23, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > For extra data I reran this on a builder where it failed. This time
> > it
> > worked out ok. I can think of two different things we could try:
> > 
> > a) Add some debug to the code so that when a unknown user error
> > occurs,
> > it triggers a mention of the filename with the issue
> > 
> > b) Potentially try turning off any parallel install code for
> > python.
> > I'm starting to wonder if that is racing somehow over file
> > ownership.
> > Making it single thread may make the issue appear (or it may
> > disappear).
> 
> I tried setting PARALLEL_MAKEINST to "", and it didn't make any
> difference (python is using standard autotools). I guess we'll have
> to catch the build directory when it happens again somehow.

The autobuilder failed with this again, I went in and the first bit of
debugging I added was to say which file its failing on. Answer was:

WARNING: python3-3.8.1-r0 do_package: ./package/usr/libx32/python3.8/__pycache__/_bootlocale.cpython-38.opt-2.pyc

so for some reason the ownership of the pyc file (or files) is suspect.

I did a quick inspection of the pseudo database and its only this one
file. That leads me to suspect its a race in how its being
generated/owned...

Cheers,

Richard



