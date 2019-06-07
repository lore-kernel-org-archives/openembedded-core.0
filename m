Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id E7FD77E079
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 08:57:29 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id r185so826917iod.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 01:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bflCN4rYn1MIvs14rO7DvYaXDLYd4ljM4+QCyXrNiX0=;
	b=uUktl6kUYHkzaofUWtUdp9gptGBDliByLnYkYJ2JUnVl6UnzZLQGHvQoNZkqMQDk46
	NzVGuQNHAUHKR7rmvtRn0aRqec11ImJPyeOi1jnvQeVe9A7GRY5QFZvjUxzE/V8i/Exw
	txtxmDwm6GFgWYALGRfBbOW/MBsbRwkKw/rVS22vvnR2+IrbETfH/A1ab4BmbWaXEWJt
	3FsMJ4w9D00zEVar/cAQERSnaYaHoeqoOwm7jrlUIDYnuW5jbRTyJKHD72mMUusEqDOi
	RBswwgJawtPTP4gbSd4ODRleqJubZmxM2wfGz0NdAFGndUysrmhWqJhbUvBf9rdTCnce
	z2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bflCN4rYn1MIvs14rO7DvYaXDLYd4ljM4+QCyXrNiX0=;
	b=cxhEJJ0oKZ36Xej3lMiKsqvd+sst4fM8Xm6AhnJhhTCPWeJdd4nWav89vQXhgh7769
	pwhBAjCOHD1Hjhwgj7sUpzLd6P1mRiFGdZ8zuxkLmPjWr31rNjdA+yJEXM5bdxtVWXzE
	XFWm1BNM5i3sX0R6p5i4Df/9b3xVulyHr6goKtZ2pPul9AfzE3N3rpHSstj0X7aD4jlS
	fvc2NXlglHtsxdGuxqb+XBB7qqQg55mfd1Dbaw/MmgNAjvw8H7rWcSU9VsBOcF0CloRg
	L8YjUfAULLNqguzuZsvK/WTBV9+FnMw/IzwosHDKbtiS+zY0DjG09XoQBeskT54YzTaT
	L2FA==
X-Gm-Message-State: APjAAAVgnCgy/MYS0yCk+R6X+CNGqIy0g8AIz7TqkbEkkHPp7r3ktOJF
	hEzbsBfiKWUVnlBiNgpbmUIxjCp4di3nHAX4SOHik6ca7e0=
X-Google-Smtp-Source: APXvYqwdYd0jArHNOlGimiAJshxcZbJK7O65MFHPte5I6X5mcIWMsb3BYqzQqjiEFOE6qXMixp7q2eaXG5hvr3KTOYY=
X-Received: by 2002:a5d:9e11:: with SMTP id h17mr31133166ioh.261.1559897850931;
	Fri, 07 Jun 2019 01:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <1559892984-24780-1-git-send-email-maciej.pijanowski@3mdeb.com>
	<CAJTo0Lb=azHFW1Cpg-FP4nbLnnNaL9KMu0FHUpHQcMh+Sr2R2Q@mail.gmail.com>
	<29e27537-a8c0-a832-8813-5e46b75bd4f0@3mdeb.com>
In-Reply-To: <29e27537-a8c0-a832-8813-5e46b75bd4f0@3mdeb.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Jun 2019 09:57:19 +0100
Message-ID: <CAJTo0Lbu1gM=q+KRymBp9uAhXdVm8pkXD7mGO1YpHNOCqrZj2w@mail.gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: piotr.krol@3mdeb.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipetool: support python3 instead of python2
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
X-List-Received-Date: Fri, 07 Jun 2019 08:57:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Jun 2019 at 09:46, Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
> > Would you be able to write a small test for this, along the lines of
> > test_recipetool_create_*() in
> > meta/lib/oeqa/selftest/cases/recipetool.py?

> Sure, I will try that. I haven't been contributing to the QA parts yet.
> Is there any documentation / guidelines I should refer to?
> Or looking at other test cases should be enough to get it done?

Thanks, that's much appreciated.  Looking at the other
test_recipetool_create_* tests in that file should show you enough to
write the test case, the hardest bit will most likely be picking a
suitable Python module for the test case!

To execute the tests, use oe-selftest:

# This runs all tests, will take quite a long time
$ oe-selftest -a

# Run just the recipetool tests
$ oe-selftest -r recipetool

# Run just test_recipetool_create_git_http
$ oe-selftest -r recipetool.RecipetoolTests.test_recipetool_create_git_http

Ross

