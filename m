Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id C9E337C723
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:59:16 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id m1so16630702otf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=9G631zC24Ghc8i9kKVCsZxORszsdKTgPD7FYT+GKHL4=;
	b=P2GGODHstLzogg1qRmPcivnWbt2osx1f5YaNDbaZZ1vLO4Qln7XRs0znSXP2xjsgcp
	vSkddDR4mhMCJWx/Ysgh+ubZJ8eS8prOyXmEpgVpmeMMiXQTDAi2q/BOv6rwwMfzZVYM
	/kCXgDuqSwgVHdFa6uVH55hilm5IGQzzaiPSMaPKkqFGqzqGccnO6F/ePGe/HhrRzCFg
	jn0GdpiSfUOmypBQq059GkZYCxW5b9nreP8awg+/lNd1886y3STpDXpDcuhy90ehXrGt
	tu7hM+VZsSHIOGHVzAy0inaiQzDtQy6VQiUidNEcmUUFP8MuxwnDggM1rWb2mAtQ8FGq
	0wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=9G631zC24Ghc8i9kKVCsZxORszsdKTgPD7FYT+GKHL4=;
	b=OniwlBVlaVMpZ7D+tgm4kvcBpN0xl9N5JHdCSXoT1L2GFhRZtKd52HvFdz2IhiScFF
	N1Tln3lS1AgBPUUzn99dcHAXJyEEeFYGWzgVsmRzjg0cyCYRSCco0ru3Ve29mHeyHhf+
	gmpulsSfRljvzu6jYw2U9ycbvGnbTOROAqeV28zHz1p6Xl6i0SUaipKw6o2bfkb4lo+2
	TEC4nXp21i+zVJBsIvKNtSILdXMVTNLPkztvRgcKjwKJceOialsshUmcanbBgF0uEBfW
	W4PqfjNixxiLT/iPrYP+U3skOk4XARO/E9oUxy6n2ijeFrU9/OPV39gvnGI5MEpP2doN
	2FCw==
X-Gm-Message-State: AHQUAuZ6oKMkxO8HQlULgNnf4tD+Jble8lFCWD+O4WYY5MZTfp5NCi7n
	JNkJk2u9HJXMO5nEwa99tNT8J9IrTRCBLg==
X-Google-Smtp-Source: AHgI3IZedtRSY/QahxVbWQHdRtU9HqeE7Fb8Ye1yrP8I8eL5Qt+6Vdh3GaO7ybScICXTMPSHRhA77A==
X-Received: by 2002:a9d:2f64:: with SMTP id h91mr5794401otb.14.1550239157391; 
	Fri, 15 Feb 2019 05:59:17 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
	[209.85.210.54])
	by smtp.gmail.com with ESMTPSA id d11sm729211otp.18.2019.02.15.05.59.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 05:59:16 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f54.google.com with SMTP id s5so16604998oth.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:59:16 -0800 (PST)
X-Received: by 2002:a9d:1b2c:: with SMTP id l41mr5611640otl.1.1550239156000;
	Fri, 15 Feb 2019 05:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
	<CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
	<CAP9ODKrP3jXE95Z84ne6y0CMOj30g8Jz+53rWX0ikNmJHYoqLg@mail.gmail.com>
	<CANNYZj8-i-HQFyHoiHaJj9XW_pMSq2muP9g=vhkN9ukZXh-dBw@mail.gmail.com>
In-Reply-To: <CANNYZj8-i-HQFyHoiHaJj9XW_pMSq2muP9g=vhkN9ukZXh-dBw@mail.gmail.com>
Date: Fri, 15 Feb 2019 11:59:04 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqi+bcaFt8+7xEzCSZ+=pPFJA8nPZz05WBZL2+hNq5VXA@mail.gmail.com>
Message-ID: <CAP9ODKqi+bcaFt8+7xEzCSZ+=pPFJA8nPZz05WBZL2+hNq5VXA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 13:59:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 15, 2019 at 11:43 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Fri, 15 Feb 2019 at 14:29, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>
> >
> > I am NOT against the switch. I am against in a single commit doing
> > multiple changes at the same time.
> >
> > So AS MAINTAINER of the recipe, I nack this commit.
>
> I have to point out that as the maintainer you are supposed to be
> doing the maintenance work. So if you feel that strongly about the
> issue, please take the patch, split it as you see fit, and send it,
> within reasonable time.
>
> I am not going to do it: this split, when done properly, would require
> separate rounds of testing of the commits, and I've already spent more
> time on it than I really want to.

When I replied first, I said I was going to do the upgrade at our side
and later you guys could convert to meson.

As Fabio pointed out, there are more changes and issues to be fixed
so, we will do the upgrade here. We then can you guys so your changes
can be rebased on top of this and we avoid duplicated work.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

