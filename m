Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.4573.1587991336463113430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 05:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rbmzu1iO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id b11so20354639wrs.6
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 05:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eMxEx0qoHg3YRcTalvp2miQMh7eajA68HveJm823KAE=;
        b=Rbmzu1iOBp8lEpt5jvrwPU+X/srHHAm2/htNdSgbXxGClrGPDsU8ro5sgZjQ2/O13C
         zPPmr0DmFLKQpq9GUnFTFZHEAWh8CehkAJzMpTQBADc1ip67YQK55Z5U5G36D+r+gTXF
         P02YnjD+oeb1tA5rtjvhiv5cR8oz7x48f0CzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eMxEx0qoHg3YRcTalvp2miQMh7eajA68HveJm823KAE=;
        b=mRQ42oFQ2LU9zI1Z6J9Sg+yzEGLDrhPjqtD1Kmuk1zcfS3FICUJgbvibqEtmi1Dg+8
         TkfmavBsBDyNUXP/G963McDODEfnnPeHtqL/JTMrZZAXAZxMmfhrvVbFuZMXofBvVksY
         JPWXkSjW+9XmydJPSDaHqgLOuVuwwr3gXq3PE1C3rsJa7MbM9RJM48ig16y3VgaLTUEb
         /pcRmmGHfX2fH5qDSAtEXqFMuMD1omVnj2l30iWpNBgUlmpyiMfc2QJzvskOmzpMUIFW
         b0/wDZIQUENp+Ne6WoDoeWo7gQZ3hUUIGDHc3M0fKtvRzLNy+ftVgSOWXzl0PflSO0SX
         yiFQ==
X-Gm-Message-State: AGi0PuYcQAj8NIoRmcOTzfpVyha4b2gGQ/Hz9a4XR8pgx28ENqqSCkUJ
	PWGWXOflZ8wX9eky0f0kSNZbVA==
X-Google-Smtp-Source: APiQypJAJ4/1vgh//B7lozUZ+QZP+o4s2wNvfEqxUQ7IPV/nMK1OAzIQllkTAbSN5tVCgWkmq8CKtg==
X-Received: by 2002:adf:978c:: with SMTP id s12mr26632667wrb.312.1587991334941;
        Mon, 27 Apr 2020 05:42:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s6sm15205693wmh.17.2020.04.27.05.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 05:42:14 -0700 (PDT)
Message-ID: <8c6ab2c0dccd4d4f86b04faafa18eedde1224139.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Adrian Bunk <bunk@stusta.de>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2020 13:42:13 +0100
In-Reply-To: <CANNYZj-XKoLUSwT0tNKj7i0DMYYHi249SFERFrP-g+Yz74CFHw@mail.gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
	 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
	 <160972188EAFC253.2907@lists.openembedded.org>
	 <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
	 <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org>
	 <20200427090911.GA19242@localhost>
	 <CANNYZj-=p9Ov7JJrDOAHZcFKu4m-aiYURQ4_mYLbBNT_R1T=AQ@mail.gmail.com>
	 <20200427100816.GA27417@localhost>
	 <CANNYZj-_Z_Kd5=6UbvMg5c-2T1QCrCuvexy+7RqzhWOZfRtArA@mail.gmail.com>
	 <39285fa7c28870730f023b1b93399dbb54854a67.camel@linuxfoundation.org>
	 <CANNYZj-XKoLUSwT0tNKj7i0DMYYHi249SFERFrP-g+Yz74CFHw@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-27 at 14:33 +0200, Alexander Kanavin wrote:
> On Mon, 27 Apr 2020 at 14:30, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > > I still don't understand this. In both cases, rpm-native is compiled
> > > (not taken from sstate). In one case, it fails due to missing omp.h,
> > > but in another, do_compile completes without error. How does sstate
> > > influence this?
> > 
> > Have you a pointer to a build where this succeeds and one where it
> > fails?
> 
> Yes, from a few emails back:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/1812
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/2073
> 
> I can't ssh into that worker for some reason.

Ok, I can't either.

I've removed the janitor from centos-ty-4.yocto.io, added the patches
back to master-next and then triggered non-gplv3 and poky-tiny builds
of master-next on that specific worker.

That worker is backed up with jobs so only one is running right now.
When they complete I just need to rescue the build from the cleanup.

Cheers,

Richard

