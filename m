Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 79D9F60119
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2016 21:55:23 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n132so41517609qka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 14:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e+NyrM6L8c1RkIwgoaQr2Ax5Nqzc8JNuYCj5zdfPppQ=;
	b=A/+Fv3ssB6mu7wI/ZhasTqFU/XhuW/dznoGJuUmVBD9m3gD77kRXdVYHTLNLTvn/n8
	KfgviGYtxfvFnrzjgruzCyquAPGDtTqIPgG6/J5eCkBAO5x4vKJgIVwgiZmFwZtn4cDY
	jqtK7Y375ciPtQ6GnZS4rgfn1bW1vKbKJxnFAjirxM7pWzl1tCaf0Iqg+8VeqSggKkqE
	WWOKmPiAU4BSpwR23gi41+6rRJgPr7ZMWGjLXua+xwKqJiszC4/zdTHql3gsPQf/WBtf
	k5RudNdSCHFBQ3K+MK25p/GEJwjTFO6vDKmp10NbeeNs3/jh1G4WXfqVJIRoM9JYr3+w
	ZFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e+NyrM6L8c1RkIwgoaQr2Ax5Nqzc8JNuYCj5zdfPppQ=;
	b=a+fKLDMD7FhxPVk0+rYAJDplQ60wZ/Q3BYVgZ9aKKhdvO6Suc5dNDgvdWw/ZNs2Ah0
	BWzGDyFfl/26rDwmLg407lmOYgrCIZCIghpK0KgCiQv758QSzxgVOSC/UWUSq5AzpK5K
	NBwG5EYKPoFE2NYRXNWjyINw1PbwSnl60U9ApH8c1+9pp3AEkxp0aoCu3mJia8MGTA0h
	Robv5mnfpEpTechunYnKY14AiPJKMH5zR5/S2R4crWIjQvxdHB/RPIAs2fdjrLWyX/eS
	IPdnbgSRJDnk5lINErwntzI1SvSJiavHhnUd4KTdvyofRBhJtL8/UDNj35gF3GZe4quC
	/63w==
X-Gm-Message-State: ALyK8tKBxKqRL+RnehkNCazwqHR/xHoJnI4WoBPsFwJADMFgWwZV0LPmOo1j685whpXUibhxz8yhyUSeUqAFNw==
X-Received: by 10.55.178.195 with SMTP id b186mr30924248qkf.81.1467842124546; 
	Wed, 06 Jul 2016 14:55:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 14:54:55 -0700 (PDT)
In-Reply-To: <20160706214209.GA3581@openSUSE-i7.site>
References: <cover.1467838464.git.paul.eggleton@linux.intel.com>
	<9e9da3e1b8034b9c233471e6053c920aa6476bad.1467838464.git.paul.eggleton@linux.intel.com>
	<CAMKF1spDqBxSpQ_kumzEgUR1YeEKOka+5yNoKH=ZdJHOAaZ8ow@mail.gmail.com>
	<1788025.i9tQxG4ZVx@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1sqLzVgDExTa71Ae7D_Ov1bokFii7f-tTXRr0wLnGFzO7Q@mail.gmail.com>
	<20160706214209.GA3581@openSUSE-i7.site>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 14:54:55 -0700
Message-ID: <CAMKF1sonvm1n5FNwOtmz7tnGt_064KLgNSaRkqQEwLjp_3+OKQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc-runtime: add SUMMARY values
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
X-List-Received-Date: Wed, 06 Jul 2016 21:55:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 2:42 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Wed 2016-07-06 @ 02:30:48 PM, Khem Raj wrote:
>> yes, clang can use the gcc runtime, I am sure
>> intel compiler can use it on linux as well and so
>> will others who target linux
>
> If you build an app with clang and include it in your image, are there not any
> clang-specific runtime files that are required to additionally be added to the
> image so the clang-compiled binaries can run?

no, there are no specific files. It can just use gcc runtime. However,
it does have alternatives if you
do not want to use gcc runtime e.g. compiler-rt and libunwind for C
runtime (libgcc) and libc++ for C++ runtime ( libstdc++)

