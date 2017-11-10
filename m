Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4108371CB3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 19:32:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b189so4688390wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 11:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p8OyrzvGM8kqH3YNTxlQbzGrAuLWA4bQIsWwZ7mpRqU=;
	b=pcaw8uyH1LThtKswvPf/+4YLtc92sIj+Ie2rD4zu/0B8LaWzCsm2nqHk+kIfZ9n8Zk
	PLQoW/r5wljjiNNgMPHBgfwu+Q5hFqA9WOGCPGhJqgPdbVHKXWF/51Zrqa4T8YRrLAej
	tJdRN8V9+h9qsQHb+cyveeMfWgIeMC5t7r3g5+qbC1M+D+PUtUwHYEBMNROcY1Fm0bXt
	0qBE97kuvfce4bRlGONxlHVyP9hPeg6FTmzIttHN8ITdUWB4k45/Lrheqh/NKsqn8yPT
	Ti7+JxcqIrWDr+2VgeXzvfZdhJycLqA4Val7f1n3zPcc9t3kxEJy0d8jcePAYtCM4QjT
	f8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p8OyrzvGM8kqH3YNTxlQbzGrAuLWA4bQIsWwZ7mpRqU=;
	b=HwVastCCKeuIu3yBkrBeWGdP77KQSqlIy8WRP9hMPcKS+rZwtkn5xi6Mo5ghJXy7At
	AosSDgNpfYukD/hbSKmfDRQHDR3whj4khxWm6+/ka85OPik0shPEM7F7dV42EKsEmJxF
	sKwKLyvBQ0xfSzMOR3pGF1EQBwnCFfC8+PHIjtnRUPsNgBxyCH4ofpLeKWajhiaLbUoQ
	OO5+VmwqTf8L0ODjidWUInoTMgl0y1Homvg/GRHPwzAw2YvbwH9f/LKjFRdc/8Yj2/MZ
	3kO1uM4rH123/HjmxRa29Pw6VJ5+YKgrwaSvGsgHLVtRJzh/ZMWAK9xSoeYNcuu5HgwV
	+X0Q==
X-Gm-Message-State: AJaThX4HTpTcq0lmzS/Wtwqh4xxNlpqxw2R8cNzkgh3HiWNHgr1kQMws
	3Nk/cfZ80Z9p0TUkyo1sWzpghX+YGSENxgivqUg=
X-Google-Smtp-Source: AGs4zMbKKsg4km8s5q19FT8JvHk1fTYR2GCXvvWXSvcasYPuNty3YvsyK1E5aOfGqQVveSCDI1554AukNPy621aykzs=
X-Received: by 10.28.145.13 with SMTP id t13mr1026587wmd.40.1510342380874;
	Fri, 10 Nov 2017 11:33:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Fri, 10 Nov 2017 11:32:30 -0800 (PST)
In-Reply-To: <20171012233202.1281-1-alistair.francis@xilinx.com>
References: <20171012233202.1281-1-alistair.francis@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Nov 2017 11:32:30 -0800
Message-ID: <CAKmqyKPLS_Nzvue0QoUq7qrcEQzMLaKQoCdDpKXNFn44=3MUOg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: Ben Levinsky <ben.levinsky@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] runqemu: Allow the user to override the Kernel option
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
X-List-Received-Date: Fri, 10 Nov 2017 19:33:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2017 at 4:32 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Update the runqemu script to allow the user to specify a Kernel to boot
> when calling runqemu.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Ben Levinsky <ben.levinsky@xilinx.com>

Ping!

> ---
>  scripts/runqemu | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index df76270904..c3719a86f7 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -584,11 +584,15 @@ class BaseConfig(object):
>          if self.fstype in self.vmtypes:
>              return
>
> +        # See if the user supplied a KERNEL option
> +        if self.get('KERNEL'):
> +            self.kernel = self.get('KERNEL')
> +
>          # QB_DEFAULT_KERNEL is always a full file path
>          kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
>
>          # The user didn't want a kernel to be loaded
> -        if kernel_name == "none":
> +        if kernel_name == "none" and not self.kernel:
>              return
>
>          deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
> --
> 2.11.0
>

