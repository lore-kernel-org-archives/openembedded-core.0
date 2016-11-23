Return-Path: <nathan@nathanrossi.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 966486FFF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 05:28:59 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k19so459035iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 21:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=40UImx5hyeKcBwb8y75d2ixxOKEpEuElBtXRJH8/8G8=;
	b=hyy1MReaKfgQFi7YO3zb+Ie9eD8Ly5LdEFuJVEebu8VqtvNSI7qAJ+T+oktNnDmkgz
	Xns3L/kdBlXgKGZrqH83HePZBpZuKVz2RPUDcwuny1yjm3fwdwX7eLFkEYMX2UzJ7j7o
	Jj3zzOPjV/yF24A4QFY0MgtVX40edDPFUJIqy87M5IxoE5Gf4MaCdWq0vaspsRY6hDYU
	tZhZmsXRgUahlSJDgCuM5PIrYnAND5kvozXMxfcIONcqC2P+XQE960MVLLhYC41CDI+m
	d3mF/ObLd15WSIgyyLG7v9R0887o/VTUJ+1aMvi+mAWJDnHNGf8t7stla9FaQ2/sqHwC
	fS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=40UImx5hyeKcBwb8y75d2ixxOKEpEuElBtXRJH8/8G8=;
	b=dnLuTA1mDoMNGlCeCMPvyzpY1oUSDd9QGYajLzjCD90Ot57o7ZAh45ykW9Gvwlx/W1
	mUSXsG2v34iN4qq1bAtFOy1Otl/JAzJtaNhAESWWd/Bo8eYDGKT/PCwymhljuThXKdhd
	spjlWe3IIcYfgjgryHANV2OESuzZfq8EID9RWxGD6TkDeEdufk0NbDhPo9l2MdCh8tse
	azHx6+ONc6rYgK64ylK2/z3D3MOjO39+JpD9T2AM/V/xfDjharktO1/+z6/zzjOl/dJt
	FXS0BpXjLAGuSyv1cLB81IBqBFbx4wq8A0lby5Wh6EYJkr2l8Cy/8Vc8OGAfWQdiedww
	FDcw==
X-Gm-Message-State: AKaTC02olXvTl/Ag5BiX2Clkjn1aL0aBjaFC5N+wm5Uk14dUplDRhZbA6YCGPTiPJ/l5UkaCVpVt4k5NsJQz5A==
X-Received: by 10.107.46.25 with SMTP id i25mr1690897ioo.145.1479878941152;
	Tue, 22 Nov 2016 21:29:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.249.10 with HTTP; Tue, 22 Nov 2016 21:29:00 -0800 (PST)
In-Reply-To: <20161021120728.22639-2-nathan@nathanrossi.com>
References: <20161021120728.22639-1-nathan@nathanrossi.com>
	<20161021120728.22639-2-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 23 Nov 2016 15:29:00 +1000
Message-ID: <CA+aJhH3sEgMX2WSGkawn-eY08+-L8NMK8mV1OOfghCgfJ6mqKA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage.bbclass: Allow unset load/entry addresses for ramdisks
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
X-List-Received-Date: Wed, 23 Nov 2016 05:29:02 -0000
Content-Type: text/plain; charset=UTF-8

Just pinging these patches, to see if there were any issues or
comments. I realize I sent them just before a release so it was very
likely they would get lost in the noise.

Thanks,
Nathan

On 21 October 2016 at 22:07, Nathan Rossi <nathan@nathanrossi.com> wrote:
> Allow the load and entry addresses to remain unset if the UBOOT_RD_*
> variables are also unset for ramdisk entries in the image tree. This
> allows for U-Boot to decide dynamically where to load the ramdisk.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 3bbf91f65a..5c9e76b9ac 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -178,6 +178,15 @@ EOF
>  fitimage_emit_section_ramdisk() {
>
>         ramdisk_csum="sha1"
> +       ramdisk_loadline=""
> +       ramdisk_entryline=""
> +
> +       if [ -n "${UBOOT_RD_LOADADDRESS}" ]; then
> +               ramdisk_loadline="load = <${UBOOT_RD_LOADADDRESS}>;"
> +       fi
> +       if [ -n "${UBOOT_RD_ENTRYPOINT}" ]; then
> +               ramdisk_entryline="entry = <${UBOOT_RD_ENTRYPOINT}>;"
> +       fi
>
>         cat << EOF >> ${1}
>                  ramdisk@${2} {
> @@ -187,8 +196,8 @@ fitimage_emit_section_ramdisk() {
>                          arch = "${UBOOT_ARCH}";
>                          os = "linux";
>                          compression = "none";
> -                        load = <${UBOOT_RD_LOADADDRESS}>;
> -                        entry = <${UBOOT_RD_ENTRYPOINT}>;
> +                        ${ramdisk_loadline}
> +                        ${ramdisk_entryline}
>                          hash@1 {
>                                  algo = "${ramdisk_csum}";
>                          };
> --
> 2.9.3

