Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mail.openembedded.org (Postfix) with ESMTP id 189AC60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 10:47:12 +0000 (UTC)
Received: by mail-vb0-f49.google.com with SMTP id w15so2647360vbb.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Qt7Us8JyfFaPBoxXN9/335h4ZjtCjwtdadYFZLMZGqc=;
	b=lEv3RLRo1IjlsF68tT7G9gk1a3YhSFD2bbZbEIG6cCnEL6CwqK8GIHpyjeuSXKhpsK
	WMtOTj52NsNaPs71qJue7Oac6UJrfXWWqKej/jQQkTAPN0u954YGi0uFfVldsW/OQDLg
	UtmXS/U7/zXNpN3vdAuQDYw+ViBPAZQZUKxOT6ycghCpWaYl3ElEOtZ+TRlDqyxsMFo+
	KJyWLk7ul9A6ib+PyvbF8TlAHsA2ITIsxkSRt3yvW5EYd/JWPzVKd55cn92kh1PeDiK8
	srAVJNXJ2wXbO665m9gfqsrFit/aaj/eQKllwuNAaTkeV7fEiTkrY45lCFwTpZ+LOg5F
	pzYg==
X-Received: by 10.58.164.101 with SMTP id yp5mr25507691veb.0.1375094832648;
	Mon, 29 Jul 2013 03:47:12 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Mon, 29 Jul 2013 03:46:32 -0700 (PDT)
In-Reply-To: <CAOMwXhNsgLaOtmCouNmB3d7wuACAt7iSLfO5zMq-ph0FBi8w0A@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<1375092018.6324.176.camel@phil-desktop.brightsign>
	<CAOMwXhNqXneU6UzeHZJJVM++RmNmmdvNMp3mbNV=YpFVE6tOdw@mail.gmail.com>
	<1375093253.13247.5.camel@phil-desktop.brightsign>
	<CAOMwXhO6+sJWjKAKVh=y1gymGoSUNVgs+nV9fz8G8eo9WHyAkw@mail.gmail.com>
	<CAOMwXhN556gDMxEGGSaFwYMJ7EU=Pvn+4mZcy0Q4eLyn7ShjqA@mail.gmail.com>
	<1375094306.13247.11.camel@phil-desktop.brightsign>
	<CAOMwXhNsgLaOtmCouNmB3d7wuACAt7iSLfO5zMq-ph0FBi8w0A@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 29 Jul 2013 11:46:32 +0100
X-Google-Sender-Auth: 13V5Ag1grhtZCAlPjaxFAPBYWNY
Message-ID: <CANyK_8fu6VhVmKeTjD8DLt5DYnf-DfNG2PGzZSM83KougpOyBA@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Mon, 29 Jul 2013 10:47:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 29 July 2013 11:42, Laszlo Papp <lpapp@kde.org> wrote:
> Not to mention, you would cause a "runtime" issue which is pretty simple to
> fix for a very minor portion compared to a *large* user base using older
> toolchains. There is a huge difference between a few people cannot use
> rfkill for those applications (2, ridiculous), and that a slightly old
> toolchain cannot even build the *whole* project.
>

Is there any reason that you need to use such an old toolchain? We
can't expect everything we have to compile with every toolchain
release since the start of the GNU project so we need to draw the line
somewhere. I think the feeling is that we'd draw the line somewhere
after the toolchain you're using (from 2009 IIRC).

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

