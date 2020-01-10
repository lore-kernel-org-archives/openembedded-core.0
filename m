Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 43A2F7FE76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 11:02:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so1520039wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 03:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Fa0rJNZL+nwyuBp7bw5HwOeIZiNi83wNfjH2vnFYqEM=;
	b=aJ4b6i5f1j+29cDK/8eoO7W3pEqPvImH/axd72nhcVC2GCx8RN8XXPjM9ADS3HT4lm
	DwHW+btOf5cYSYzTXu/NS2LehibQIK0FZZO+MF7lCCuHblxW3I/ke+7h1PMr8BykBepk
	FJ1OHjvTLono3lOwi3hzbwO1ktPfdfonBJvZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Fa0rJNZL+nwyuBp7bw5HwOeIZiNi83wNfjH2vnFYqEM=;
	b=lVCyF7rpbA6H8LwMUf9oRVTmDEWzp5kf+EeJN5lMG4eJh2dTxoQstdISGcPT9owifU
	40oWm7iO4YxugyQZAGxEtmD/2silGUe4T52kk/JExk5h9jqq/hYNlbTP4llP4A+vhDLq
	ypZWlDUsJhl9M5TowBuP7vzuKEWKaYsOOdOag6er0wpHNC8bH021feRGeLnh0wP0o50Z
	POlBk1cymTS1vuhb8V+2Nj8TdL+RXTiNrHeHPT7ohNILCU65DdKuwnsrwzsNvdtldwLF
	Ub7lDihnJB/33yrzvv99KBtFBkqQgUziv69lfDgMWfaJFdOsoc2XP1N27Ei57Z9NjQV4
	ZLhQ==
X-Gm-Message-State: APjAAAX2SQaOyEWvO43Q6e8vTGwW5gZS4HMCBc9GskMZTi485HupryyN
	5I8H+nNpg2v1Qztj9fXagtU1SA==
X-Google-Smtp-Source: APXvYqxspyaN5dipQY3o3x0Jz6a4axcmki6DaGPegeCTc3k0z2T5nIFWiXN/YD543kzpb5BbmYel1w==
X-Received: by 2002:a05:600c:294d:: with SMTP id
	n13mr3427189wmd.130.1578654123819; 
	Fri, 10 Jan 2020 03:02:03 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id l6sm1859074wmf.21.2020.01.10.03.02.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 03:02:02 -0800 (PST)
Message-ID: <c03bd9ff0e73c5bde8ae080d0ce057b90094c691.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 11:02:00 +0000
In-Reply-To: <20200108132759.95603-7-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-7-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 07/28] acl/attr: update to latest upstream releases
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
X-List-Received-Date: Fri, 10 Jan 2020 11:02:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> The latest release use standard autotools, so drop all
> the build system related hacks and patches.
> 
> Ptests have been rewritten, with 100% pass rate for both.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../0001-test-patch-out-failing-bits.patch    |  63 ++
>  ...dcode-the-build-path-into-a-helper-l.patch |  24 +
>  ...file-libacl-should-depend-on-include.patch |  51 --
>  ...-order-of-expected-output-of-getfacl.patch | 198 ------
>  meta/recipes-support/attr/acl/configure.ac    |  49 --
>  meta/recipes-support/attr/acl/run-ptest       |  60 +-
>  .../acl/test-fix-directory-permissions.patch  |  37 -
>  .../test-fix-insufficient-quoting-of.patch    | 100 ---
>  ...-SELinux-machines-for-root-testcases.patch |  84 ---
>  meta/recipes-support/attr/acl_2.2.52.bb       |  52 --
>  meta/recipes-support/attr/acl_2.2.53.bb       |  64 ++
>  meta/recipes-support/attr/attr.inc            |  41 +-
>  .../0001-Use-stdint-types-consistently.patch  |  69 --
>  .../attr/attr/attr-Missing-configure.ac.patch |  63 --
>  .../attr/attr/dont-use-decl-macros.patch      |  56 --
>  meta/recipes-support/attr/attr/run-ptest      |   3 +
>  meta/recipes-support/attr/attr_2.4.47.bb      |  15 -
>  meta/recipes-support/attr/attr_2.4.48.bb      |   6 +
>  meta/recipes-support/attr/ea-acl.inc          |  52 --
>  ...option-to-enable-disable-static-libr.patch |  70 --
>  ...e-attr.5-man-page-moved-to-man-pages.patch | 240 -------
> 

Fails build reproducibility in ptest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/610

Cheers,

Richard


