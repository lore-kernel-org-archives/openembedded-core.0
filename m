Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id CB4897F36F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 14:53:58 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n7so16483997qtb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2UpCSQ4Vtp5SffD0+A2y44HZtmlnueaLIkbRUzl+tEY=;
	b=JXm3RiZNf6qOz2u+jrZz90qN8LG760O9vvJnFr7Q5szMtMD2wvQUna4j/cRV6keUfC
	dpUEx8/wAE8Rdiox+6xOm0VM6haJ+CQDtkkqPYDh+m5t/qT4yGoqAfRdu0dzKMigX0xU
	cuvy2gdKYZzjcgxELjQO7jwnpylLKrLfBQ0xjHqiFZsk9nn6FKdWzJ2ojD7Dycj/W1Zw
	SweFx6CrVgH0yzCoQI6eJvrSTt3N5otu8/ek5POLWsy3UPeE5yBRWI4hoaB/QWaF15CP
	VDYK5aM99914iP4MJF0ITmuoIDbC6HUrPnhTAk+bjVVkw4OXL/oVDvaHzOry7AYJ7gm4
	9q9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2UpCSQ4Vtp5SffD0+A2y44HZtmlnueaLIkbRUzl+tEY=;
	b=JTNZxGaEExWFhpYS4MktYZST5RFzpJtxfHjJ3H3u7FnWwJIXUK4PBXRjMLR8sdMH4X
	KlXWSlbeqfummVpZCl4itFs98IlebL0iGDIG3kxyqHeHoqg6ObEwyqjzc5mbSaXZtyfP
	/EGbtyYUUtcLi1a06cCe0sCHTpLnKkt0Upah3oU5vd420jQ6w34ni/aiEbXvWU9EpjES
	kccBxKgpY2hU/rOhVnDZCZsit6ZPYciECaZDbAdQZ4TwBNnWHdl3sJCZsPC46Avx7/ss
	tbNpKLzpAXN8PKTnJBUti+ya8xzYX9XamkfWN67aJeLrich4lyIL2zGHhtR1873E0wb1
	qNCA==
X-Gm-Message-State: APjAAAXycoAPCDzSRePucC1VK/98j5bOho2N2ykbsF0+GEnilOMsYG7a
	lP8WFWGKGADWYHlOPMNcUOsXI2CIJZZHvvrnmGrOvRfuHSY=
X-Google-Smtp-Source: APXvYqx5qRGSVS+MptdA9mTT/zWgZYHle0QKhR38cgmOncLNgPshmp5kA78ujrB2EQe2A9DVuk387otn8v9uOhLOd3U=
X-Received: by 2002:ac8:7089:: with SMTP id y9mr24003015qto.363.1568040839623; 
	Mon, 09 Sep 2019 07:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<CAP9ODKp8Bmss=NcsPYMgCqKAoKDpPSrCKzA7Tm8FoNOM8tSejA@mail.gmail.com>
	<CANNYZj-N7zt57Gcbfj=0E-dunRwDQSLUfyQ3cpt=8AFHHjVS-A@mail.gmail.com>
In-Reply-To: <CANNYZj-N7zt57Gcbfj=0E-dunRwDQSLUfyQ3cpt=8AFHHjVS-A@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Mon, 9 Sep 2019 11:53:43 -0300
Message-ID: <CAAPZna3atYLmKGs1tXVq-ZujAN=BDgiQ6fcmAKGcU_wwuEgTGA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Mon, 09 Sep 2019 14:53:59 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Alexander!

I sent a v2 with python3 in depends and dropped the patch.

Thanks!

On Fri, Sep 6, 2019 at 5:33 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Fri, 6 Sep 2019 at 22:12, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
>>
>> > As I had previously suggested... can you try adding 'python3' to DEPENDS of mesa, and see if that helps please? I think that would allow avoiding this patch altogether.
>>
>> Why a new build dependency if this works just fine?
>
>
> 1. Less patches is always better than more patches, especially if they are non-upstreamable.
>
> 2. The patch reverts to something that meson has deprecated and will likely remove in the future.
> https://github.com/mesonbuild/meson/blob/master/docs/markdown/Python-3-module.md
>
> 3. Meson's currently supported way of detecting python does in fact rely on python's target configuration being available, as it picks up settings from it. I had fixed a similar issue elsewhere recently.
>
> Alex
>

