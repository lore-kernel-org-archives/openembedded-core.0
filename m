Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 61C7879605
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 10:21:50 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id h33-v6so1447302edb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 03:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FYvNNA8KZ8fEZ038ZPjjv7C3WGT0oLohXS+PD0XaJZA=;
	b=ACGsyDpHgnbX4+WMpGesKUYvYxvMgWS4DV7qiRYYIvJZoaLvBI/DsPhIPHBLYhIWz/
	yL2fKCeuQWGhErURjds1Q44UyQQ7eicUaSwV0FAjaztK5NKv6BCjIrWd6XvSqgOZle3P
	b2RX4H0YIC1HrEbzXD9LsMuViQoZmb6k2Ityob+IDu5LQrt+hRAJ/MGu6mPgV6zEcDkr
	Tz+F9jEvRgT0YhiMHU0FOgqPNvrSyxK1bbEpyyLncrR6MzGg0sG4/KoUQRnoSReSjp8M
	du2LS9AfDwIlJo82wT5uVDME7qJFoEYoiIBQDqAL3x8Fs/Bd1Q+hUP4tYOIsTy71tWeK
	B7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FYvNNA8KZ8fEZ038ZPjjv7C3WGT0oLohXS+PD0XaJZA=;
	b=uWvk6Vi5MUel+gdLKSQ8boX8Ao6svCs/5qZ6ZkwneHXzrGNK9fabZdGocAEJY43gOC
	+A5C1qMF+vA+ZGy7L66DhLocQqUGGjobLKSEVU1S93cWy5JC+0tiNVEXEJLyGRdrNpU3
	qv6SXwjkjCSGsiawll8Llu/xTd5IwYqyszWZ97CBU41cf9ogIhiJqfVykxV7/RFVQ/ZB
	hT65e/cXE5kkZIPWx42Mqin5E4d6tIEfx6gb0sPLEh2WhvZC/SC89U8wx5ItgaTgFqMs
	WoxHCkeUczTkhmCNw5VZNwsXJ+ViqxoWzdWjo+SHEB4D2kDkZ/jR/8fM1VDMHa3OUv99
	ur8w==
X-Gm-Message-State: APzg51C/oLgWAstY7LWGvP8PPfJu1/rOeZxA2AlWE7a7RL0fxXdmo/TA
	HHJbxpLUpxzHa10Ke8YS0z4B/AvOKz5RzNfv2oodjg==
X-Google-Smtp-Source: ANB0Vda/X63h7rUFJwTZGepWpnGy8JqsqUIEzDUtDBrF/zU10Su8lzYdPpKp/3zRDbTC7viJTPbNx0vgW2RS/Knxksc=
X-Received: by 2002:a50:d619:: with SMTP id
	x25-v6mr49969744edi.178.1537266111039; 
	Tue, 18 Sep 2018 03:21:51 -0700 (PDT)
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
In-Reply-To: <CAMjhiJgR1xe_uikpD+07pKDjeBw7er6efV04P3ygMAPfnTUu6w@mail.gmail.com>
From: Leon Woestenberg <leon@sidebranch.com>
Date: Tue, 18 Sep 2018 12:21:41 +0200
Message-ID: <CAMjhiJho48VP8eySMUg27Y2RDvCesB+W=hSf0i1=VbazdDLBcQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 18 Sep 2018 10:21:50 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Marek,

On Tue, Sep 18, 2018 at 12:01 PM Leon Woestenberg <leon@sidebranch.com> wrote:
> On Tue, Sep 18, 2018 at 11:44 AM Marek Vasut <marex@denx.de> wrote:
>> On 09/18/2018 11:40 AM, Leon Woestenberg wrote:
>> What bug is it that you're seeing ?
>>
>> > Whilst cleaning things up, my understanding was that
>> > kernel_do_deploy_append() in kernel-fitimage.bbclass deploys the
>> > fitImages, along with the .its file etc.
>> > Maybe I was mistaken.
>>
>> That's the case, yes.

Am I mistaken or is my assumption correct that kernel-fitimage.bbclass
should deploy the fitImages?

Regards,

Leon.

