Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B004C7DE3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 21:46:58 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id n25so516768wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=FgkUHNUrvdIoTNkBDk7uJ72iPkfSu/37Tiku2PntSBU=;
	b=T5n0Hf5fAEh3NCCoojgkfJBga1KMQoSf9x6UMxNtdReh6zcXzcqSCIb/T6dYl8wuA5
	gFUwVGWr48/4DJ9suVwy8HOXMi56emsqrfca9uSF72FicYJNzmmQFoDFQE2XGwjVLYoV
	Wxrc4GRptI/pYQFIfgO66YS9RR3C2pP67/mm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FgkUHNUrvdIoTNkBDk7uJ72iPkfSu/37Tiku2PntSBU=;
	b=fuWEhuGPsexM62QWcivyzyyO70AIXcgENMalq2RIQAT+ihwDo1OAv7MhPHtf6YZpY+
	oiuOC9p/wLfe+ppeUJlYHraCQqa7IkA75b2Pcb0mQBQnqdBDg/Gc2ujnrVgtek2zQ2Md
	3wVmxngNgiftXIhBEwGhfho3OEHsM0Y29A447KCG1MwyFXFxxsfNUs/p/ELAxAVqMwLG
	JxDkdnuHL2y1y0Z7MyTxchvhao3HBPd4U8PplJAIcddbtkMY1FS505wcPX/7GBatfTI2
	uk4Z1CoWA5ST/Zyy/cEKZVGpevsqjOYDRLykErMi/jxKJHx/e/6KDuE5mPBFV2zg/DML
	ZIeQ==
X-Gm-Message-State: APjAAAVi4xwL9tK7DzuSiywIVM9qmv4GDQLVZEWDfXOrf6zFI0NXRdse
	Comh9Ep9Cck7vnWd2Gd2pqoG3g==
X-Google-Smtp-Source: APXvYqzJ2U4JVHhouz0v23UHVWcjeLQ62bAI8KAX4COPsm2lTDQ0ITvcf/sB4/8WFcKUfkWk04tCiQ==
X-Received: by 2002:a05:600c:230a:: with SMTP id
	10mr7504292wmo.13.1557870419395; 
	Tue, 14 May 2019 14:46:59 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a5sm167673wrt.10.2019.05.14.14.46.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 14 May 2019 14:46:58 -0700 (PDT)
Message-ID: <0332c9bc1d4a9d3b841a1afb658dfd952e2e3d80.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org, "Yang, Liezhi"
	<Liezhi.Yang@windriver.com>, "Burton, Ross" <ross.burton@intel.com>, "Hao, 
	Kexin" <Kexin.Hao@windriver.com>
Date: Tue, 14 May 2019 22:46:57 +0100
In-Reply-To: <c6d172d4-80f4-d91b-662f-b9b1de85f032@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
	<20190514035716.27376-2-Randy.MacLeod@windriver.com>
	<4588fa927b2e10223bab39d65aab4184db783f49.camel@linuxfoundation.org>
	<8f1030b6-b831-7ac8-88e3-1208272d7533@windriver.com>
	<19e3463fcf6a41f0c35b7227760bd1f2cf6aeac5.camel@linuxfoundation.org>
	<c6d172d4-80f4-d91b-662f-b9b1de85f032@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] valgrind: do not strip the package or ptests
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
X-List-Received-Date: Tue, 14 May 2019 21:46:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-14 at 17:42 -0400, Randy MacLeod wrote:
> On 5/14/19 5:32 PM, richard.purdie@linuxfoundation.org wrote:
> > Actually, my test was flawed. I just retested and this time it
> > worked.
> > What I tested with was:
> > 
> > RDEPENDS_${PN}-ptest += " sed perl perl-module-file-glob ${PN}
> > ${PN}-dbg"
> > INSANE_SKIP_${PN}-ptest = "debug-deps"
> 
> Ah nice. Thanks.

Note I add PN above, I'm going to send a different patch which does
that in the ptest bbclass as it fixes a ton of problems. Its not quite
a straightforward patch though.

> > Can you see if that works for you?
> 
> Sure. I'll test and resend the whole series.
> 
> > We also have a problem that its overflowing the 4GB limit on some
> > image
> > sizes with the debug info included :/
> 
> There's an enhancement to track that:
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=13025
> Kevin owns it and has it scheduled for 2.8 M2.

The immediate problem will have to be fixed before valgrind can merge:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/602

Cheers,

Richard


