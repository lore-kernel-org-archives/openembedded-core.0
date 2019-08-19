Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
	[209.85.167.179])
	by mail.openembedded.org (Postfix) with ESMTP id DB1D66B3D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 16:49:20 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id b25so1821449oib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 09:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6yj7jE86kFD6xdk/C/z6Ottb0XxmWekicvvZOVT3PBg=;
	b=FJ2lvlYc0W72ZeDgy7KZ5pXt2lHR4V4/XlBD+UxudWE1Ryg5nRCz0kYP+6QmiW42a+
	uzRJEiyWd4bGilM9HHc776/Mmh6LR5/ATmAK8wYD029aHxQgMix0oIM1nTe6ys8An9+o
	kMNqZPny8Q/3zvMQ3rk+5LztQmHVI/YEMCko8WkfcuoOYGOfwxf2yN4f/CtviAX+nay0
	hHy5elnylXXx6JvrtsxgRZ+ZAfwX2fUtwnGvupd+SzwVBwNENY/hJ1EIyE5NL50dSvin
	Ocbm2O9uCCUj65NvrJIqFd6KyGZNMNOqGjvB4OxLSYBGgmKSgEKt6u2cn4P2Fjg0cAGx
	EluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6yj7jE86kFD6xdk/C/z6Ottb0XxmWekicvvZOVT3PBg=;
	b=QSxulEu6j6rBCKxDYCSmm+fzLNBcVcpXKfCrKfc7js1/IgKKq4yTyPevsKHZ989BSZ
	OT5NlDE/z8xp1TrBx0Qy969845BViqM72SLugG36TRDGoH3BThfOI2aDBKdeixWlisbl
	nj5HA9Xv4xCpDNCCkvnEomkMX0VmOZ5dIvVOsO51bHwg8GOnAT/1NsTavpF/ppTHMAno
	AmneYUxpAujil6xrgff/fPFM9bsenDvS/LAYwFlOJ2o58YqxAalJ9lJpjt9CSLHrOISr
	u+M1Aqd+XKbYP8ah2nYJVFNdjaP+BI21WHsz5IZzcpHUKWeb8YFpdbHRbyvD263dkx2C
	idfg==
X-Gm-Message-State: APjAAAWIiuUduPfnEXEwNez2lFVvMJ4Ys9kdBxu8xSuqETWv1tdSe2G6
	zpKJ3ZG8tYTceDLv4+3E7c1VjYE98BsEMQ==
X-Google-Smtp-Source: APXvYqzFG96qIM6N2bapcC57KrLY6wK7mbTZxLKFGguvtH89Adu/A4+FptHCzUXqn0SokNa8kh9gmg==
X-Received: by 2002:a54:4693:: with SMTP id k19mr13341497oic.160.1566233361248;
	Mon, 19 Aug 2019 09:49:21 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com.
	[209.85.210.44]) by smtp.gmail.com with ESMTPSA id
	c15sm5430386otf.35.2019.08.19.09.49.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 19 Aug 2019 09:49:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f44.google.com with SMTP id b1so2283261otp.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 09:49:20 -0700 (PDT)
X-Received: by 2002:a9d:7a42:: with SMTP id z2mr19265239otm.345.1566233359519; 
	Mon, 19 Aug 2019 09:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKqnJX-fLme5JUQF8XAHr2hDzJ31auZPQGOUQCehuTb4XA@mail.gmail.com>
	<b3e14a93-8d27-c5f4-0895-8122a030d451@windriver.com>
	<CAP9ODKqWyAG5Zigqcwi7JEgxreaGfSYgBKQG23fhHrHi81QVcQ@mail.gmail.com>
	<4035859d-d86b-16ff-d40c-b5dbdbf56b71@intel.com>
	<e0fd2cfb-afc3-53d6-c821-b7a3ce05d4d4@windriver.com>
In-Reply-To: <e0fd2cfb-afc3-53d6-c821-b7a3ce05d4d4@windriver.com>
Date: Mon, 19 Aug 2019 13:49:06 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqM8tPNPQQ9LjbUKSaCq7CQF4Pica7RLVLnH9qNikA9Tg@mail.gmail.com>
Message-ID: <CAP9ODKqM8tPNPQQ9LjbUKSaCq7CQF4Pica7RLVLnH9qNikA9Tg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conflict of systemd and sysvinit
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
X-List-Received-Date: Mon, 19 Aug 2019 16:49:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 1:48 PM Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 8/19/19 11:27 AM, Ross Burton wrote:
> > On 19/08/2019 11:37, Otavio Salvador wrote:
> >> On Sun, Aug 18, 2019 at 11:00 PM Kang Kai <Kai.Kang@windriver.com> wro=
te:
> >>> On 2019/8/18 =E4=B8=8A=E5=8D=883:27, Otavio Salvador wrote:
> >>> Would you like to give more detailed steps how the error occurred? An=
d
> >>> what's extra settings in you local.conf please?
> >>
> >> I had sysvinit and systemd enabled.
> >
> > The autobuilder should be exercising this, so when it's fixed we need t=
o
> > ensure the AB covers the case Otavio is hitting.
>
> If they are both enabled what is the expected functionality of the system=
?
> (which is init, etc...)

The image needs to pick the desired ones.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

