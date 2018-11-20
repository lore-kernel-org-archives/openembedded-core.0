Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8462A6C48B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 11:10:57 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id l14so922330ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 03:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:from:date:message-id:subject:to:cc;
	bh=4cnGZ00eDXjXOnqKqka7n8oxWx+2qWf6V50xZmQz548=;
	b=WTMhFqGqvxkU6tZkZYu42EFjgHXDa6EOvBYAti+G7QaAepicu46AuPx/+vPWKSL2h8
	oXExe0JJjQuM/2MrUMebj3Hp/l8I9+a0LtVlMWO27cVYn7JCHJkeF2y9adfzaYddnphP
	IEgSx2SiqBggGqzTO9n8INxlxlLnV58Ztvg94/ix5RyIBStLTBlhx0LEPGC5x7xp8W6h
	mtTIb9Bs2lxN1+RPrQRe8LQ6Cw/ac/uQEAM/axbSTZusOIDaIp+EPxcUyI8JleQbMcgZ
	1avTu2cT7Rhe+h1Eo5FSh/dIKyw1/2brjO2mulKdN5AgPssCEYu1CDc7Kto56SN8XsPp
	0hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:from:date:message-id
	:subject:to:cc;
	bh=4cnGZ00eDXjXOnqKqka7n8oxWx+2qWf6V50xZmQz548=;
	b=JlrKCBCVMrUfVTlDZW4ssqQGzP0u1t8OnZ4NY/rW1+E0GsgL6yUOm8+e0HJHTDcT2T
	eih0aai23G06E1K61EXJNjPhPuzb0cEh+2tMT11d8u4k7ux8ggM586p7mRL2sXOO4Gr5
	OsltO8MQ4b8Rs+CQymmiQAsEKd5a9rdkQ0Gf3oZe7uj7yXpwq0lBM2NtsxAVCB7Jhnv3
	CJmz59SAZwe/f/rw1/fWTa9qkh/iBKqkTxUWP54NTfyfWlp0xYC0s83er6AU4CHIwrFL
	9t9xm0E0roIBiDs0cJCGqP9+uKncrX6GTI9XnunOCtS3NkatJB8P6zuIVnHbQ8JLcXLj
	6/ew==
X-Gm-Message-State: AA+aEWaWaTMIgsXo8Xt060NVXpmVng6vO9u4jto6rrhnnT9QGgnirlU6
	JIOi0a3GVFMYPfANK3OFpfzhf2e1fuxNWGJ2q8TYqg==
X-Google-Smtp-Source: AFSGD/UFc6Qie1BNg33boHDBKNuStT6CTxoGi5FMlstb7D7In3NHf019Q4vGCoHaWBFaWHGf1wjcLQ0M14tuhbICsF4=
X-Received: by 2002:a6b:fb19:: with SMTP id
	h25-v6mr1060498iog.270.1542712258582; 
	Tue, 20 Nov 2018 03:10:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542247292.git.Qi.Chen@windriver.com>
	<61202575a1c0b4be44534526dd22fc85c9dadfd2.1542247292.git.Qi.Chen@windriver.com>
	<CAJTo0LZi1ouNpFqrhQ0EhwWfXcX3By54-YCBY6wuifaOjBmw8A@mail.gmail.com>
	<892aa2af-472c-e653-a3f0-129d6fdd78bc@windriver.com>
	<CAJTo0LaENzuvZSr0QMZqPqwWv-XQ0P0zuuHH=Lp51fOCXJb2WQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Nov 2018 11:10:47 +0000
Message-ID: <CAJTo0LYGWOZuK2k18C8w=NR9nm4e3RQAYdp6Uh5sp+GagBz-JA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] busybox: use example.org instead of google.com in wget test case
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
X-List-Received-Date: Tue, 20 Nov 2018 11:10:57 -0000
Content-Type: text/plain; charset="UTF-8"

Ignore me, you did :)
On Tue, 20 Nov 2018 at 11:10, Burton, Ross <ross.burton@intel.com> wrote:
>
> My point is, if there's a better host then lets send this upstream.
>
> Ross
> On Tue, 20 Nov 2018 at 01:45, ChenQi <Qi.Chen@windriver.com> wrote:
> >
> > On 11/16/2018 01:43 AM, Burton, Ross wrote:
> > > On Thu, 15 Nov 2018 at 01:57, Chen Qi <Qi.Chen@windriver.com> wrote:
> > >> Use example.org to ensure it's always reachible.
> > > Is this because of China's firewall?  You'd think that google.com
> > > would have excellent uptime.
> > >
> > > Ross
> > >
> >
> > I guess so.
> > I agree that google.com has excellent uptime. However, I think
> > example.org might be better for ptest.
> >
> > Best Regards,
> > Chen Qi

