Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB057DCD9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 20:34:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id f7so6101924wrs.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gjVRv7wUo/AEbX/0ajkEq01IcnXOJTLfSrldT7OJAEA=;
	b=S0mSIwP9tRGI8z8HKTXA5mhiPrbPEPLNYw0PHhpl0s38ItbWX+sNlcR6vocUd4wuit
	9HjRugIn/3vPeWGEopc7KK4dL9wnsEfc36FMQJlbZH04D+osEhYLJCnCkPz4SBYWsmtJ
	rXCrF2WkTCkxMcAtsHxsWCanszCJFvwjXl2Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gjVRv7wUo/AEbX/0ajkEq01IcnXOJTLfSrldT7OJAEA=;
	b=b7MTVPAUj0iGyLp4lJ78Xj9oRY5Z0sNOyOar1TcSiTcyTuAStVS0mNmyc7JEu3E/LL
	eETO2xhwk5zpSW3nVDFHuMJ5n4IKcbOG/XZ/3iHbf+LYkkA18lQezQIa+qQrsu/BnKVq
	Go3H3I+p9yaBRpOWA+kx7eUOhtP9R8SxVq09svRToY6/sZIjEIRMhQOgaheAR9CqEcCS
	+qJ7mwqRcChlhXWwgNS1wbCq5XItKAA42GAMJGiterm4m6jSJqpPZsSLhXuCxem7Zt1g
	oRG4ORqJH1OOrRrnqai55P3oGvtsK1FtaIPNjIsqbOvZ4ttPcxDIo3yuZRiowU09oNUS
	G45A==
X-Gm-Message-State: APjAAAVS7WHEkd05+ScLda/iCPyiCa0xv0QLI1+uNCsU7CH/pRCeF8nL
	tsO4OYVQ+vWIQoeKtC5fYEvKig==
X-Google-Smtp-Source: APXvYqzsMIIbNLTvgC74g/omJh7qO/TnwnGY/Gb7mer/XQXgaLhXp8iPiFCRz8ZgvPUcDQCxZlCecQ==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr13558046wrv.131.1556310889278; 
	Fri, 26 Apr 2019 13:34:49 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o6sm51475936wre.60.2019.04.26.13.34.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Apr 2019 13:34:48 -0700 (PDT)
Message-ID: <e290569afc4a08a1489cf033195e32d58ba78e19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2019 21:34:47 +0100
In-Reply-To: <20190424091318.18154-1-schnitzeltony@gmail.com>
References: <20190424091318.18154-1-schnitzeltony@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] vte: upgrade 0.52.2 -> 0.56.1
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
X-List-Received-Date: Fri, 26 Apr 2019 20:34:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Wed, 2019-04-24 at 11:13 +0200, Andreas Müller wrote:
> * license: COPYING was replaced by
> COPYING.LGPL2/COPYING.LGPL3/COPYING.GPL3
> * prettify recipe a bit
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
> 
> V1 -> V2: Fix build with musl

I think something with vte-native is not working quite right with one
of these patches and is causing oe-selftest to fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/433

(oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk)

Cheers,

Richard


