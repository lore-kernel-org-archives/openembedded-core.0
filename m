Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C90016BD4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 21:10:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r10so31759225wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 13:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Shb89X/7JfcTpUDIlpU0R8miCIEfrQzWz2KQtaA9ocI=;
	b=T2UPl3BCKVKJ1E7o0CzAh4WdMo3/KzPPP8kZQSmTWaAPTieDNL8JAIop579UZvixZZ
	uJXScYL6G03WUCzdxQ3uI634L1h1qOLSdMlao7W2t5KZMKLi1HXtKf0qaMqG7SknMBRX
	oVgc+EzZPgVEg1lCgpym9sZQAmX7nP7lS7czg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Shb89X/7JfcTpUDIlpU0R8miCIEfrQzWz2KQtaA9ocI=;
	b=tjNnIvr/P4TIlA39AE85VW+f5pixyWBjQSsVtLVeZ93To3KynAttX77Hq6ONBEWxHK
	tEMP0n/IOxUBwpmLookWGP7Pk2DG0qhJlx2mtjbMPnct6PlPLhWok6hd5fSyisfh5Lbv
	TU00OojoNVA2mtZV4Cfgd45RoevKnxxPS1zrs2gYmfD2Ge1aUOgFq487OzkJKhgNYa6Q
	7WAZqO28/EEVEaMkmuwVHOSEo0+1TKW1D2wNB7b+fUTiccPEU+eZIeL3NKHhKgH7PElE
	3tUI8MS88CCqcuIECgwgaslOq9Lw9ZhpNiqUCaD4SfMNn9sAFfJcIQWKUgMpqP4oVknW
	t+Lw==
X-Gm-Message-State: AJcUukfbSIan3s2U1Wldq689h9ZWCt/PbZcjDJXwcsQTTe4ZHX04PdhZ
	qWcOFapTmMZqogeFn4t696tEug==
X-Google-Smtp-Source: ALg8bN5hwCcGAPLx6WiyC/5Y59calZjTbygVlx6PD7KvopbM4L9zWgSuhMM2RZXbAFTgV1WmetOh/g==
X-Received: by 2002:adf:ee89:: with SMTP id b9mr40836100wro.246.1546463431235; 
	Wed, 02 Jan 2019 13:10:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b129sm27825480wmd.24.2019.01.02.13.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 13:10:30 -0800 (PST)
Message-ID: <2901bb5e08ab0951951579651c52b2970066d2f5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: roman.stratiienko@globallogic.com, 
	openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Date: Wed, 02 Jan 2019 21:10:28 +0000
In-Reply-To: <20181227123849.5532-2-roman.stratiienko@globallogic.com>
References: <20181227123849.5532-1-roman.stratiienko@globallogic.com>
	<20181227123849.5532-2-roman.stratiienko@globallogic.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] eglinfo: add wayland receipe
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
X-List-Received-Date: Wed, 02 Jan 2019 21:10:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-27 at 14:38 +0200, Roman Stratienko via Openembedded-
core wrote:
> From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> 
> Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> ---
>  .../eglinfo/eglinfo-wayland_1.0.0.bb                | 13
> +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-
> wayland_1.0.0.bb

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/83

2019-01-02 17:48:44,799 - oe-selftest - INFO - ======================================================================
2019-01-02 17:48:44,799 - oe-selftest - INFO - FAIL: distrodata.Distrodata.test_maintainers (subunit.RemotedTestCase)
2019-01-02 17:48:44,799 - oe-selftest - INFO - ----------------------------------------------------------------------
2019-01-02 17:48:44,799 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/selftest/cases/distrodata.py", line 82, in test_maintainers
    """ + "\n".join(['%s (%s)' % i for i in no_maintainer_list]))
  File "/usr/lib/python3.6/unittest/case.py", line 670, in fail
    raise self.failureException(msg)
AssertionError: 
The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
eglinfo-wayland (/home/pokybuild/yocto-worker/oe-selftest/build/meta/recipes-graphics/eglinfo/eglinfo-wayland_1.0.0.bb)

Cheers,

Richard


