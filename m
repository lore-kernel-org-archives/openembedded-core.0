Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4186378285
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 16:02:16 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 53so11033162otj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 08:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=LQ3o33boSdew8meSSM/f4gbBZr5Ilpb3g7LFSexOJgk=;
	b=wKQyBf8y4ZKVRTNmWUwwrGEClUrlm1dwuh0+/x41KdRfyUXvSsrooqfE/fuGk3M5qQ
	WPfVc/NF1o6nqaZablfWCRhvuDBgzmk0M4D5OVRccqkVeGBgzY/xneGB3b6Sf6GoU0Ni
	TA+Z3uLKxWVdKf5OoA0FnvNMwC7DWnKByh0vDaqFHFC5A8qhE0WlxQVHwS3OCTTx5q8c
	Lzz6kOs7DZkr/nRwCryqel/QUhnu6IqaYbi3Sz6B3Kn1AYeqR+sUdJFJAPR78RgLB72o
	2e718H1EPGC2V8JgvpWzIhZgk/ScOcr8a4UtY62TsCsXfS6TJVqknCxU3Uw9QPmZ9jWs
	T71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=LQ3o33boSdew8meSSM/f4gbBZr5Ilpb3g7LFSexOJgk=;
	b=drJdy8Lt3GDK+hOUI6mvZeCqk57lfAdozmGuUQl8L0Kq7wPhbVyvALgzeXMHoclEE1
	uzs97q4SwbrYuT8JnIlq63v3pvQrFS1hQInHRCGOQMQD1n2jTTkw8RWeu7FJis/M6iQa
	14YZgMW6HbGaMr4DIUPOci+BHYHeEWBilCbZ79QWoJdnSoTulfD19qTtJKuF3bHmIANP
	HkA5yEJbxS9J1pNvSBD6ogp2d+xxuy+c5eIafzN3dmQ0+6M39tDdE/3zU+twA4Pzbuc5
	+9ws1hXsPD0jrbex2TbfxnIr7nZOsVREhtjOhQyBjuF6lJQt3s9vMuovDGxcPeizJCXZ
	ErDg==
X-Gm-Message-State: AKwxytfAfGMWHTMpO6g9iCzDvpYhFUd1D15/h8iXm57KeoEuIFfEMfER
	4eFHHkglFPNOXprVy3/S9zfOPtQs
X-Google-Smtp-Source: ACJfBouylJ69Jmip0t1X7rxVJaYt87yr4sCfcOALmeqt1EUAF4OTH7/w9wfTT4po4nX6IrIg+BPwow==
X-Received: by 10.157.11.151 with SMTP id 23mr10745792oth.179.1516032137641;
	Mon, 15 Jan 2018 08:02:17 -0800 (PST)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com.
	[74.125.82.176]) by smtp.gmail.com with ESMTPSA id
	e64sm2836553ote.30.2018.01.15.08.02.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 08:02:15 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f176.google.com with SMTP id d10so11021705oti.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 08:02:15 -0800 (PST)
X-Received: by 10.157.23.138 with SMTP id j10mr2117208otj.370.1516032134866;
	Mon, 15 Jan 2018 08:02:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Mon, 15 Jan 2018 08:02:14 -0800 (PST)
In-Reply-To: <ce42cef0-e51a-50de-0454-02ba61667d2c@ni.com>
References: <20180112130644.21313-1-alex.stewart@ni.com>
	<CAP9ODKoKBNbFia_YCQB-H1J10iUoCu2ROrjCZEW7t07LWRT4cA@mail.gmail.com>
	<ce42cef0-e51a-50de-0454-02ba61667d2c@ni.com>
Date: Mon, 15 Jan 2018 14:02:14 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpnfvQJ5adGMmH+a+ZJ-_ob8LYdVyQY2Y+2ycQfBEkKHw@mail.gmail.com>
Message-ID: <CAP9ODKpnfvQJ5adGMmH+a+ZJ-_ob8LYdVyQY2Y+2ycQfBEkKHw@mail.gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] recipes-core: move hwclock.sh to util-linux
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
X-List-Received-Date: Mon, 15 Jan 2018 16:02:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 15, 2018 at 1:59 PM, Alex Stewart <alex.stewart@ni.com> wrote:
> On 01/13/2018 05:48 AM, Otavio Salvador wrote:
>
>> On Fri, Jan 12, 2018 at 11:06 AM, Alex Stewart <alex.stewart@ni.com>
>> wrote:
>> As mentioned by Christopher, it will increase the build time for
>> everyone and there is real gain in this this change. If you want to
>> disable the busybox dependency then move hwclock.sh to a hwclock-init
>> package that has no standard dependencies and is allarch and make
>> busybox and util-linux to depends on it.
>
> Either solution works for my purposes, so I'm fine breaking hwclock.sh out
> as its own recipe. It seems degenerative to break such a small piece of
> common-code into its own recipe, but I suppose there isn't a better solution
> if util-linux isn't commonly built.

Leaving it on busybox seems to be the commonly built package; moving
to a specific package works too.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

