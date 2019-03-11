Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 68CD17C6F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 17:19:03 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c2so3181797qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 10:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+pTZntRSailITDoKSCiModVMIWr9/u7sj79WI1O2WsA=;
	b=tmgHrOU6IwhXgPvaUrPAjaLRPrUsqH3kEdnF05uXY0EacnDZPKLXAfGYUkw4FYSg1F
	e8fYmJ8V7g6d1OV8kq9Odj3PfUCQEViw9VYUeYtGGn706LdTdy3J+8UtGnzTnacHXVvX
	G/tMKRE2Zmb3XRFlQC9eElJLYYLvXxnP7CmHrAe0te5agIDMtIH5GkZsRlagvy4YG34x
	YzT5DEnzgcmcI/iGPfKnRUcdrRRs6QiI/bJPzIJGs3a7fBxN82TVRL32/mNPRrN3VG/j
	vhT++yfsf680WPmTNQAXaX2SvzFqWMjJokXws1bkqHhAfaB/w6//mQKhdsfkD4b6+X6/
	6c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+pTZntRSailITDoKSCiModVMIWr9/u7sj79WI1O2WsA=;
	b=U6XRPzH2USRUXRkzzVXrBdYxy4OCVib81xtDnJpYG2vBiimj6boMRS0cEh7e9Xa07T
	QjP136c955A7axK8cVf8VOquHFj+HCeDu2fMUkXo/5y+a60tApuTEaIfVMWFhWaAYrZo
	EbdKy9HuSBXBsYdPVUT/jfAOcYBg2zxPhL8Aj7uog9rrC5JU5JA9cRNFFaAi16ZMiOkM
	3+nMt2QRD6f8RfhIKKFu2WVmYN2xBoscA4IDtudVU14klxqVpt/LLG0uMJf/mPJDRdEJ
	yOgwjC2iRzZkE0nT2c5sNtTA7+STxEKOOa2L+/LmEcVVXy2p4nnry91owudjzVdF/UoF
	Xjww==
X-Gm-Message-State: APjAAAUr3mUpSf+ZluAEz26Ns/Y6MmPjz/vMkgl1nmAH1rr2B/c0eVdl
	57IEY5AhZ3RUOXdqUjzEvkpq/hqfdXVngVxGqvY=
X-Google-Smtp-Source: APXvYqyrd58FDOFGyhR+cgN83Xpeg3NGGfghv6QoBh48ooRCwoLGQr26gxL2OdQmYJ5BLWsq0wLWUbGkEntgZ/2TtKs=
X-Received: by 2002:a37:6814:: with SMTP id d20mr3602593qkc.102.1552324744032; 
	Mon, 11 Mar 2019 10:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190311055151.31185-1-douglas.royds@taitradio.com>
In-Reply-To: <20190311055151.31185-1-douglas.royds@taitradio.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Mar 2019 10:18:36 -0700
Message-ID: <CAMKF1sr0Gce=7VFVU76TDSz0Nc6mDWNO2-ZCzVzZkGS4cQuuTQ@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Reduce verbosity for make invocation
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
X-List-Received-Date: Mon, 11 Mar 2019 17:19:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 10, 2019 at 10:53 PM Douglas Royds
<douglas.royds@taitradio.com> wrote:
>
> Since the dawn of time, we have set CMAKE_VERBOSE_MAKEFILE=1 in cmake.bbclass.
> Back in 2016, we also explicitly set VERBOSE=1 in cmake_do_compile(),
> to ensure that make (and ninja) output were verbose in log.do_compile.
>
> Turning off CMAKE_VERBOSE_MAKEFILE=1 means that make (or ninja)
> invocations from the command-line are non-verbose,
> giving CMake's default human-readable output on the terminal instead.
> The user can still invoke VERBOSE=1 make if they do want verbose output.
> This has no effect on the verbose output that goes into the logs.
>

I think it would be better to have knob to turn is on and off both on
console and log files.

> Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> ---
>  meta/classes/cmake.bbclass | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index fa7f68c99b..e16630434e 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -164,7 +164,6 @@ cmake_do_configure() {
>           -DCMAKE_INSTALL_DATAROOTDIR:PATH=${@os.path.relpath(d.getVar('datadir'), d.getVar('prefix'))} \
>           -DCMAKE_INSTALL_SO_NO_EXE=0 \
>           -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
> -         -DCMAKE_VERBOSE_MAKEFILE=1 \
>           -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 \
>           ${EXTRA_OECMAKE} \
>           -Wno-dev
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

