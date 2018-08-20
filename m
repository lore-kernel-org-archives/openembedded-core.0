Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD8DF7908D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:14:15 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 13-v6so26415293ois.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xYQQJDE7T8OeGeyQf+PMtBIhmRZQ+SrsibWTU4evxis=;
	b=E1bnypVgrtBkWYlkGdwKhzQiSkvG9ftecgTCNYg7m7wo6UaMuNPvsZzihw44I/M1kW
	sWPdIsSqurHYmRHd8hzhxJwxMNj1Wv9uwXK7gOmGL5Mf5T5jiV2p0d4KK7Egtg8bGxTv
	cMLf2QKoYB7zd308W8tdG7OFWDEy5O0kV5Dqj1RqNYmKDYxZKBMcgYl0FbqSM84imFdx
	1fhw1jPIGVE9mEg1lkEbvzIkrCgfleWEcF3KrSAvrewtG/wKRO1IR/p5sgBaudhDKoDG
	OP74bWsyG++Quot9AtMuiucrQS1d40NyE+aShaemDeiR2Q/OauI8xvMMSZEUt0vFZxMc
	FGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xYQQJDE7T8OeGeyQf+PMtBIhmRZQ+SrsibWTU4evxis=;
	b=TTcnctg8jqTClNbXRhFnnavwl9pvPnBp718g1bR8n5gmbh8qo9WPqXPBPCWFOuDc6c
	JykUuBLcV6VQz8Swl5EzS9s936GVdefVPFt9EYHLttfc/YKjYiOMvAj9/bqwhkr2Z/iV
	qZiPvzmwrfnwMecFHwtNcqu+FL5MPSkKeulYS9Vchp4f1yuCIhi+vkWsr3qHEXGwZb3t
	HRrA+mY47M0kH/2lmNEcMyHYLRe8DMYHwOd0RCVr1F90x56D9q3TgAYVFM3bjFqWQzRY
	8fRnywUGdbxOzUZDSqsNINzAPg87YLHD1H1asSKmGk6Kf6PD21A+HlHAMaDWSt8dM8ul
	BN9Q==
X-Gm-Message-State: AOUpUlHN2TazFBe+jdy7kq0Wbrwvv2W8/f7lBMYi70imgN5XxcnF/aS9
	LZgE19FXZYsJc6EMI9ycfORvKYdcitaKrxnc8gWzDdH4
X-Google-Smtp-Source: AA+uWPxGpX/XmtpteNCApjBzGlJuQomy/ZUdrpS0btZvDCNDJDZhGvrVXTJAao4gMwOD1kICbg03ZdD45MWOGGg1FR8=
X-Received: by 2002:aca:edc1:: with SMTP id
	l184-v6mr14442024oih.65.1534778056649; 
	Mon, 20 Aug 2018 08:14:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Mon, 20 Aug 2018 08:14:16
	-0700 (PDT)
In-Reply-To: <lywoslrvbf.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lywoslrvbf.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Aug 2018 17:14:16 +0200
Message-ID: <CANNYZj9NvALbQks02PS_Q-9cc=ZACfxWX8O3FKDC1-aP1p964A@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Submission of 'emit-buildvars' class?
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
X-List-Received-Date: Mon, 20 Aug 2018 15:14:15 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-20 16:01 GMT+02:00 Enrico Scholz via Openembedded-core
<openembedded-core@lists.openembedded.org>:
> we are using for some time an 'emit-buildvars' class which exports
> bitbake variables into makefile fragments.  This class is used for for
> developing of kernel, u-boot and other low level software and for
> generic packaging.

I don't quite understand how this is useful? Can you provide specific
usage scenarios please?

Alex

