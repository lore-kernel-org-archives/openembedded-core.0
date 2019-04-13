Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29BF77DBD1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 08:03:14 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p23so10534195iol.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xvKkMLvUFo5aMIqNGwpt87CzCJOdB/mArk/f9X1gM88=;
	b=ZTk/inBR9Tp2mYLDDHmprRZ9iISZExsb9f2Qc7GG5l5ECnV3RCFHewdt+YFaQDoFqF
	JsxnjpzGexyvp9ud6K4/G+pk/OVr7inMicF4HvfKoHyG+H97OrkHoi//EfL/C1ELxi0E
	pw/bAPFZlJBjvvYKbPxppGKkj1OZcvZ2mYbmjNvf2vt2KP2kHSao3aLQH5fqLGtYlwTz
	RvI5ZMcbtXtv7wryiDaimNKg2TZzaJJvLeR+YB70ZQGH42OimQabQz8qAaawoQ+WMRFW
	RJvyrPLCO/W+WyfiZiGTI8eVr/3RLWp8Ozem2MifGDMQVtiFotXqFLOmPjJU5lWD5uGJ
	cSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xvKkMLvUFo5aMIqNGwpt87CzCJOdB/mArk/f9X1gM88=;
	b=khLiP90b81wRFz1IYEQ3xJ6zGaQSNDZmhmHXeynfAgVg4tzNeO1gNqZ2h+z6eC9cSR
	qZnEFaa8K6X+g6byW54ZbrDzZ2IU6MehECS3OZ+xrQYdB2/n8bwSEuMSb8I21YKUSMtJ
	09fbQz23g1TES1mNp3gRr+catE1LlChROBV1g0RsZo8UZlxspTEPWcQ4G/4Kf9HlK5ug
	2sIjWhay8A/VDVKzO555LTIRH6sdU/KMf0FIsKuCJPExcV+wRn7NsyVp2e2InNKH+gs1
	IOsj1PaAyB4+BUkCwYS0U/LMJmlgCXJmSJsZ9dviAZoftEED+CioeGvVkY0a9SAkSMG3
	DOLQ==
X-Gm-Message-State: APjAAAVZXj+Q+Zu6DzIfaidaCma7GG9hvTZUrR5MaNIvNE+JkORFZ7um
	oFdK03N8y0alj/ulZDAaZyGZY+el8uQ79D2InMo=
X-Google-Smtp-Source: APXvYqx8bnukVoALLejqBhZMeAY186q67qDxKh/SpAFECauqxwihxzBg4mf41iyp3shktazvYK6kzfLrmwoqQkUXNZY=
X-Received: by 2002:a6b:e50d:: with SMTP id y13mr38805567ioc.142.1555142595013;
	Sat, 13 Apr 2019 01:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
	<20190410185944.0a16ea5d@seebsdell>
	<2cf8ada8df82cb38252db3ff4c45b9f85294c63e.camel@linuxfoundation.org>
In-Reply-To: <2cf8ada8df82cb38252db3ff4c45b9f85294c63e.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 13 Apr 2019 10:03:03 +0200
Message-ID: <CALbNGRR7HZt9Jf1rEhMHd_y4tW4G=f8rUH=9hA9hbfcAY2Yayg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Update to gain key bugfixes
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
X-List-Received-Date: Sat, 13 Apr 2019 08:03:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 12, 2019 at 10:18 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-04-10 at 18:59 -0500, Seebs wrote:
> > On Thu, 11 Apr 2019 00:12:54 +0100
> > Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >
> > > -SRCREV = "6294b344e5140f5467e6860f45a174440015304e"
> > > +SRCREV = "6ebc7d6bc8ab973d0ba949eeb363821811ce8dc5"
> >
> > I would sort of recommend one of the two commits since then -- one
> > may
> > fix the .NET startup failures, and the other fixes warnings that this
> > one introduced and I forgot to fix. But I'm also okay with this one.
>
> That is good news. I've tested and updated to the later revision,
> thanks!
>
> Cheers,
>
> Richard
>
Hi,

If you want a happy weekend - stop reading here.

But somebody has to do widen the audience...

Seems that this commit causes issues on meta-qt5 / qtbase [1]. To make
it worse it seems that only some host configurations are affected...

Cheers

[1] https://github.com/meta-qt5/meta-qt5/issues/187

Andreas

