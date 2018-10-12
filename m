Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6025879B9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 14:00:13 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id a13-v6so13571780wrt.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 07:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gc9U2TV4TQPijCNvKzm5JE4L/yFMtIlCkDCaO1UNF90=;
	b=aO+yLZ82Nz81HNK/R67HJEVm6uQ0gNHBGZGv3dGFq20geP3Ee9ptSqGsl8qb5sVOvG
	8dDrYppr0ZxaNhSiP5s9G0B9aVSRK0xRIpr6UMAyHsc8p3iXmlMgnRVSWHug8cokRwtB
	BylCQ3mDJory/HnC98sZRcGYkgHPAlFTZ3NSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gc9U2TV4TQPijCNvKzm5JE4L/yFMtIlCkDCaO1UNF90=;
	b=SH28ci0CVLGKVskIqH4gsqG4leqozT0X8y9vpoTntXaoQHKOdYXj0V4WwmG7iDByJL
	MWlXCpXVcgzoSkavLzbqlueTqPvZhE1Z8S1zm5cqv7zlVGru72l216CwtwyEC6CDdfo4
	ECwmnOs8LAL2/2b+aDCgIx11xB1hn07haElJTq/9Tk4fOMlLnZCeW8Gtx4l7mKOCn4hM
	TfQXQ3mXu8+WaVX7UyoqM8VPteCsexgndM0+9f8WmXSuBZJf2C0tFg76cjQlEfjKAqwJ
	kQcVOKqOLvk8FDBkplQC5TXRImTzy8uAAiDlUc2k9msrRIpRZmjbkC8LQfykRzuL1XRU
	k2cQ==
X-Gm-Message-State: ABuFfogS1SgE2x5gbXtW8Pu0oNOoPd6J4daIXYrPbUQN6+iiyJZgj/Cb
	XRElUevVUDSNnDkz0KHPBBVHyw==
X-Google-Smtp-Source: ACcGV610xMP+9NRrM08+3Zmuqhwp1eNPiOf9fG+iNOOp793m+265KrcorCCDiJajCfhLf285XGXs0w==
X-Received: by 2002:a05:6000:1ce:: with SMTP id
	t14mr5714997wrx.146.1539352813815; 
	Fri, 12 Oct 2018 07:00:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o17-v6sm1610618wro.2.2018.10.12.07.00.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Oct 2018 07:00:12 -0700 (PDT)
Message-ID: <a5b826c08416843fd31d1668524a1269ed3d6682.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ming Liu <liu.ming50@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 12 Oct 2018 15:00:11 +0100
In-Reply-To: <CALatG=4wF+yKGxkV5EmxBHdPvMr4FMQJpip01f1F6YH=5f6hbA@mail.gmail.com>
References: <1539267354-26753-1-git-send-email-liu.ming50@gmail.com>
	<CALatG=4wF+yKGxkV5EmxBHdPvMr4FMQJpip01f1F6YH=5f6hbA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Cheuk Wing Leung <cwleung@kth.se>
Subject: Re: [PATCH] python3: set PYTHONHOME for nativesdk
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
X-List-Received-Date: Fri, 12 Oct 2018 14:00:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-12 at 13:37 +0200, Ming Liu wrote:
> Hi, Richard:
> 
> > I think its this which is causing breakage:
> >
> > 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps/7/logs/step3b
> >
> > 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps/7/logs/step2b
> >
> > 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps/7/logs/step1b
> 
> Are you sure about this? This patch creates a nativesdk python3
> wrapper which supposes to run on SDK machine, it should not impact
> native sysroot binaries, and I could not reproduce the error with the
> patch applied on my local machine. (Ubuntu-16.04)

Sorry for the false alarm, its actually the cmake patches sine after
dropping those, -next built cleanly. Cc'ing Pascal Bach...

Cheers,

Richard


