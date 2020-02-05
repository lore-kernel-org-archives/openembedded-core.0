Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C10AC60CD0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 17:43:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a6so3768071wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=t4NJQFmzTG8ic6BwIkX0U4bM5fbS9u1Duh2TT5a1PUs=;
	b=M+JEwC/tL/dnTJU9MWpf64/cMS3q1zW3eypQSvu2B2SSZ0pbtpMqlBFh6kflNu2VyM
	1Isst85rPASIHwKc3tyO/sVrO/mZvdbqGlkHCJLa7j4gvaslu0TENcNG59BN8M/hddFx
	qpkSTOqZhzVyH/wwn/yG5qMVkvB5GK91dpSNghvTYOEuVqTuAu74JgBFDdN15lwSDFLL
	Z5aMuqILsZZzGSba5EgvjaldhY7LfvYWwFf0CG3d2v8ZrNSeNUIZpGeKxowJgEOZFsfb
	fpdJf8YXnm9rM/3H9YYx2lOgGA74Cg9QPoaI22JswuLFILfT3D7GHptOIr0QF0/OWOo7
	J7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=t4NJQFmzTG8ic6BwIkX0U4bM5fbS9u1Duh2TT5a1PUs=;
	b=l31grxGjA+BpHFD/NNBz2UL23x4FtG2sGR6i0Ftv7UId0FdlHLNGqk9nhjD5DxV43y
	+Md3DJVXRpgnQz6Im2E24EzM9SHsW76EvNq0LNnwgSSxKSuntAgbaXMJ2GuPycx44PqH
	zNXxA9yH6aUTZMDEYDtaH9fSYCvZWjD4Ol26mLIAdUWmp6XZdR5OFRhuLxUUK4tDm0+R
	Sr7Zyy5iSw0ULIGj9lUk2mv0AFr8LYtHiE0XNCIyDwamfZ0nvLThwnQTEhkuCYVey2IP
	BDUqEiK2rknK4NGvvm5aoaCbXPjmYAiBlkYpFlvZJ3ycU+9/kNDDTEnf9zD3Ks/7mBm5
	LEnA==
X-Gm-Message-State: APjAAAUN6DqY6GuPUYOfXICCGwZkl4m+4gyxd9yTX4C+uuEqpWQxJT3M
	TmYYi0qgVILq/u72HykTyN8=
X-Google-Smtp-Source: APXvYqzVO/Gp3x/5iuzohb4yH2JXSLnpsigG/zUyO3h3BY1YvpB1eIx9K7NqUiiXA/gP6W4cQjvTsQ==
X-Received: by 2002:adf:dfce:: with SMTP id q14mr25636788wrn.324.1580924593076;
	Wed, 05 Feb 2020 09:43:13 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id l29sm661870wrb.64.2020.02.05.09.43.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 05 Feb 2020 09:43:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 5 Feb 2020 18:43:10 +0100
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20200205174310.avol4qigjn4hweda@jama>
References: <20200203212641.57611-1-bruce.ashfield@gmail.com>
	<20200203221142.7jljrrrjxic3qtau@jama>
	<CADkTA4OjZmkVYbiuZ_GpLSUb25dqOGQPKR=ogEvtasBUpkYO0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OjZmkVYbiuZ_GpLSUb25dqOGQPKR=ogEvtasBUpkYO0w@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kern-tools: tweak symbol_why to be python safe
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
X-List-Received-Date: Wed, 05 Feb 2020 17:43:13 -0000
X-Groupsio-MsgNum: 134558
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nkbxnswpjpyleejm"
Content-Disposition: inline

--nkbxnswpjpyleejm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 11:16:03AM -0500, Bruce Ashfield wrote:
> On Mon, Feb 3, 2020 at 5:11 PM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >
> > On Mon, Feb 03, 2020 at 04:26:41PM -0500, bruce.ashfield@gmail.com wrot=
e:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Updating the SRCREV to pickup tweaks to symbol_why.py to be
> > > python3 safe:
> > >
> > >   - we explicitly call /usr/bin/env python3
> > >   - we full specifiy our symbols
> > >   - do not assume that 'None' can be converted to a string
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >
> > > I didn't realized the v5.4 series had gone in, or I would have
> > > send this sooner. This should resolve the errors that are thrown
> > > when symbol_why is run to detect missing symbol dependencies.
> > >
> > > Bruce
> > >
> > >  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb =
b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > > index a4c0b6fb8a..57ec1abc6d 100644
> > > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=
=3D5;endline=3D9;md5=3D9c30e971d435
> > >
> > >  DEPENDS =3D "git-native"
> > >
> > > -SRCREV =3D "7465c8497893ef8f6503c918aeede969f7e9753b"
> > > +SRCREV =3D "5358eb293399867db05fd73d04ce908d69a03bed"
> > >  PR =3D "r12"
> > >  PV =3D "0.2+git${SRCPV}"
> >
> > This needs a bit more cleanup for python3.
>=20
> Martin,
>=20
> I've got builds and tests running on the rest of the patches that have
> come in recently, and I wanted to loop back to this one.
>=20
> I'm dropping into a devshell and running the symbol_why.py script
> using python3 from the sysroot and I didn't see the same issues (But I
> do have changes for what's in your log).
>=20
> I'll double check once my build churns through the queued patches
> here, but I thought I'd check with you to see if you are still seeing
> this with the various fixes for the gold linker you've pulled together
> ? I'm guessing that now that it isn't aborting early, the warnings
> aren't triggering and hence it isn't even running (like it was in my
> runs), so you can't say one way or the other,
>=20
> I'm mainly interested to hear if it was a host python3 or the
> sysroot-native one that was tossing those errors, so I can detangle my
> last changes and test in a similar env.

