Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1C081617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:28:31 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 20so1441905yks.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 12:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=PD0zXSbcHhMSARHFo2kcW9L5STurYdRDHBfkzHOVWVE=;
	b=iG313DfuxerwhXekwxHd3wbuwc0rkdjED0LYlMcFRRn2/eniSRmTQr8d+RibQYNHCi
	yHjawfYhUX6UZP7ZA0YLFRwj8TvJ9G7+yRBg77SYCbjQ0SAdFPPK4InGIfwQ5JvNTx7W
	Fxznr9yhFsj3jy7IWMmfE/sGZckY6zdYkZx+xv6RNLpo26fNa8RPmNKTmvW1Uecsy3Ad
	upm6nOGmi8e0PVF+dqrhsSH+WIhZqIA4OIOSHGoSso4JEVLnJua872TbvbYJscZsfbew
	QlF5CYJJC13ATiTcxbfQ9sTbtD85tG2sDQaZ7ftkN6pdt5EnIN7KAEqmEv8oxk7dRwjZ
	ThDQ==
MIME-Version: 1.0
X-Received: by 10.236.91.74 with SMTP id g50mr35812329yhf.59.1408994912343;
	Mon, 25 Aug 2014 12:28:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 25 Aug 2014 12:28:32 -0700 (PDT)
In-Reply-To: <0e3c53a4d84fa2a3c5e6b53697b953fab59a71bc.1408993148.git.raj.khem@gmail.com>
References: <cover.1408993148.git.raj.khem@gmail.com>
	<0e3c53a4d84fa2a3c5e6b53697b953fab59a71bc.1408993148.git.raj.khem@gmail.com>
Date: Mon, 25 Aug 2014 16:28:32 -0300
X-Google-Sender-Auth: rTJBngEt34xdusNs8O-feHTb-zU
Message-ID: <CAP9ODKqY11_EXarBER9MqxE-DCD7Dp_mGjVZZjrHtwk9rzomog@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] native/nativesdk: Clear MACHINEOVERRIDES
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
X-List-Received-Date: Mon, 25 Aug 2014 19:28:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 4:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> In cases where we override variables e.g PACKAGE_ARCH
> conditionally and use a MACHINEOVERRIDE to qualify the
> override like
>
> PACKAGE_ARCH_<MACHINE> = "some target PACKAGE_ARCH"
>
> This would also be effective if this recipe is
> BBEXTENDED to native or nativesdk which is undesired
> This particular issue will cause wrong sysroot to be
> used for nativesdk case since PACKAGE_ARCH would have
> been modified and eventually changing value of
> STAGING_DIR_TARGET which we use as --sysroot option
> to cross and cross-canadian built SDK gcc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Tested-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

