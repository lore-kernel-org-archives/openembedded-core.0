Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3D8FE71B3E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 10:23:01 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b186so4795771vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 03:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WcRJ0gBMB/GmY/Jdui+9IybTmXJ7FGjvWzRFFI9N8rw=;
	b=wJ87CfWWU7QKb6kzVtKwQBnPHVu3U7PqCg7s3lrHlnyvva1QCnYpzZmNhBw+aWiXu5
	7UwxWDsITxMceQ3skKls0BAWR+9dl3tsYYFYp7uV/DmHkjFkfW6Px+Sqgfoa/kuMWWD1
	bWlf2PJSdnFBYEBkOrN93UEMgdIPfOBCjHSbhiBLdWEEM8OX8ZELswEU83E/prkez00G
	tB1UWrO877HkNdAAmD23T2ObmsqkAM6AM9GTtQ0tfcBGRlzsTk84mIZ904/t/QP5cKGr
	BCqyhwgKf3PqmNAmsCkcvjoASAwpUBuHEu16RctANlcdhOzWFWMLw6ZyduNBFhyo06lM
	sDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WcRJ0gBMB/GmY/Jdui+9IybTmXJ7FGjvWzRFFI9N8rw=;
	b=aqG1l2rZg3O1nVCmbH7JIdrTfolf7gbjMkXa70VW/xh+tx8pPhtfRv8M7XgLZtotq/
	G5gjYe5fGsZmlhKER/zecBuy3VAOMusCFgR/cMGHGLfHm6kKK90P2CschpsfTjiXyCUr
	sfk/7Td4jZlTHoQ+gtIhL4fJwJVL0jrj/Zyyb8pwVdTqrpTf1cqQHzCY+g1beazryJ/m
	ziNOe2jnFFKOJOuBwUAv+L0HJlvG2OgZ02DD06IHxQlZ8qVE5n/W8DkWfGgD7eGCV55i
	NwamrTWTdNJerulE2ZZKL6fOiCOMenLjA0/grleNoiV66g4F52Nk5A4tnkdgBz15tn6h
	t2Nw==
X-Gm-Message-State: AA6/9Rml5daa2gDblJXYLYkJLsx0qgP5TKJbkQWiUpG0zmpJoPexNf4RHqkaFF/uqju5UA==
X-Received: by 10.31.174.147 with SMTP id x141mr8475082vke.73.1476440582220;
	Fri, 14 Oct 2016 03:23:02 -0700 (PDT)
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com.
	[209.85.213.47])
	by smtp.gmail.com with ESMTPSA id y72sm7094528vky.9.2016.10.14.03.23.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Oct 2016 03:23:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f47.google.com with SMTP id 2so108856948vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 03:23:00 -0700 (PDT)
X-Received: by 10.31.60.9 with SMTP id j9mr7230909vka.48.1476440580582; Fri,
	14 Oct 2016 03:23:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.120.78 with HTTP; Fri, 14 Oct 2016 03:22:59 -0700 (PDT)
In-Reply-To: <CAMKF1sqxj2_VrhzRcCeHytLO=n12QdhZcVr-HAiZvPkh02QAPg@mail.gmail.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
	<CAJTo0LaiX-F+0ZPeTs8jJ2GxT61WFi1aPYZ76RgUMAKCMiWaeA@mail.gmail.com>
	<HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
	<CAJTo0LZ1NdDfTb72cH-vLrE=Q=kW6ksFQ5p7pnA3Tgoj0QZbaw@mail.gmail.com>
	<HE1PR0401MB26823C71B1DC91A7D8723D59E9DF0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
	<CAHiDW_GFdwy_1ZSuv7s8L8NExnFpY-1VUA5jV==x_q3SrFSMuA@mail.gmail.com>
	<CAMKF1sqxj2_VrhzRcCeHytLO=n12QdhZcVr-HAiZvPkh02QAPg@mail.gmail.com>
Date: Fri, 14 Oct 2016 07:22:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrZHwDW8ZB3zb_pc18_gTJdJZEa3o3YA1fwG0NsfpeLAA@mail.gmail.com>
Message-ID: <CAP9ODKrZHwDW8ZB3zb_pc18_gTJdJZEa3o3YA1fwG0NsfpeLAA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Carol Zhu <carol.zhu@nxp.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/4] Add patches for gstreamer1.0-plugins-bad V1.8.3
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
X-List-Received-Date: Fri, 14 Oct 2016 10:23:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2016 at 6:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Oct 14, 2016 at 9:35 AM, Jussi Kukkonen
> <jussi.kukkonen@intel.com> wrote:
>>
>>
>> On 14 October 2016 at 06:22, Carol Zhu <carol.zhu@nxp.com> wrote:
>>>
>>> Hi Ross,
>>>
>>>
>>>
>>>       So could we try integrating them to master branch and proving the=
m
>>> firstly?
>>>
>>>       If they are all ok, then we can try next.
>>>
>>>       They won=E2=80=99t block the RC1 of 2.2.
>>
>>
>>
>> That would be the way to go, although GStreamer 1.10 release may have
>> already happened by the time oe-core master opens again: in that case th=
e
>> appropriate thing would be to upgrade the recipes in master to 1.10.
>
> We can serialize the upgrade and get these patches in before upgrade.

Agreed as Carol already did the patches work.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

