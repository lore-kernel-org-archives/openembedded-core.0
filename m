Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 07F606FFC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 11:12:43 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id ho8so29986891pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 03:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=N0eJBt1mBNlrjQygl3mP8Zze50QuCjI+nIu0SFgNHS4=;
	b=UV5d+D2xr9eDi+0GtYNNcbExFIlpvau4uqCJVLGjdHoNif4JTtedAnBMKNNTVFoO/2
	PCRHaBve42gZlaHgPEUGpNc6Tec4ThRPiVVN2HL6PDKOAaWjtnih3NX6i6IL6TYpFdDH
	pyplFxSiOMrlvlsI0HEMeS4t5f8e15Rc4HAiClZKEiuGSSDnqYqYdw3pZUlHg51G5rXp
	sxqnrFiICbHBfAfGAcsG8jdNJGqMj8wWhrNxBN96mPOPo2kdnQmI/VX596gvqIZc//Sh
	VBh+tVNb7uT+yo4dK6LVzOanVjsaE+7mU3s2p2KQlpWPhX7xEB6rACKth6eCqvpmzF1J
	ceIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=N0eJBt1mBNlrjQygl3mP8Zze50QuCjI+nIu0SFgNHS4=;
	b=braGxLixE2V1OpSyxNXnelK+18mkVe6CfHL+INwH0K0O6uC6acxbW7OjOOyBu8saKb
	aF+sR5w8B3xWgyTMTubtvSQroemjr+Zg0B6TEyFvwECM/V8G8nivhfWo7WQMk20zSkAl
	IzEGMEwqeMZAytHwpeSTR2J3kSrI2Fu2zu+q5xC+WOlwupswrBnFz5NwDmTv8OufuDNL
	tO05ucCVgmypC8ZsUTZa2lVsnyOxUrBAzlxVmuBrq2FRVXZW9C64UlSrycPeZLNbM+UU
	4x5DjXQ1VGIjdn4mhZ60gSTm2rsRuo2TufRVHUd+QQiaF0pmHe+CPADFlXYB8c2l9Ged
	pCIg==
X-Gm-Message-State: AG10YOQs+bgzvw6N9aB2YOytB5fbmOLOdEt0I4J+IgDz9JkKAj/wAYzd0udx9oAoe17PEw==
X-Received: by 10.66.124.170 with SMTP id mj10mr9225990pab.92.1455793964476;
	Thu, 18 Feb 2016 03:12:44 -0800 (PST)
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com.
	[209.85.220.42]) by smtp.gmail.com with ESMTPSA id
	t87sm9532562pfa.14.2016.02.18.03.12.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Feb 2016 03:12:43 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f42.google.com with SMTP id fl4so29273337pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 03:12:43 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.121.10 with SMTP id lg10mr9092044pab.59.1455793962828;
	Thu, 18 Feb 2016 03:12:42 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Thu, 18 Feb 2016 03:12:42 -0800 (PST)
In-Reply-To: <CALbNGRTcuFWpTEpwu1V=m6U2cz+3RiQNFmyXtaV1sg8wxx91Kg@mail.gmail.com>
References: <1455460128.16142.400.camel@linuxfoundation.org>
	<CAP9ODKryst11Tr3QpuCA87pDYdsezEjTwxpb2HOwcVvi32f+pg@mail.gmail.com>
	<CALbNGRTcuFWpTEpwu1V=m6U2cz+3RiQNFmyXtaV1sg8wxx91Kg@mail.gmail.com>
Date: Thu, 18 Feb 2016 09:12:42 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpv3m5uOWDLtE0pWiGxzuboNW2P=C=AteqH=KMD_hdTQg@mail.gmail.com>
Message-ID: <CAP9ODKpv3m5uOWDLtE0pWiGxzuboNW2P=C=AteqH=KMD_hdTQg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] conf/distro/include: Add no-static-libs.inc
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
X-List-Received-Date: Thu, 18 Feb 2016 11:12:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2016 at 8:05 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Feb 15, 2016 at 2:44 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Sun, Feb 14, 2016 at 12:28 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> Maintaining this list in a common location is more desireable than
>>> everyone doing it themselves. Poky will switch to using this, OE-Core
>>> will need to discuss that as its default.
>>
>> I support this being enabled by default on OE-Core as well.
>>
> Does 'support' mean you are taking care for recipes this is will break
> throughout our layers?

Poky being the most commonly used one will cause us the same harm; so
I see no difference here.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

