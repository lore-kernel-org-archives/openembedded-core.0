Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id A620360125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 16:41:00 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id w198so17797118oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=8vDcnEn/8KLYQBuZDGfzm7WXZRzNqGM1gFZu7meGOPg=;
	b=gMzY+DixB7CQUBU5ABl2+u9BLM/epHVcmvGUP+cIc02HIbEbAytqebwTn/d0PkmNgw
	yHlodeHoHX3G8DmJMxPMbvYLUw1aJQP9DL6EKlAnOOlDH3xXBYFlGSfLTx/PBBEfEh5r
	Xt8hH9Hnnsyn6XZI17nWlIjFzGzPVdqLRfX+0MAWKH/Ym9Saa+q2eZIy8OEUVretoQeE
	A9r4tkUt2aa3GKsXUN10HdaursJqgVx2PVEKU1zW/fJQP2btxKkCZbRqJygpAOAVHQFb
	1TJEEVqj7UNnL3ib8LdfxR2p2e4tuS5SzxXObvzgeWmBkpxXpmvpestf6gIY+TeRNA8j
	QHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=8vDcnEn/8KLYQBuZDGfzm7WXZRzNqGM1gFZu7meGOPg=;
	b=aPpf7xB6mKfoP8xfkFUmbI+XWb58aLXOb7h9yg374FkILRZXmhTsmmuW5ozaF8HsNV
	R7Yhwogrr7CrM37PSWsab9qnHm3WXY5oq5zJ9XZsRrn+DVnM8mYoE040GqRrJMvHGMnv
	YTYiChEuP6dybjKTcjZWwCMnhPIMXbMKJW3slufB1sIIjU3P6MzszLfIx/UWGpxgEm5S
	SBteNl+41VYBSbIe6aDHEUeFHTM0QNUASiXOsrUFyXxD3Fo9dx/7C/UGzEP6ii7oDIuV
	IkIncx+aLaWlBevFhsVDnqs04U6rFM4q61fwW0dU7m+9FLpef+4gkQA4niqL2J7KqxLL
	xjdg==
X-Gm-Message-State: AOPr4FXzwRZn3HHLGNQhGz69z5hQa7wOdCZwWUEUkUrCnXryykpx8tpsOQZuhp+PHWfQdlTdwrzerj1fT3HC9A==
X-Received: by 10.202.244.1 with SMTP id s1mr7592623oih.161.1463676060820;
	Thu, 19 May 2016 09:41:00 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.142.193 with HTTP; Thu, 19 May 2016 09:40:31 -0700 (PDT)
In-Reply-To: <1463089059-10156-1-git-send-email-alistair.francis@xilinx.com>
References: <1463089059-10156-1-git-send-email-alistair.francis@xilinx.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 19 May 2016 09:40:31 -0700
X-Google-Sender-Auth: wmiAXbJcmx97B9bkV-V78Ul2OIQ
Message-ID: <CAKmqyKPPRF+AvEShiFopGj-WtzM6Hdr48nBanA4TEwdWKq2ZSg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] runqemu: Add suport for qemuzynqmp
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
X-List-Received-Date: Thu, 19 May 2016 16:41:00 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 2:37 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Ping!

> ---
>  scripts/runqemu          |  9 ++++++++-
>  scripts/runqemu-internal | 21 +++++++++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index d7fa941..de05035 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -121,7 +121,7 @@ while true; do
>      arg=${1}
>      case "$arg" in
>          "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
> -        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
> +        "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq" | "qemuzynqmp")
>              [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
>                  error "conflicting MACHINE types [$MACHINE] and [$arg]"
>              ;;
> @@ -350,6 +350,10 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
>  QEMUZYNQ_DEFAULT_KERNEL=uImage
>  QEMUZYNQ_DEFAULT_FSTYPE=cpio
>
> +# Default to booting u-boot as a direct Linux boot isn't supported yet.
> +QEMUZYNQMP_DEFAULT_KERNEL=u-boot-qemuzynqmp.elf
> +QEMUZYNQMP_DEFAULT_FSTYPE=cpio
> +
>  setup_path_vars() {
>      if [ -z "$OE_TMPDIR" ] ; then
>          PATHS_REQUIRED=true
> @@ -382,6 +386,9 @@ setup_path_vars() {
>          if [ -z "$DEPLOY_DIR_IMAGE" ] ; then
>              DEPLOY_DIR_IMAGE=`sed -n 's/^DEPLOY_DIR_IMAGE=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
>          fi
> +        if [ -z "$QEMU_DTB" ] ; then
> +            QEMU_DTB=`sed -n 's/^QEMU_DTB=\"\(.*\)\"/\1/p' $BITBAKE_ENV_TMPFILE`
> +        fi
>          if [ -z "$OE_TMPDIR" ]; then
>              # Check for errors from bitbake that the user needs to know about
>              BITBAKE_OUTPUT=`cat $BITBAKE_ENV_TMPFILE | wc -l`
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index ac1c703..5671b4f 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -498,6 +498,24 @@ config_qemuzynq() {
>      fi
>  }
>
> +config_qemuzynqmp() {
> +    set_mem_size 2048
> +    QEMU=qemu-system-aarch64
> +
> +    export QEMU_AUDIO_DRV="none"
> +    if [ "x$SERIALSTDIO" = "x" ] ; then
> +        QEMU_UI_OPTIONS="-nographic"
> +    else
> +        QEMU_UI_OPTIONS=""
> +    fi
> +
> +    # Networking and system options required for QEMU ZynqMP machine
> +    QEMU_NETWORK_CMD="-net nic -net nic -net nic -net nic -net user,net=10.10.70.0,dhcpstart=10.10.70.1,host=10.10.70.101"
> +    QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xlnx-ep108 -serial mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.dtb"
> +
> +    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -tftp $DEPLOY_DIR_IMAGE"
> +}
> +
>  config_qemumicroblaze() {
>      set_mem_size 256
>      QEMU=qemu-system-microblazeel
> @@ -533,6 +551,9 @@ case "$MACHINE" in
>      "qemuzynq")
>          config_qemuzynq
>          ;;
> +    "qemuzynqmp")
> +        config_qemuzynqmp
> +        ;;
>      "qemumicroblaze")
>          config_qemumicroblaze
>          ;;
> --
> 2.7.4
>

