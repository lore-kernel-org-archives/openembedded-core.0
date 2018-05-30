Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id D157974D87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 10:12:20 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id d5-v6so12794342oib.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 03:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PKm/R3wsu6oxegAxq/CZNhQBEZjqgraOLUKGitr8TMg=;
	b=QFIs2bBXPuLFVXsOw8GiSWIOqG3IIkvcvEu96HWxuKtGCzZPLSFlQCQKYE/+TO8Qxl
	e0WBwFs3u2Yrcy+tyyzYXe2baPGsW6DxGvyeG1YMJpU3uzRqHJranF9BLS8uc5F6Eps/
	RPYmRWaqLRyZsDD/6ZhBRDbwPUOPMK9nJgffcfPYicsciYEmEN2bux2gsJi9Cxtpv61v
	pVov7kNG9Apu1V7ofJZ5H8KiW7LL1xZ1+6YE8qtrN7JZ91hT3DbQ5NL7BImyrYWopv6x
	UjDUX1YHV8SX7/h46OB5VlE0PR+w0iFNHsySWHWvdPt2UDgewTfB4k++bUPyy01pSUY1
	1stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PKm/R3wsu6oxegAxq/CZNhQBEZjqgraOLUKGitr8TMg=;
	b=IDWwfy+SfooremDer3OeH7uX0097k86n+vDCa4McmXQ3aN0Gomp05CcsIl7Zd3gHAp
	rJoT1KWgLjZANsSnLJm7JGqrR0yFwL2ZSMzISpyIo1v7fODII+r1F6MrPL6s+pyi0R9A
	Tq2QixsKqXlg2ZXkNMTnmI2p7HNgxkV289Xg5Oox/9RonFhZVHQXGsGtUDgOvKdBo/cH
	JLMPEFgkW09K7Pu0n7pYZCmsBPsVCA5kA8b1RR5RwMP+Jb2BiaBTAPK+Sf84Uuf4WxoC
	wF4MFudnK5uO05QAny7JffmeZg04ZpKPNgBZu5PbfrmvrKqLhhpjz56TYqGjcJVlvXh+
	KGqg==
X-Gm-Message-State: ALKqPwe0YCqe5P7rQI7bKgdjzpEJeyhk5Zg+0SoDuMxU2UIddUHPMIV1
	zrEnNxnNmzYwQ/3K645PpFnUklzNjXNlDceq2e0Yofny
X-Google-Smtp-Source: ADUXVKKL49zeD59tnM+/moBlmYaq5TD/okw3HsqegySs2rj0jzwfwSy4OWlJZQ8gVG2wNrTzk41zg+Q/xwud+5Y3+bg=
X-Received: by 2002:a54:4d02:: with SMTP id
	v2-v6mr1051663oix.190.1527675141756; 
	Wed, 30 May 2018 03:12:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Wed, 30 May 2018 03:12:21
	-0700 (PDT)
In-Reply-To: <7ae03f87-ddea-e8e4-20f6-3d0c2942ad61@windriver.com>
References: <1527654433-263632-1-git-send-email-changqing.li@windriver.com>
	<CANNYZj8kCFWOfoDdn+F8LsGtT7oG6TKapBEnzPTSL=K0sttbRg@mail.gmail.com>
	<5b7ff97e-01dd-527f-9ca2-942997b7e6e9@windriver.com>
	<7ae03f87-ddea-e8e4-20f6-3d0c2942ad61@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 May 2018 13:12:21 +0300
Message-ID: <CANNYZj9WjP_FU_SbfZ7OpYqVOrm_HD73vNsY3r9WK4mWn7N4fQ@mail.gmail.com>
To: cli10 <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemuwrapper-cross: fix postinst failed warning
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
X-List-Received-Date: Wed, 30 May 2018 10:12:21 -0000
Content-Type: text/plain; charset="UTF-8"

2018-05-30 12:37 GMT+03:00 cli10 <changqing.li@windriver.com>:
> if in the future,  some recipe inherit allarch,  but use @qemu_run_binary
> directly,  not call qemuwrapper,
>
> I think maybe still will met problem of get wrong base_libdir. so I think
> maybe we should change qemu_wrapper_cmdline in
>
> qemu.bbclass, like this:
>
> -    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " +
> rootfs_path\
> +    return "PSEUDO_UNLOAD=1 " + "qemuwrapper" + " " + qemu_options + " -L "
> + rootfs_path\
>              + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "

qemu_binary is determined like this:

    qemu_binary = qemu_target_binary(data)
    if qemu_binary == "qemu-allarch":
        qemu_binary = "qemuwrapper"

So it will fall back to qemuwrapper if the recipe inherits allarch.

Besides, at this point it's a theoretical problem, right? We don't
even have a suitable allarch recipe to play with and see where things
work and where they don't, and whether the fallback to qemuwrapper
works correctly. If such recipe appears, we can look at the issue
again.

Alex