I think it was combination of gold triggering the error in Kbuild:
> kconfiglib.KconfigError: scripts/Kconfig.include:39:  gold linker 'x86_64=
-oe-linux-ld --sysroot=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-lin=
ux/linux-yocto/5.4.15-r0/recipe-sysroot ' not supported
which was then incorrectly handled by kconfiglib.py, the error handling
issue is very likely still there, just no longer triggered for me
after passing KERNEL_LD.

I still have your SRCREV bump included in my builds, but it seems to be
unrelated to kconfiglib.py issue shown in my build
http://git.yoctoproject.org/cgit/cgit.cgi/wr-kernel-tools/commit/?id=3D5358=
eb293399867db05fd73d04ce908d69a03bed

With all the queued fixes for KERNEL_LD I was able to build whole
image with ld-is-gold

with log.kernel_configme not showing any python exceptions
just couple symbols which then aren't included in
log.kernel_configcheck, so I assume these are expected (whole log at the
end).

I was also able to boot it with qemu for testimage tasks

There are 3 failing tests for core-image-sato-sdk-ptest:
SUMMARY:
core-image-sato-sdk-ptest () - Ran 62 tests in 7387.915s
core-image-sato-sdk-ptest - FAIL - Required tests failed (successes=3D34, s=
kipped=3D24, failures=3D3, errors=3D0)
ERROR: core-image-sato-sdk-ptest-1.0-r0 do_testimage: core-image-sato-sdk-p=
test - FAILED - check the task log and the ssh log

RESULTS - kernelmodule.KernelModuleTest.test_kernel_module: FAILED (2.98s)
RESULTS - rpm.RpmBasicTest.test_rpm_query: FAILED (0.22s)
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (0.35s)

Only the first one seems to be related to ld-is-gold and 5.4 kernel (as
reported in separate e-mail before), rpm test failed probably because
I'm using package_ipk not rpm and systemd test failed because of
mdmon@md125.service failing.

I don't have a good base build to compare with, I usually don't use
testimage and all my previous tries failed even more badly :).

