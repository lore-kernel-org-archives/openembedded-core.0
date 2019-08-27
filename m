Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8C04D7EBD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 23:29:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b16so485449wrq.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 16:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=3ybS8wKQx/nC6LPhWPQxFYfClylrPfWlswY0LrphaC8=;
	b=PJLzhlhFrVMC3q7vOQACFv3b0/b4E8eij+h5XeFQIktWWfRiLs+TGh296fxTdvOqGH
	KSHrLyjunSi8g3CbueBcOxAPuD20kjOovAkeI+MNtXQ800bT3gwnJpOYMHNqpM/A3G9f
	9ZOVmegB2KU1DvGyVwVWtlaACpAR3Tff0D7jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3ybS8wKQx/nC6LPhWPQxFYfClylrPfWlswY0LrphaC8=;
	b=pgVJdmtTFJvp+hBpNGIPzkIUPunAjIOutRS/BsqnPse99L0urDvZFRm1Er5kog5DrP
	k8TKPI+ymhKbcEE88QSfAzumCFPTREgSGJ2GnyURPYfT0FR6POsXZfXbeqAeo5I9pX3j
	HwliiI1+miq3uz9OcV1fXftOxlUx5wQbC1Mx5n51d34u1ktGAH0tyPD1HcH6pMIoJz+C
	Hv8+iaxo94nmXfg3ETw0pGyUVaevFYsZ3OolB/TGEgzkwLQT6PWmb3122INQYbFvqncb
	PXCuTlCmbDlqCVVQ4Y02fpFwgmvrxKrhputKxsqTQ2xv+P5ndOK+9JKMEjMwvTm5k5Zo
	YreA==
X-Gm-Message-State: APjAAAW/5V9+Ath8otuYUb449LhoJv7j+vQF7tDz7YcggC0qxPU+GdZa
	96PfE9y/7Fepn/Vz8Z+wLr6qtw==
X-Google-Smtp-Source: APXvYqzRFICoHXSXwiSFPu5iusT0+e8rM/B8YKO/6rssSZ6k+eyviXWaQr2bkslzyeVDBnwTc5hqyQ==
X-Received: by 2002:adf:f507:: with SMTP id q7mr575592wro.210.1566948563154;
	Tue, 27 Aug 2019 16:29:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 39sm1618902wrc.45.2019.08.27.16.29.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 16:29:22 -0700 (PDT)
Message-ID: <dbf4f8583c8616bdc437c37cc68a0f76e98d608f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Kang Kai <Kai.Kang@windriver.com>, Hongxu Jia
	<hongxu.jia@windriver.com>, openembedded-core@lists.openembedded.org, 
	armccurdy@gmail.com,  alex.kanavin@gmail.com
Date: Wed, 28 Aug 2019 00:29:20 +0100
In-Reply-To: <7210fb6d-563e-497c-a25b-bc53ffe15954@windriver.com>
References: <CAJ86T=WtuV46YbMMcGigKRrsvTNTtgWWdNLDp2P27-Zx6Rn+Yw@mail.gmail.com>
	<1566279918-9733-1-git-send-email-hongxu.jia@windriver.com>
	<7210fb6d-563e-497c-a25b-bc53ffe15954@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH V3] nfs-utils: decrease RLIMIT_NOFILE to 4k for systemd
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
X-List-Received-Date: Tue, 27 Aug 2019 23:29:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-27 at 17:43 +0800, Kang Kai wrote:
> Hi Richard,
> 
> This patch could fix the test_image failure with systemd. Would like
> to 
> try systemd as default init manager on yocto build again
> to check whether any more blocking issues?


There is at least one issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/67/builds/967

Please monitor this build which should show up any other issues: 

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/645

(master-next was looking green other than this change).

Cheers,

Richard


