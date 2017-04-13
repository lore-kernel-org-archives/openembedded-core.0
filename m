Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8B76277CD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:46:32 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id l7so70587978ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 01:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Q+uLpTCFew4R2Mxa7vRrc+9lDB1P/noI27Z3RqxRh04=;
	b=0cLsnBcwTdWd59pC40mzj4ZLka/pmf5V3y/E7yY5MJfc7/DBaxACefo0vLzBF6tXLE
	Z62pWEyyLBWK0CQEU7i3SJko6VscBZAdpLJvM40toAbixSV8wjfkqR7yagd1+ILC/nA9
	/j9NhnJpwagqFVstIXpCyRbEP562vJvDdHEc5QNkTDf3IBdTj98/UPS41z7QU8EnItEg
	PURGZZRitIl32WPO/b1sXSskRGfjsI6PJEqPgTJVL2MtJa/5QX8TTWD9yId9FLeas1vZ
	HWNZmXmK/thmTXCy1Za9IVoE+BAF/fEyPBO1l3R3+Ah9z3kdUt6CZmLzhWHEY7O5saWh
	w3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Q+uLpTCFew4R2Mxa7vRrc+9lDB1P/noI27Z3RqxRh04=;
	b=Agod+cdngI7u9Z+y8DycpHIYkK0pVRF89ISwMdmVRFApK2o8B7vSchpGia6eJWoA7u
	S/+4INmHsS8XaZ8w0Zl0ghrk3Snp7ShplcBC75dP1t7k0lx5x6/M+uCtNKAtyEuSaU/m
	2eEF2AZjRpL4ZjMuW8Jt3Xqh+UEq4gzd8n6F1diwQ1/eLnY7DEy1WlWIB2UzieZn9BeT
	jxcZIRH84n2Vq7IvoGOHreIj37Ht2+iHChBQQwxQH35UNdu2lH64Nt1tvyDOsrZn2lbR
	TeT9SijXw9DhnXmA1G0qroWImYqPcz7PyiaNhOcWlg+3+W6tdhFl3Jwl62hezXNUwmYu
	g9wA==
X-Gm-Message-State: AN3rC/44yDieZqKQZGkxAxjXU3jU5A6KeppKhBOJjw2a/45WHK4Rfl5k
	8EYss0XQ+5NMTk6d
X-Received: by 10.107.153.9 with SMTP id b9mr2388153ioe.200.1492073193396;
	Thu, 13 Apr 2017 01:46:33 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C73A.dip0.t-ipconnect.de. [93.232.199.58])
	by smtp.gmail.com with ESMTPSA id
	j130sm9463034ioj.19.2017.04.13.01.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 01:46:32 -0700 (PDT)
Message-ID: <1492073188.27604.46.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 13 Apr 2017 10:46:28 +0200
In-Reply-To: <902f18e3b4520021f20feaf3522ba6a52cbc9031.1491902179.git.liezhi.yang@windriver.com>
References: <cover.1491902179.git.liezhi.yang@windriver.com>
	<902f18e3b4520021f20feaf3522ba6a52cbc9031.1491902179.git.liezhi.yang@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] runqemu: do not rely on grepping images
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
X-List-Received-Date: Thu, 13 Apr 2017 08:46:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-04-11 at 02:21 -0700, Robert Yang wrote:
> Fixed when the image is large and not enough memory:
>   grep: memory exhausted
>   Aborted
> 
> [YOCTO #11073]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/qemuboot.bbclass |  3 +++
>  scripts/runqemu               | 19 +++++++++++--------
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index 3ca97cad4c..2870388dfb 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -64,6 +64,9 @@ QB_DEFAULT_FSTYPE ?= "ext4"
>  QB_OPT_APPEND ?= "-show-cursor"
>  QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
>  
> +# This should be kept align with ROOT_VM
> +QB_DRIVE_TYPE ?= "/dev/sd"

Now that I am faced with the problem of selecting virtio I'm starting to
wonder how to do that.

Our refkit image doesn't expect the image on a particular drive, using
PARTUUID instead to find it. But when running under qemu, it would be
nice to use virtio for performance reasons... if the kernel supports it.
But that's not something that the image recipe or even the distro should
make assumptions about.

It seems safer to let the machine configuration which chooses the kernel
also set QB_DRIVE_TYPE, but with ?= so that it can still be changed
elsewhere. In that case, we would need:

qemuboot.bbclass: QB_DRIVE_TYPE ??= "/dev/sd"
qemuboot-intel.inc (from meta-intel): QB_DRIVE_TYPE ?= "/dev/vd"
distro, local or image (optional): QB_DRIVE_TYPE = "/dev/..."

> +                elif self.get('QB_DRIVE_TYPE'):
> +                    drive_type = self.get('QB_DRIVE_TYPE')
> +                    if drive_type.startswith("/dev/sd"):
>                          logger.info('Using scsi drive')
>                          vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' \
>                                         % (self.rootfs, rootfs_format)
> -                    elif subprocess.call(cmd2, shell=True) == 0:
> +                    elif drive_type.startswith("/dev/hd"):
>                          logger.info('Using ide drive')
>                          vm_drive = "%s,format=%s" % (self.rootfs, rootfs_format)
>                      else:
> -                        logger.warn("Can't detect drive type %s" % self.rootfs)
> -                        logger.warn('Trying to use virtio block drive')
> -                        vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
> +                        logger.warn("Unknown QB_DRIVE_TYPE: %s" % drive_type)
> +
> +                if not vm_drive:
> +                    logger.warn("Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE")
> +                    logger.warn('Trying to use virtio block drive')
> +                    vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)

Here "/dev/sd" should be treated as an explicit selection of virtio,
without triggering warnings.

I'll send a patch for both if there are no objections.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




