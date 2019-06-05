Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4F14C6C4CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 22:05:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d17so377857wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 15:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=qWzu3lc8ATzNwENZ1X6+YWBKx50/EkqARHccMTj1Gf4=;
	b=XERrPkNfQdxANTKNBdZSZxLcnBAvwo2Ha3dU4zK8sr646AtmLPjWyXENcnst29c1O7
	L1Nj+lMeS19d+kPEA8RubzMzuLhtsssiW3+4RzVcQQNye/oeb2CHBnd7K5wbntZcvgoW
	wx0wd2cj+4xbkWp0Uy823fWpnHeCzmmdcsFkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qWzu3lc8ATzNwENZ1X6+YWBKx50/EkqARHccMTj1Gf4=;
	b=H431WuHhvCNZM1REU1K1+meeOTzjmtJyIy2L/jTMyN6gyhRZXqR6m+T/sXjfb2WcbM
	gMbEVdEpetCmtQrjat/AlQlikHG/QsOH+ZYTesKDVMpBkCGej9PWavyTrjOp/hpCVwv6
	6IMP45OJGNl+7zAcqL6zU8/jla5zIRejdfgHXEzxl9Bz4dEON5o7lASDwRXfbcFYeAeK
	zw1EvPH0PqdZei7AsNl3H5a7VetheEwU2/XFlujWEc7kLADFpuf9jZDEuwR4M1IcxgNM
	LJVYb+cfnZcXvMt0CVdmJcSxb6f5eJUTZHTwmLOsA19E+AKbF2rhMEDJMgGj9+N437Bx
	81bw==
X-Gm-Message-State: APjAAAX3Oi0AttvpKDq3+8FlSdZwm/djiNshTxyyhokmowEPICI9JlCa
	iAXESWJ9iH8P3j0CDtsHv4xFdGpO7SE=
X-Google-Smtp-Source: APXvYqy7zkz9Oo/1smCKZUL7w1QfFC9AktkztUNyZDlJ20oooIP0ozqyNUMKHSmfY+FmVs9b6aNT4w==
X-Received: by 2002:a1c:eb16:: with SMTP id j22mr11128854wmh.56.1559772356962; 
	Wed, 05 Jun 2019 15:05:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t14sm59167wrr.33.2019.06.05.15.05.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 15:05:56 -0700 (PDT)
Message-ID: <3ac933c8a87df80234530828d585bf4bd919314f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Jun 2019 23:05:55 +0100
In-Reply-To: <20190604192939.29929-2-sakib.sajal@windriver.com>
References: <20190604192939.29929-1-sakib.sajal@windriver.com>
	<20190604192939.29929-2-sakib.sajal@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 2/2] bash: inherit useradd and remove redundant patch
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
X-List-Received-Date: Wed, 05 Jun 2019 22:05:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-04 at 15:29 -0400, Sakib Sajal wrote:
> 1) inherit useradd to allow new users to be created.
> 
> Ensure that useradd/del are available when running
> bash ptests.
> 
> 2) run ptest as non-root.
> 
> Removed patch:
>    fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
> 
> which enabled the two tests:
>    execscript, test,
> to be run by root but under 'su' as a user. These two tests
> now fail since all bash ptest are now run as non-root and there
> is no need to 'su'. There are remaining problems with the test
> that will be resolved in future commits.
> 
> Bash ptest statistics with said changes:
>    PASS: 77
>    SKIP:  0
>    FAIL:  4
> 
> Failed tests: execscript
> 	      test
> 	      read
>   	      trap
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> Signed-off-by: Randy Macleod <randy.macleod@windriver.com>

Nearly but this breaks one of the selftests which will need fixing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/500

oe-selftest -r imagefeatures.ImageFeatures.test_useradd_static

should reproduce.

Cheers,

Richard



