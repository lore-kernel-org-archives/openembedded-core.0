Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10522.1793276425863233976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: otavio.salvador@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eae12762c9so832227e0c.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 05:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793276425; x=1793881225;
        h=content-type:content-transfer-encoding:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSdM78z5jzEbf7E/YtJk9pIUw0npN3iNCJW7bu3Ij6k=;
        b=YTg4ciDAlYoRJwlJ8cg9zUfu0aM5I2U/hHT1o6QJIdgq4ot2MTCs5XSrMdkb/vJCHX
         lY1W6gtYntpm6Rspul0zS0cDtR4+I/XVbSRWZ7VKNhAvUA1QRDgcbI3cvoNFGJb0IyYZ
         HyZz9R75A2n7/u3VZgxE4ZefaevFRrxBfWVkhnmHvi2Uk8Ce/+wl+60ee7iMzpOEGrM0
         TklYIPPVvhv6nFzXyXXnv0tRho7mkbf0XE8FKJ12F+8MsJop5zsI1Gfpk6d7Eu2OUNKW
         YJAkJyypqdBYT7fmGV3L2VnlC97OrFUxQsS5bCYy+ay2Yrz27f1QJO5wr5Hys5WBpao2
         nmFQ==
X-Gm-Message-State: AFq9FYImEhl06KAjLw6PKdj0duKbfUIj4y+rEe35Pe+su2eWeq5paZKc
	aFwNRuCLoUCfURimwh876j9deoU3c36k2G1w/U1fytGPooM4P0X3usZE
X-Gm-Gg: AYBFou2LHFgZVVsMwM631v4IjU1OsdWxBxWloxWPyZ9oHnJQ4u7zFEYBvxsO2pOM6mp
	8fOAXQkgnuAZbABTHNl1G77h3MkiCo72G+DDV6dmnKprrHZJZnwS3pN510m4mSjFAFVpGjBtrVO
	auiBF0cK6LMs9VuURs9mqxAwjSrQedX23/SBdVsL7wSElQ6+KfR2PLEtM5SGuEd2vcV8tB0W2u3
	oeZQrkclYLkj2rUsSXC1R6/iqxFuA/5LFSh9YcuUBYwe/rE6vknSMgD/IrBG3SFFNVbLPe0CIKR
	QX/TIh+sm3L1TT8D1cA3RvIISo0pOX6qrM022/K+8BCsmfuXzgJcMaWvdDfgCupVcsrlhUic9pL
	1Lm6KM18SXwF0f1izAFPn6ujEV+5Pg5pcmYBTyRW7wBUmkC8GG7o0M7xRTNhCZAqhzb75J9Y8Us
	yuq0GIP0+Sj0ptI25B5u1O4Fnu7XDRgQGT+eZm1EhmfxByeUKTCRNGNtMgqPA+mVZ4cxuEJ86Ro
	6s3qmacTlIbI1i953PzDOcQ5ipY6vfvqSX8/X+V8boWm6YXeuJWNWVqTsPFhRv0gAvoqtsN++4p
	+tVWEOYuXfD+ORyzC+eDmOcjZ8nrwxL4AG8NxHlsxSp3tIyHC1aK+TRV+94juX6DzMHYyQmJC8F
	oX/lsqAxTuHGpzEiKHGzmGraeL3c+si5RByFX0hzE1aVdQ70GDuR03FQQgI/Xk7WQs/Nm4krNEd
	FDk6rvkSeXrIW13dYlLRk+Q9p/ItXTYg==
X-Received: by 2002:a05:6122:e22b:b0:5d6:7f46:b8dc with SMTP id 71dfb90a1353d-5ec4cd2d851mr2603750e0c.21.1793276424703;
        Thu, 29 Oct 2026 05:20:24 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([201.89.183.192])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f9d0ed5sm5310218e0c.16.2026.10.29.05.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:20:23 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
 Paul Barker <paul@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2 3/3] checklayer: Share each world signature dump between the tests needing it
In-Reply-To: <20261019143924.1521981-4-otavio@ossystems.com.br>
References: <20261019143924.1521981-1-otavio@ossystems.com.br>
 <20261019143924.1521981-4-otavio@ossystems.com.br>
Date: Thu, 29 Oct 2026 09:20:21 -0300
Message-ID: <179327642127.31634.6504288368028561565@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 12:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248942

Hi Mathieu,

I saw this patch was reverted in master-next to test Ricardo's
"checklayer: run bitbake once per machine for the machine tests",
since the two conflict. Ricardo replied that his patch solves the same
issue and can be dropped in favour of this one:

https://patchwork.yoctoproject.org/comment/42922/

master-next still has the revert, with Ricardo's patch on top. Could
you drop both, so this patch goes back in with 1/3 and 2/3? It covers
the machine tests as his does, and the common tests too: test_world
and test_signatures share one dump.

If you'd rather keep Ricardo's version, I have a follow-up on top of
it that moves the common tests to his cache, and I can send that
instead.

Thanks,
Otavio
