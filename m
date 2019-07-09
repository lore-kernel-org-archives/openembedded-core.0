Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 424D07E6FA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 11:54:53 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s7so42461460iob.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 04:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RSlZSaAdLxMqFDTbYwBpQbCQZ1tFmFB3s4FMmAo8abU=;
	b=zgpESCFEIEITYTfFQP1dafcM01bo9ZeBd6brShu635jINW1vSMAViGRDYsaOSHY8EF
	bc++SXgWeZP+1iT2TXikO9DXDqSmvkkBisfxC2h6ULqQG0ipyxy+hZ8F3hQBgSRM76A5
	GXTglCxoprXSDXctoftoIq5M9xzx8mI+992AyQStTBhS3nxl7Qebmn83po6ar2pZ6ruo
	J/w5deNjQqAwHRKofJ6k5nNBqG9vV8FBiah7d8elEQ6og+MCiy+8uz/O5JXcbceVaB5N
	3DAqcM/cw++WJp9CZBnrQxOHzlXl9skbL9nCJiK5h0zaYjF88sc4s+DzlxJxsDTONAwZ
	xiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RSlZSaAdLxMqFDTbYwBpQbCQZ1tFmFB3s4FMmAo8abU=;
	b=k9s90p1EtWQebq9sLnq4cZbBOdQDI5+/ptmH9Wb44HiW7zNm6uBxVl+nKfi1ytL7zn
	u6vaJublctA3nic1HF3f8AQYWdvvmeEpLCzb2YHZ8S5cqnDdmUxnCzZqyOX3/6M80ekq
	yvKHF95EU8FslMXq3PTD1gM1bjIuMwUbU0pUpwIBYHqbhGX1Am80IrO+VQNf62AlSUcf
	PAH6vJ/YOAAxB8a32oF0A44GgQq2ZPKfO0dVAT/UseAEHVmbOic6gO3iRtqWqDAMGWQw
	qJhAI5deFFSjiOeqRcorenr4OUpNvasCTIHxzng2PVHtHroWOV6Q1NKWsAoNyotol9cm
	TcfA==
X-Gm-Message-State: APjAAAW+BPz1TguetCOiHn0rC8Ktpng90a/1vrd0B2d59Fpc4820osP/
	i7wa0NCCH8Ao6UAjluBDufXDh9mx8ohxTDkRPPpTcOgNqLk=
X-Google-Smtp-Source: APXvYqzmo4/I3mGqz/ngGUVgHTvspQ0YGpvw+NqaXkfobiWmBwf8l4mwK3R3ArJq2dFmMs/FYcS8gaC1j7A/ERFbR+s=
X-Received: by 2002:a02:b883:: with SMTP id p3mr3946870jam.79.1562673294286;
	Tue, 09 Jul 2019 04:54:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<CAJTo0LadJjwL+NN+09uWCcgYpGa-2Kggx_wPWkXejA2AmU=B9g@mail.gmail.com>
	<CA+aJhH0W6EAkbuhUG0Xmuy6OhgwLja_ZNHW+O6QW9EK_E4vYDw@mail.gmail.com>
In-Reply-To: <CA+aJhH0W6EAkbuhUG0Xmuy6OhgwLja_ZNHW+O6QW9EK_E4vYDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2019 12:54:42 +0100
Message-ID: <CAJTo0LbNt-X-51=cHyqd6oyGAq9wyoo5f+g-GT1163=yRtRGTQ@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
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
X-List-Received-Date: Tue, 09 Jul 2019 11:54:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jul 2019 at 12:47, Nathan Rossi <nathan@nathanrossi.com> wrote:
> Just to clarify, by real hardware are you interested in the tests
> running against a system running with a oe distro + kernel. Or just
> running on e.g. the build host?
>
> As for the failing tests, do not put to much emphasis on the values
> provided. I am sure there are a number of tests that are failing due
> to minor configuration issues that simply need a deeper look at the
> test result and output to fix the issue. And the large number of
> failures for powerpc are due to qemu user failing due to illegal
> instruction.
>
> The goal would be to get the results similar to what other
> users/distro get, by reviewing results posted here:
> https://gcc.gnu.org/ml/gcc-testresults/.
> And for glibc the results from: https://sourceware.org/glibc/wiki/Release/2.29

Ah that's useful that they publish those.  So the test results for
2.29 on x86-64 are:

   5961 PASS
     21 UNSUPPORTED
     17 XFAIL
      2 XPASS

And your report has 1423 failures, so *something* is broken.  As you
say, some flaw in qemu-user is most likely the culprit there.  Compare
to the ARM results:

      9 FAIL
   5041 PASS
     31 UNSUPPORTED
     17 XFAIL
      2 XPASS

Your report has 64 failures, which is much closer even with qemu-user.

Ross

