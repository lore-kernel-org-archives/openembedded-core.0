Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7B98972F67
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 02:25:54 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id j27so1194607wre.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 19:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1uVCvWa4ANVWAVkFVQ6FVSGegJspNl0sXMd1IG1hqO8=;
	b=EOqGGmU27SO0aYVMQfVS3oxhfH6Dr55Epx35OHY9RVKCC1r1P9ZpqAIObzPLALFtwa
	ouS7pnrsBCAbJwvG54jk8aJOIVPXG+DHgSHD0x8gO+6Vags0h81fDxFJnEBGYrvLUPcM
	drjrZBJs67l1JLAX0dChBj3TrH66tvZzBmrxPBjJW2ag7Gm/Hio187TV9hFi5AVqK6OK
	6CavQ7OFMEiAV/sSUoPvAhZDTQ79DAQqaP9CplR5Wu3kdoOX/mosbvFrYuAMD2nLKQIK
	SUi0iGiHXXQ5Kv4al8CqDy9/cJegoLDy1tG/Tm/fRlHIGyuJAFTgv27CviPHDkt1K5Sr
	vbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1uVCvWa4ANVWAVkFVQ6FVSGegJspNl0sXMd1IG1hqO8=;
	b=kfS0oKuTa5K1/bsIcXOcJpwHggF62CUeLYnauznMM1iTIgm0+49JpxRB5BLeLtBu5x
	XesnmiU4UYC94sUUlwojTOG6a/W0wAwFMM+plhCysHlAyEx1b/sZ29j4kTNTgE6hPSMv
	0h4CxzkRNWTjmcr5nCf5Ns8QZtdOZqEK8hF5PFsRRun7LLUM9xlWzgZkuUazBY27gb7c
	2JkwJz9Quf5cULZJMFm66a+cO28uIVSmx2ELRQI0C9/lOzeYVD/dr3LWc/Sb7ltV7Pbx
	jyPnYbb+/KkL6psCwk6nw4oZBEeh5YSO2yEHw70uUzKVF61gAN8Mis8Zk7K3s2lTPLn9
	5o3Q==
X-Gm-Message-State: AODbwcA+Vv+pWeDUuMiFAG52pCYjpowuiflLvKdfDXgHin6JHEOrVF/T
	wlZqEjh11jIv6b/cpOk=
X-Received: by 10.223.139.72 with SMTP id v8mr15907195wra.13.1496197554661;
	Tue, 30 May 2017 19:25:54 -0700 (PDT)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com.
	[209.85.128.175])
	by smtp.gmail.com with ESMTPSA id 8sm13370344wrb.55.2017.05.30.19.25.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 19:25:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f175.google.com with SMTP id j27so1194472wre.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 19:25:53 -0700 (PDT)
X-Received: by 10.223.164.137 with SMTP id g9mr5507153wrb.128.1496197553694;
	Tue, 30 May 2017 19:25:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Tue, 30 May 2017 19:25:52 -0700 (PDT)
In-Reply-To: <20170530171523.37470-1-raj.khem@gmail.com>
References: <20170530171523.37470-1-raj.khem@gmail.com>
Date: Tue, 30 May 2017 23:25:52 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2pzFF-i5UPch30TZWasYdYzEwTZFgro=Ma-cROdv51w@mail.gmail.com>
Message-ID: <CAP9ODKr2pzFF-i5UPch30TZWasYdYzEwTZFgro=Ma-cROdv51w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] gstreamer1.0-plugins-bad: Fix missing library with bcm egl
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
X-List-Received-Date: Wed, 31 May 2017 02:25:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 2:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
> userland graphics driver provided libegl for rpi depends upon
> symbols from vchostif library, therefore add it to linker cmdline
>
> helps with loadng gst-gl plugins on rpi
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Has it been send upstream?


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

