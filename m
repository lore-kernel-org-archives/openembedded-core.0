Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 62EBC7952D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 08:19:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id e1-v6so1294073wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lXBVtfAR64/UDlyzRjZzoHE3p9Xlle5F0Tl7aOR8Wvc=;
	b=VR6Jjb5mRrkIOnHsc8TZkS5TcxDxwqa20G1FSdEfsjHHFNlE4H2tAC7ceF0L2SyiYL
	9p+XHJTi7KcHssTcuVmBd/oavig+0n3SUwm6V4Z/chcrex5zO30MnCmGqOJ6xtWf+lyn
	UyEbrmcUo6+TnzL9+r5neQM/ckfaJucwtSPNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lXBVtfAR64/UDlyzRjZzoHE3p9Xlle5F0Tl7aOR8Wvc=;
	b=pxkNO2bA8iHcwpIRzhm8IkWxE+i7XTsqO/v0pX6csXi2mWqRgbbAWO53ZMnUkqxdja
	7u8T3wN7IHD7gNGWeuyuwR8gyI2PK2nV7ScSxeVKLD1+Xk/wgpMAdT9LoK7fUIv8HlY0
	dmRbfAD8WO0/hRs1dmwgF9eelopIKjTuQGWFRDuCMks1hSdNGTwlDQOCHl2FBA3YCoUk
	tBKKySOKIS2eKIT3PdA81XlXwwNAKwBR6Tr5lDLutscS1S6Tl3450l5IOGR4eTHRd0mT
	OYOYF6VWeMY6KmGkex3rzK/pOyknTL6TybOvarWBr0uR3LbEkTAWS0etKAM0gWr/NLeN
	aWvw==
X-Gm-Message-State: APzg51CtFXTsLxZWYpkhJW7bTdPMhPe5QFoJH5ugXxDOYJt8anmDE1K6
	Kpr9all9oJTOy9XTX5yq2YVsEg==
X-Google-Smtp-Source: ANB0VdYKkjyLXW8A719oJzDstLDWby0p4T0lRZahAPH4B5NB+IwC5eVAI2GPOQfjA+/t2+PddagZcA==
X-Received: by 2002:adf:bd90:: with SMTP id
	l16-v6mr1378345wrh.250.1536221963075; 
	Thu, 06 Sep 2018 01:19:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	132-v6sm3936966wmd.13.2018.09.06.01.19.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 06 Sep 2018 01:19:22 -0700 (PDT)
Message-ID: <4f62f20f8d4b9378684b6224ddf7d1bc5cfca814.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 06 Sep 2018 09:19:21 +0100
In-Reply-To: <a7d35d68-e546-408f-561e-c5a3a8f4aaa5@windriver.com>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-7-richard.purdie@linuxfoundation.org>
	<a7d35d68-e546-408f-561e-c5a3a8f4aaa5@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 7/8] busybox: Put klogd/syslogd alternative links in syslog package
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
X-List-Received-Date: Thu, 06 Sep 2018 08:19:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-06 at 10:11 +0800, ChenQi wrote:
> Hi Richard,
> 
> I think my previous patch has covered this case.
> 
>    git://git.pokylinux.org/poky-contrib ChenQi/busybox-alternatives
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busyb
> ox-alternatives
> 
> Chen Qi (1):
>    busybox: fix the alternatives logic
> 
> 
> Is there some problem with the patch?

Sorry, I thought I'd replied about this. There were build failures from
this patch and I had to drop it from the test branch. I'm afraid with
all the build failures we're had recently I'm struggling to find which
failures those were...

I merged my simpler but less complete fix simply to get patches moving
as I'd assumed this one was being debugged. I guess we need the
failures for that though...

Cheers,

Richard

