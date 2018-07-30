Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 472BE78CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 15:55:23 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id n21-v6so22170610oig.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7JuyjvTAxgT3FFyg+Zb2TjCOCFXm24hYtkqv0d7HBzw=;
	b=rq6F0korRQziIuLkbKlaZAS9xeero/wWOOSV3X05fW2aYNoawcvVcOVIpERcsTxYaT
	0rnWBcElTTeHtmcTN7wg5XWnf2Q4r8QsIU6SWF30wyroD8I07BC4orolUi/yWlb+rKqS
	wg4HSyDmQ1A/uGpW0SQNlWPYtG2qI5kg2fteQBjwUxQG8D50MdMlIKARFWffzuEY7LeQ
	Zz4SP8b/+zH4hbwjrAxpFoNJuAGK0R3Y0/9Vah5wxLmou7/ms/bpi7ahALHk1MtlZ7Eu
	mECov9VHnxWn3rASPBvy+8vP1W3aD9Vq0dCAGQSTXav3D0/ZnOH7XItkPU5pCAeBoxJ7
	oYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7JuyjvTAxgT3FFyg+Zb2TjCOCFXm24hYtkqv0d7HBzw=;
	b=EeAHKuFQKzC4v0B9Tfu2rwJMVNUOaWxLFbWkKtGJzwWJ9HdFT2dPLdS3/vZ/arwiz3
	x9YrqzB8uKZsYS7CjUx65H96tbIvu9Ib4DVJ9u3fHtHmNJtPgjNgOIbjhUOYXsW9mar2
	VHFvxatp1RNy+LCqfswx6C7ajfafZ5wJedooyJ4qGcTTzyGAe9gE+EPhU8fTj4Koa7pG
	mHpCcY4VQlsT3U3kGR8xfMzD/gIFQ2sGg7QoweWLUBXdF4iABw8UoiolgJo9SEU83N16
	Fi9jJ1qb6in7YEFoLetLAiYejbjgnfS4DJPcYZv9ki6AUoal6qeOJ9Z4Pm8QMCbJq2zU
	2HCA==
X-Gm-Message-State: AOUpUlH1U2xBeFRQevKn+iV/DRFqHkm6E+oeFebh81xvdwlDOC7upbhy
	byYXJ36W911C/xoVBz1i9eETANJ5gtrFCWZAi7/q9Q==
X-Google-Smtp-Source: AAOMgpeUX9pMNCcq34JBnsZ8nkpipJ2Y6kSzB1dmI8FUTHKER1HcqWUC6thQwm2M/MMt1tH4TSJQ5f1FZAaTmVm72DM=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr19567312oih.102.1532966125094; 
	Mon, 30 Jul 2018 08:55:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 08:55:04
	-0700 (PDT)
In-Reply-To: <1532963040-31606-1-git-send-email-akuster808@gmail.com>
References: <1532963040-31606-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jul 2018 16:55:04 +0100
Message-ID: <CAJTo0LZNTBvCSg7E+b0oUMHW=7tB0NZMPtLM-Khnc4PXxSZf5g@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parselogs: Add bluetoothd error to list of mips
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
X-List-Received-Date: Mon, 30 Jul 2018 15:55:24 -0000
Content-Type: text/plain; charset="UTF-8"

Wouldn't it be better to fix bluez?  It's crashing....

Ross

On 30 July 2018 at 16:04, Armin Kuster <akuster808@gmail.com> wrote:
> do_page_fault(): sending SIGSEGV to bluetoothd for invalid read access from 0000000000000030
> [   21.402249] epc = 000000852c3a0438 in libc-2.27.so[852c310000+19b000]
> [   21.402505] ra  = 000000852c3ae0cc in libc-2.27.so[852c310000+19b000]
>
> This causes the xorg testcase to fail.
>
> [Yocto #12845]
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
> index f0bcd16..e902299 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> @@ -90,10 +90,12 @@ ignore_errors = {
>          'Failed to load module "glx"',
>          'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
>          'cacheinfo: Failed to find cpu0 device node',
> +        'do_page_fault(): sending SIGSEGV to bluetoothd for invalid read access',
>          ] + common_errors,
>      'qemumips64' : [
>          'pci 0000:00:00.0: [Firmware Bug]: reg 0x..: invalid BAR (can\'t size)',
>          'cacheinfo: Failed to find cpu0 device node',
> +        'do_page_fault(): sending SIGSEGV to bluetoothd for invalid read access',
>           ] + common_errors,
>      'qemuppc' : [
>          'PCI 0000:00 Cannot reserve Legacy IO [io  0x0000-0x0fff]',
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

