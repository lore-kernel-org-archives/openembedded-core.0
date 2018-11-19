Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id BC8B06C10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 15:11:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id w7-v6so5687035wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 07:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uFHL2ByXLZhTWHySmzDcA2wlSmQg0OMOCCk31jGkPO8=;
	b=QRVb0Crb5PmLuC4OKgivMP5yinSo12MWd+IciOPFpk2NaiP6y6zzp/m2glmty0nGBa
	0cwpsomJAw4LHkEtQ2fOIJUDS6lrXhzBCb0UBW8DUfUKdLpnDwwJ3Xa+HyCbAwK7uTGE
	c6TY2kn4H/MvSaR3iU/lxUX//KzEepkZv/JAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uFHL2ByXLZhTWHySmzDcA2wlSmQg0OMOCCk31jGkPO8=;
	b=WCfDleYIz7FYT7Ir+Ib1Ht6YV07+Zw90BeF3cXTEV45HjJdXNQYrXIWhYPbgc4As3p
	L/FnultfNzxA+aUObl6hwcTlfjvPxu6s55JtNFB/vhAO71Lw0b72EWHW9SP3OBUoEWCW
	bqQ1YYJN+FFwfmHVQoo9ahXV8dskENm7//ypF6QGxctNsB0IyBMvS4ck8I6C/zdfblDn
	wCyi3J+Ciingc6cVtcrniXpOLz8f/tsgvcrzcnzlMHXXpO7cmceXd7houCAppdY+sJyq
	i/1B8zb8pw1Nw50/OAJnrQDubG8yxCDbICjKirm+Whd7mW/DpPmym3TLatN0anEy0kmG
	eERg==
X-Gm-Message-State: AGRZ1gJl0Ezu4Kz0iPNLPBPJxss6StUqxeVXfV3WW5dCv8pVCWBVSy2d
	cJJIjTloETEzDTxWZcvYv3XBXw==
X-Google-Smtp-Source: AJdET5ciC4H9umJiqml9OdiI7awsrmOnEwOPw2NGAlfsYc/55t0IWkH0Pzfd8qP83oo3Hsjw2Y+ytw==
X-Received: by 2002:a1c:c008:: with SMTP id q8mr6800979wmf.99.1542640311389;
	Mon, 19 Nov 2018 07:11:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v16-v6sm22515416wrv.90.2018.11.19.07.11.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Nov 2018 07:11:50 -0800 (PST)
Message-ID: <3a2a5bf58f8d10fb30b915eaab8627cabc087643.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Valek, Andrej" <andrej.valek@siemens.com>
Date: Mon, 19 Nov 2018 15:11:49 +0000
In-Reply-To: <D55698ECEC159B488D62A508E18D7FEC01696588@ATNETS9912WMSX.ww300.siemens.net>
References: <D55698ECEC159B488D62A508E18D7FEC01696588@ATNETS9912WMSX.ww300.siemens.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Update sdk dummy providers
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
X-List-Received-Date: Mon, 19 Nov 2018 15:11:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-19 at 15:00 +0000, Valek, Andrej wrote:
> Hello Richard,
>  
> I would like to ask You a question about your commit (
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/meta/dummy-sdk-package.inc?id=0d0984e1e616c9f1c211b7b980ba2ca54c096e6e
> ) to update sdk providers. I have found an issue regarding to
> buildtools.
>  
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>     Either fix the cause of this error or at your own risk disable
> the checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
> 
>     Required perl module(s) not found: Text::ParseWords Thread::Queue
> Data::Dumper
>  
> After analyzing, I have found, that buildtools-tarball contains a
> nativesdk-perl (in manifest), which I guess should be excluded.
> I have found, that after removing comments your comments of
> d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}") and RREPLACES_%s
> in meta/recipes-core/meta/dummy-sdk-package.inc it works. Is there
> any reason, why You have commented out?

Good question, I think this behaviour is package backend specific and
I'm not sure if those commented out lines were accidental from testing
something. I'll remove them and see what the autobuilder makes of
that...

Cheers,

Richard


