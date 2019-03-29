Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D0277D035
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 15:33:09 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id w15so4550542itc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZDd/0SS25EUbHjhsN21hWtnrt63RS+HAS4Stm3/w60E=;
	b=SxsNsdq+3RbPu3bJc7nqT5Yqd7FRh+X/wD9honFxNtpJyRLwcRs6GopKOd6/hsgJzi
	ijX/ZibsJXwDG1UNxZaZWtYH+uLuVeJhc0o+MvkXfrJBTjfnFwUx5zp8m9HMpPRrIiK5
	XDqs6LUZZXe54dSU8CSe5NzuQkxEkyMBrNAIhyWQxlYbmnPeJLAKWBSeOKoFG63Cgjbz
	qQ95n6s+bvHvxinAjp3znxvEfuf5isAo4MY+dxQ7cK6vdXZTWPFsquCrCMlyWedzc4/s
	rPLvTQFetgKHPzJNYnpiFg/eJsqSrLRycMc5TI3CaMk691Q/r3CwWVmKJCWH/7p5DlUk
	f0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZDd/0SS25EUbHjhsN21hWtnrt63RS+HAS4Stm3/w60E=;
	b=o4oWt749nOQ5zP2hTrWDbfxRFlJ/0rcfQLIpSENPAFz+yLbSarTIiB/hnxHZazcTZO
	CwJQcqu0GCW0U45Ja5BE4dnz9cZ8ow15gkcp2Fy/JV1+S9lcRV9jXdZPg7kZIe5EdZAV
	khccm2lNLbr6Z8AN5YUNQ/urhDZNJH7VY1Vj2xS2nhbq4OOLHNnrgp6RrA75Ps0xV0Gx
	Au2f48QVPSDA6K0GhOwo8D8um0k+K9uQu43JAIhAXmaNg6LAHq8y7iv3VFnr8eW1dbby
	FepzaCrEXgKSZcBKYZ71JoU/3rzqvjGmMRYU9qGJWRXUl4veYewx9m0bHAX6jPHkRay6
	EVAw==
X-Gm-Message-State: APjAAAVyIOuJYH57C+jg7zW4DK1mblzwZMiU6P/yi1J87cAF/c6HViaY
	sYZzOszL7qzb+0NAp3AscKrMKhPfUgbgFlHU6Zg=
X-Google-Smtp-Source: APXvYqzDxSZU5aBdPImuMEzPZZWRm9m/54IRIll8viNlUBZHadF3xTNGUUDULMqjJbbi4+ebp546s536l+Sw8lKdtgI=
X-Received: by 2002:a24:5c47:: with SMTP id q68mr5038779itb.81.1553873590993; 
	Fri, 29 Mar 2019 08:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
	<CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
	<CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
	<CALbNGRTJYpi90K4VYtSfTq7kJj1Fukvu_iGGx=D-n6hDrNH7Pg@mail.gmail.com>
	<CAJTo0LYQHcaAg=ikVDWSQjBTgTOwTTRmtpKnNUvbuK0UjRuJWA@mail.gmail.com>
	<CALbNGRRu-VFXsZVLU9HeQx232-oDPxRVDKG4EjCvaXhLe87QSA@mail.gmail.com>
	<CAJTo0Lar4HWEaQVZFiUCcvBnnjcam8smPsnR0MrLWgHaSsXFCA@mail.gmail.com>
In-Reply-To: <CAJTo0Lar4HWEaQVZFiUCcvBnnjcam8smPsnR0MrLWgHaSsXFCA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 29 Mar 2019 16:32:59 +0100
Message-ID: <CALbNGRQU1CUfv=R3M1YJKHsdZn6Khsifnw46-9EjTifQoRapDw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 15:33:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2019 at 3:54 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 29 Mar 2019 at 14:51, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> > * The patch you just sent: Doesn't adwaita-icon-theme need a rdepend
> > on librsvg then? If so it is another allarch rdepending on arch
> > recipe...
>
> RDEPEND? No.  The theme just contains PNGs and SVGs.
>
> Ross
Ehm but .. no let's not continue this.

Hope adwaita-icon packs remain complete / have librsvg from elsewhere
in my images.

Andreas

