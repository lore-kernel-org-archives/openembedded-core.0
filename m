Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B50377DB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 17:08:01 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id t11so10004863oib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YtBdWECI2sAVYFjtPktR0Iiyd2/QTn9tZnVGGK/n8HU=;
	b=vf/vmEPxGhanz2RdA7JOD+BGeB82jQGVfFMkgDA/Jz1aXkRkJrxmq2R+BZEIBuaTmg
	ZYkBVwwRzWMRZ7+mBLeCFsIDdrJ/g9R6Cwv1hXkfhP/HZpqWAD+jzUzkepeu581KIwHI
	a0WH7YffYfvfIWaV+TgJyweWdvNZ2cfRRmT2KU0EX2q76jhZwZqYWuGAqwS13d99QN4i
	kuJkOzgNFzKu23p3H3MHTYby0kHOnrEkPD26AzATNaecPVxVvnxCnaPwThAvfYGO5n37
	QkVwhdDbEGIFNtUWRqPTDjMHivuM9Sra5/0sKmGkeqarDnSqAEcRqhth9WEyCYEvDk38
	/CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YtBdWECI2sAVYFjtPktR0Iiyd2/QTn9tZnVGGK/n8HU=;
	b=JAT4BlaAMSqqHYigggDNy8Xmip0ZEQRAPxwDEkMIHsyjA7E11O5+P392poLcdNMq54
	EnMDO8uzqsF+YSeg5Bgh5i/dCslafQaCDNZkI7OjgWnPRW8yUosjI/5hMAnyEs9MYwWX
	zjRc5MerUmoc/UW2MXKp0j4mdj50LFYVq9KZzxXJhooeO5KR4xGITd/MJ00rWT6YDM0L
	P+LvkYgmBqOYRhXEKIJ42dlu0ASqYCWVsQOu8THbDtjcL79PkvCQy7EF1gsSuVgAXKP1
	c8hLCs2Qu6a9ZAIJHopsFus2ApWMuYY4Wy9Jg3cX/B8IjyzXI4KDKV5bl0+a6/2hOeAf
	t7Jg==
X-Gm-Message-State: AFeK/H3GdlnnPi7RPWjBRgYWcK3A+RGDGjbRUzyqPUGGkMSY0jURicEoiLjew5teaVo3Vqp7Uuc7D3xUWh2lTw==
X-Received: by 10.202.104.130 with SMTP id o2mr2071029oik.93.1490980082437;
	Fri, 31 Mar 2017 10:08:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.2.34 with HTTP; Fri, 31 Mar 2017 10:07:32 -0700 (PDT)
In-Reply-To: <20170324203858.27464-1-alistair.francis@xilinx.com>
References: <20170324203858.27464-1-alistair.francis@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 31 Mar 2017 10:07:32 -0700
Message-ID: <CAKmqyKM-wvykD1R+nyyCMjictWhLYRuOXYW1wmPPKrtVLyu9hw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] runqemu: Automatically add a TFTP directory for slirp boot
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
X-List-Received-Date: Fri, 31 Mar 2017 17:08:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 24, 2017 at 1:38 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> When booting QEMU with slirp networking we want to use QEMUs TFTP server
> to make the images in deploy accessible to the guest.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Ping?

> ---
>  scripts/runqemu | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 23c9efb..f76d976 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -832,7 +832,7 @@ class BaseConfig(object):
>          self.kernel_cmdline_script += ' ip=dhcp'
>          # Port mapping
>          hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
> -        qb_slirp_opt_default = "-netdev user,id=net0%s" % hostfwd
> +        qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
>          qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
>          # Figure out the port
>          ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
> --
> 2.9.3
>

