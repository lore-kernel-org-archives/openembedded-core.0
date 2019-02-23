Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF447C6EC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 19:58:25 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id i5so3113337qkd.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 11:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TynxZR1SKRcE7d4xhCnrLnJq6VR6J9dcnykK9dIL+nY=;
	b=FJ67PIUqd/pq4DtoS18kowBVXAvCcee/zb4QM7Xidywu2269H/8uwX5+yDuOc71YyP
	i1sMn4gPUhN4X6RTBiMxoA+PwbvBRMnbKZiddJ2pmltjYwOkLMJ6LxsJZ0pNuWNa8Dzz
	ifxU3XG/tN/X2z98Z/5MxOc0ETI9wUG0YvMLhdNj+j0qTPkCsbB+7Je1xd6RXwqcJF+r
	8ov4+rDN6ooF1qu5rlH+t6z2OK1W6jKA1ut9eUvIhAGnPvHj5DEXJTWaBdOtHs9ZUcqj
	HVnIB9H+KpLhLG7O/BWI/9PB02Ilz1VhuNX7nyw6DQ03++nxn9R9ihUYkKuE/6FBlzpq
	DTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TynxZR1SKRcE7d4xhCnrLnJq6VR6J9dcnykK9dIL+nY=;
	b=qhvWUsT+Mpb/xsMGJ7k5U2+ehRUfntvUygACcvPcqhji6ILe5/B/Uz3aknQ4atHqsP
	QIfcvXCx9YodEQhc+uX5Avz9nI105G3jBSNGjwyZyS7NUMFJVfqKVITiI4b1M3xKVat7
	e8gUeIEDpuh+GGRA9DllFUtDZ2Y4DYgpwgi3I2EItvtz3XlAulXdS9l1nOT0IBTR/NU1
	kPIqIXrEQTee1jaBXL3DJx0hW/99+HhS519CXL3SYkuwif3dqh65SEybqICyAVxHMJpq
	F2j+OvXqA/8n5cLHF55nIMM3if0ZzoOLqRwEhjOjIkHm37jFLjpj+Rca3ya4Ejsxqkks
	/vwA==
X-Gm-Message-State: AHQUAuY1O6ofcmor2cSiM968TKUyszUmC+TVuSrGEp0Jdv3TUOESPhZf
	ada+sllW66vRmldx/r2m4uQvlzc22TYoI39GL7E=
X-Google-Smtp-Source: AHgI3IYE1UNXkWJYqP9xcah1qZzBbXL3VWEftxyaj4kwt+Zu6pyr+ooyCiJc9PXG7ENabAifF6jor60wdQg8Eprp1Bw=
X-Received: by 2002:a37:4c88:: with SMTP id z130mr7556239qka.206.1550951905711;
	Sat, 23 Feb 2019 11:58:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550845989.git.alex.kanavin@gmail.com>
	<bd7acae5310c012ee39c5142fa0059c88fcc4b57.1550845989.git.alex.kanavin@gmail.com>
	<CAMKF1sqHzK6Q8-GNLV6Yc5_QuWjKaUMWO==twypXYmRtmvGpKg@mail.gmail.com>
	<CANNYZj8pxkyaYwp+Ob2ZzH=G2iA=F_E1PzOz-L4-q5LdC-C06g@mail.gmail.com>
	<CAMKF1sr+UW3vBu3p+5-mWK89VU0LYVHo_O5vzopb7131bQLNBw@mail.gmail.com>
	<b333823bfa0d9a3b34a02fa49d23002048fe12e3.camel@linuxfoundation.org>
In-Reply-To: <b333823bfa0d9a3b34a02fa49d23002048fe12e3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Feb 2019 11:57:59 -0800
Message-ID: <CAMKF1sqcSUWyem7Yb0TeR0zjmGazNP+k0EriDq8KkK6dS5gt+Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] virglrenderer: add a recipe
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
X-List-Received-Date: Sat, 23 Feb 2019 19:58:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 23, 2019 at 10:07 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2019-02-23 at 09:56 -0800, Khem Raj wrote:
> > On Fri, Feb 22, 2019 at 11:11 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > > Probably this is the very first time virgl is built for mips :-)
> > >
> > > Note that it is useful only if you intend to run qemu on that
> > > platform, so I wonder if we could just blacklist it...
> > >
> >
> > I would have thought world build should have caught it on AB for
> > mips.
> > Which tells me it could be
> > musl+mips specific
>
> The AB does not run world builds for everything. It does them for musl+
> qemux86, musl+qemux86-64, qemux86, qemux86-lsb and no-x11 if I recall
> correctly.

Thats right, I meant to say mips/glibc world builds, I think they are
run regularly
and should have caught it if it was mips specific and musl builds
should have caught it
if it was musl specific, so its probably a combination musl+mips which
causes this

>
> Cheers,
>
> Richard
>

