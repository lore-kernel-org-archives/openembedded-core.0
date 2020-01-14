Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 51EA97F859
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 10:23:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so13057160wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 02:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=UZEbaMIa/Q5hu1hI7KoW+4sMcFjdtvSpBkyt8U6hvJU=;
	b=Bp5Du1Mn0i8hQiKhs3ret/08ZTPvgfYBzVlIcedCPvbWEAp00oOrEbsoPj9RnH9Q50
	m/RmZOvV21wCFEHu1CwPP5nKk4fGHeaIfYov+0m2Lw9N1rqEB7IMyU6mHhWkumyQx11L
	+jd7riw3LnukVjrUB6HfRmfTlijI/brueQSiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UZEbaMIa/Q5hu1hI7KoW+4sMcFjdtvSpBkyt8U6hvJU=;
	b=GnskjqUF9lLG22ExgyKmmkxPP8eWP8+mKLpbtOPHPBTslGzVps8QOU+SC/OTWC9LlI
	WcGs6ZpEo9MR6bn2OxZpptIJjMeroe3S0uoTCv1bxsD0YV2LabqOINfTmFnPeyfrZO+H
	HOV5kd92xjCRuAtTvmMxteCkBoyFNcF72uW1lbWMWFc6e1XUxQCe/T+BUK3r2rYMPXKn
	4tY2WWXUtZdvc8q07mg4K61PAGf4PxKTjfWerP+eeDjJopem9sL5I/ZH4/OKmwynWOig
	mYzLEAfOVqdzVC8tNPSSDzzd9zGUfriOXvq3eaVVdTnPWlawYUbCcaH1XSU7p/BSjELP
	rEdw==
X-Gm-Message-State: APjAAAWSYqT4oQ/Zpi6i3IeNFKp0ReO7MIKDrgbDbdU5nB7GgKhB+/LK
	vxiWukFvOHnVHnS6jEuv4UvIGw==
X-Google-Smtp-Source: APXvYqz8U999r5W8D18xp72PygJwsJULwhtj3rmJpMTkw1+KLT8nvaMB8jsJgIC1tixkmZf3bP8xeA==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr26002265wml.67.1578997401946; 
	Tue, 14 Jan 2020 02:23:21 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v22sm17788396wml.11.2020.01.14.02.23.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 02:23:21 -0800 (PST)
Message-ID: <9ebe5e019aa41e1c79cae9f0657b044687701759.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Jan 2020 10:23:19 +0000
In-Reply-To: <CANNYZj-MWCDrwtWDgb5YYUSAY0oxMjKvnA3B=K-b151+mQ51oQ@mail.gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-5-alex.kanavin@gmail.com>
	<492572ea126b424def780911c58230941842dd91.camel@linuxfoundation.org>
	<CANNYZj-=HOtgRiTh9xcnt9Q7c+gcm-Le26dfJeY0f3+Pt2HQsQ@mail.gmail.com>
	<8f8e989f2e630df2fcbee68f1ea18034549e069d.camel@andred.net>
	<b264b9d4f20106585d8a3daa6da6652f6ec90873.camel@andred.net>
	<CANNYZj96gxDZnxLKzEZUy+qehNQirO87hrUeKOR9KCrPmnWsOQ@mail.gmail.com>
	<bdc3d78fb086561f839d8a6a41d2ed336ef5a793.camel@linuxfoundation.org>
	<CANNYZj-MWCDrwtWDgb5YYUSAY0oxMjKvnA3B=K-b151+mQ51oQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Jan 2020 10:23:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-13 at 15:15 +0100, Alexander Kanavin wrote:
> On Thu, 9 Jan 2020 at 23:14, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2020-01-09 at 20:49 +0100, Alexander Kanavin wrote:
> > > The problem is, I couldn't reproduce this locally at all. Random
> > > glitch?
> > 
> > No, its happened on multiple workers and there should be a pattern,
> > we
> > just don't understand it yet :(. I don't have ideas right now
> > although
> > the build user is 1000 on many machines, 6000 is a minority.
> 
> I guess we'll have to save the build folder on next failure and
> inspect that.

For extra data I reran this on a builder where it failed. This time it
worked out ok. I can think of two different things we could try:

a) Add some debug to the code so that when a unknown user error occurs,
it triggers a mention of the filename with the issue

b) Potentially try turning off any parallel install code for python.
I'm starting to wonder if that is racing somehow over file ownership.
Making it single thread may make the issue appear (or it may
disappear).

Cheers,

Richard


