Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7326577CF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 08:11:06 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id t23-v6so14135206ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 01:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zpRJvcntqJTxMKDUHo4EWm8hxGWxdL//IKFtseiHXKY=;
	b=zlZITnLEYImq1ojP33lIGyLuha6MYD2wVLKI3eDuwuEL1ya5wa0dmFeOR+ZLcZoXQ0
	mlq5sYia64QOLBRxoyN0yGyZQIk5yK5gt3Y+dZcS4+dUKLqgurRmy+xV/FDQJBgeABax
	SZgiOjV5VTl9r8l2B7lWubUgqD1K3eRjc7/ToKnew5IkqTmvMbqBNpJUdOEvRgorPtzu
	1r7PPo1uF/kTlOglgyYFVjFGRSFcUxLhnauVHDM38UhomA+qQ76Kj12kdcnBm9RMrIbi
	5OFyyjnBHkpFZjfdVV9AvVapZBkxQcAPUDPg4MhTPwDa1gv/P5/a8kMEm4OgLykRy8uN
	B7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zpRJvcntqJTxMKDUHo4EWm8hxGWxdL//IKFtseiHXKY=;
	b=JqzZxVqu0jTh/qGEAcpSYa8IfGNPUUhrqrlVwrGknuq7ffDmlEB8sdGGUQYMbS6UxB
	bj3/hccpcUUD4Kj7kETcQGGy7UnXRtiCd71SniZxmUucaKLwZGkQhlYUmvddqM/tHPNl
	SwVQQ9G8iRA1CV+kky/MdU6xiDVfXfrS7klGJ7JKBfqJeV7b6LpP6AiQpaO5yok6vSpG
	pZYj9WKIRRHpaHwTiIw8VJY5BAnMaSf1c+ycj+VQgJAjxJyHb8fZyKXRt13laVNh8k8G
	yxhCVu7ps5FjFmVFMJhhPzSYRC8QEUB1Z1pcRcWaH1484Wv8jIdW7e0oFyOSz1InHmuj
	5DnQ==
X-Gm-Message-State: ALKqPwde3KJcqlnkw/1at3BjEQV/l/7bg+fF0Gh8A2KfeSAIkbcPcLxJ
	Q7ILRedM2BLQUO8FWr7fR89sp8UmfBMzFDQ4JBDe6Q==
X-Google-Smtp-Source: AB8JxZpCzW9igRcAnEo8gqeGnJHpLxPkAUBHbr0ZqMReGhn6J8XACd8YGBCvAka7TaN8Alj2app+mlr9UfvepEkxPrM=
X-Received: by 2002:a6b:6b16:: with SMTP id
	g22-v6mr9390561ioc.20.1526285467124; 
	Mon, 14 May 2018 01:11:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Mon, 14 May 2018 01:10:46 -0700 (PDT)
In-Reply-To: <1522952730-5967-6-git-send-email-kamensky@cisco.com>
References: <1522952730-5967-1-git-send-email-kamensky@cisco.com>
	<1522952730-5967-6-git-send-email-kamensky@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 May 2018 09:10:46 +0100
Message-ID: <CAJTo0LZmS7TFPhQLsUFY0=BCAgAtrZm=6q-Y5TSB7XhP0zLpWQ@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 5/5] crosstap: replace script with new python based implementation
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
X-List-Received-Date: Mon, 14 May 2018 08:11:06 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 April 2018 at 19:25, Victor Kamensky <kamensky@cisco.com> wrote:
> New crosstap python implementation is total replacement for
> crosstap shell script, that has superseding capabilities.
> New script support cross compiling of SystemTap scripts
> for user-land, by using supplied image rootfs. Whereas old
> script could only deal with scripts against kernel. New script
> has more complex logic and additional capabilities.

...

> +        benv_kernel = BitbakeEnv("virtual/kernel")
> +        (self.staging_bindir_toolchain,
> +         self.target_prefix,
> +         self.target_arch,
> +         self.target_kernel_builddir
> +        ) = benv_kernel.get_vars(
> +             ("STAGING_BINDIR_TOOLCHAIN",
> +              "TARGET_PREFIX",
> +              "TRANSLATED_TARGET_ARCH",
> +              "B"
> +            ))

> +        if not os.path.isdir(self.target_kernel_builddir):
> +            print("ERROR: Cannot find '" + self.target_kernel_builddir +
> +                  "' directory. Was 'kernel/virtual' built?")
> +            ret = False

You can't assume that B exists and is useful, as if virtual/kernel was
installed from sstate then all the installed pieces will be present
but $B will be empty.

For example, I re-ran oe-selftest on the autobuilder, the kernel was
extracted from sstate as the previous run built it, and the test
failed:

2018-05-13 22:36:08,905 - oe-selftest - INFO - FAIL:
test_crosstap_can_use_systemtap_on_qemu (crosstap.CrossTapTest)
2018-05-13 22:36:08,906 - oe-selftest - INFO -
----------------------------------------------------------------------
2018-05-13 22:36:08,906 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/cases/crosstap.py",
line 25, in test_crosstap_can_use_systemtap_on_qemu
    self.assertIn('hello world', result.output, 'Crosstap failed.')
AssertionError: 'hello world' not found in 'ERROR: Cannot find
\'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto/4.14.30+gitAUTOINC+ea9330894e_74f6cd2b69-r0/linux-qemux86_64-standard-build\'
directory. Was \'kernel/virtual\' built?

Ross

