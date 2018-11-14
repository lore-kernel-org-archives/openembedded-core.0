Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF466C17F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 09:32:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z13-v6so16459288wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 01:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EKdGuvyfv+6WwIxlZarUX4fxeB6P9QHML18ad1/3nLc=;
	b=iOeWLeAyqnPWAqcyqwqXYKBVQbx9MCo7Xqp6O/d1KV14la8GpUY4LSqeRUU0ltVdR6
	pVj6Dn2M43b60ECgCTMWbJqLecqUUsPUM/FtWUm5cWlJUdWzSU7irzGdpS7XgJbK3loE
	XHWd2OPCk2CVxSCGoe8fTXV9jCTO0xee5MAOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EKdGuvyfv+6WwIxlZarUX4fxeB6P9QHML18ad1/3nLc=;
	b=V2yU3YLK+1d/Im6bnfVInRazrHTCPxl4NNmF1Do75fXaOv7E0tYDzdBN37FSv89/pQ
	CjysYpdAm1TQOXH1KT6eZJngmSORJ9tj4Bynl3Z+Epc0IjgMkZpkmHJUYnLIzlUFMcph
	Guuv6ftgYbYaEwhvi2uWZOmBmnEIxZLi5Ji7iEUVm7PFwD/Ad7x0e/W7BclQixtKogDx
	eM+bxjLYMOlaHZQsZeCY0TTWfAywejPcEN7yTos39rWrX+ZkCsKk1tRiiwKm7WBH0NS5
	CNO2U9vJmzrKpeZLyV/BPxAwWrPyD3kdov6KcBrBIOhvhaTZtivGGvnDEuwHh7slyW/L
	XsKA==
X-Gm-Message-State: AGRZ1gJvt9yYnhpXsP1MjHT6wjAA0KSUXkr8WkhkPzjIigzbbb5FyIKX
	RuBDH5w38DsUxWHavZe42R681Q==
X-Google-Smtp-Source: AJdET5cOYOFpi6hOVVYnyoA1SEvamJ5DObeeuC7Fy84KC9nedUUVXijrMrqbjQUTUp52PdjPu9wjfw==
X-Received: by 2002:a5d:5390:: with SMTP id
	d16-v6mr1055154wrv.71.1542187951805; 
	Wed, 14 Nov 2018 01:32:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y2-v6sm38718548wrh.53.2018.11.14.01.32.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 14 Nov 2018 01:32:31 -0800 (PST)
Message-ID: <389bf0dd9a15dce53d94e4ae426d47099d083ae6.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2018 09:32:29 +0000
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D0434811F952@KMSMSX155.gar.corp.intel.com>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434811E1D4@KMSMSX155.gar.corp.intel.com>
	<3c2a7b56677a1eb00aace62b4608055810e9f9f8.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D0434811F952@KMSMSX155.gar.corp.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 01/12] build-appliance: Drop test which is already	automated
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
X-List-Received-Date: Wed, 14 Nov 2018 09:32:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-11-14 at 08:05 +0000, Yeoh, Ee Peng wrote:
> > In that case wouldn't it make more sense to combine these steps 
> > with  
> > some of the other build appliance tests? We could add an extra step
> > where the tester builds build-appliance rather than having multiple
> > tests which start "launch build appliance"?
> 
> In general, Pros & Cons for merging test cases, Pros: reduced the
> number of test cases & making it simpler for reading, Cons: loss of
> lower level tracking on the test status. 
> Example: currently we have multiple test cases for build-appliance
> where each test cases testing the ability to use build-appliance-
> image to bitbake different type of images (recently we detect that
> build-appliance-image was able to build core-image-minimal & core-
> image-sato-sdk but it failed to build the build-appliance-image), if
> we merge multiple test cases into general
> test_build_appliance_can_build_images, then we will loss the
> visibilities on which type of images failed when this test failed,
> unless we looked into the test log if test log were generated.  

If a step fails, QA will write a bug report for the failure. I'd have
thought it would be quite clear in this case what the failing step was?
QA would also always include a failing build log in such a case which
should also make the problem quite clear.

Even if the step was "bitbake core-image-minimal core-image-sato build-
appliance-image -k", the logs should still clearly show what it was
that failed?

Cheers,

Richard


