Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC39260B1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 21:24:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t3so6225351wru.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 13:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2eirIZ+8VeUK3porz1MypeLpwy5T+5NxgbKHUUKfxuI=;
	b=Uh2Lox15iEF8bjIKlcqtciDAZz7U1xgQ75z7iu1sxwm2wwakIhpHphGQ4l7lMOb3gz
	16zjl6+1k3838Q16aAc5+fyfngVVaVcHUSM5aeVz6WDqSmH14qA/X1FF0vBNuTvSXeah
	xWxbMfaO0Xzjw99hWrjgwV7KPdTr5uohrmfrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2eirIZ+8VeUK3porz1MypeLpwy5T+5NxgbKHUUKfxuI=;
	b=CBuZ1009ixbsLfAaYX1Db9s6U1JV3LcJEV9734Zgsuv2YWnbdd6AAYmNc5XskNclFe
	1tXRK2AkoaC8qKIk88TlUJKrsuG7wOUmmu716OAVWpVL0lqBls87S7jt9/LjBA5HMg+X
	Lhqi2iTj0wY9wJ8/eYeUt84cZjFaYnrUe+Zjxh/ulA9C/KuQct2LYk39jOo6/s/gIn6U
	0Q2oiXC7LKstBguvbS0w7s7sdPNNNvt0O/9qoW95WimJIc7Iorng299BicSFH/oDDF+C
	XxyHXE5PzCKNpT6m9lpFdngZ2TozYkWcfvWHeyQr2F9t+yFAUJ9Rgxl9CZWHYuVlsz1n
	P8+A==
X-Gm-Message-State: APjAAAWHwNMOzdi52DPmQTqfQsFtm79QhCAkUWr5okNSX38/E5ZpBGuq
	FdG/SNcQMg9kIM92iQTI7WRe7A==
X-Google-Smtp-Source: APXvYqxgNv99ZPPeps60ia2ZaMspPMCbp7u3Ha1dbWmTXnTxEhOEfTw0Izii4dlA5nXTFNANE6Fj/Q==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr44107617wrs.365.1582233863626;
	Thu, 20 Feb 2020 13:24:23 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t187sm828825wmt.25.2020.02.20.13.24.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 13:24:22 -0800 (PST)
Message-ID: <a818227bae18888bd8483eea95c5f1373a5c400b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 21:24:16 +0000
In-Reply-To: <1582201146-2668-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582201146-2668-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] mc: upgrade 4.8.23 -> 4.8.24
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
X-List-Received-Date: Thu, 20 Feb 2020 21:24:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-02-20 at 04:19 -0800, Wang Mingyu wrote:
> 0001-Ticket-3629-configure.ac-drop-bundled-gettext.patch
> 0001-Add-option-to-control-configure-args.patch
> Removed since they are included in 4.8.24.
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...Add-option-to-control-configure-args.patch |  99 ----------------
>  ...29-configure.ac-drop-bundled-gettext.patch | 110 ----------------
> --
>  .../mc/{mc_4.8.23.bb => mc_4.8.24.bb}         |   6 +-
>  3 files changed, 2 insertions(+), 213 deletions(-)
>  delete mode 100644 meta/recipes-extended/mc/files/0001-Add-option-
> to-control-configure-args.patch
>  delete mode 100644 meta/recipes-extended/mc/files/0001-Ticket-3629-
> configure.ac-drop-bundled-gettext.patch
>  rename meta/recipes-extended/mc/{mc_4.8.23.bb => mc_4.8.24.bb} (88%)

It looks like there is some kind of race in mc do_install:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/703

Cheers,

Richard


