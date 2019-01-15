Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7507C07F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 13:35:22 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id w25so2414949otm.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QfHOIg/n/J2KPgzSqGtuTK4K1pJUyZXb/gTwNPuWR94=;
	b=rO7Rjeej7ur2FFtMc7tk8peqTXTB9flpt1ThivUX89yUJA2WycTy9FcxZCJjK1bJG1
	kCZ8Z9HEGSOhaqLbttmrVjePYZf3hs9Fa70suFI1RK7gv9e+JGkGQpay5xfRoRJCghu1
	lLTiy4wnX09CGbgE+gJ8kY4oh6Qv2GNbiZz+SlGnejLOoA0eA9FHEsaCT2XMrfqfgC70
	+sz1McdbKAIsOP4vd9o8g7RZKfrZhHLRFoMYOM/w4TOUEYX/VsQGHF4CfYgtQh/MCcBN
	16hDM13LVimMvGb02tf9nBCkbL1cB9MUIlMlGGFs7fppc8zCaMzt3o89hwMoXM1BTTKY
	zDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QfHOIg/n/J2KPgzSqGtuTK4K1pJUyZXb/gTwNPuWR94=;
	b=Ifu8VYXd/a1auKky12cPxVm7X8JzGfNJ0W7VyoqlBi4cqArBHWDVeScSJM8nHznWUc
	TVrGStAq48rxqfXr1+7jGHtPNGfeNP7XNiDY8rJEkwAXr1JweBsyEP28pIF4e1dZX+iq
	y2OS9YZRZk4OdlQG7PX+JhjbTzJl3jo6s5GgiPr2tW2nqvOcH4V9RF5nmxpPM3goytc1
	uy+ZRTxZB41qbUayKBJFCvhHB6jLcyJIJbAa9iWkWh+w2Lq0kT/L+ZhTQypc52UGjqK8
	x7UnKtxVo/uf+fG/F72Sd4iYiu5aPXCVYFAOWPusUH2Uzi5ttQUu49TCHoVXKzuHnBKw
	BDgw==
X-Gm-Message-State: AJcUukfWpP0EcU/MiEH0Q5jK3KaDITzyY7+lvHArmzyrWq/TL7Ni/yeZ
	8PuJj+E/bCJn8P+H+XTpOk95sEiDVni6bsPOsU53RQ==
X-Google-Smtp-Source: ALg8bN60Ik0A4mDB+TNMz4kzsFCzluDTd/cw62wEl7TZDM/59h1/lcCoRaybkSxhS5dmOqSLVeMkMW1vtHpG3kBSP8w=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr2318991oti.367.1547559323563; 
	Tue, 15 Jan 2019 05:35:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547477793.git.alex.kanavin@gmail.com>
	<55c6e394f9668f9b1bd5b426d557d39581c0ff42.1547477793.git.alex.kanavin@gmail.com>
	<CAJTo0Lb4Ju4TG2JD_mHy-uXHxqkZc6atb2OEGZbujpvEmw_sNQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb4Ju4TG2JD_mHy-uXHxqkZc6atb2OEGZbujpvEmw_sNQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Jan 2019 14:35:12 +0100
Message-ID: <CANNYZj-gVjcW2NK5W7Gw4W+WdcFXvimf0O0=DnTgTt6e7Az=9w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/23] mesa-gl: do not enable nativesdk variant to avoid clashes with main mesa recipe
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
X-List-Received-Date: Tue, 15 Jan 2019 13:35:22 -0000
Content-Type: text/plain; charset="UTF-8"

Not really. For native/nativesdk builds mesa-gl is not a viable
alternative to mesa, as it lacks all of the bits that make accelerated
qemu possible. Using PREFERRED_PROVIDER would imply otherwise. I added
this to the commit message.

Alex

On Mon, 14 Jan 2019 at 17:10, Burton, Ross <ross.burton@intel.com> wrote:
>
> Wouldn't a preferred provider would sort this?
>
> Ross
>
> On Mon, 14 Jan 2019 at 15:06, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
>> index 73267eb4f0d..030db6c1440 100644
>> --- a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
>> @@ -7,3 +7,5 @@ PROVIDES = "virtual/libgl virtual/mesa"
>>  S = "${WORKDIR}/mesa-${PV}"
>>
>>  PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>> +
>> +BBCLASSEXTEND_remove = "nativesdk"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

