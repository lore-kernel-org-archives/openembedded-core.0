Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id F1FB879641
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 14:55:21 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id h23-v6so700387vsk.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 07:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I7DyGoRcJJPVr6bVsyZN/zpVt7TMZu2D6UPNVPgD1RI=;
	b=GJXOfSfTVAWiiigfLqozrP2jtU+NaQwh5UywjurFsEWGKzCk3J2YmIpvOdqmiQg9YV
	Trp3mqzHTdsZqUeFEYKwVFN50ClpzZCvXgVc3iQrGYiCtQlBE64SrAgoO9IM7uN6Y5fj
	8p5wtY3UzOCJAz5T9BXdfVlqx6Q8A90bM1GZU1IS9TMkeAKoofvDFQELiWUGLT6/WswP
	QtqHQL5dWc9rHxAwYrWUIkHrIbym8Bcn43Pgu1wIdKqPFgqC6T3spUGd+ZGKdDa/dtEZ
	JBMKR0fHxPGKef8VCIszQNQy3DTDlot8K+fD1ikyxxCQ+o/39S1wjuUIbauc/cMZzubN
	lRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I7DyGoRcJJPVr6bVsyZN/zpVt7TMZu2D6UPNVPgD1RI=;
	b=XAAwk+rLl0sYCbfcHRUlB+OrsvnFGcs3pUsW9+Az/tY5wdGxfTJTfzeTzJrDxWFux0
	9x8e2JFMIXYirlCHuA5Ph1AiNu2iF8AuAPJosAHAPMzNh0eWbdreXEnxjFegUfuM3YIx
	rmko/OStFrcdq8QHJE2Jfu2elNaxL8hfSX+LT2LUNL+9qIvpBk0V32+4AdNIy4bfGhVE
	AOZXJFFyFRfHXTBVp00ib2f8IRu/Iv4WXEGEyEYBjyEAo4MfhkwY80o5S+La+Lt2jm/B
	m15IMmwaxnMXho7e3r1rwiTYDNuYglMAF0CGmbuKDwwSvQs90OEThkj3Z9D3rtYlvPBg
	4kMA==
X-Gm-Message-State: APzg51CYvNJ7mnrOj+Gu9jnXWIN2sfcawIWJx6iCmGc2wwGmvjTrgbN0
	snYrZu3gWUFiqLQ+aJjMrJhS0hMXChLSeExdHR8=
X-Google-Smtp-Source: ANB0VdYqie7k667ZXIJtETti8AoAv6skiNJ3feqDoleFbooR6diAe97P7E+hxsvtY1Fr+tpDeEvMPomJTLw0TSpCwus=
X-Received: by 2002:a67:8658:: with SMTP id
	i85-v6mr8575622vsd.98.1537282522825; 
	Tue, 18 Sep 2018 07:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
	<CAO5Uq5S43E3cXUSEVJP8-dKtuqR-XaqrN+6fhHfy6QESLRh7_w@mail.gmail.com>
	<AB33E724-81C2-43BC-8169-6100CABAA375@sidebranch.com>
	<CAO5Uq5ToXbUR2Pv9PwQOPp-F+5CbwvuPwy84Kfz7HWUzx2ohFA@mail.gmail.com>
	<CAO5Uq5Rws0YP5_y-CSXhKKSrHe1BZiSQsYFQHH9AABFgjKWv=g@mail.gmail.com>
	<4F5C8364-78D3-41EF-B239-B641651A2F64@sidebranch.com>
	<CAO5Uq5TMF-dTZA=dS4QqioRGvycNWeZHC_QWh6FViohLrAy76w@mail.gmail.com>
	<CAMjhiJi9awJ-WVs+Y4V=cqy8JT+qbb=5txQzFVM741inkmzFuQ@mail.gmail.com>
	<d36ea830-9aa0-5e3e-140d-d0e2788175aa@denx.de>
	<CAMjhiJgR1xe_uikpD+07pKDjeBw7er6efV04P3ygMAPfnTUu6w@mail.gmail.com>
	<c2748bb0-22b3-0f25-72e7-519c940e2430@denx.de>
	<CAMjhiJgRa6_z3AGZWKpA7sgtLaa4mYK_-b05-t0aimsDKyo7dg@mail.gmail.com>
	<da056905-c114-097d-8dbc-f4a398872933@denx.de>
	<CAMjhiJjimOmzdcYa7kgh9Ff0WdTh=TXD0tROTF08o1pDRC_QVw@mail.gmail.com>
	<37465946-772d-7f4e-d5e0-a98e69d15f1a@denx.de>
	<CAMjhiJg4TDe93fytjKGVbYCL+eaOH2NeFtkSfv2sK5FfZV7U4Q@mail.gmail.com>
In-Reply-To: <CAMjhiJg4TDe93fytjKGVbYCL+eaOH2NeFtkSfv2sK5FfZV7U4Q@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 18 Sep 2018 15:55:11 +0100
Message-ID: <CAO5Uq5TK1vpLQt57Z4ZDZzGOV1x_8VXaNWHKhT-XgpfBvGowZg@mail.gmail.com>
To: Leon Woestenberg <leon@sidebranch.com>
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Tue, 18 Sep 2018 14:55:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 18, 2018 at 12:23 PM Leon Woestenberg <leon@sidebranch.com> wrote:
>
> Hi Marek, Alex,
>
> On Tue, Sep 18, 2018 at 1:19 PM Marek Vasut <marex@denx.de> wrote:
> > On 09/18/2018 12:59 PM, Leon Woestenberg wrote:
> > > On Tue, Sep 18, 2018 at 12:38 PM Marek Vasut <marex@denx.de> wrote:
> > >> On 09/18/2018 12:22 PM, Leon Woestenberg wrote:
> > >>>
> > >>> There is no exception for INITRAMFS_IMAGE_BUNDLE in
> > >>> kernel-fitimage.bbclass. The initramfs will be packed inside the FIT,
> > >>> in addition of also being packed inside the kernel.
> > >>
> > >> So why would you use initramfs_image_bundle with fitImage when you can
> > >> pack the initrd into the fitImage instead ?
> > >>
> > > To be honest, I do not know that use-case anymore but it's a valid
> > > configuration that shouldn't give an unexpected outcome.
> >
> > True
> >
> > > We also found a use-case for non-compressed kernels in the FIT image;
> > > that was for very small delta-upgrades even when kernels are FIT
> > > packed. Currently kernel-fitimage.bbclass hard-selects a compressed
> > > kernel (such as zImage).
> >
> > Patches are welcome
> >
> Thanks for explaining the rationale behind the deploy stage, it
> confirms Alex's suspicion I was solving the problem at the wrong
> place.
>
> Alex, if you are still reading this: the answer is yes, please revert.
>

I am :)

Thanks for the discussion... I'll send the series I've got - whilst I
was about it I cleaned up a bunch of other small things in the same
area.

-- 
Alex Kiernan

