Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id D395A6C2FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 11:10:34 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id g85so2724327ita.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 03:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3jh/LqKtaYpVMajMRnqzilU/88ZFugl/jRI+huPijtw=;
	b=gMt/S4NaTQYbPa7jQ0JnpUT0ILf/guI13VfX0PO43Ca6DtC1QFaicNRyXzX28TF09S
	XFa/hacxY8f0NpG9c1rbPT2SY/BD0CMZ5AFbiz9X63OdykoAoEwxtgazbQ6+1f2Hkji2
	SuyCnv72b7GPE2n4sXPxVD0FREKmzab3CUouGgHDhWxhHLsR9K9IGGZzy9gc1OJva2/V
	gOBaS7f5rXWOtlpy5iLgdtguFI3adQlbHgKyvXeDrJTVAKJNo3lDhYXoHGEcVNs0eUuc
	l2f8slBrZodg6BB6TGvv9bEj24W9EPl+Vp06vdpGL4dhMPm9phMPl0pWL2q/NdHjUHKT
	Nhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3jh/LqKtaYpVMajMRnqzilU/88ZFugl/jRI+huPijtw=;
	b=SVZX6McCLlgpsiyLgScYC/Zro15C++LpmoBCWGhQCunJ+2w3wyWnz7YHm9pU9BIxLv
	kw3DNATMvJzEZ0SzbfCuM8iztC4UCKnlQNv14StQpPQnNXyjXTjksKF0dJQR+D6Gf1S4
	dqKj+IRoI4vdYIpgVFclAh115uvZRSHqm3miWO79YaYZRQeliz/31rBnU7KAgi6QSwUe
	B1QwcQG4Mnz3lLzu6clJ1+7lDKJgpowMN5gmg4lzWrdX0k3cxQBGJ1x89TWuSRAxStjO
	M3h+iVk/fb9jv2ATEMZ8UMKoPUyoLPHTvk/DSlSoAjCm6VrsywPm3iXusIrTd8nrAFKx
	YMOw==
X-Gm-Message-State: AGRZ1gKol2+vq524UGvydb4eofNKZRwla7kKd8dithfXVwpCEoR6MEvw
	2l6sd22/vjuqEIanOo4nsP8IxOzHLM892Nd3GYeovg==
X-Google-Smtp-Source: AJdET5fXuSmc7k+Zns5TF9zPWUSAubaiMwDEmfEBX052U/9r/CqfEmkNkQBMzagTQph0Rpf8DGKY/Xb1AHQFETJpLA8=
X-Received: by 2002:a24:9142:: with SMTP id
	i63-v6mr1888753ite.130.1542712235536; 
	Tue, 20 Nov 2018 03:10:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542247292.git.Qi.Chen@windriver.com>
	<61202575a1c0b4be44534526dd22fc85c9dadfd2.1542247292.git.Qi.Chen@windriver.com>
	<CAJTo0LZi1ouNpFqrhQ0EhwWfXcX3By54-YCBY6wuifaOjBmw8A@mail.gmail.com>
	<892aa2af-472c-e653-a3f0-129d6fdd78bc@windriver.com>
In-Reply-To: <892aa2af-472c-e653-a3f0-129d6fdd78bc@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Nov 2018 11:10:24 +0000
Message-ID: <CAJTo0LaENzuvZSr0QMZqPqwWv-XQ0P0zuuHH=Lp51fOCXJb2WQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 20 Nov 2018 11:10:35 -0000
Content-Type: text/plain; charset="UTF-8"

My point is, if there's a better host then lets send this upstream.

Ross
On Tue, 20 Nov 2018 at 01:45, ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 11/16/2018 01:43 AM, Burton, Ross wrote:
> > On Thu, 15 Nov 2018 at 01:57, Chen Qi <Qi.Chen@windriver.com> wrote:
> >> Use example.org to ensure it's always reachible.
> > Is this because of China's firewall?  You'd think that google.com
> > would have excellent uptime.
> >
> > Ross
> >
>
> I guess so.
> I agree that google.com has excellent uptime. However, I think
> example.org might be better for ptest.
>
> Best Regards,
> Chen Qi

