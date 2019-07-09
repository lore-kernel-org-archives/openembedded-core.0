Return-Path: <nathan@nathanrossi.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9C07E6FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 11:47:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v15so2770204wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1ieNRxCuO4/+l7zJ9YjtciYwLzMJcojy3+EnJeQ1w/k=;
	b=cPTPy5LiVs0d8xSgxrJggIIeYHhV6TkOSvpUgg8AZBLWwHJl/g48MnLqpt3Fuep3+z
	p+B7Wx9DKryLcI0Gs+FMcqDF7SB2VMA5KCmJBJk3xyO6EeCCNCUFrIzA4ujAuZBJ6pxw
	pNIoCoZZqZWI2MbKT68F7of2S8qqv3oe+/TRQJ9esF0v8NkQrWmuSlFl+YLStFE9vmRR
	7Szpe+Te1eIADCN/tlC9wF87+t1rYSPxPTug4VkjE0fe5fj5QP/KpG/SoLQ2x3WN1rSk
	tlpDZAjbf1Xx4TeeQ8Qkx+dEHq9EoKF3mKq+43A/e/zA0YXjPezQXfddRS8ALFLDWhMy
	/DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1ieNRxCuO4/+l7zJ9YjtciYwLzMJcojy3+EnJeQ1w/k=;
	b=OwGkZZe+On3OoeAYSmAodVQ1yFQ+9wiTDPBXt6rLS+GPnKu0K95t6wwbmHymTiK+is
	h05HYeF23wGTMSx9yVvVAvtjyA7WOFtbqmDKZ5/+pdOPClxPcE/eWsyXSztHVd4BElCF
	sHUav7xR77GFrQZDovxVafA1ehiEqUcy4uFb/Y/o38AY38UYy/3AFut0JebSyseGcDDH
	nOaixUE0F6DQQGuZMMRZuV/xZgjk/wAibXHewYCBOV8ME/84PdC2oaFnSn02kTEw62/X
	PBILmBHtTCvnphzCE47zjgvstsNMTKO6QLhDi+uQ3C7t8eEh3CfKRLaTBIZduhv5Nz84
	Ndgw==
X-Gm-Message-State: APjAAAWr1SRwYLuWP75h9f585HLk86Ompc7iegBMI+j9UJI2hGmYHYNr
	HY3KTlE+/eT6nxqodX0bedZmmGmCBogTj4lq5mBqDg==
X-Google-Smtp-Source: APXvYqyfBKOzTTMenr5LQeBwh/NTToGDEOVTFiXR7vFRDdi1nvx+N4JYHn0UAA59O75EmnQRursJ7fRg46ihasQk0sM=
X-Received: by 2002:a1c:7e14:: with SMTP id z20mr21613638wmc.83.1562672861664; 
	Tue, 09 Jul 2019 04:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<CAJTo0LadJjwL+NN+09uWCcgYpGa-2Kggx_wPWkXejA2AmU=B9g@mail.gmail.com>
In-Reply-To: <CAJTo0LadJjwL+NN+09uWCcgYpGa-2Kggx_wPWkXejA2AmU=B9g@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Tue, 9 Jul 2019 21:47:30 +1000
Message-ID: <CA+aJhH0W6EAkbuhUG0Xmuy6OhgwLja_ZNHW+O6QW9EK_E4vYDw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] Add gnu testsuite execution for OEQA
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
X-List-Received-Date: Tue, 09 Jul 2019 11:47:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2019 at 21:16, Burton, Ross <ross.burton@intel.com> wrote:
>
> This is awesome!
>
> On Sat, 6 Jul 2019 at 12:39, Nathan Rossi <nathan@nathanrossi.com> wrote:
> >         | gcc          | g++          | libstdc++   | binutils    | gas         | ld          | glibc
> > x86-64  |   589/135169 |   457/131913 |     1/13008 |     0/  236 |     0/ 1256 |   166/ 1975 |  1423/ 5991
> > arm     |   469/123905 |   365/128416 |    19/12788 |     0/  191 |     0/  872 |   155/ 1479 |    64/ 5130
> > aarch64 |   460/130904 |   364/128977 |     1/12789 |     0/  190 |     0/  442 |   157/ 1474 |    76/ 5882
> > powerpc | 18336/116624 |  6747/128636 |    33/12996 |     0/  187 |     1/  265 |   157/ 1352 |  1218/ 5110
> > mips64  |  1174/134744 |   401/130195 |    22/12780 |     0/  213 |    43/ 7245 |   803/ 1634 |  2032/ 5847
> > riscv64 |   456/106399 |   376/128427 |     1/12748 |     0/  185 |     0/  257 |   152/ 1062 |    88/ 5847
>
> So what I'm really interested in is what those numbers look like for
> e.g. x86-64 on real hardware: are the test suites always failing a
> bit, or are these indicative of problems we've introduced?

Just to clarify, by real hardware are you interested in the tests
running against a system running with a oe distro + kernel. Or just
running on e.g. the build host?

As for the failing tests, do not put to much emphasis on the values
provided. I am sure there are a number of tests that are failing due
to minor configuration issues that simply need a deeper look at the
test result and output to fix the issue. And the large number of
failures for powerpc are due to qemu user failing due to illegal
instruction.

The goal would be to get the results similar to what other
users/distro get, by reviewing results posted here:
https://gcc.gnu.org/ml/gcc-testresults/.
And for glibc the results from: https://sourceware.org/glibc/wiki/Release/2.29

Thanks,
Nathan

