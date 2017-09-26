Return-Path: <alistair23@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0F5F871AC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 23:23:41 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k10so129238wrk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 16:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JQb2c1yDb622k298HnWyTdLZ7znhAU0nhYYJDPIGpb4=;
	b=vWLvtxVCc9YfkC5YboLewDffPw0aqi9LCfE8ND+9Fcu7jjeLng4DC1dMgnzBbvEPVP
	g8guNieqDnhr79OOIL+6xCc1zKLp6JE0wyDBAXMs8ERfGsiNmhJFWMWoot/nwBVMFKjN
	5CnI5yldDUyLXZwlnJDtDf5W6QFCoI/+Mp1YCvz2V9TspSw3BNVga1x8woEIMHSbxiQw
	s+EURSaAzwLH7yAK30jcZMhFmsM0eC5q4T9FFuMdemk3itVU/Vg0k0EchBlw9FaDCw7C
	gP93sDUuYTRixvW++RXJOsNaRz78lxtQnVGPBYlfioIWbV+IwAixzyA5CB+dWuuBhuS4
	6B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JQb2c1yDb622k298HnWyTdLZ7znhAU0nhYYJDPIGpb4=;
	b=FuM8CEs0z0HN4bxGeeKkENvw7NypSMXWxrp+j0wfd9SIYgvGteo0FeX1MvF8XPB0dt
	zT8vwRZmvXQPCkfkn8K+5yBlywJsNJmwml5iF3x9Efkpd/xP9U1Ox2UIvE0zG+Sm04e6
	7UU6Cr34FRt0HamUp9h2q41yeoj8CH/+GLggnFcu9k9B69q3rP5rWlk/TfrvXF46K/NC
	3L5G/FCwln3bij/ZpGQQL4Tmnn0revxQd2Ay7j8QNGDE7aWdA7zXl96n8dtpUOHHtTLs
	OacbgRWZu8HHMo4aOetWGA79QD8dRW4y9hEERM94maVvr+eqD5aawX0sAEm+D589fopo
	ZauA==
X-Gm-Message-State: AHPjjUh/5KvPPBd4L3u6mol0kHJRAo6oGtpiZx1+AvSuzmdn9oUUy4P3
	AXDhUDlkTqoTBA5fQ4QL/hfDXJsS6Js4VadtfY3xkw==
X-Google-Smtp-Source: AOwi7QBuhEhmF6EwS7o0JXwfSRuUeY4f/PzDDBApHBu5JAwasHdVTtt5HIwDsy8vjzsorpD9qqHyCR0hCoJJY+j/eys=
X-Received: by 10.223.144.71 with SMTP id h65mr10706364wrh.41.1506468222881;
	Tue, 26 Sep 2017 16:23:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.135.139 with HTTP; Tue, 26 Sep 2017 16:23:12 -0700 (PDT)
In-Reply-To: <20170926231506.13672-2-alistair.francis@xilinx.com>
References: <20170926231506.13672-1-alistair.francis@xilinx.com>
	<20170926231506.13672-2-alistair.francis@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Sep 2017 16:23:12 -0700
Message-ID: <CAKmqyKNe7Ffor6irBQbJ07rbX_MdVfdkE5sMSD2rxhqTfD_JTw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: Ben Levinsky <ben.levinsky@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] runqemu: Allow the user to override the device tree option
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
X-List-Received-Date: Tue, 26 Sep 2017 23:23:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 26, 2017 at 4:15 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Update the runqemu script to allow the user to specify a device tree
> to boot when calling runqemu.
>
> This involves creating a seperate check_dtb() function incase the user
> has specified 'none' for the kernel but still wants a device tree.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
>  scripts/runqemu | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index c3719a86f7..45722a18ef 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -178,6 +178,7 @@ class BaseConfig(object):
>          self.env_vars = ('MACHINE',
>                          'ROOTFS',
>                          'KERNEL',
> +                        'DEVICE_TREE',

Ah, I forgot to update the help information. I'll do that in v2.

Thanks,
Alistair

>                          'DEPLOY_DIR_IMAGE',
>                          'OE_TMPDIR',
>                          'OECORE_NATIVE_SYSROOT',
> @@ -579,7 +580,7 @@ class BaseConfig(object):
>                  raise RunQemuError("Can't find OVMF firmware: %s" % ovmf)
>
>      def check_kernel(self):
> -        """Check and set kernel, dtb"""
> +        """Check and set kernel"""
>          # The vm image doesn't need a kernel
>          if self.fstype in self.vmtypes:
>              return
> @@ -608,6 +609,15 @@ class BaseConfig(object):
>          if not os.path.exists(self.kernel):
>              raise RunQemuError("KERNEL %s not found" % self.kernel)
>
> +    def check_dtb(self):
> +        """Check and set dtb"""
> +        # Did the user specify a device tree?
> +        if self.get('DEVICE_TREE'):
> +            self.dtb = self.get('DEVICE_TREE')
> +            if not os.path.exists(self.dtb):
> +                raise RunQemuError('Specified DTB not found: %s' % self.dtb)
> +            return
> +
>          dtb = self.get('QB_DTB')
>          if dtb:
>              cmd_match = "%s/%s" % (deploy_dir_image, dtb)
> @@ -678,6 +688,7 @@ class BaseConfig(object):
>          self.check_rootfs()
>          self.check_ovmf()
>          self.check_kernel()
> +        self.check_dtb()
>          self.check_biosdir()
>          self.check_mem()
>          self.check_tcpserial()
> --
> 2.11.0
>

