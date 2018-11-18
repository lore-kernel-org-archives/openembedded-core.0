Return-Path: <marek.vasut@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3D46F6BBEA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 15:05:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y139so2872319wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 07:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5R5UQ5J55Nat/wo5eji5jhzDf47k8N9QQQJ8d7npC3I=;
	b=KdpcvkMqIN2Z/9MEVYnS6LhKA7TWDyuZtWNnbtofRQpo0lvSbI68o4iqPx1KGwIFbg
	qrhwb9qcYoGF6xS0DETncz89hG3FezHKwCsWAsoWxiofZ5DFWeZcM5kZrgyXhnMfQ6/l
	niFyPod4/nQLfodQx6dYKQVOFZ+UzbnkE3Kt4cqkpEqJ7IooXU0ZuFuLsdHOef2be1Rs
	eF5juoJ34kDmGwqtmXIhT7WJrVio8I3X0tJxx/KuK1pFn/jrAJOZ1irWzd/YcEBdJ5UP
	+kqBGACx1vM9dpKT2ldhrx1qKk+XUaMfbWth3kW0X985P1xf6emysGjsTq6xjvC3ycdw
	jiog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5R5UQ5J55Nat/wo5eji5jhzDf47k8N9QQQJ8d7npC3I=;
	b=h4ELcjDF3xzRDHytmlpQZ9B22Dia9ufosRTN+AyzJPYlZH47V7r6qAZy2i6viF/IXa
	E0zs+4xwnQCbdnRkE8smPav7b/TQYwa45uL+4jeCFJq14sCyAxZJEeb8YELL29A/gtFE
	uDSi0NY4PgdE1BsrAf9bdWOLbmYzaKqQ0aG/dMGIt/GaucX6LVcL5crfTRMV8zdWl3vd
	tjp6mR1F1kYHTPyytv6hAmQVxWvo2VMlB9Q57KeDamF25m6OXjhWGjewq0RiwmpaME+y
	Ke9qBcYzBJEqufDag8O8wRjQ8aahb4+X6tvyJRTC0xFNMvAdtxN9m6Dx3BmNG9HO+A9k
	51hQ==
X-Gm-Message-State: AGRZ1gJrWLicszP5QLYBySobCk2Uv3Emufcb1gYxkExO+6kzLvss4w33
	FzeG02LVN2DgG7BOPihUQSO7ugGN
X-Google-Smtp-Source: AFSGD/WUj9tb2mBwKHxyOaLmuloQ+ewdVzr/GHHzTmIuWez1/d5rNmSx0rcg2zMeoO77FV9Ulh9Hqg==
X-Received: by 2002:a1c:2e08:: with SMTP id u8mr4473233wmu.152.1542553558960; 
	Sun, 18 Nov 2018 07:05:58 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
	[86.49.110.70]) by smtp.gmail.com with ESMTPSA id
	n12-v6sm3740310wmi.1.2018.11.18.07.05.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Nov 2018 07:05:57 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20181117144457.A7B74440002@auh.yoctoproject.org>
	<be32ec5d-9c69-0625-10a2-a32b587bc02a@gmail.com>
	<CANNYZj-0azx-FS8J8uT=tHWteoVyq5rUCyCeBv-+cqoB=HK2vg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <31066f04-438f-94a1-8050-b4fa6d1cfbad@gmail.com>
Date: Sun, 18 Nov 2018 16:05:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-0azx-FS8J8uT=tHWteoVyq5rUCyCeBv-+cqoB=HK2vg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-11-17
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
X-List-Received-Date: Sun, 18 Nov 2018 15:05:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/18/2018 10:32 AM, Alexander Kanavin wrote:
> On Sat, 17 Nov 2018 at 22:42, Marek Vasut <marek.vasut@gmail.com> wrote:
>> Is there any chance AUH will be fixed to update U-Boot properly, that
>> is, all recipes at once ? Now it updates it partly and fails, obviously.
> 
> The issue is that all recipes include uboot-PV.inc (that carries the
> git revision), and updating one recipe breaks the others. AUH relies
> on devtool to do the upgrade, and devtool operates only on one recipe
> at a time, so I don't think it's feasible.

So AUH cannot update multiple recipes in lockstep ? I'd expect that to
be needed quite often.

> Perhaps you can take those
> emails as a reminder to do the upgrade manually, or alternatively I
> can blacklist u-boot recipes so that auh skips them (but then you have
> to remember to do the updates anyway).

Heh, I spent quite some time to make sure U-Boot builds on the targets
AUH uses for it's auto update stuff, exactly to let it update U-Boot so
I won't have to do it manually.

Perhaps we can fix AUH somehow ?

-- 
Best regards,
Marek Vasut

