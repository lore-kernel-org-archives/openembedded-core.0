Return-Path: <alistair23@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 39866601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 22:29:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so41941680wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 14:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c8IJech6/ZnM6gd6uswzECZ34/qz0CBn61JP75Gq08w=;
	b=J0f+FChFgydcGbLXPn2GseT9ZuDKIcRqKNS8lW2HXjxcoU6nljpCCeKJgzcU++u37q
	kfhDIfIJOv1Of83rIwkZdIZ317cctZxZyAasuwbbk6q1cljcdTfFK7qGbv+d8TP1hLq8
	dTXxEwPd1yFRK+55THclCrwiaeoRvQOIfsaN1YZRzrMwqvocintQ554B6alG8F3uktmr
	EifTEvosJygY9ukZInAb2IwiFVRHCHKJ2Ft4/yD2USvME7xy3K7q1Wb2uC+rDQ+/rXoY
	+WEi9kxtq+QDGLotcGDxzrgCSgYeWDrQPyrztflfIkvkoymbCbz/a+kPifCsb42ck3FV
	VWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c8IJech6/ZnM6gd6uswzECZ34/qz0CBn61JP75Gq08w=;
	b=OlED4MfkxS8H4Mnh9Kg7K7GJjZwclterIWNL6ZQw8B4NisRR5WsTVbB8JP8GmXkO/x
	VVAzzn/Ljr9kgzNmZa+huaYIir6UchT9rtZp5UY9V5a3vAmeV9NI0dc2cDT4Rcm9oKhG
	5KZHbVcMgYxkLj1XDpTPti0tSile8kPSdMtJiGMOqQmqS4zzyEoE/sXSnlUj3yuBkjWA
	lh2Z+pwxDOELF3o4SQ0w+jZStFVdOX/MBxEtseiu6+tL6Fda5gzjiN/2uqNnlp2LKKx1
	MUzDOxwYYzq5JK8oHZ39syWhJTO/8WdmNp2/uPBnyNRX6QVv0Lz1sv3rEkoSMYBVWLNQ
	B15A==
X-Gm-Message-State: AIkVDXKAGX0gucMnBEXVQMD2C99GkwRkpRXbSpQMuPGf4fnUm3bRZps/tjW1gake57K8rMxMt9goI/D5lVS4Jg==
X-Received: by 10.28.185.193 with SMTP id j184mr19565293wmf.86.1484692179836; 
	Tue, 17 Jan 2017 14:29:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.154.68 with HTTP; Tue, 17 Jan 2017 14:29:09 -0800 (PST)
In-Reply-To: <1484082240-8105-1-git-send-email-alistair.francis@xilinx.com>
References: <1484082240-8105-1-git-send-email-alistair.francis@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Jan 2017 14:29:09 -0800
Message-ID: <CAKmqyKPCq=xMz2dEX2=A=P4j_waB6FC1f2oaXqRUAMJLjXCJYQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Allow the user to specity no kernel or rootFS
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
X-List-Received-Date: Tue, 17 Jan 2017 22:29:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 10, 2017 at 1:04 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> In some cirsumstances the user doesn't want to supply a kernel, rootFS
> or DTB to QEMU. This will occur more now that QEMU supports loading
> images using a '-device loader' method.
>
> Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
> to avoid supplying these options to QEMU.

Is there any possibility of back porting this to Morty as well?

Thanks,

Alistair

>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
> Nathan Rossi previously queried if we should have a QB_KERNEL_OPT
> variable instead of this, so then different machines can set that
> based on their specifc use cases. Generally it would be set to
> QB_KERNEL_OPT = "-kernel @KERNEL@".
>
> I never heard any feedback on that and as it would break all
> existing QEMU usage I haven't changed this patch to do that.
>
>  scripts/runqemu | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 203992a..83ec337 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -453,7 +453,7 @@ class BaseConfig(object):
>      def check_rootfs(self):
>          """Check and set rootfs"""
>
> -        if self.fstype == 'nfs':
> +        if self.fstype == 'nfs' or self.fstype == "none":
>              return
>
>          if self.rootfs and not os.path.exists(self.rootfs):
> @@ -481,6 +481,10 @@ class BaseConfig(object):
>          # QB_DEFAULT_KERNEL is always a full file path
>          kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
>
> +        # The user didn't want a kernel to be loaded
> +        if kernel_name == "none":
> +            return
> +
>          deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
>          if not self.kernel:
>              kernel_match_name = "%s/%s" % (deploy_dir_image, kernel_name)
> @@ -858,6 +862,9 @@ class BaseConfig(object):
>              k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server, self.nfs_dir, self.unfs_opts)
>              self.kernel_cmdline = 'root=%s rw highres=off' % k_root
>
> +        if self.fstype == 'none':
> +            self.rootfs_options = ''
> +
>          self.set('ROOTFS_OPTIONS', self.rootfs_options)
>
>      def guess_qb_system(self):
> --
> 2.7.4
>

