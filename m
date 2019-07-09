Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id B356B7E7A1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 11:59:18 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id 62so13225218lfa.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 04:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1lHRzx4/MA+COljfvTg3KcgVigs/USeeJPBePE03Wo4=;
	b=IKvAUUXKXefs2GD8VmYVAxEAFaMGLAhWkcn2VUrJRXGTjUFUToX5sERZP5qZbUqYXa
	Uh1F/wNUFpvDnJQvCp1ktELdTtA0hr//uTBIuz94M/I8ChSUWGHn9tm/DvZyevQ0tJij
	17xcrEHKW/h3GrOqv8PwB89W1NyERujj/DgeMDGaQUJR42Mwym3FuSOj1C/jAKloTWB7
	prL2bb+ieFYeUKnsOLTm6ByAftz0GHv4kpFi2Lxhp+lCPhXGQwVkk3gps2ydxHXVV7lH
	CJESQdSwkvkkBVmlnNY+MDUupwGY2zxJVjJx+v2rtHFvGFUHBWZnDmSeFqYIdb7lpxCV
	lQiA==
X-Gm-Message-State: APjAAAWUg9TtOlL/+U4ILatKrWe0BIEPmJFPntdByNwumvPm9fBPYQAt
	QjOvYyu56mOZ4I0l/juMrlfLEIz4A1lB74/UYQs=
X-Google-Smtp-Source: APXvYqwLl7ecO4Bf/PFlzOsjxReyrA8Q6RrsjUTzFrRDI2PRry7X7rkxTZpa/bC0ZfcHmJ2ibOqrdygNpzuuwjsFb1o=
X-Received: by 2002:ac2:44ce:: with SMTP id d14mr10039520lfm.143.1562673559317;
	Tue, 09 Jul 2019 04:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190709084334.28399-1-ricardo@ribalda.com>
	<CAO5Uq5RXK1k23fQZ2ov2vq5pomza=FzVb1umwyh2ArmVez44nw@mail.gmail.com>
In-Reply-To: <CAO5Uq5RXK1k23fQZ2ov2vq5pomza=FzVb1umwyh2ArmVez44nw@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Date: Tue, 9 Jul 2019 13:59:02 +0200
Message-ID: <CAPybu_0E1bZ9ZwzvJ3QaWRxd8fEnmzvS0rkpFF9YhpyuZ725rw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix interface bring-up on kernels >= 5.2
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
X-List-Received-Date: Tue, 09 Jul 2019 11:59:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Alex

That would also be ok. Is this already on a released version or is
only on the "master" branch?



On Tue, Jul 9, 2019 at 1:12 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Tue, Jul 9, 2019 at 9:43 AM Ricardo Ribalda Delgado
> <ricardo@ribalda.com> wrote:
> >
> > With kernels >=5.2  systemd-networkd is unable to bring up the link.
> >
> > eth0: Could not bring up interface: Invalid argument
> >
> > This is already reported upstream and fixed on master:
> >
> > https://github.com/systemd/systemd/issues/12784
> >
> > They recommend Debian to backport two patches.
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> > ---
>
> Could we just move the SRCREV to the top of systemd-stable, which
> includes a change that looks a lot like this problem, but isn't the
> exact same change?
>
> --
> Alex Kiernan



-- 
Ricardo Ribalda

