Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1C4A6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 12:19:33 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r24so11802381wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 04:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=grMXKNUdl5ElK9f45YzbHDXp6R+LtJWCT7+gyj44Z/M=;
	b=eWDT6K+QEEqiam7SrT1Nkxg2DmDwV55n/3dqEkRSLNih5aGkHqd5EnFVV7z4lCwcpk
	NKmcIHfqi/gs8k3yORfPC/FJvCyKrxjkOMkg5hkcwtRWWpxEzRMxx5LbcThLozKVPmtf
	+FY/tZd9lrzQ/fiUfJloFt6L827+gMlvbaMAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=grMXKNUdl5ElK9f45YzbHDXp6R+LtJWCT7+gyj44Z/M=;
	b=WBdkLok6gUEARHna4at75XzXOcXwDHgrqPgo+I0iHgPLQdYpphb2aAXSV7BSlf0apH
	6/IRE3U1pdH9NUipxu82xUKAIu1WTwqGiMyHd1/j82POSVdvZj3wnzvPghVOaUtL66Mn
	VzA9C0gVfhoc261i5ogYG4nK6+sTIzO6r2pETGszJJJbTSlbUt9YciPm5SAy9ogakMKa
	TCYvQt0GpHz2SeSA5Gu4FOq81Mph0QvUxq1c9QoF+v4V3s1J6QMeI0XweYriiP4B/HdS
	+q9byNQzFeR+68Rfkoo1iOe+uQEBII6I8YVpNVVG3hAW8wndmB3XMrt0KNGFwy8+SsjZ
	Vghg==
X-Gm-Message-State: AA+aEWZEj7S97LhMUMSNWWE1OLouwHWMMy273HTAuOE1g6ZJKvV0tbOI
	B3pfobuTNhYqqmKL7OlPgkDFDQ==
X-Google-Smtp-Source: AFSGD/VoL81DpLyqPECyuSCpUUAZUSEsGeLmFJfKUw+VUFXq2eSUNRlwznjj2nJbbo4/Pz6mR8xOiw==
X-Received: by 2002:a1c:a755:: with SMTP id q82mr11739044wme.6.1545308374228; 
	Thu, 20 Dec 2018 04:19:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s8sm8973860wrn.44.2018.12.20.04.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 20 Dec 2018 04:19:33 -0800 (PST)
Message-ID: <75d63f87f2ea25effa7707b735b2123ed2156ea4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 12:19:32 +0000
In-Reply-To: <50ccbdb3-12b8-e381-5931-b52b5b5efdf5@windriver.com>
References: <cover.1545291716.git.liezhi.yang@windriver.com>
	<29e6785a8b38d49961aa7f1138d664336052dca8.1545291716.git.liezhi.yang@windriver.com>
	<53c222052c0da6a7db056bfa1318371c8b7db2dc.camel@linuxfoundation.org>
	<50ccbdb3-12b8-e381-5931-b52b5b5efdf5@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] oeqa/concurrencytest: fix for locating meta-selftest
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
X-List-Received-Date: Thu, 20 Dec 2018 12:19:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-20 at 18:43 +0800, Robert Yang wrote:
> 
> On 12/20/18 6:14 PM, Richard Purdie wrote:
> > On Wed, 2018-12-19 at 23:43 -0800, Robert Yang wrote:
> > Sorry, but this change just swaps one problem for another. meta-
> > selftest is part of OE-Core so its position relative to bitbake
> > isn'tfixed.
> 
> I always thought that bitbake must be in oe-core, otherwise it didn't
> work, but seemed that it was incorrect?

bitbake doesn't have a fixed location relative to oe-core. It may
expose bugs but people do put it in different locations.

> > How about we use
> > 
> > from oeqa.utils.commands import get_test_layer
> 
> Thanks, that is much better, Updated in the repo:
> 
> commit 9d03cf9e726232a9df544435cadfe520020ef631
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Tue Dec 18 18:38:00 2018 -0800
> 
>      oeqa/concurrencytest: fix for locating meta-selftest
> 
>      The previous code assumed builddir and meta-selftest are in the
> same dir, but
>      this isn't always true, builddir can be anywhere, use
> get_test_layer() to
>      locate meta-selftest can fix the problem.
> 
>      Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py 
> b/meta/lib/oeqa/core/utils/concurrencytest.py
> index f050289..6c403ac 100644
> --- a/meta/lib/oeqa/core/utils/concurrencytest.py
> +++ b/meta/lib/oeqa/core/utils/concurrencytest.py
> @@ -25,6 +25,7 @@ from itertools import cycle
>   from subunit import ProtocolTestCase, TestProtocolClient
>   from subunit.test_results import AutoTimingTestResultDecorator
>   from testtools import ThreadsafeForwardingResult, iterate_tests
> +from oeqa.utils.commands import get_test_layer
> 
>   import bb.utils
>   import oe.path
> @@ -166,7 +167,7 @@ def fork_for_tests(concurrency_num, suite):
>                   if 'BUILDDIR' in os.environ:
>                       builddir = os.environ['BUILDDIR']
>                       newbuilddir = builddir + "-st-" + str(ourpid)
> -                    selftestdir = os.path.abspath(builddir +
> "/../meta-selftest")
> +                    selftestdir = get_test_layer()
>                       newselftestdir = newbuilddir + "/meta-selftest"
> 
>                       bb.utils.mkdirhier(newbuilddir)

This broke on our autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/61

It basically creates a "stampeding herd" of bitbake startups as if you
specify -j 40, it would do this 40 times nearly all at once and that
causes retry problems.

We need to move the call outside the for loop as the value doesn't
change.

Cheers,

Richard




