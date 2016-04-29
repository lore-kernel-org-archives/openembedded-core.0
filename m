Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE6973167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 20:44:20 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id q76so45334787qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 13:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b7OEV1dcTaEv7Gc6SwDanZmlaCrLEiA9eC4ZyLrrWB4=;
	b=LOcNGnsvtPttiFLhQL4hWbQbjRg0mRfWMhTTiX5aNV+PddTFk8dcM73odoBEeTquIG
	pscmFdXgnUc/Ptk7FjHyVKL2l6bpEcn63oQ28IihRKeuUCcrYTcnLTqMBgNL83u2YJzi
	fQCOP8CBr5e0EpcH+p4P0uwi0Nf1v0J2tc5vHK6Uw/FuU4P3SASL3bSHwYUrn5A92pjB
	w3w/7YfZeVaIPKXOb7d4td72k1n4lIp6OJAlVOiehNejUiILwmebUWiNaYnrzRvoLJ0S
	cdvhLZTXAnK/pXYGA+dCyvhgEjZr9L8NCjchrOIziGxlgqXoJIpjul98vlSdToooVhg0
	lTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b7OEV1dcTaEv7Gc6SwDanZmlaCrLEiA9eC4ZyLrrWB4=;
	b=CBQN95N3wsJ30YQyahZ9GeeAeElVApasp0BZgaC8NQX/XWaF7GZnxysdjJk29mRFv+
	81SJx2WKEjdYyVrAd3awLoimkwY30JyssFgwXp/CG4eKGM6P60MiSf6OIR/+ZPCa3Pnh
	RS27QQrqhigaVuOCQSLnGrGJZDheF4uR1dsYP+C6/OXfahYWlgWcNEmU5m3QWklL7w/v
	NugpCYI7YkunJvVU1uPg5gLWvi95TwiBnGYP8igTYZ7MMybUbU83rOZtqH04gXACaP18
	1Ard/YllxryRSHENrBYF+bK93iuRXervjhkhYaae3nOpvKYop2ki5eZbwIq26scVk6Q1
	PBWw==
X-Gm-Message-State: AOPr4FUb+rVFgCtg7jY7+l+V0IkcpBJpXZH5Z4vt9xeOIfjrlYnZaFK9qpbXgyxUd5sCEhGoxmbVu6Kyw2eEdg==
X-Received: by 10.55.155.22 with SMTP id d22mr22682605qke.26.1461962660433;
	Fri, 29 Apr 2016 13:44:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 29 Apr 2016 13:43:51 -0700 (PDT)
In-Reply-To: <571E0BF3.8080408@linux.intel.com>
References: <571E0BF3.8080408@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Apr 2016 13:43:51 -0700
Message-ID: <CAMKF1sq+Bk+74RQbdevy9U6QtVpJ1UB_ghq5THHf4=jNK0271A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: moving OpenEmbedded-core to Python 3
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
X-List-Received-Date: Fri, 29 Apr 2016 20:44:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 25, 2016 at 5:22 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Hello everyone,
>
> we want to deprecate Python 2 in oe-core and set Python 3 as the default,
> preferred choice. What does this mean?
>
> 1) Introducing new Python 2 dependencies via new recipes or additional
> DEPENDS etc. in existing recipes will be discouraged: you'll have to provide
> a reason.
>
> 2) Bitbake itself is at the moment Python 2 only - which will be addressed.
>
> 3) OE-core recipes that are currently dependent on Python 2 will be moved to
> Python 3 whenever possible (e.g. when nothing in oe-core requires them to be
> built against python 2). This may break some of your code, so please do try
> any patchsets before they land in master (or stable release), and suggest
> alternatives.
>
> 4) Of course, there is a large mass of Python 2 code out there, which may
> never be ported to Python 3, so Python 2 will continue to be provided at
> least until it's no longer supported upstream (the current date is 2020).
>
> I'll prepare an initial patchset for review, so please keep an eye on it.
>

Can you clarify the scope, are you addressing the case where target
images would prefer python3
and you are making sure that packages that use python on target are
ready for using it.

bitbake itself is a separate task but then we do write scriptlets that
are executed as part of
build, are you addressing those too ?

Thirdly, there is general pythonic code in metadata meant to control
build policies

Which of these are you addressing specifically.


>
> Thanks,
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

