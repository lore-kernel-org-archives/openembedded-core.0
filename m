Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 63E7F74EBC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 11:15:12 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id h79-v6so8391425oig.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jun 2018 04:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o/pvMUXVYy6NmXiuEr3RGeaQO5Tk2BjyWNdkrhdjJ/Q=;
	b=Wxy/RdU0jgE3UjFj6NWnD9N8YNeWFqlR94rMnAbSDSDJfrWUAS4Ik2in4u24Eff0Gl
	oMfpGUzEbfHEwBimBtftr9A12IZa+Q8Re/oDOhqMNFUFKeMJJKsgEnAdUO1NMTYOIOpD
	j523+IOU+s/ggqjpMvXU/BcQTZPkQlV4BXEL48Vm1+LriN0llcWiPijrVsfi5jeeHvEc
	U1kWzKU/H/Qpj489sx0Zpy4j7BRghFN2zzJCmsEGohHrU1KC3c+yOzSkkHbDyRvfDgr+
	XT4/Og7NhYXiZvAZxDgrNpteysPRqQkiOdWUviQnD2DxHPpXJWB4ydjUHilTMYgJoUFD
	QRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o/pvMUXVYy6NmXiuEr3RGeaQO5Tk2BjyWNdkrhdjJ/Q=;
	b=BrGVwRSGl7Q+aeMv8Ag/Otgv4d12GzjVOUt+S9aSFl1dpifwIDJG/VXPALsn+T9X2O
	C3kddyxzK/3nRhAq6PGq/7xdsTIUJlD/g/1J3/PmDd1ve2wwXzYP56buXaEVu303yd8C
	wFsjZpepDEtbSrp3bJ4li7FqpmMQ789N0uLLkLv/T3Oo8Wglh3ChwdxQ20cCCkIXJM2t
	EwASm+PgiNZJBqsSPHKM2CZditJ4+20HBq16Ydt5ENsdVV1Watyy9RiM4pQDNOTWxR12
	Gg8hVn5miDQUgcqwhTbeOaYJKkvNpWlNmD4paw+5JC7FTsYww0DHl/O7YR1ksc8h/PrK
	VK+A==
X-Gm-Message-State: APt69E0W+MZRRfCR1e+8Gizk6Hgp/7/MLAlndnz1lHpmJMx+KQf5Ozt9
	OREg89KlRAmcmGoZOFi7qzHF6U5vs9+m+CHKxWA=
X-Google-Smtp-Source: ADUXVKJNr6CjV5pJrIS5bjounqh2MvJq//z7aYDdXQ1t8GnYbmGyhF5I4f1MEGgeU5XzRjhi+7igmRsA3uluEqXkH6A=
X-Received: by 2002:aca:fd55:: with SMTP id
	b82-v6mr2580267oii.321.1529752513336; 
	Sat, 23 Jun 2018 04:15:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Sat, 23 Jun 2018 04:15:12
	-0700 (PDT)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363AEB0BC@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZVcc+_ocfuYEUBKK0Hbr0SaZEH7CUYKK17gMk+CXwxwg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9A7F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-ege3VdhZ_AR=CpTmOZc3yyO55BOpt0YZNMk+Ww2BpJA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9E2F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-xJa=pQwc3ORfzjOXqvOyKWHbOFVFPh=oH1J-urrZmKg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AEB0BC@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Jun 2018 13:15:12 +0200
Message-ID: <CANNYZj_Vprkd=2gJKydazzUtTKoLYgyZcOd_yjQymzfRp=vqrw@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Sat, 23 Jun 2018 11:15:12 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-23 12:50 GMT+02:00 Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>:
> Yes, modifying the image recipe can actually customize your root file system, as linux vendors, they are familiar with bitbake and it's very easy to them.
> But, as I know, there are many users who are not very familiar with bitbake but also want to customize their root file system. And it's hard to make them learn how to use bitbake.
>
> So if dnf-nativesdk can be used in sdk, as linux vendors, they only need to provide rpm packages and sdk to users instead of teaching them how to use bitbake. At last, users can use dnf-nativesdk to manage their packages as what they do in their host.
>
> So I hope to add dnf-nativesdk in toolchain.

Thanks - I see the point now. I guess this is something we need RP's opinion on.

Alex

