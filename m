Return-Path: <ptsneves@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C1F8475526
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:32:12 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k16-v6so20596569wro.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K7RCs9LAAN/SWMbcTjMPkCJcJFv6bQXJr3eET2CbaOs=;
	b=hysNFLPo2D1t52ASPDFXxbXlIoSF5T5lZH8ujm/vZB/arhtXa97zNXmRfDwSpIjaWk
	E9jo5OPODXYyasyjeGWEnONcTFVXlpChHLVZfafSqzETekblzzn6otPn0ixi4tlA5iP9
	EqMrIi6VhGVN/S8Lzx9crdGA9wXHIH5QFR6fh7hmT3qi19tiD+MvnXD/DG8yIA7xpYmM
	b9Nb/7OKwo9SLJQ0p1UizT6pkSgdqF3ypvXIeOonBcEdgVzBcfr/01YhTlBRtMn0yZQ8
	rADUu+McWjl8oB7MS0iPWHTljh04rwHZxMMH2tolSfn0zqnjTbrRwrfcBegZyuaKH77W
	KiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K7RCs9LAAN/SWMbcTjMPkCJcJFv6bQXJr3eET2CbaOs=;
	b=V+Wy9lIpNUc8/MBMA07tIdUwynZ02BSnWVYXJ6ntSIK8R+Utoz2i3ekaYogtDXYUN5
	WMVXsBpkbUzPi3NT1m95vTH4ASglo0lWZKVb7aj53JekdZ5imvvsaZ0oZ8YeXtf3SDXc
	5wjYtOE/HXoV1iqjK8lqtehBPq0H2/7C9OQuHKnmjNO1h6r0F/1XsB3ew+xKHzKcIu3g
	VXW0+UvHWpUyaQOkpujf2PD+Xr6UvGv4LOD44pCwwXGCkINPV5VGta9WSYIJs3KckhRn
	IjdTBCm+1i/6Ycnqnl1CdKsh4vHrTM4Mt9AE+0Cd0ISzscYpasgaYrSNBZhG3O2clSMV
	6HnA==
X-Gm-Message-State: APt69E2h1RAjI+zEmShdBkjr6WfZNE2ZoAK1DhDhKOWfnuA7K1/HR6Ly
	nDllIL1lJ9e5o9VujaFoTINo44y3bkZJTEtOiebEeEg=
X-Google-Smtp-Source: ADUXVKInuvCG3+LteqxxQsooamapXqesfo5cYq/ErqHxlIBWj6uMjAJF2P40e2Ks8t5YxVU2Xf2rAvt0OrNReqXQkkE=
X-Received: by 2002:adf:cf0d:: with SMTP id
	o13-v6mr13699769wrj.112.1529415133459; 
	Tue, 19 Jun 2018 06:32:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1c:3e0b:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 06:32:13
	-0700 (PDT)
In-Reply-To: <CANNYZj_-_TYcU1ZHbesWPiMq-VXdQAcwPeLGGngk=bcQJmkOrQ@mail.gmail.com>
References: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
	<20180619114512.11699-3-richard.purdie@linuxfoundation.org>
	<CAJO0J4hDdQbK_2jzo_ehd0so1SjWnq2RgT5ESdg7JAfAc8Pvew@mail.gmail.com>
	<CANNYZj_-_TYcU1ZHbesWPiMq-VXdQAcwPeLGGngk=bcQJmkOrQ@mail.gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Tue, 19 Jun 2018 15:32:13 +0200
Message-ID: <CAJO0J4iGFbi=a6Ekq64RN=GmepjBj9cGbZ_xeqmkG=bSVDsUOQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] image/testimage: Rework auto image test execution
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
X-List-Received-Date: Tue, 19 Jun 2018 13:32:13 -0000
Content-Type: text/plain; charset="UTF-8"

I can, but some of the patches i sent earlier did not have comments.
Maybe I sent them to the wrong place. Furthermore I sometimes have the
feeling that I may have fixed something which, was not in need of
fixing, meaning wrong assumptions on my part.

This HOSTTOOLS case was a case in point: If a stable version (SUMO)
was released like that, I thought it was me who was doing something
wrong, so I added the ip, ping and ifconfing in my layer.conf and
"fixed" it for my case.

I will try to be more active. I am working on a class for the meson
recipes that appends the exe_wrapper of the .cross file to
qemu-${TARGET_ARCH} so that we can run unittests in the build time.
The idea is to left shift and fail the recipe build if tests fail.


Paulo Neves

On Tue, Jun 19, 2018 at 3:13 PM, Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> 2018-06-19 16:06 GMT+03:00 Paulo Neves <ptsneves@gmail.com>:
>> I support this patch and I see that one of the problems in sumo is
>> fixed, namely the HOSTTOOLS missing ip and ping.
>> Even so there is one HOSTTOOLS that is missing, ifconfig. As far as I
>> know the automatic network setup scripts of runqemu require ifconfig
>> for 192.168.7.1 tap setting. Without ifconfig the virtual machine
>> cannot be spawned.
>>
>> Also, given the lack of the HOSTTOOLS in the sumo version i have, how
>> is this being tested?
>>
>> I also would like to discuss the possibility of testing u-boot in a
>> virtual machine. I have a setup where I am able to pass to qemu,
>> u-boot.bin as a bios file, and then I am able to boot from tftp
>> enabled qemu network device. This allows for unification of test setup
>> of virtualized and real target booting. Do you have any integration
>> like this in the plans?
>
> Paulo, I would recommend that you prepare the patches for all of these
> things, and send them. Yocto is what you make it, don't expect things
> to get fixed for you by other people.
>
> Alex

