Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id D89BF60746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 18:03:07 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id w143so2032567oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 11:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=QRRpQlQ8NolK7o6genkh65XhoUNzazaTne/wCvDO9l0=;
	b=SZp7EFVTtkTZpBJlDewOJ45sNEwDGVgj+ot2meb+oAieJqefqkuxThzPUoz9rRXWtd
	r5s//lg7MB5DNjpeYbBtfAWSdN2jap7Hw0Qj1Cf/4N6G5VdgcIgCsHYadBBy5472UD70
	fZ+RtwF0Cfm3MWEyBbwefINjOCMC4mZYGMW+mFxZsbjTfX3v0mTTgOtch/kgGIUU2p4I
	zo5d2gkFQ5GEPGdIzJzVlEEvW7E59Kx51GGP/CjV0NROJSw6OwcBSwiM9ktbPhmcu3Nb
	4mshonl/HBcDqtlKUTMmysAFi18Lyrhsx86volIZX/M7sMD5pWmzSanndwV7PgwA1r26
	pH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=QRRpQlQ8NolK7o6genkh65XhoUNzazaTne/wCvDO9l0=;
	b=SEKamzC07shsuGz21RV6zP3Kaxi/opbsZkyINGFL+IwOjY24/KiqBnjuLK5ZatQLRD
	GWxG0FSFTqieOBbxCCeTw3HjqAPWGol2Rbkikybz2O+ipqtmYTwPnI0teIvj1pwTbifl
	T2bY/wgOYo2nENPZZkkeG6VUOHx6ev/otbQZk5EPrLwlc9vk1ThlW+oUo+UZE9rg+V99
	cQAkiyvtzH+Wh2Qq2dMW1IdFvwasqXiU/2oqh7nMfHZ/Ab/Ch2xnT3IJoP3W3RwFnnr7
	24Ej9saMuALVlfmkA+essYU/JdZZq8KJiKJ2VLW21AgqXlJuuNf1JaLGxEMsrfPdygFp
	h57g==
X-Gm-Message-State: AEkoousf1sPwwFPYwgNUC9Sk77IJJpeVwkWdlHgCfpQLoxzqTc6M80Tqvln8F701hcpmiYAbT6q6bjGfGbQuHQ==
X-Received: by 10.202.68.6 with SMTP id r6mr17500150oia.53.1469642588355; Wed,
	27 Jul 2016 11:03:08 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.14.72 with HTTP; Wed, 27 Jul 2016 11:02:38 -0700 (PDT)
In-Reply-To: <1466023403-1976-1-git-send-email-alistair.francis@xilinx.com>
References: <1466023403-1976-1-git-send-email-alistair.francis@xilinx.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 27 Jul 2016 11:02:38 -0700
X-Google-Sender-Auth: Pyt76OpvH3YG8UyfEGjisxZQweI
Message-ID: <CAKmqyKOviCTZBEnTXgSsWk2s+H6NJHAW490dPLkxy+Lz3Yuj2w@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: qemuzynqmp: Add Linux boot support
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
X-List-Received-Date: Wed, 27 Jul 2016 18:03:09 -0000
Content-Type: text/plain; charset=UTF-8

Ping!

On Wed, Jun 15, 2016 at 1:43 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Add support to direct boot Linux instead of just booting u-boot.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  scripts/runqemu          | 3 +--
>  scripts/runqemu-internal | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index de05035..d52ea15 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -350,8 +350,7 @@ QEMUMICROBLAZE_DEFAULT_FSTYPE=cpio
>  QEMUZYNQ_DEFAULT_KERNEL=uImage
>  QEMUZYNQ_DEFAULT_FSTYPE=cpio
>
> -# Default to booting u-boot as a direct Linux boot isn't supported yet.
> -QEMUZYNQMP_DEFAULT_KERNEL=u-boot-qemuzynqmp.elf
> +QEMUZYNQMP_DEFAULT_KERNEL=Image
>  QEMUZYNQMP_DEFAULT_FSTYPE=cpio
>
>  setup_path_vars() {
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index ea1a307..ecc5e63 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -514,7 +514,7 @@ config_qemuzynqmp() {
>      QEMU_NETWORK_CMD="-net nic -net nic -net nic -net nic -net user,net=10.10.70.0,dhcpstart=10.10.70.1,host=10.10.70.101"
>      QEMU_SYSTEM_OPTIONS="$QEMU_NETWORK_CMD -M xlnx-ep108 -serial mon:stdio -dtb $DEPLOY_DIR_IMAGE/${QEMU_DTB}.dtb"
>
> -    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -tftp $DEPLOY_DIR_IMAGE"
> +    QEMUOPTIONS="$QEMU_SYSTEM_OPTIONS $QEMU_UI_OPTIONS -initrd $ROOTFS"
>  }
>
>  config_qemumicroblaze() {
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

