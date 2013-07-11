Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 114D3608C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:41:52 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id ha12so6628203vcb.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 03:41:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=xSWjlmz+qavzDnV8maVBgQBymPlXKii6wMvBgKJWHgw=;
	b=AfoBVMF+YFZd+QPzNhK9SSir7HJuGe6Qk4fkAt1Ecg9PSVcdvwL6Lhk7vaouCZB+/M
	Rm4FhS1g7uTFYpGuEnVfHPpPCYuvEoN2ARbDSW1SaiQfLBcqrpoiC+/+wtVc45Tb+joF
	dY4aque5tCODWR2ndSY0vSxUZnYe0lRe0fjobiV3gFE89evEQU7Fpqlkneh+DEjtDbhL
	fEgesOkWywnKDk4rGcCud9efuXOpsK5h7cD9W6yWfEtVUZdpo7BFvuvNoFDQMijCPZaR
	mpFxQ0Z5GPDi63/Wn9rNCnST8Xdf7WH9l+CKQgrKh9gy746Ymlth60abNvtUqwvI3j81
	M+kA==
X-Received: by 10.52.18.196 with SMTP id y4mr10048031vdd.51.1373539313619;
	Thu, 11 Jul 2013 03:41:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 03:41:33 -0700 (PDT)
In-Reply-To: <CAJTo0LZTHz5hE8jx+6qNtePXj-LcMpsXEJ3zbwN4jS9npDHpLg@mail.gmail.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<a546f2c5f8ecec522cb8087015359f433fb5c998.1373443071.git.hongxu.jia@windriver.com>
	<CAJTo0LZTHz5hE8jx+6qNtePXj-LcMpsXEJ3zbwN4jS9npDHpLg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 11:41:33 +0100
Message-ID: <CAJTo0LbGRLcbb_9J1AdDM1ZFX18SYQi_h6VPwxN3SESDdnN0gA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Gm-Message-State: ALoCoQkxgSU5FW5nnP8lesN/gGsMTOICgYe2un1zcLRxaISI9BKVDbND8+CUEnBjba5zxli3ggso
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Thu, 11 Jul 2013 10:41:53 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2013 11:40, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 July 2013 09:03, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Network Security Services (NSS) is a set of libraries designed to support
>> cross-platform development of security-enabled client and server applications.
>> Applications built with NSS can support SSL v2 and v3, TLS, PKCS 5, PKCS 7,
>> PKCS 11, PKCS 12, S/MIME, X.509 v3 certificates, and other security standards.
>
> What's the rationale for putting this into oe-core instead of updating
> the recipe in meta-browser?

Of course if I actually read the other mails I'd see it was for LSB.

Ross

