Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE08745BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 11:23:50 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y20-v6so1605079edq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 04:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Dm2dcyd76Ri9lamOMd4B+MnQ0onfAe/HO/cmh0VzRWI=;
	b=q7mrd9ZziSL+hUT608sdVhcNpTl/RXHx7fJZcws3ZUUCiIp80KBsOxzQ4s0oL8yHkB
	jmoovayHI9oVv1KuIp1WcrrkXsHSRir6SvaXYZw0YhoYpclhkVNtiB/d4OX41QeRzbHB
	suXxQUDpSkJ9460gCmFLiZl9ZvnE9pP4KIChH69sjbxA9ft32vyROa3GvXo6ytPP63yx
	Q470blw2pqhAwJKjGDnePV0ybtPGUKIg3x1KdOXm/VKZcr9b8MSmapJ8kBrRd8J6SN/1
	d/usIb/0UUbC1nD64xp5vPfe6wOMR2oidwP0ZlDjOO2LD/PSOJoIulScV4BsmCi+M+yD
	GupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dm2dcyd76Ri9lamOMd4B+MnQ0onfAe/HO/cmh0VzRWI=;
	b=gVYFv9dv8WPaO/7V2Cm9bCCeWEsvz9nG7m78im2Bp5dBowRiz9sAO0WVSWTswBYxAw
	3BBHS4u+Q8rsbgWu3qq2qrRldU4/Dxw0qKs6xBf5xYjMDu0AHhHgVhC0P2LhsY3MNFIK
	V+fPfDiXHkNcyVgj/D7ZPU5ek6THQuYP+MjUd+rELZisWjeB73NhsyH09e48lQksSdjs
	mPYrANc4tnbqLFAW/53n1c3u3TcZxnWA1Xs2LefoW8niXhX+TPWjkWw4UlGTs2mUnO+r
	qs7hdqgQ3hg73NfPdUZs3i0CvzD/Ak+tiM0bssFsD9OmaYglVPTkIGKwZ2sSUuMk0U3r
	qdcA==
X-Gm-Message-State: APzg51CnVL+vfGHUD/ZLlX71xD0OiVafWCEftFK1DhO0mDKQQdjI10Oh
	1egXdqUzVsFyceJ3O5m6xQXwWGmT2kfO1QNB5so8tw==
X-Google-Smtp-Source: ANB0VdYzEvVBsgTDEJxJUC0Broa05yqJzlXCEBOW3M40q0p3G/MWpRkizQyv3uLlcevmclCnLK3q6CH92lRWGWyHAz8=
X-Received: by 2002:aa7:d78c:: with SMTP id
	s12-v6mr48450879edq.69.1537269831236; 
	Tue, 18 Sep 2018 04:23:51 -0700 (PDT)
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
In-Reply-To: <37465946-772d-7f4e-d5e0-a98e69d15f1a@denx.de>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 18 Sep 2018 13:23:41 +0200
Message-ID: <CAMjhiJg4TDe93fytjKGVbYCL+eaOH2NeFtkSfv2sK5FfZV7U4Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Sep 2018 11:23:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Marek, Alex,

On Tue, Sep 18, 2018 at 1:19 PM Marek Vasut <marex@denx.de> wrote:
> On 09/18/2018 12:59 PM, Leon Woestenberg wrote:
> > On Tue, Sep 18, 2018 at 12:38 PM Marek Vasut <marex@denx.de> wrote:
> >> On 09/18/2018 12:22 PM, Leon Woestenberg wrote:
> >>>
> >>> There is no exception for INITRAMFS_IMAGE_BUNDLE in
> >>> kernel-fitimage.bbclass. The initramfs will be packed inside the FIT,
> >>> in addition of also being packed inside the kernel.
> >>
> >> So why would you use initramfs_image_bundle with fitImage when you can
> >> pack the initrd into the fitImage instead ?
> >>
> > To be honest, I do not know that use-case anymore but it's a valid
> > configuration that shouldn't give an unexpected outcome.
>
> True
>
> > We also found a use-case for non-compressed kernels in the FIT image;
> > that was for very small delta-upgrades even when kernels are FIT
> > packed. Currently kernel-fitimage.bbclass hard-selects a compressed
> > kernel (such as zImage).
>
> Patches are welcome
>
Thanks for explaining the rationale behind the deploy stage, it
confirms Alex's suspicion I was solving the problem at the wrong
place.

Alex, if you are still reading this: the answer is yes, please revert.

Regards,

Leon.

