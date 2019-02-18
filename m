Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 04C3C74583
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 09:07:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w17so17380657wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 01:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=AGacCh7/QmTBWuRtNKpFkaYzesj7BmmBcyssnVX+hiE=;
	b=AWk8n3fEuGtTm5TQ/f5D8mJX/q8b01Mq8RRrvlWr3gIPf8i101cUcQE5tcitBAhZJv
	RVE2aBZW909JvjLUe4VL8ixftuUD4OS4nRq9XhZzMRS+JUfTcK5GZu9iN/La2NezYrUg
	LCXn6uy4L39KzCu9eNxucCqlcZmbmCly5v/sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=AGacCh7/QmTBWuRtNKpFkaYzesj7BmmBcyssnVX+hiE=;
	b=fHP0EAWwogCV0FBOuNmQtzRZEtTU/NURHtvwBzVVp+SCp8/6ItO6zILtfT5SXJMkPa
	Kc76mJw84ttxrkYeaamESJzZpLuKtl5GKvbZ9941KgtQ18RONg1HbM6Hrs+hiGWVtLcS
	doCKwj4Xh20mxExv+x2qGHAMWyCenm5lTWazBvvrCA06ayljOobgKCh6VZ8s4uWe0Jbp
	wZQ8Fv/6le/OK1JqXd9fFnKt24X6rDfmTpNB9Ig01k2yWBtIXGNxVZhMF/GXsK3fj/2L
	BCbfdeQYe01ffDtY+sppNAeiKCOw/JKcPQ/UNQQ8f8nPZKU36E3wgwYVREmZEHIFhPFw
	gopA==
X-Gm-Message-State: AHQUAuZkv2BKPPHiiPMgDFFVUlYUsUAkIXTy0gitE+GME3dSggOlj23M
	PLWBGzCfKQn+WkEOKZebJFA7YA==
X-Google-Smtp-Source: AHgI3IYq5UO+Cmqay/uOy+rCnhkRGtMZQvPz/QII5jLC04B4555zHbQeZRFJiFpe+5m4GwVHmknVRg==
X-Received: by 2002:a5d:6b05:: with SMTP id v5mr17187076wrw.76.1550480857491; 
	Mon, 18 Feb 2019 01:07:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i10sm25418676wrx.54.2019.02.18.01.07.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 18 Feb 2019 01:07:36 -0800 (PST)
Message-ID: <f8f1b23ffe248d9ad469b25ed2226fa426ed152c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 18 Feb 2019 09:07:34 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D0434818607F@PGSMSX109.gar.corp.intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
	<8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434818607F@PGSMSX109.gar.corp.intel.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Mon, 18 Feb 2019 09:07:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Ee Peng,

On Mon, 2019-02-18 at 08:09 +0000, Yeoh, Ee Peng wrote: 
> I did some testing with the latest from resulttool: Update to use
> gitarchive library function. 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=b9eecaabe56db5bcafff31e67cdabadc42e2d2e4
> 
> I had 2 questions. 
> 1. For "resulttool regression", currently it was comparing result id
> set without comprehending the difference in the host distro used to
> executed the oeselftest. Example: it was matching oeselftest run with
> fedora28 host distro with oeselftest run with ubuntu18 host distro,
> is this the expected behavior? 
> Match: oeselftest_fedora-28_qemux86-64_20190201181656
>        oeselftest_ubuntu-18.04_qemux86-64_20190201175023
> Match: oeselftest_fedora-26_qemux86-64_20190131144317
>        oeselftest_fedora-26_qemux86-64_20190131144317
> Match: oeselftest_ubuntu-18.04_qemux86-64_20190201175023
>        oeselftest_fedora-28_qemux86-64_20190201181656
> Match: oeselftest_opensuse-42.3_qemux86-64_20190126152612
>        oeselftest_opensuse-42.3_qemux86-64_20190126152612

There were two reasons for this:

a) the results of the selftest should be independent of which
HOST_DISTRO they're run on so they can be compared.

b) some builds only have one oe-selftest (a-quick) and some have four
(a-full). In an a-quick build, the HOST_DISTRO would likely therefore
be different between two builds but we still would like the tool to
compare them.

> 2. For "resulttool store", I had noticed that it will now generally
> stored testresults.json in a meaningful file directory structure
> based on the store_map except oeselftest. oeselftest currently store
> multiple result id set inside oselftest file directory without
> comprehend the host distro. 
> 
> For example runtime, store testresult.json with the configured
> store_map. 
> ├── oeselftest
> │   └── testresults.json
> ├── runtime
> │   ├── poky
> │   │   ├── qemuarm
> │   │   │   ├── core-image-minimal
> │   │   │   │   └── testresults.json
> │   │   │   ├── core-image-sato
> │   │   │   │   └── testresults.json
> │   │   │   └── core-image-sato-sdk
> │   │   │       └── testresults.json
> │   │   ├── qemuarm64
> │   │   │   ├── core-image-minimal
> │   │   │   │   └── testresults.json
> │   │   │   ├── core-image-sato
> │   │   │   │   └── testresults.json
> │   │   │   └── core-image-sato-sdk
> │   │   │       └── testresults.json
> 
> I believe that we shall again comprehend the 'HOST_DISTRO'
> configuration inside the store_map.  
> store_map = {
> -    "oeselftest": ['TEST_TYPE'],
> +    "oeselftest": ['TEST_TYPE','HOST_DISTRO'],
>      "runtime": ['TEST_TYPE', 'DISTRO', 'MACHINE', 'IMAGE_BASENAME'],
>      "sdk": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE', 'IMAGE_BASENAME'],
>      "sdkext": ['TEST_TYPE', 'MACHINE', 'SDKMACHINE',
> 'IMAGE_BASENAME']
> 
> Doing so, it will store oeselftest in a more useful file directory
> structure with host distro comprehended. 
> └── oeselftest
>     ├── fedora-26
>     │   └── testresults.json
>     ├── fedora-28
>     │   └── testresults.json
>     ├── opensuse-42.3
>     │   └── testresults.json
>     └── ubuntu-18.04
>         └── testresults.json

The reasoning is the same as the above, its more useful to allow the
files to be directly compared between different host distros.

Cheers,

Richard