log.kernel_configme:

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['/OE/build/oe-core/openembedded-core/meta/re=
cipes-kernel/kern-tools/kern-tools-native_git.bb:do_populate_sysroot', '/OE=
/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_9.2.bb=
:do_populate_sysroot', 'virtual:native:/OE/build/oe-core/openembedded-core/=
meta/recipes-extended/bc/bc_1.07.1.bb:do_populate_sysroot', 'virtual:native=
:/OE/build/oe-core/openembedded-core/meta/recipes-devtools/bison/bison_3.5.=
bb:do_populate_sysroot', '/OE/build/oe-core/openembedded-core/meta/recipes-=
devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot', '/OE/build/oe-cor=
e/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.33.bb:d=
o_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['kern-tools-native', 'gcc-cro=
ss-x86_64', 'bc-native', 'bison-native', 'quilt-native', 'binutils-cross-x8=
6_64', 'libtool-native', 'gnu-config-native', 'xz-native', 'autoconf-native=
', 'flex-native', 'gettext-minimal-native', 'texinfo-dummy-native', 'automa=
ke-native', 'libmpc-native', 'mpfr-native', 'linux-libc-headers', 'zlib-nat=
ive', 'gmp-native', 'readline-native', 'm4-native', 'ncurses-native', 'pkgc=
onfig-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing shell function do_kernel_configme
Using .kernel-meta/configs/v5.4/ktypes/base/base.cfg as base
Merging .kernel-meta/configs/v5.4/standard/ktypes/standard/standard.cfg
Merging .kernel-meta/configs/v5.4/standard/features/kgdb/kgdb.cfg
Merging .kernel-meta/configs/v5.4/standard/features/kgdb/kgdb-x86.cfg
Merging .kernel-meta/configs/v5.4/standard/features/firmware/firmware.cfg
Value of CONFIG_FW_LOADER is redefined by fragment .kernel-meta/configs/v5.=
4/standard/features/firmware/firmware.cfg:
Previous value: # CONFIG_FW_LOADER is not set
New value: CONFIG_FW_LOADER=3Dm

Merging .kernel-meta/configs/v5.4/standard/features/lttng/lttng.cfg
Merging .kernel-meta/configs/v5.4/standard/features/blktrace/blktrace.cfg
Merging .kernel-meta/configs/v5.4/standard/features/systemtap/systemtap.cfg
Value of CONFIG_DEBUG_INFO is redefined by fragment .kernel-meta/configs/v5=
=2E4/standard/features/systemtap/systemtap.cfg:
Previous value: # CONFIG_DEBUG_INFO is not set
New value: CONFIG_DEBUG_INFO=3Dy

Merging .kernel-meta/configs/v5.4/standard/features/kprobes/kprobes.cfg
Merging .kernel-meta/configs/v5.4/standard/features/uprobe/uprobe.cfg
Merging .kernel-meta/configs/v5.4/standard/features/utrace/utrace.cfg
Merging .kernel-meta/configs/v5.4/standard/features/ftrace/ftrace.cfg
Merging .kernel-meta/configs/v5.4/standard/features/hrt/hrt.cfg
Merging .kernel-meta/configs/v5.4/standard/features/uprobe/uprobe.cfg
Merging .kernel-meta/configs/v5.4/standard/features/kprobes/kprobes.cfg
Merging .kernel-meta/configs/v5.4/standard/features/tmpfs/tmpfs-posix-acl.c=
fg
Merging .kernel-meta/configs/v5.4/standard/features/cgroups/cgroups.cfg
Merging .kernel-meta/configs/v5.4/standard/features/namespaces/namespaces.c=
fg
Merging .kernel-meta/configs/v5.4/standard/features/net_sched/net_sched.cfg
Merging .kernel-meta/configs/v5.4/standard/features/vdso/vdso.cfg
Merging .kernel-meta/configs/v5.4/standard/features/fuse/fuse.cfg
Merging .kernel-meta/configs/v5.4/standard/features/input/input.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/fs/devtmpfs.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/fs/debugfs.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/fs/btrfs.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/fs/ext4.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/net/ipsec.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/net/ipv6.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/net/ipsec.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/net/ipsec6.cfg
Value of CONFIG_CRYPTO_SEQIV is redefined by fragment .kernel-meta/configs/=
v5.4/standard/cfg/net/ipsec6.cfg:
Previous value: CONFIG_CRYPTO_SEQIV=3Dy
New value: CONFIG_CRYPTO_SEQIV=3Dm

Merging .kernel-meta/configs/v5.4/standard/cfg/net/ip_nf.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/net/ip6_nf.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/net/bridge.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/systemd.cfg
Merging .kernel-meta/configs/v5.4/standard/features/rfkill/rfkill.cfg
Merging .kernel-meta/configs/v5.4/standard/features/bpf/bpf.cfg
Merging .kernel-meta/configs/v5.4/standard/bsp/common-pc-64/common-pc-64-cp=
u.cfg
Merging .kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-drivers.=
cfg
Merging .kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-eth.cfg
Merging .kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-gfx.cfg
Merging .kernel-meta/configs/v5.4/standard/bsp/common-pc/common-pc-wifi.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/efi.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/efi-ext.cfg
Value of CONFIG_EFI_PARTITION is redefined by fragment .kernel-meta/configs=
/v5.4/standard/cfg/efi-ext.cfg:
Previous value: # CONFIG_EFI_PARTITION is not set
New value: CONFIG_EFI_PARTITION=3Dy

Merging .kernel-meta/configs/v5.4/standard/cfg/efi.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/timer/hpet.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/timer/no_hz.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/x86_base.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/smp_64.cfg
Value of CONFIG_NR_CPUS is redefined by fragment .kernel-meta/configs/v5.4/=
standard/cfg/smp_64.cfg:
Previous value: CONFIG_NR_CPUS=3D24
New value: CONFIG_NR_CPUS=3D64

Merging .kernel-meta/configs/v5.4/standard/cfg/timer/hz_1000.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/x86_64.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/amd.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/intel.cfg
Merging .kernel-meta/configs/v5.4/standard/features/pci/pci.cfg
Merging .kernel-meta/configs/v5.4/standard/features/pci-iov/pci-iov.cfg
Merging .kernel-meta/configs/v5.4/standard/features/mmc/mmc-base.cfg
Merging .kernel-meta/configs/v5.4/standard/features/mmc/mmc-sdhci.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/usb-base.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/ehci-hcd.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/usb-base.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/uhci-hcd.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/usb-base.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/ohci-hcd.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/usb-base.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/xhci-hcd.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/usb-base.cfg
Merging .kernel-meta/configs/v5.4/standard/features/input/touchscreen.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb/touchscreen-composi=
te.cfg
Merging .kernel-meta/configs/v5.4/standard/features/usb-net/usb-net.cfg
Merging .kernel-meta/configs/v5.4/standard/features/intel-e1xxxx/intel-e100=
=2Ecfg
Value of CONFIG_E100 is redefined by fragment .kernel-meta/configs/v5.4/sta=
ndard/features/intel-e1xxxx/intel-e100.cfg:
Previous value: CONFIG_E100=3Dm
New value: CONFIG_E100=3Dy

Merging .kernel-meta/configs/v5.4/standard/features/intel-e1xxxx/intel-e1xx=
xx.cfg
Value of CONFIG_E1000E is redefined by fragment .kernel-meta/configs/v5.4/s=
tandard/features/intel-e1xxxx/intel-e1xxxx.cfg:
Previous value: CONFIG_E1000E=3Dm
New value: CONFIG_E1000E=3Dy

Value of CONFIG_E1000 is redefined by fragment .kernel-meta/configs/v5.4/st=
andard/features/intel-e1xxxx/intel-e1xxxx.cfg:
Previous value: CONFIG_E1000=3Dm
New value: CONFIG_E1000=3Dy

Merging .kernel-meta/configs/v5.4/standard/features/igb/igb.cfg
Merging .kernel-meta/configs/v5.4/standard/features/scsi/scsi.cfg
Merging .kernel-meta/configs/v5.4/standard/features/scsi/cdrom.cfg
Merging .kernel-meta/configs/v5.4/standard/features/x2apic/x2apic.cfg
Merging .kernel-meta/configs/v5.4/standard/features/bluetooth/bluetooth.cfg
Value of CONFIG_BT is redefined by fragment .kernel-meta/configs/v5.4/stand=
ard/features/bluetooth/bluetooth.cfg:
Previous value: # CONFIG_BT is not set
New value: CONFIG_BT=3Dy

Merging .kernel-meta/configs/v5.4/standard/features/6lowpan/6lowpan.cfg
Merging .kernel-meta/configs/v5.4/standard/features/power/intel.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/8250.cfg
Merging .kernel-meta/configs/v5.4/standard/features/i915/i915.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/fs/vfat.cfg
Value of CONFIG_NLS_CODEPAGE_437 is redefined by fragment .kernel-meta/conf=
igs/v5.4/standard/cfg/fs/vfat.cfg:
Previous value: CONFIG_NLS_CODEPAGE_437=3Dm
New value: CONFIG_NLS_CODEPAGE_437=3Dy

Value of CONFIG_NLS_ISO8859_1 is redefined by fragment .kernel-meta/configs=
/v5.4/standard/cfg/fs/vfat.cfg:
Previous value: CONFIG_NLS_ISO8859_1=3Dm
New value: CONFIG_NLS_ISO8859_1=3Dy

Merging .kernel-meta/configs/v5.4/standard/cfg/boot-live.cfg
Value of CONFIG_BLK_DEV_LOOP is redefined by fragment .kernel-meta/configs/=
v5.4/standard/cfg/boot-live.cfg:
Previous value: CONFIG_BLK_DEV_LOOP=3Dm
New value: CONFIG_BLK_DEV_LOOP=3Dy

Merging .kernel-meta/configs/v5.4/standard/features/scsi/scsi.cfg
Merging .kernel-meta/configs/v5.4/standard/features/scsi/disk.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/fs/vfat.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/usb-mass-storage.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/virtio.cfg
Merging .kernel-meta/configs/v5.4/standard//usb-base.cfg
Merging .kernel-meta/configs/v5.4/standard/features/media/media.cfg
Merging .kernel-meta/configs/v5.4/standard/features/media/media-usb-webcams=
=2Ecfg
Merging .kernel-meta/configs/v5.4/standard/features/sound/snd_hda_intel.cfg
Merging .kernel-meta/configs/v5.4/standard/features/nfsd/nfsd.cfg
Merging .kernel-meta/configs/v5.4/standard/features/debug/printk.cfg
Merging .kernel-meta/configs/v5.4/standard/features/kernel-sample/kernel-sa=
mple.cfg
Merging .kernel-meta/configs/v5.4/standard/features/netfilter/netfilter.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/virtio.cfg
Merging .kernel-meta/configs/v5.4/standard/features/drm-bochs/drm-bochs.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/sound.cfg
Value of CONFIG_SOUND is redefined by fragment .kernel-meta/configs/v5.4/st=
andard/cfg/sound.cfg:
Previous value: CONFIG_SOUND=3Dy
New value: CONFIG_SOUND=3Dm

Value of CONFIG_SND is redefined by fragment .kernel-meta/configs/v5.4/stan=
dard/cfg/sound.cfg:
Previous value: CONFIG_SND=3Dy
New value: CONFIG_SND=3Dm

Merging .kernel-meta/configs/v5.4/standard/cfg/hv-guest.cfg
Merging .kernel-meta/configs/v5.4/standard/cfg/paravirt_kvm.cfg
Merging .kernel-meta/configs/v5.4/standard/features/scsi/scsi.cfg
Merging .kernel-meta/configs/v5.4/standard/features/scsi/scsi-debug.cfg
make[1]: Entering directory '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe=
-linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --alldefconfig Kconfig
=2E/.tmp.config.IzRt9b1cd6:2208:warning: unexpected data:  #
=2E/.tmp.config.IzRt9b1cd6:2209:warning: unexpected data:  # Generic Driver=
 Options
=2E/.tmp.config.IzRt9b1cd6:2210:warning: unexpected data:  #
=2E/.tmp.config.IzRt9b1cd6:3092:warning: symbol value 'm' invalid for SAMPL=
E_SECCOMP
=2E/.tmp.config.IzRt9b1cd6:3109:warning: symbol value 'm' invalid for NF_CT=
_PROTO_GRE
=2E/.tmp.config.IzRt9b1cd6:3110:warning: symbol value 'm' invalid for NF_CT=
_PROTO_SCTP
=2E/.tmp.config.IzRt9b1cd6:3111:warning: symbol value 'm' invalid for NF_CT=
_PROTO_UDPLITE
#
# configuration written to .config
#
make[1]: Leaving directory '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-=
linux/linux-yocto/5.4.15-r0/linux-qemux86_64-standard-build'
Value requested for CONFIG_KALLSYMS_ALL not in final .config
Requested value:  # CONFIG_KALLSYMS_ALL is not set
Actual value:    =20

Value requested for CONFIG_DEBUG_DRIVER not in final .config
Requested value:  # CONFIG_DEBUG_DRIVER is not set
Actual value:    =20

Value requested for CONFIG_HUGETLB_PAGE not in final .config
Requested value:  # CONFIG_HUGETLB_PAGE is not set
Actual value:    =20

Value requested for CONFIG_SCHEDSTATS not in final .config
Requested value:  # CONFIG_SCHEDSTATS is not set
Actual value:    =20

Value requested for CONFIG_DEBUG_SLAB not in final .config
Requested value:  # CONFIG_DEBUG_SLAB is not set
Actual value:    =20

Value requested for CONFIG_DEBUG_SPINLOCK not in final .config
Requested value:  # CONFIG_DEBUG_SPINLOCK is not set
Actual value:    =20

Value requested for CONFIG_DEBUG_KOBJECT not in final .config
Requested value:  # CONFIG_DEBUG_KOBJECT is not set
Actual value:    =20

Value requested for CONFIG_DEBUG_HIGHMEM not in final .config
Requested value:  # CONFIG_DEBUG_HIGHMEM is not set
Actual value:    =20

Value requested for CONFIG_KEYS not in final .config
Requested value:  # CONFIG_KEYS is not set
Actual value:     CONFIG_KEYS=3Dy

Value requested for CONFIG_REISERFS_CHECK not in final .config
Requested value:  # CONFIG_REISERFS_CHECK is not set
Actual value:    =20

Value requested for CONFIG_REISERFS_FS_SECURITY not in final .config
Requested value:  # CONFIG_REISERFS_FS_SECURITY is not set
Actual value:    =20

Value requested for CONFIG_FAT_FS not in final .config
Requested value:  CONFIG_FAT_FS=3Dm
Actual value:     CONFIG_FAT_FS=3Dy

Value requested for CONFIG_KGDB not in final .config
Requested value:  CONFIG_KGDB=3Dy
Actual value:    =20

Value requested for CONFIG_KGDB_KDB not in final .config
Requested value:  CONFIG_KGDB_KDB=3Dy
Actual value:    =20

Value requested for CONFIG_KDB_KEYBOARD not in final .config
Requested value:  CONFIG_KDB_KEYBOARD=3Dy
Actual value:    =20

Value requested for CONFIG_KGDB_LOW_LEVEL_TRAP not in final .config
Requested value:  CONFIG_KGDB_LOW_LEVEL_TRAP=3Dy
Actual value:    =20

Value requested for CONFIG_FW_LOADER not in final .config
Requested value:  CONFIG_FW_LOADER=3Dm
Actual value:     CONFIG_FW_LOADER=3Dy

Value requested for CONFIG_DEBUG_INFO not in final .config
Requested value:  CONFIG_DEBUG_INFO=3Dy
Actual value:    =20

Value requested for CONFIG_CGROUP_DEBUG not in final .config
Requested value:  CONFIG_CGROUP_DEBUG=3Dy=20
Actual value:    =20

Value requested for CONFIG_BFQ_CGROUP_DEBUG not in final .config
Requested value:  # CONFIG_BFQ_CGROUP_DEBUG is not set
Actual value:    =20

Value requested for CONFIG_CRYPTO_SEQIV not in final .config
Requested value:  CONFIG_CRYPTO_SEQIV=3Dm
Actual value:     CONFIG_CRYPTO_SEQIV=3Dy

Value requested for CONFIG_BRIDGE_NETFILTER not in final .config
Requested value:  CONFIG_BRIDGE_NETFILTER=3Dy
Actual value:     CONFIG_BRIDGE_NETFILTER=3Dm

Value requested for CONFIG_V4L2_MEM2MEM_DEV not in final .config
Requested value:  CONFIG_V4L2_MEM2MEM_DEV=3Dm
Actual value:    =20

Value requested for CONFIG_VIDEOBUF_GEN not in final .config
Requested value:  CONFIG_VIDEOBUF_GEN=3Dm
Actual value:    =20

Value requested for CONFIG_VIDEOBUF_DMA_SG not in final .config
Requested value:  CONFIG_VIDEOBUF_DMA_SG=3Dm
Actual value:    =20

Value requested for CONFIG_VIDEOBUF_DMA_CONTIG not in final .config
Requested value:  CONFIG_VIDEOBUF_DMA_CONTIG=3Dm
Actual value:    =20

Value requested for CONFIG_VIDEOBUF_VMALLOC not in final .config
Requested value:  CONFIG_VIDEOBUF_VMALLOC=3Dm
Actual value:    =20

Value requested for CONFIG_VIDEOBUF2_DMA_SG not in final .config
Requested value:  CONFIG_VIDEOBUF2_DMA_SG=3Dm
Actual value:    =20

Value requested for CONFIG_VIDEOBUF2_DMA_CONTIG not in final .config
Requested value:  CONFIG_VIDEOBUF2_DMA_CONTIG=3Dm
Actual value:    =20

Value requested for CONFIG_DVB_CORE not in final .config
Requested value:  CONFIG_DVB_CORE=3Dy
Actual value:    =20

Value requested for CONFIG_DVB_NET not in final .config
Requested value:  CONFIG_DVB_NET=3Dy
Actual value:    =20

Value requested for CONFIG_DVB_MAX_ADAPTERS not in final .config
Requested value:  CONFIG_DVB_MAX_ADAPTERS=3D8
Actual value:    =20

Value requested for CONFIG_DVB_DYNAMIC_MINORS not in final .config
Requested value:  CONFIG_DVB_DYNAMIC_MINORS=3Dy
Actual value:    =20

Value requested for CONFIG_MEDIA_ATTACH not in final .config
Requested value:  CONFIG_MEDIA_ATTACH=3Dy
Actual value:    =20

Value requested for CONFIG_NFSD_FAULT_INJECTION not in final .config
Requested value:  # CONFIG_NFSD_FAULT_INJECTION is not set
Actual value:    =20

Value requested for CONFIG_TTY_PRINTK not in final .config
Requested value:  CONFIG_TTY_PRINTK=3Dy
Actual value:    =20

Value requested for CONFIG_SAMPLE_CONNECTOR not in final .config
Requested value:  CONFIG_SAMPLE_CONNECTOR=3Dm
Actual value:    =20

Value requested for CONFIG_SAMPLE_SECCOMP not in final .config
Requested value:  CONFIG_SAMPLE_SECCOMP=3Dm
Actual value:    =20

Value requested for CONFIG_NF_CT_PROTO_GRE not in final .config
Requested value:  CONFIG_NF_CT_PROTO_GRE=3Dm
Actual value:     CONFIG_NF_CT_PROTO_GRE=3Dy

Value requested for CONFIG_NF_CT_PROTO_SCTP not in final .config
Requested value:  CONFIG_NF_CT_PROTO_SCTP=3Dm
Actual value:     CONFIG_NF_CT_PROTO_SCTP=3Dy

Value requested for CONFIG_NF_CT_PROTO_UDPLITE not in final .config
Requested value:  CONFIG_NF_CT_PROTO_UDPLITE=3Dm
Actual value:     CONFIG_NF_CT_PROTO_UDPLITE=3Dy

Value requested for CONFIG_NF_NAT_SNMP_BASIC not in final .config
Requested value:  CONFIG_NF_NAT_SNMP_BASIC=3Dm
Actual value:    =20

Value requested for CONFIG_SOUND_OSS_CORE not in final .config
Requested value:  # CONFIG_SOUND_OSS_CORE is not set
Actual value:    =20

Value requested for CONFIG_SND_COMPRESS_OFFLOAD not in final .config
Requested value:  CONFIG_SND_COMPRESS_OFFLOAD=3Dm
Actual value:    =20

Value requested for CONFIG_SND_MIXER_OSS not in final .config
Requested value:  # CONFIG_SND_MIXER_OSS is not set
Actual value:    =20

Value requested for CONFIG_SND_PCM_OSS not in final .config
Requested value:  # CONFIG_SND_PCM_OSS is not set
Actual value:    =20

Value requested for CONFIG_SND_SEQUENCER_OSS not in final .config
Requested value:  # CONFIG_SND_SEQUENCER_OSS is not set
Actual value:    =20

Value requested for CONFIG_SND_SOC_AC97_BUS not in final .config
Requested value:  CONFIG_SND_SOC_AC97_BUS=3Dy
Actual value:    =20

Value requested for CONFIG_SND_SOC_COMPRESS not in final .config
Requested value:  CONFIG_SND_SOC_COMPRESS=3Dy
Actual value:    =20

Value requested for CONFIG_SND_SOC_AMD_ACP not in final .config
Requested value:  CONFIG_SND_SOC_AMD_ACP=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SST_ATOM_HIFI2_PLATFORM not in final .config
Requested value:  CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SST_IPC not in final .config
Requested value:  CONFIG_SND_SST_IPC=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SST_IPC_ACPI not in final .config
Requested value:  CONFIG_SND_SST_IPC_ACPI=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_SST_FIRMWARE not in final .config
Requested value:  CONFIG_SND_SOC_INTEL_SST_FIRMWARE=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_HASWELL not in final .config
Requested value:  CONFIG_SND_SOC_INTEL_HASWELL=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_HASWELL_MACH not in final .config
Requested value:  CONFIG_SND_SOC_INTEL_HASWELL_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH not in f=
inal .config
Requested value:  CONFIG_SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_BXT_RT298_MACH not in final .config
Requested value:  CONFIG_SND_SOC_INTEL_BXT_RT298_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_BROADWELL_MACH not in final .config
Requested value:  CONFIG_SND_SOC_INTEL_BROADWELL_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH not in final .co=
nfig
Requested value:  CONFIG_SND_SOC_INTEL_BYTCR_RT5640_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH not in final .co=
nfig
Requested value:  CONFIG_SND_SOC_INTEL_BYTCR_RT5651_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH not in final .=
config
Requested value:  CONFIG_SND_SOC_INTEL_CHT_BSW_RT5672_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH not in final .=
config
Requested value:  CONFIG_SND_SOC_INTEL_CHT_BSW_RT5645_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH not in fi=
nal .config
Requested value:  CONFIG_SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH not in f=
inal .config
Requested value:  CONFIG_SND_SOC_INTEL_SKL_NAU88L25_SSM4567_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH not in=
 final .config
Requested value:  CONFIG_SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_INTEL_SKYLAKE not in final .config
Requested value:  CONFIG_SND_SOC_INTEL_SKYLAKE=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_AC97_CODEC not in final .config
Requested value:  CONFIG_SND_SOC_AC97_CODEC=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_AK4104 not in final .config
Requested value:  CONFIG_SND_SOC_AK4104=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_AK4554 not in final .config
Requested value:  CONFIG_SND_SOC_AK4554=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_AK4613 not in final .config
Requested value:  CONFIG_SND_SOC_AK4613=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_AK4642 not in final .config
Requested value:  CONFIG_SND_SOC_AK4642=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_AK5386 not in final .config
Requested value:  CONFIG_SND_SOC_AK5386=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_ALC5623 not in final .config
Requested value:  CONFIG_SND_SOC_ALC5623=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS35L32 not in final .config
Requested value:  CONFIG_SND_SOC_CS35L32=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS35L33 not in final .config
Requested value:  CONFIG_SND_SOC_CS35L33=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS42L51 not in final .config
Requested value:  CONFIG_SND_SOC_CS42L51=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS42L51_I2C not in final .config
Requested value:  CONFIG_SND_SOC_CS42L51_I2C=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS42L52 not in final .config
Requested value:  CONFIG_SND_SOC_CS42L52=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS42L56 not in final .config
Requested value:  CONFIG_SND_SOC_CS42L56=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS42L73 not in final .config
Requested value:  CONFIG_SND_SOC_CS42L73=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS4265 not in final .config
Requested value:  CONFIG_SND_SOC_CS4265=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS4270 not in final .config
Requested value:  CONFIG_SND_SOC_CS4270=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS4271 not in final .config
Requested value:  CONFIG_SND_SOC_CS4271=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS4271_I2C not in final .config
Requested value:  CONFIG_SND_SOC_CS4271_I2C=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS4271_SPI not in final .config
Requested value:  CONFIG_SND_SOC_CS4271_SPI=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS42XX8 not in final .config
Requested value:  CONFIG_SND_SOC_CS42XX8=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS42XX8_I2C not in final .config
Requested value:  CONFIG_SND_SOC_CS42XX8_I2C=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS4349 not in final .config
Requested value:  CONFIG_SND_SOC_CS4349=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_CS53L30 not in final .config
Requested value:  CONFIG_SND_SOC_CS53L30=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_DA7219 not in final .config
Requested value:  CONFIG_SND_SOC_DA7219=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_MAX98090 not in final .config
Requested value:  CONFIG_SND_SOC_MAX98090=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_MAX98357A not in final .config
Requested value:  CONFIG_SND_SOC_MAX98357A=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM1681 not in final .config
Requested value:  CONFIG_SND_SOC_PCM1681=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM179X not in final .config
Requested value:  CONFIG_SND_SOC_PCM179X=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM179X_I2C not in final .config
Requested value:  CONFIG_SND_SOC_PCM179X_I2C=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM179X_SPI not in final .config
Requested value:  CONFIG_SND_SOC_PCM179X_SPI=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM3168A not in final .config
Requested value:  CONFIG_SND_SOC_PCM3168A=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM3168A_I2C not in final .config
Requested value:  CONFIG_SND_SOC_PCM3168A_I2C=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM3168A_SPI not in final .config
Requested value:  CONFIG_SND_SOC_PCM3168A_SPI=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM512x not in final .config
Requested value:  CONFIG_SND_SOC_PCM512x=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM512x_I2C not in final .config
Requested value:  CONFIG_SND_SOC_PCM512x_I2C=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_PCM512x_SPI not in final .config
Requested value:  CONFIG_SND_SOC_PCM512x_SPI=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_RL6231 not in final .config
Requested value:  CONFIG_SND_SOC_RL6231=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_RT298 not in final .config
Requested value:  CONFIG_SND_SOC_RT298=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_RT5616 not in final .config
Requested value:  CONFIG_SND_SOC_RT5616=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_RT5631 not in final .config
Requested value:  CONFIG_SND_SOC_RT5631=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_RT5640 not in final .config
Requested value:  CONFIG_SND_SOC_RT5640=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_RT5645 not in final .config
Requested value:  CONFIG_SND_SOC_RT5645=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_RT5651 not in final .config
Requested value:  CONFIG_SND_SOC_RT5651=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_RT5670 not in final .config
Requested value:  CONFIG_SND_SOC_RT5670=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_SPDIF not in final .config
Requested value:  CONFIG_SND_SOC_SPDIF=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_SSM4567 not in final .config
Requested value:  CONFIG_SND_SOC_SSM4567=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_TLV320AIC31XX not in final .config
Requested value:  CONFIG_SND_SOC_TLV320AIC31XX=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_TLV320AIC3X not in final .config
Requested value:  CONFIG_SND_SOC_TLV320AIC3X=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_TS3A227E not in final .config
Requested value:  CONFIG_SND_SOC_TS3A227E=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8510 not in final .config
Requested value:  CONFIG_SND_SOC_WM8510=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8523 not in final .config
Requested value:  CONFIG_SND_SOC_WM8523=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8580 not in final .config
Requested value:  CONFIG_SND_SOC_WM8580=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8711 not in final .config
Requested value:  CONFIG_SND_SOC_WM8711=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8728 not in final .config
Requested value:  CONFIG_SND_SOC_WM8728=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8731 not in final .config
Requested value:  CONFIG_SND_SOC_WM8731=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8737 not in final .config
Requested value:  CONFIG_SND_SOC_WM8737=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8741 not in final .config
Requested value:  CONFIG_SND_SOC_WM8741=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8750 not in final .config
Requested value:  CONFIG_SND_SOC_WM8750=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8753 not in final .config
Requested value:  CONFIG_SND_SOC_WM8753=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8770 not in final .config
Requested value:  CONFIG_SND_SOC_WM8770=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8776 not in final .config
Requested value:  CONFIG_SND_SOC_WM8776=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8804 not in final .config
Requested value:  CONFIG_SND_SOC_WM8804=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8804_I2C not in final .config
Requested value:  CONFIG_SND_SOC_WM8804_I2C=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8804_SPI not in final .config
Requested value:  CONFIG_SND_SOC_WM8804_SPI=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8903 not in final .config
Requested value:  CONFIG_SND_SOC_WM8903=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8960 not in final .config
Requested value:  CONFIG_SND_SOC_WM8960=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8962 not in final .config
Requested value:  CONFIG_SND_SOC_WM8962=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8974 not in final .config
Requested value:  CONFIG_SND_SOC_WM8974=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8978 not in final .config
Requested value:  CONFIG_SND_SOC_WM8978=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_WM8985 not in final .config
Requested value:  CONFIG_SND_SOC_WM8985=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_NAU8825 not in final .config
Requested value:  CONFIG_SND_SOC_NAU8825=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SOC_TPA6130A2 not in final .config
Requested value:  CONFIG_SND_SOC_TPA6130A2=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SIMPLE_CARD_UTILS not in final .config
Requested value:  CONFIG_SND_SIMPLE_CARD_UTILS=3Dm
Actual value:    =20

Value requested for CONFIG_SND_SIMPLE_CARD not in final .config
Requested value:  CONFIG_SND_SIMPLE_CARD=3Dm
Actual value:    =20

DEBUG: Shell function do_kernel_configme finished

>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > DEBUG: Executing python function do_kernel_configcheck
> > Traceback (most recent call last):
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _ex=
pand_macro
> >     res +=3D args[int(new_args[0])]
> > ValueError: invalid literal for int() with base 10: 'error-if'
> >
> > During handling of the above exception, another exception occurred:
> >
> > Traceback (most recent call last):
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/symbol_why.py", line 295, in <mod=
ule>
> >     conf =3D kconfiglib.Kconfig( kconf, show_errors, show_errors )
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 947, in __in=
it__
> >     self._init(filename, warn, warn_to_stderr, encoding)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 1085, in _in=
it
> >     self._parse_block(None, self.top_node, self.top_node).next =3D None
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2982, in _pa=
rse_block
> >     prev =3D self._parse_block(None, parent, prev)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2907, in _pa=
rse_block
> >     while self._next_line():
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2234, in _ne=
xt_line
> >     self._tokens =3D self._tokenize(line)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2364, in _to=
kenize
> >     self._parse_assignment(s)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2604, in _pa=
rse_assignment
> >     s, i =3D self._expand_macro(s, i, ())
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2780, in _ex=
pand_macro
> >     res +=3D self._fn_val(new_args)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2843, in _fn=
_val
> >     return py_fn(self, *args)
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 6769, in _er=
ror_if_fn
> >     kconf.filename, kconf.linenr, msg))
> > kconfiglib.KconfigError: scripts/Kconfig.include:39:  gold linker 'x86_=
64-oe-linux-ld --sysroot=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-l=
inux/linux-yocto/5.4.15-r0/recipe-sysroot  ' not supported
> > Traceback (most recent call last):
> >   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _ex=
pand_macro
> >     res +=3D args[int(new_args[0])]
> > ValueError: invalid literal for int() with base 10: 'error-if'
> >
> > During handling of the above exception, another exception occurred:
> >
> > and the log is full of this (the warnings at the end look the same as b=
efore)
> >
> > # wc -l /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yoct=
o/5.4.15-r0/temp/log.do_kernel_configcheck.28364
> > 11804 /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/=
5.4.15-r0/temp/log.do_kernel_configcheck.28364
> >
> > Maybe kernel_configcheck now needs KERNEL_LD exported as well? See:
> > https://patchwork.openembedded.org/patch/169702/
> > which fixed do_configure with 5.4.
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--nkbxnswpjpyleejm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXjr+rQAKCRA3VSO3ZXaA
HEKNAJ0ejwkju/keE7SdkuSca4sHm5jmxQCgotvFxPrXvCNsy/yJJXvXXVZKT58=
=3NYG
-----END PGP SIGNATURE-----

--nkbxnswpjpyleejm--
