Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8C35660268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 22:33:38 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id 2so195755333vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 15:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N+PDgUo4nQaFJRBUnmc8cHtkKqPk2Av9h3VNj8O3SZs=;
	b=kJ5BzPPJt9DPGasxs4Db2gLvII8EHRWwWJMBVOKfllUy6XkTuMRz4c17ukCxujnPAL
	OdCuWmB734SdPry4O1DrWbu3Xln74DvbkpJfgUnFjSklrobdsYXMe9gy1B8TOZexDWB6
	A+GW1WrcPZlxYMbtwPPFEpsp+ZaW6jr9bacgr6wrhb7Trs7GkuTJ7n6VuzKLXUKDGg24
	OzVorpmZYHNntwmiGmwTKWr6HwmRbMo+PQk9ga+K5/PkluM2DzHBngdrWQ5RhZOC2ZXe
	Je03Mxax2EJne2SLoMOlgawO2z/hol3Kb/ch12eb/BAk2LuHJhc6wu0WeoCtu7jX5HMd
	R18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N+PDgUo4nQaFJRBUnmc8cHtkKqPk2Av9h3VNj8O3SZs=;
	b=WvwNal7CO35jDsTNv4OLbogA3mDy+cUM8XYTjl2bkn8gEen50o0ZCjF5ZU2mEdpl5i
	9tjJLjx4h6AmncL/reRX23eMoIY2vLY2a9nzrYAJmfqK5quVfVvzxHd6B2p4vj/q8l5x
	yvDAXY+P3tbuiAYNcooWKXQMHEqHNhbAaX2TtQBayqW+SViQgp5aJKAK4XqmTFlFx8tX
	QFvx8HkN2bIz2ofP8HTU/rHxfdFAbhSO4WTs5odv8JIdjjcL0atDD6i6R5yPM5/O0wQ1
	hXSylG4uVevXdUM4Ng+Ed5lXN29WRDCMObwZtGrcLLL+hdc9Yb9uMsDrQYWWnyhjc8z5
	2Y9g==
X-Gm-Message-State: AA6/9Rlx8TjZwOX6py3TA8aMOzbfX1aKt0wjvtdOxlKH+zNiZtg8+VBIWONTV0CC8JvsRRK7FHS+1GkWJtu0rQ==
X-Received: by 10.31.140.147 with SMTP id o141mr17006195vkd.149.1476743619388; 
	Mon, 17 Oct 2016 15:33:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.117.81 with HTTP; Mon, 17 Oct 2016 15:33:38 -0700 (PDT)
In-Reply-To: <23442997.E5G5x9UaiI@peggleto-mobl.ger.corp.intel.com>
References: <1476729027-5072-1-git-send-email-ulfalizer@gmail.com>
	<1476729027-5072-2-git-send-email-ulfalizer@gmail.com>
	<23442997.E5G5x9UaiI@peggleto-mobl.ger.corp.intel.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 18 Oct 2016 00:33:38 +0200
Message-ID: <CAFkk2KREJY+WDZf-Ug-xS_R1k4E1mvWZwYeBt=Zv1EpWHNSM0Q@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake: bitbake-layers: Make show-recipes show PR
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
X-List-Received-Date: Mon, 17 Oct 2016 22:33:38 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 17, 2016 at 11:42 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi Ulf,
>
> On Mon, 17 Oct 2016 20:30:27 Ulf Magnusson wrote:
>> Only PE and PV were shown, which might have been an oversight. The
>> tuples passed to version_str() contain three elements (PE, PV, and PR),
>> not two.
>
> I have to say I don't recall exactly but I think it was deliberate. We're
> talking about the recipe side here - is knowing the PR value actually useful?
> It's not like you can identify the recipe in any meaningful way by the PR
> value.

It's helpful when mapping recipes to packages at least.

Waxing philosophical, maybe PR could be viewed as a "recipe revision"
with PKGR being the "package revision", in the same sense as for
PE/PKGE and PV/PKGV. That's just an excuse I made up just now though.
I intuitively expected PR to be in there.

> Cheers,
> Paul

Cheers,
Ulf

