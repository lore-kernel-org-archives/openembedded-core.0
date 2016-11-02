Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1313C71B4D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 23:31:20 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id v84so3551752oie.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 16:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZhrIDAGP3QyBwSILm9WnFaexRcP0AcAzBk7p/2mlJB4=;
	b=XPx3OemX51JvA9aJb5NbJO/8NcqN0YsN0Mp9erLYH8NuKV0mdFzi9CjpngeHZrc22B
	5oyZtZQ4mYIYub/bBRFOM6VxG43S/XFVHNKrpZZhb+A99he08u2V1tSUuScvUZUAhJTl
	RDSXdXGogdKirBugLp1mJxa1xMhIGe0O2MxFXOfVYXfJO/VqE3EM5icu7CC4VTyxgdZ7
	Hn3Gq/nD80KbvCReep90/Sjh8wanKl3tOI+lIp9nhSSICpTG5xdEY7P0+fw1kxj+hMLn
	Olpv/UHN8kH76tKbrmQqboY39X7jlRb75doVvFkMowkkfTbhlTaA9NaFQ2+hID3kAjUg
	d99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZhrIDAGP3QyBwSILm9WnFaexRcP0AcAzBk7p/2mlJB4=;
	b=etU7+OIgkhiYs61faRGS6OfY1CVqltpyU6dtv4MNnADhTEcQ1weWV3c93eniV28L7d
	8D/UXss7FJBP3MzlQpru09hUtC9BNmsQ1TZ0A3hVwnFOTHswRRzh2Rw5ZaPlI7YI/mgf
	pE3Ep5EfVAD2/0AJsPBG2k7+XsiKjcTGb6EcB3oG9AeNeQdYWgx1U+zWlrD6o2RgNFWe
	T0vBFIUTkLnaGTyeakDvD5t9mv7YEkQ6+BAps/lh486Ja0j4lvolTc+pOcM8+4hmPQ8L
	/ULU+HLKcHWz/z7eWl3t6viH17YyigCzuc63HgtP5tulpnqx1gtbVw6riXUzldjAPWhz
	W1sg==
X-Gm-Message-State: ABUngvfBMXXujZOLTtR3mRiGdZXF1tC4jMJvuXo/UzJlFWrwbWmYmPZaiJkZLjkSfs52N+NFuUNZw7K3LhuQ9A==
X-Received: by 10.157.31.18 with SMTP id x18mr3830188otd.29.1478129482394;
	Wed, 02 Nov 2016 16:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.122.34 with HTTP; Wed, 2 Nov 2016 16:30:52 -0700 (PDT)
In-Reply-To: <1478128703-12144-3-git-send-email-alistair.francis@xilinx.com>
References: <1478128703-12144-1-git-send-email-alistair.francis@xilinx.com>
	<1478128703-12144-3-git-send-email-alistair.francis@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Nov 2016 16:30:52 -0700
Message-ID: <CAKmqyKNX+9gFkukkL=eN_wPrv+0tDPf5jpvnRaL6BjHe-xmkHQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] runqemu: Allow the user to specity no kernel or rootFS
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
X-List-Received-Date: Wed, 02 Nov 2016 23:31:21 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 2, 2016 at 4:18 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> In some cirsumstances the user doesn't want to supply a kernel, rootFS
> or DTB to QEMU. This will occur more now that QEMU supports loading
> images using a '-device loader' method.
>
> Allow users to specify 'none' for QB_DEFAULT_FSTYPE or QB_DEFAULT_KERNEL
> to avoid supplying these options to QEMU.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  scripts/runqemu | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 922ebaf..ac10ee2 100755
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

This diff didn't end up making it in somehow. This is also required:

diff --git a/scripts/runqemu b/scripts/runqemu
index ac10ee2..5f60312 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -861,6 +861,9 @@ class BaseConfig(object):
             k_root = '/dev/nfs nfsroot=%s:%s,%s' % (self.nfs_server,
self.nfs_dir, self.unfs_opts)
             self.kernel_cmdline = 'root=%s rw highres=off' % k_root

+        if self.fstype == 'none':
+            self.rootfs_options = ''
+
         self.set('ROOTFS_OPTIONS', self.rootfs_options)

     def guess_qb_system(self):

Thanks,

Alistair

> --
> 2.7.4
>

