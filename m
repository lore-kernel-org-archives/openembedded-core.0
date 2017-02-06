Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 56D8E719DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 21:02:31 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id d5so8526918uag.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 13:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K40ho8AvxazNK2ywcS3MNPEnSdU/h8A2V/2dka49UhY=;
	b=UPEuOB0CFoSX1YhTmtFd+9RsvHekUwNW52QGmUaxRdAZHuT6568Up46KLGfiTGabw5
	5V3jKNt95d+RmxmZoJBUwG7cm4oEBcZy5y/XRqvfJxcX3UgkSzZgZlVDQbvaj59wob0O
	qVSt4Ol+43Xj3uVW29xda8eONHF/39rems9/MbQxkRQaAua/Wfaut0paQsNpkPWwVglN
	SETMH8Flbh9SL7SzEYmvRV5sLrV57ERdzaLqG76z00LI8xfxUdgnT191bxy1nQT8DaIh
	sDkABeawIAQ+4H61+/8KBoC8HnhlQcaShDeeiu4oLTZWo0g5/P9lV6qhfLIGtTYgZ8pk
	mVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K40ho8AvxazNK2ywcS3MNPEnSdU/h8A2V/2dka49UhY=;
	b=N3nrMUP3SDeLKkAKM/NmR99RLfZyqTn8gMnkaIyvA8NBg9Tu0a1s7w7YYzMUPdxV7p
	jwLSRfUbTbDwpo0pQjSKChhyFEYQ6NQDLo8uUJLQ0idPy5iaBx74XtwnAIXut39GBi5U
	0QicG/dRn72P6sK6J3p/o+Zk4DiTo3w0qwZF17AJUS7ThfisgOok2bdndkm90LYf8+Iz
	dv9aKBSHbWD1kLrAAwY3fx4c3E4Ea7c07cnQnnvrMKZ8y7KFSx9FPuK+uGxt8doz4+DC
	UNC+ypEUTVl1PwA7JjLinA33meX1j2bukgL3I1H+cX6WIjzMNZdPshTZeghDFCDXnbxI
	R7fg==
X-Gm-Message-State: AMke39nVtaXBrJsy4ABAXKJJ19Azp8T2h79Wv1Tu90swARCWIdayNXVNEZ6wXKsf2p8OI+Z42o4q37mxH1ejFQ==
X-Received: by 10.176.64.168 with SMTP id i37mr5911983uad.60.1486414952224;
	Mon, 06 Feb 2017 13:02:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Mon, 6 Feb 2017 13:02:01 -0800 (PST)
In-Reply-To: <1486414751-24947-4-git-send-email-sgw@linux.intel.com>
References: <1486414751-24947-1-git-send-email-sgw@linux.intel.com>
	<1486414751-24947-4-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Feb 2017 13:02:01 -0800
Message-ID: <CAMKF1spjcD8X=oxK4HHeO05PxRsn_ieRoDhpA3QpNOxKLXCbtg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] meta-intel.inc: Enable linux-intel and 4.9 by default for meta-intel hardware
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
X-List-Received-Date: Mon, 06 Feb 2017 21:02:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 6, 2017 at 12:59 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Enable the linux-intel production kernel for meta-intel by default for 4.9,
> this will enable using the Intel production kernel.
>
> This is a well tested 4.9 tree that will start to include additional
> support for the Apollolake and Joule hardware.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  conf/machine/include/meta-intel.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/conf/machine/include/meta-intel.inc b/conf/machine/include/meta-intel.inc
> index 21587fb..eb759c4 100644
> --- a/conf/machine/include/meta-intel.inc
> +++ b/conf/machine/include/meta-intel.inc
> @@ -9,8 +9,8 @@
>  #
>
>  # Soft set linux-yocto as preferred kernel like x86-base.inc
> -PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
> -PREFERRED_VERSION_linux-yocto ?= "4.8%"
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-intel"

whats the difference between linux-yocto and linux-intel ?

> +PREFERRED_VERSION_linux-intel ?= "4.9%"
>
>  # for Xserver older than 1.13.0
>  OLD_XSERVER_X86_EXT = "xserver-xorg-extension-dri \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

