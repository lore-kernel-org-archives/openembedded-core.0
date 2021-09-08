Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9682.1631097296295415202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 03:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KjW+ctY6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id u9so2513431wrg.8
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8Q3Iasp6275wIUwNhndB6pOZ3NB4ir8Hqz5LwDQwZ9M=;
        b=KjW+ctY6+EOxxrhFuvwK7kKFWA2qIZWzev5D40ERpKLV0orLnZbG2ym6gjvSyMPdUm
         zF742UKLZkyS/oVfVaoJ3HKsIasgZeZ1Kiym58lFTmCinOZDRxMOiw5oRX9Zn6n0I9Om
         r5sB2qODlHzXEuZkeKVozdYPyAE8mWaED1kq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8Q3Iasp6275wIUwNhndB6pOZ3NB4ir8Hqz5LwDQwZ9M=;
        b=yfpiREwylqrEqfRi+K8Du156s/FIknFmvg+yHWmvJGqUJ14JZ8ouATavn8VKZkzYdp
         OIE5VTwwBy/n1rbpKN8NDe1iFxVe8Hf4Ae9pxUct9KBJ9GXqwyDFYVdy30Xxp3W8bhKF
         krBGziR0OWso4QLGVrheCC5oAn08DuwTwUTV6eeNzgpqm3TvPdOEt3wabYFPanUbGKyL
         Tpo7HxdKhGGoAPciBTNMFaTWEGk+EswRT8U1xJyajPIwUdHBJoEoKRre+we06MaSaf7V
         xvo/nkPE52f2XJxhmvtOgU0RbUsgfm1RzTQfzo472ECK+wqrQmj+hgawzaHMmvW2uuwc
         4agg==
X-Gm-Message-State: AOAM5333SiS7MALplkooWWEvI/8aA5eyUnyf2I1I5VB2l3UCoSSsEAec
	A6Jjf8mX8PCqTFUKHdcjfm4zHQ==
X-Google-Smtp-Source: ABdhPJzY+FS3yINjyuCS7A18f1O+xAvkGatnr0D0gFHSW7sBXzOcaCiq5o0uslGJDsInTZnp20JU0A==
X-Received: by 2002:adf:c501:: with SMTP id q1mr3275972wrf.150.1631097294728;
        Wed, 08 Sep 2021 03:34:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2cf4:2068:e5af:caee? ([2001:8b0:aba:5f3c:2cf4:2068:e5af:caee])
        by smtp.gmail.com with ESMTPSA id a10sm1785202wrd.51.2021.09.08.03.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 03:34:54 -0700 (PDT)
Message-ID: <890f782a90fccfc15be5a3cd664112f7a95aaad8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Robert Yang
 <liezhi.yang@windriver.com>, OE-core
 <openembedded-core@lists.openembedded.org>
Date: Wed, 08 Sep 2021 11:34:52 +0100
In-Reply-To: <CAAnfSTu2fs=tG7NEW6w5PxLXsczTB5g3cm9_Y5jPgugA+-mc=A@mail.gmail.com>
References: <cover.1631006167.git.liezhi.yang@windriver.com>
	 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
	 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com>
	 <CANNYZj_6j9W0KKuR68KjRk+=MTQx_EOcuWnH3Zt1aKZHJZzvHA@mail.gmail.com>
	 <CAAnfSTu2fs=tG7NEW6w5PxLXsczTB5g3cm9_Y5jPgugA+-mc=A@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-09-08 at 11:08 +0100, Ross Burton wrote:
> On Tue, 7 Sept 2021 at 13:50, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > I'm not sure why layerindex says otherewise, but neither vulkan nor anything in meta-qt5 actually depend on assimp.
> > qt5/6 has an option, off by default, to use external assimp, vulkan has no dependency at all.
> > 
> > This leaves basically meta-ros, so carrying assimp for the benefit of a single layer is dubious at best.
> 
> I thought Vulkan needed assimp so dug into the history.  vulkan-demos
> used to need it, but that was replaced with vulkan-samples which does
> not.
> 
> So, I say we drop assimp from core and move it to meta-oe.

FWIW I agree, its looking like a pain from a few angles and it isn't worth that
in core.

Cheers,

Richard

