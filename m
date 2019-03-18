Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E5EF97C6E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 11:15:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g12so16557703wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 04:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=T7dfznsk5zKq0162yEoVGZ/5nlaT7XPW7+nrUiLe24E=;
	b=aYgYKJj8YmoRth+SizxDaAK4hcuSuILnB+ETDBNrNwjlcDFzhlNmlYV6v4dolCI26I
	kBzeL2BE91wvC77N7tryH9zrL9hbEzWN9drk7yW/K7MIAOhD4pzjsSOrfZL9gU0n2Ycz
	gQq7b70sDiTLiKQVFSA5BcFjGJG/psmUBX8x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=T7dfznsk5zKq0162yEoVGZ/5nlaT7XPW7+nrUiLe24E=;
	b=TQgruzVk7uhMvA5rFlK7h79TpjhTpDo3XQrndKtbqP2gl6j8WPyBgu/1GDvKyYUqci
	Vti+qiScREbwdKkr3qHaf30MU8zz6QkGmLfdSJeiuoONiy5HQlQoGuGOAiY94nT0Aras
	hWk9eI/58f7WRypALkwZc5bhWxt/AWc87mVmPCPq5Hgrm0st6/ISaoQiT/8P/D3lBt/o
	q8UWZSYisGTy9sJhDjAjR9FoPQRwkDzMBrKSvyYlDAf0t0gaduyM94NSN5dILtUSkcfo
	3x2sCbAaRbtNWbGbyzr5D69tSWuIvhU5HzucqLqk+X+25XLiG1WYGcFw3m4j9uVqtF5M
	JVzA==
X-Gm-Message-State: APjAAAWhlW7qUPA26AyjR6VigWmiNNlLxiqCBpG/gB6yQlMR3/MaDpn8
	QYZdzPjce/SY/afStuyhxv94YpXTtn0+/Q==
X-Google-Smtp-Source: APXvYqz4+klMvCm2GJJ1+nVs4ThTgCSlhYxVT+uQMpPuIEYMCXDh6Caxa+KOCzp0fcaTggoXRDrtZQ==
X-Received: by 2002:a5d:46c9:: with SMTP id g9mr5263066wrs.211.1552907738686; 
	Mon, 18 Mar 2019 04:15:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u134sm10195406wmf.22.2019.03.18.04.15.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 04:15:37 -0700 (PDT)
Message-ID: <3c87f366b69756abc62d37aac4e4683d75237c79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2019 11:15:36 +0000
In-Reply-To: <c7b19826-0eb6-2e9d-1369-9d407895826b@topic.nl>
References: <c7b19826-0eb6-2e9d-1369-9d407895826b@topic.nl>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: Cannot get bitbake multiconfig to work
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
X-List-Received-Date: Mon, 18 Mar 2019 11:15:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-13 at 10:03 +0000, Mike Looijmans wrote:
> I think I've done everything, but cannot figure out what step I
> missed.
> 
> I am using yesterday's "thud" branches:
> 
> BB_VERSION           = "1.40.0"
> BUILD_SYS            = "x86_64-linux"
> meta                 =
> "HEAD:fbb688ab3eeca1bbfbaaaaffd8c81fd8052bcc68"
> meta-oe
> meta-multimedia
> meta-networking
> meta-python          =
> "HEAD:6ef9657068492d4644079c88f2adee9c3cac9543"
> 
> 
> I created a conf/multiconf directory with a "pmu.conf" file (and
> others)
> 
> $ cat conf/multiconfig/pmu.conf
> MACHINE="zynqmp-pmu"
> DISTRO="xilinx-standalone"
> GCCVERSION="7.%"
> TMPDIR="${TOPDIR}/pmutmp"
> 
> I added to my local.conf (and removed the MACHINE setting there):
> 
> BBMULTICONFIG = "pmu ..."
> 
> Now when I invoke bitbake with the multiconfig syntax, it completely
> ignores that:
> 
> $ bitbake multiconfig:pmu:pmu-firmware
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>      Either fix the cause of this error or at your own risk disable
> the 
> checker (see sanity.conf).
>      Following is the list of potential problems / advisories:
> 
>      Please set a MACHINE in your local.conf or environment
> 
> 
> Apparently, bitbake doesn't even care about the "multiconfig:"
> syntax, I get 
> the same response when I type:
> $ bitbake multiconfig:blah:pmu-firmware
> $ bitbake multiconfig:blah:blah
> $ bitbake blah:blah:blah
> 
> I can add a "MACHINE?=" to local.conf, which results in a build for
> that 
> machine and nothing from the pmu.conf gets ever used at all.
> 
> So what step did I miss?


The piece most people miss when thinking about multiconfig is that
local.conf still needs to be valid as one of the configurations. Did
you try setting MACHINE to something valid in local.conf and then
building the pmu multiconfig?

Cheers,

Richard


