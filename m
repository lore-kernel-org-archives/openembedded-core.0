Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9tmq-0004WV-4s
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 10:19:36 +0200
Received: by eekb57 with SMTP id b57so960843eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 01:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vudAvW07aOrZAYqOjka6LBb20E2D58GE7EGFNwvPs+E=;
	b=yPMhn6KjdnWJ+EnauiIFXbCcqR6WQ6d0uHTOsyqzjR6zBpUE4fvYyeYvInPy1tessP
	gjcD13/gDxxs9h3NUBHpCrBLOvYzq17/5e/9fVFnVon1vEF5RvB/+06VjR9UFixoxwrt
	a8kueQZX1zQsNT+5EFqzesQlL9iZ+TTgTfSw5pz+N66li2eYctPcKmDFpbKi9sI6cYFE
	uVM2HhQAz6NLnj0asdt9nqE7NS91gDQxjeOqIgeACvC8hhnos2sR5Oa3rNopvPpbyaJL
	+JLcyRAY+gPW3fOAdYWe+ZhhYDlDKFauJ9+cZq63UJJ3SIa/PjFJ7zJsQqDWkR4GWIHP
	Xezw==
Received: by 10.14.202.66 with SMTP id c42mr6584819eeo.35.1347005230815; Fri,
	07 Sep 2012 01:07:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 7 Sep 2012 01:06:40 -0700 (PDT)
In-Reply-To: <cover.1346970617.git.raj.khem@gmail.com>
References: <cover.1346970617.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 01:06:40 -0700
Message-ID: <CAMKF1sry7wR6seOpYDfzc31S7_uRUPoXX2yHWiMMLjeBgZr-8w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Upgrade qemu to 1.2 and eglibc with kconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 08:19:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 6, 2012 at 3:32 PM, Khem Raj <raj.khem@gmail.com> wrote:
> This patchset updates qemu to 1.2 release
> Adds kconfig to eglibc, kconfig is of interest for
> eglibc upstream which is next step.
> Removes nptl and enable-tls configure options from
> x86 machine configurations

I missed to push a patch to runqemu-internal script to pull branch
now the branch has that additional patch along with these 6

>
> The following changes since commit 610f8c0c0cab8e258919689fd641faec28b58caf:
>
>   adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:27:31 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/qemu-eglibc-updates
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/qemu-eglibc-updates
>
> Khem Raj (6):
>   eglibc-2.16: Add kconfig infrastructure
>   eglibc: Enable kconfig for option management
>   kconfig-frontends: Create symlinks for conf and mconf
>   qemu-git: Move to tip of git past 1.2 release
>   qemu: Update from 0.15 to 1.2
>   machines/x86: Drop redundant glibc configure knobs
>
>  meta/conf/machine/include/ia32-base.inc            |    5 -
>  meta/conf/machine/qemux86-64.conf                  |    3 -
>  meta/conf/machine/qemux86.conf                     |    4 -
>  .../0001-eglibc-menuconfig-support.patch           | 1007 ++++++++++++++++++++
>  ...0002-eglibc-menuconfig-hex-string-options.patch |  169 ++++
>  ...0003-eglibc-menuconfig-build-instructions.patch |  176 ++++
>  meta/recipes-core/eglibc/eglibc-initial.inc        |    1 +
>  meta/recipes-core/eglibc/eglibc-options.inc        |    4 +-
>  meta/recipes-core/eglibc/eglibc.inc                |    4 +
>  meta/recipes-core/eglibc/eglibc_2.16.bb            |    8 +-
>  .../kconfig-frontends/kconfig-frontends_3.5.bb     |    8 +-
>  .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 -
>  .../a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch |   66 --
>  ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 -
>  .../qemu-0.15.1/ppc-s500-set-invalid-mask.patch    |  610 ------------
>  .../qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch |   12 +-
>  .../enable-i386-linux-user.patch                   |    0
>  .../fallback-to-safe-mmap_min_addr.patch           |    0
>  .../fix-configure-checks.patch                     |   18 +-
>  .../{qemu-0.15.1 => qemu-1.2.0}/init-info.patch    |    0
>  .../larger_default_ram_size.patch                  |    0
>  .../{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch |   14 +-
>  .../{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch     |    0
>  .../{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin    |  Bin 4096 -> 4096 bytes
>  .../qemu-vmware-vga-depth.patch                    |   70 +-
>  .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 bytes
>  .../qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb}         |   18 +-
>  meta/recipes-devtools/qemu/qemu_git.bb             |   15 +-
>  28 files changed, 1431 insertions(+), 868 deletions(-)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-Fix-linker-script.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Actually-raise-interrupt-on-timer-expiry.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-set-invalid-mask.patch
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/arm-bgr.patch (75%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/enable-i386-linux-user.patch (100%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fallback-to-safe-mmap_min_addr.patch (100%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/fix-configure-checks.patch (59%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/init-info.patch (100%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/larger_default_ram_size.patch (100%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/linker-flags.patch (64%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/no-strip.patch (100%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/powerpc_rom.bin (100%)
>  rename meta/recipes-devtools/qemu/{qemu-0.15.1 => qemu-1.2.0}/qemu-vmware-vga-depth.patch (61%)
>  create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
>  rename meta/recipes-devtools/qemu/{qemu_0.15.1.bb => qemu_1.2.0.bb} (57%)
>
> --
> 1.7.9.5
>


