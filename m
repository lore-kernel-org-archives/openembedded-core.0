Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3261977D7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:13:35 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l7so71223798ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=8ybM7j0ZrS2y89H24alZP1U7SIxK9m4YGe95Da2i898=;
	b=AvX7l3f+jeYEyPFe6dwX+HRUzAomP83Sf2xCJmrFjpTVI3CNRfLx3mPAgDVHkZUi0x
	etNgr2bCdsCK3m8p35HSkZNmAIgYtbG5xZJJRS//lZAh6hP8QXgsgMacmpTfMES68BHa
	zj4XJ5vCs0+tYq30o/IAiEmvOrT/YqdMshmJ2+nx41ZdxFMn4ZV5DTxDXj860HVXm7iL
	1bXQYBGIhUZXHYWDP2ToGPNPMDOMSESrYrM35x8gIpMshyPM3m1jh6nFoyfpvBAQX9Lr
	5v1xnwbp7ZaxdOz0696hbgNl/gApi9069vkA3l63mg1D6vvniTT5NVbswiNgwhAFCoyv
	/qLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=8ybM7j0ZrS2y89H24alZP1U7SIxK9m4YGe95Da2i898=;
	b=mUlhPjDaq+tUjnmS3Wp2lPd8zEsfpFliT75o+l12WVlTMiLeMyACNm8IsLllbK5oqB
	9vIvJQuzdwq6xE8tKeAJiNJA2jgX5DKAtqBNW59DyXCv4tQkOFejCi4rYsDecuwIzofX
	s91h6WOM0Z0J8K1+2K0r/Nk1Rlp2l1IMa+y6qJuVhqLVAttxu1rULMsrt/okwzcGh9II
	naTug+ZZ4nARSvFJWyMrXCIAvTQ4TLH4jTCmt1FZmTJ97mNhBq4eMdFsKYP32MNh201E
	/0dc5jnpUVJFvd2Vuaz3Bwpkf25rexRsri9aFs8eucd77aFCi2Z7nqYHj9oEDatHh1hR
	BkYA==
X-Gm-Message-State: AN3rC/52jM9fvjWGZebCytJlo/ZhMb1xKUfztms2bDMJ/dPMBPR+Bued
	q/zm5u4orBybwanO
X-Received: by 10.36.26.81 with SMTP id 78mr2149856iti.91.1492074816900;
	Thu, 13 Apr 2017 02:13:36 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8C73A.dip0.t-ipconnect.de. [93.232.199.58])
	by smtp.gmail.com with ESMTPSA id
	w137sm3692994ita.20.2017.04.13.02.13.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 02:13:35 -0700 (PDT)
Message-ID: <1492074812.27604.50.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 13 Apr 2017 11:13:32 +0200
In-Reply-To: <9b2b9be1-26a3-0002-2ff0-8dfd91abaec8@windriver.com>
References: <cover.1491902179.git.liezhi.yang@windriver.com>
	<902f18e3b4520021f20feaf3522ba6a52cbc9031.1491902179.git.liezhi.yang@windriver.com>
	<1492073188.27604.46.camel@intel.com>
	<9b2b9be1-26a3-0002-2ff0-8dfd91abaec8@windriver.com>
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
X-List-Received-Date: Thu, 13 Apr 2017 09:13:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-04-13 at 16:59 +0800, Robert Yang wrote:
> Hi Patrick,
> 
> On 04/13/2017 04:46 PM, Patrick Ohly wrote:
> > On Tue, 2017-04-11 at 02:21 -0700, Robert Yang wrote:
> >> Fixed when the image is large and not enough memory:
> >>   grep: memory exhausted
> >>   Aborted
> >>
> >> [YOCTO #11073]
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>  meta/classes/qemuboot.bbclass |  3 +++
> >>  scripts/runqemu               | 19 +++++++++++--------
> >>  2 files changed, 14 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> >> index 3ca97cad4c..2870388dfb 100644
> >> --- a/meta/classes/qemuboot.bbclass
> >> +++ b/meta/classes/qemuboot.bbclass
> >> @@ -64,6 +64,9 @@ QB_DEFAULT_FSTYPE ?= "ext4"
> >>  QB_OPT_APPEND ?= "-show-cursor"
> >>  QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
> >>
> >> +# This should be kept align with ROOT_VM
> >> +QB_DRIVE_TYPE ?= "/dev/sd"
> >
> > Now that I am faced with the problem of selecting virtio I'm starting to
> > wonder how to do that.
> >
> > Our refkit image doesn't expect the image on a particular drive, using
> > PARTUUID instead to find it. But when running under qemu, it would be
> > nice to use virtio for performance reasons... if the kernel supports it.
> > But that's not something that the image recipe or even the distro should
> > make assumptions about.
> >
> > It seems safer to let the machine configuration which chooses the kernel
> > also set QB_DRIVE_TYPE, but with ?= so that it can still be changed
> > elsewhere. In that case, we would need:
> >
> > qemuboot.bbclass: QB_DRIVE_TYPE ??= "/dev/sd"
> > qemuboot-intel.inc (from meta-intel): QB_DRIVE_TYPE ?= "/dev/vd"
> > distro, local or image (optional): QB_DRIVE_TYPE = "/dev/..."
> 
> The "??=" is not needed, just "?=" in qemuboot.bbclass is OK, we have
> "?=" in other bbclass, too, and they can be overrided as expected.

Other classes might depend on a different order of setting values.

> For example:
> 
> qemuboot-intel.inc (from meta-intel): QB_DRIVE_TYPE ?= "/dev/vd"

But you right, that works, because although that default gets set first,
it does not get overwritten by the latter default from qemuboot.bbclass.

I thought defaults worked the same way as normal assignments, i.e.
  foo ?= "a"
  foo ?= "b"
would result in foo == "b". That's not the case.

> >> +                elif self.get('QB_DRIVE_TYPE'):
> >> +                    drive_type = self.get('QB_DRIVE_TYPE')
> >> +                    if drive_type.startswith("/dev/sd"):
> >>                          logger.info('Using scsi drive')
> >>                          vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' \
> >>                                         % (self.rootfs, rootfs_format)
> >> -                    elif subprocess.call(cmd2, shell=True) == 0:
> >> +                    elif drive_type.startswith("/dev/hd"):
> >>                          logger.info('Using ide drive')
> >>                          vm_drive = "%s,format=%s" % (self.rootfs, rootfs_format)
> >>                      else:
> >> -                        logger.warn("Can't detect drive type %s" % self.rootfs)
> >> -                        logger.warn('Trying to use virtio block drive')
> >> -                        vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
> >> +                        logger.warn("Unknown QB_DRIVE_TYPE: %s" % drive_type)
> >> +
> >> +                if not vm_drive:
> >> +                    logger.warn("Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE")
> >> +                    logger.warn('Trying to use virtio block drive')
> >> +                    vm_drive = '-drive if=virtio,file=%s,format=%s' % (self.rootfs, rootfs_format)
> >
> > Here "/dev/sd" should be treated as an explicit selection of virtio,
> > without triggering warnings.
> 
> Did you mean /dev/vd ? If yes, I'm fine with that.

Yes.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




