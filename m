Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id BCA877964D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:59:55 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id l5so1512656edw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BsOa82XV2RxKP+Bw8IEdXkROGjBiw9uXAyvSlmsP0qM=;
	b=UVES+TZtkMxJbAjbpE4bVTkQLZ+l5Z35kfDTY5RNYE7T6ZH/f/RIFAqi4y58aw34lO
	+ILJ5MwZSM1vJrJuxpncc6hESrzRR/xb9tWoNT7pfc3swzZKwKDki9xdwnSsiDC3pUx8
	Yc6ormAhwbW1cXRKavcFI5Su1cKFsrrCQFVaeU8h//FAP4u24okBO1lmy4OU6fgXDu0y
	OvHF36FTARFmjYuIqcbBCCSj9sQNMWmbyb3J10Xp8O8xyRIRDS05u4+p+6WC/phbwNKn
	83FAGL+uJn0ZC7K5mCcUKMP+HO+Y4iFQ8MbYLFTgr2/BnKGj64mg5b8ivka2C13qlBZU
	Vzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BsOa82XV2RxKP+Bw8IEdXkROGjBiw9uXAyvSlmsP0qM=;
	b=RMDycgs4JK1Ti7XMdxVHOScgL/0mEL8cWtuTyyJb8apOxXE+2QAYMknBe73zDvDQb0
	MzprEHtJicvrq8KjZGhLRjTDHzyaMLc1PvZGUkbbzI7qTueSEcBqeAgPfeO9NoQNL64R
	ddNWWeQVGJjPEjH31BmZTzgOzN541cOj24yCmWzBaqgzEJkk7ZRaMQGXmRi0qPavb1m5
	qjWZ73oYuENZJTHQuj/vFcMfUttskex3nZ2LIIL4BDLvguFPd01bogetXY89RxSLxAbP
	7P+oR8TJq8Vi13F1sAOMGqR+h/DY7Y8Oh1au0t84ZR4oOo9YaNzsEJNf0C3oC4b+WzSX
	OGqg==
X-Gm-Message-State: APzg51DzPlL3sdC7CHUWCyK5uduVexNPFsNwNdC7IoNoZa1Jku5Mttgz
	bayuqJ9CwYrykPhsNeYs44O79Ks6oX0dVTUs0JRhUA==
X-Google-Smtp-Source: ANB0VdYfqe6/OYeCBZrp9Hn5H/bicAjexYDLxyv6CUL4PQCsAD/juXbsCcFALHG505uLy1TDRStBJHtZESZGFUELwLU=
X-Received: by 2002:a50:c101:: with SMTP id
	l1-v6mr48069012edf.126.1537268396287; 
	Tue, 18 Sep 2018 03:59:56 -0700 (PDT)
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
In-Reply-To: <da056905-c114-097d-8dbc-f4a398872933@denx.de>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 18 Sep 2018 12:59:47 +0200
Message-ID: <CAMjhiJjimOmzdcYa7kgh9Ff0WdTh=TXD0tROTF08o1pDRC_QVw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 18 Sep 2018 10:59:56 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, Sep 18, 2018 at 12:38 PM Marek Vasut <marex@denx.de> wrote:
> On 09/18/2018 12:22 PM, Leon Woestenberg wrote:
> >
> > There is no exception for INITRAMFS_IMAGE_BUNDLE in
> > kernel-fitimage.bbclass. The initramfs will be packed inside the FIT,
> > in addition of also being packed inside the kernel.
>
> So why would you use initramfs_image_bundle with fitImage when you can
> pack the initrd into the fitImage instead ?
>
To be honest, I do not know that use-case anymore but it's a valid
configuration that shouldn't give an unexpected outcome.

We also found a use-case for non-compressed kernels in the FIT image;
that was for very small delta-upgrades even when kernels are FIT
packed. Currently kernel-fitimage.bbclass hard-selects a compressed
kernel (such as zImage).

Regards,

Leon/

