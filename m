Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1D1566A957
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 21:56:27 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id z12so5685689wgg.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 14:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kHV0bs8yKqUeoqTE4TiEbb4XVAdle6CPKAxlcuOhCiA=;
	b=t0EyO5YrmSaprTOyClbm0R9rD9YncMeunui9UhBnd2DIfPtmhbKX1gNeTW75R/I07d
	fxPy0ZVXoKW4e7pGqv1bmo3clqU0fF0cLHOduODkG+ckBRBtO2QXOo2iw2STYwL9qo8A
	jpOgF3U2C4tf4Qr0L5BBhlNyJ+5M3ESQcQSOYFzz1KnqRJnO+ncAxXVl1czcRt45CCQ1
	GQBlbmZF5arwzGqh/9FXD0RbbkpyeNnib8LXMsvJ3Ip498CRNzgBiTThYVpP0K+Ui/oX
	RI8S48C4sxCz7C5dZov/ceK+YHlB1YlwE5Wfj1LrkWeeL/yyleFHxZYArSKgTZaJJzH8
	XEKQ==
MIME-Version: 1.0
X-Received: by 10.180.99.232 with SMTP id et8mr2629284wib.17.1370987788569;
	Tue, 11 Jun 2013 14:56:28 -0700 (PDT)
Received: by 10.194.16.136 with HTTP; Tue, 11 Jun 2013 14:56:28 -0700 (PDT)
In-Reply-To: <CAMKF1sqUQ7KfZ5dux+6SU1WQ=+4DPRThEVL8A0C4Zu6eVT1YcA@mail.gmail.com>
References: <1370520520-13372-1-git-send-email-riku.voipio@linaro.org>
	<51B0947C.3020603@linux.intel.com>
	<CAAqcGHmL1EE-HLv_m-a845KiY6uo8G_s_Yh8vbKLTcJNXa5tVw@mail.gmail.com>
	<51B733C5.4080409@linux.intel.com>
	<CAMKF1sqUQ7KfZ5dux+6SU1WQ=+4DPRThEVL8A0C4Zu6eVT1YcA@mail.gmail.com>
Date: Tue, 11 Jun 2013 23:56:28 +0200
Message-ID: <CA+chaQdboLKXv=MauVJ7Bvd82Wf2Ub7VgJSDM88Xw1KB5g6pDg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: update to 1.5.0
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
X-List-Received-Date: Tue, 11 Jun 2013 21:56:29 -0000
Content-Type: multipart/alternative; boundary=f46d041825ac2111d404dee7f823

--f46d041825ac2111d404dee7f823
Content-Type: text/plain; charset=UTF-8

It also segfaults when building emacs for x86* architecture, so let's see
if it gets also fixed by 1.5


On Tue, Jun 11, 2013 at 11:33 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jun 11, 2013 at 7:27 AM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 06/10/2013 04:37 AM, Riku Voipio wrote:
> >>
> >> On 6 June 2013 16:54, Saul Wold <sgw@linux.intel.com> wrote:
> >>>
> >>> On 06/06/2013 05:08 AM, Riku Voipio wrote:
> >>>>
> >>>>
> >>>> Patches removed:
> >>>>
> >>>> 0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
> >>>>    - applied
> >>>> 0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
> >>>>    - fixed different upstream
> >>>> Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
> >>>>    - fixed different upstream
> >>>> arm-bgr.patch
> >>>>    - this should be also fixed upstream, if still issue please resend.
> >>>> fallback-to-safe-mmap_min_addr.patch
> >>>>    - this should be also fixed upstream, if still issue please resend.
> >>>> linker-flags.patch
> >>>>    - unneeded with makefile changes
> >>>>
> >>>> from configure the obsolete --audio-cards-list option has been
> removed.
> >>
> >>
> >>> Please describe how this was tested, as Qemu is a core part of OE-core
> we
> >>> have seen past failures on version updates.  It's important to do
> >>> multi-architecture builds and execution with graphics.
> >>
> >>
> >>> Also will it build target binaries (for example the build appliance
> uses
> >>> qemu on the target) we have seen failures there also on updates.
> >>
> >>
> >> I've only tested building ARMv5 and ARMv7 systemd-gnome-images (which
> >> use qemu-native at some point of build. I just tested also building
> >> qemu for arm target and it builds fine. Differences between 1.4.1 and
> >> 1.5 in upstream are not that major that they should cause breakage in
> >> typical usecases. Setting IMAGETEST="qemu" did start qemu but the
> >> image didn't start. That however didn't work with 1.4.1 either.
> >>
> >
> > It really needs to be tested on more ARCHs other than ARM.
> >
> > What kind of failure do you see with IMAGETEST, this works as we use it
> all
> > the time for the Autobuilder Sanity Testing.
> >
>
> FWIW, I have tested this patch by booting angstrom/systemd-image on
> qemuarm/qemumips/qemumips64/qemuppc/
> qemux86/qemux86-6 without a problem.
>
> Secondly there is a qemu segmentation fault with 1.4.1 qemu when
> trying to emulate mips64 is now fixed with 1.5
> so thats an improvement.
>
> Tested-by: Khem Raj <raj.khem@gmail.com>
>
>
> > Sau!
> >
> >
> >> Riku
> >>
> >>> Thanks
> >>>
> >>> Sau!
> >>>
> >>>
> >>>> ---
> >>>>    ...x-texinfo-table-markup-in-qemu-options.hx.patch |  213
> >>>> --------------------
> >>>>    ...x-generating-qemu-doc.html-with-texinfo-5.patch |   54 -----
> >>>>    ...re_vga-Add-back-some-info-in-local-state-.patch |  114
> -----------
> >>>>    meta/recipes-devtools/qemu/files/arm-bgr.patch     |   30 ---
> >>>>    .../files/fallback-to-safe-mmap_min_addr.patch     |   39 ----
> >>>>    .../recipes-devtools/qemu/files/linker-flags.patch |   25 ---
> >>>>    meta/recipes-devtools/qemu/qemu.inc                |    7 +-
> >>>>    .../qemu/{qemu_1.4.1.bb => qemu_1.5.0.bb}          |    4 +-
> >>>>    8 files changed, 3 insertions(+), 483 deletions(-)
> >>>>    delete mode 100644
> >>>>
> >>>>
> meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
> >>>>    delete mode 100644
> >>>>
> >>>>
> meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
> >>>>    delete mode 100644
> >>>>
> >>>>
> meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
> >>>>    delete mode 100644 meta/recipes-devtools/qemu/files/arm-bgr.patch
> >>>>    delete mode 100644
> >>>> meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
> >>>>    delete mode 100644
> >>>> meta/recipes-devtools/qemu/files/linker-flags.patch
> >>>>    rename meta/recipes-devtools/qemu/{qemu_1.4.1.bb => qemu_1.5.0.bb}
> >>>> (67%)
> >>>>
> >>>> diff --git
> >>>>
> >>>>
> a/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
> >>>>
> >>>>
> b/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
> >>>> deleted file mode 100644
> >>>> index 9435cfe..0000000
> >>>> ---
> >>>>
> >>>>
> a/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch
> >>>> +++ /dev/null
> >>>> @@ -1,213 +0,0 @@
> >>>> -From 9a7146ca91c04d05af36684d8b3ca79c1254abc2 Mon Sep 17 00:00:00
> 2001
> >>>> -From: Markus Armbruster <armbru@redhat.com>
> >>>> -Date: Wed, 13 Feb 2013 19:49:40 +0100
> >>>> -Subject: [PATCH 1/2] doc: Fix texinfo @table markup in
> qemu-options.hx
> >>>> -
> >>>> -End tables before headings, start new ones afterwards.  Fixes
> >>>> -incorrect indentation of headings "File system options" and "Virtual
> >>>> -File system pass-through options" in manual page and qemu-doc.
> >>>> -
> >>>> -Normalize markup some to increase chances it survives future edits.
> >>>> -
> >>>> -Upstream-Status: Backport
> >>>> -
> >>>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>>> -Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >>>> -Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >>>> -Message-id: 1360781383-28635-5-git-send-email-armbru@redhat.com
> >>>> -Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> >>>> ----
> >>>> - qemu-options.hx | 56
> >>>> +++++++++++++++++++++++++++++++++++++-------------------
> >>>> - 1 file changed, 37 insertions(+), 19 deletions(-)
> >>>> -
> >>>> -diff --git a/qemu-options.hx b/qemu-options.hx
> >>>> -index 9d7131a..54bd92a 100644
> >>>> ---- a/qemu-options.hx
> >>>> -+++ b/qemu-options.hx
> >>>> -@@ -537,13 +537,15 @@ STEXI
> >>>> - @end table
> >>>> - ETEXI
> >>>> -
> >>>> --DEF("usb", 0, QEMU_OPTION_usb,
> >>>> --    "-usb            enable the USB driver (will be the default
> >>>> soon)\n",
> >>>> --    QEMU_ARCH_ALL)
> >>>> - STEXI
> >>>> - USB options:
> >>>> - @table @option
> >>>> -+ETEXI
> >>>> -
> >>>> -+DEF("usb", 0, QEMU_OPTION_usb,
> >>>> -+    "-usb            enable the USB driver (will be the default
> >>>> soon)\n",
> >>>> -+    QEMU_ARCH_ALL)
> >>>> -+STEXI
> >>>> - @item -usb
> >>>> - @findex -usb
> >>>> - Enable the USB driver (will be the default soon)
> >>>> -@@ -610,9 +612,15 @@ possible drivers and properties, use
> @code{-device
> >>>> help} and
> >>>> - @code{-device @var{driver},help}.
> >>>> - ETEXI
> >>>> -
> >>>> -+STEXI
> >>>> -+@end table
> >>>> -+ETEXI
> >>>> - DEFHEADING()
> >>>> -
> >>>> - DEFHEADING(File system options:)
> >>>> -+STEXI
> >>>> -+@table @option
> >>>> -+ETEXI
> >>>> -
> >>>> - DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
> >>>> -     "-fsdev
> >>>>
> >>>>
> fsdriver,id=id[,path=path,][security_model={mapped-xattr|mapped-file|passthrough|none}]\n"
> >>>> -@@ -676,9 +684,15 @@ Specifies the tag name to be used by the guest
> to
> >>>> mount this export point
> >>>> -
> >>>> - ETEXI
> >>>> -
> >>>> -+STEXI
> >>>> -+@end table
> >>>> -+ETEXI
> >>>> - DEFHEADING()
> >>>> -
> >>>> - DEFHEADING(Virtual File system pass-through options:)
> >>>> -+STEXI
> >>>> -+@table @option
> >>>> -+ETEXI
> >>>> -
> >>>> - DEF("virtfs", HAS_ARG, QEMU_OPTION_virtfs,
> >>>> -     "-virtfs
> >>>>
> >>>>
> local,path=path,mount_tag=tag,security_model=[mapped-xattr|mapped-file|passthrough|none]\n"
> >>>> -@@ -769,11 +783,9 @@ ETEXI
> >>>> - STEXI
> >>>> - @end table
> >>>> - ETEXI
> >>>> --
> >>>> - DEFHEADING()
> >>>> -
> >>>> - DEFHEADING(Display options:)
> >>>> --
> >>>> - STEXI
> >>>> - @table @option
> >>>> - ETEXI
> >>>> -@@ -1215,7 +1227,6 @@ ETEXI
> >>>> - STEXI
> >>>> - @end table
> >>>> - ETEXI
> >>>> --
> >>>> - ARCHHEADING(, QEMU_ARCH_I386)
> >>>> -
> >>>> - ARCHHEADING(i386 target only:, QEMU_ARCH_I386)
> >>>> -@@ -1301,10 +1312,10 @@ Specify SMBIOS type 0 fields
> >>>> - Specify SMBIOS type 1 fields
> >>>> - ETEXI
> >>>> -
> >>>> --DEFHEADING()
> >>>> - STEXI
> >>>> - @end table
> >>>> - ETEXI
> >>>> -+DEFHEADING()
> >>>> -
> >>>> - DEFHEADING(Network options:)
> >>>> - STEXI
> >>>> -@@ -1718,13 +1729,19 @@ libpcap, so it can be analyzed with tools
> such
> >>>> as
> >>>> tcpdump or Wireshark.
> >>>> - Indicate that no network devices should be configured. It is used to
> >>>> - override the default configuration (@option{-net nic -net user})
> which
> >>>> - is activated if no @option{-net} options are provided.
> >>>> -+ETEXI
> >>>> -
> >>>> -+STEXI
> >>>> - @end table
> >>>> - ETEXI
> >>>> --
> >>>> - DEFHEADING()
> >>>> -
> >>>> - DEFHEADING(Character device options:)
> >>>> -+STEXI
> >>>> -+
> >>>> -+The general form of a character device option is:
> >>>> -+@table @option
> >>>> -+ETEXI
> >>>> -
> >>>> - DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
> >>>> -     "-chardev null,id=id[,mux=on|off]\n"
> >>>> -@@ -1766,10 +1783,6 @@ DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
> >>>> - )
> >>>> -
> >>>> - STEXI
> >>>> --
> >>>> --The general form of a character device option is:
> >>>> --@table @option
> >>>> --
> >>>> - @item -chardev @var{backend} ,id=@var{id} [,mux=on|off]
> >>>> [,@var{options}]
> >>>> - @findex -chardev
> >>>> - Backend is one of:
> >>>> -@@ -1990,14 +2003,15 @@ Connect to a spice virtual machine channel,
> >>>> such
> >>>> as vdiport.
> >>>> -
> >>>> - Connect to a spice port, allowing a Spice client to handle the
> traffic
> >>>> - identified by a name (preferably a fqdn).
> >>>> -+ETEXI
> >>>> -
> >>>> -+STEXI
> >>>> - @end table
> >>>> - ETEXI
> >>>> --
> >>>> - DEFHEADING()
> >>>> -
> >>>> --STEXI
> >>>> - DEFHEADING(Device URL Syntax:)
> >>>> -+STEXI
> >>>> -
> >>>> - In addition to using normal file images for the emulated storage
> >>>> devices,
> >>>> - QEMU can also use networked resources such as iSCSI devices. These
> are
> >>>> -@@ -2113,10 +2127,16 @@ qemu-system-x86_84 --drive
> >>>> file=gluster://192.0.2.1/testvol/a.img
> >>>> - @end example
> >>>> -
> >>>> - See also @url{http://www.gluster.org}.
> >>>> -+ETEXI
> >>>> -+
> >>>> -+STEXI
> >>>> - @end table
> >>>> - ETEXI
> >>>> -
> >>>> - DEFHEADING(Bluetooth(R) options:)
> >>>> -+STEXI
> >>>> -+@table @option
> >>>> -+ETEXI
> >>>> -
> >>>> - DEF("bt", HAS_ARG, QEMU_OPTION_bt, \
> >>>> -     "-bt hci,null    dumb bluetooth HCI - doesn't respond to
> >>>> commands\n"
> >>>> \
> >>>> -@@ -2130,8 +2150,6 @@ DEF("bt", HAS_ARG, QEMU_OPTION_bt, \
> >>>> -     "                emulate a bluetooth device 'dev' in scatternet
> >>>> 'n'\n",
> >>>> -     QEMU_ARCH_ALL)
> >>>> - STEXI
> >>>> --@table @option
> >>>> --
> >>>> - @item -bt hci[...]
> >>>> - @findex -bt
> >>>> - Defines the function of the corresponding Bluetooth HCI.  -bt
> options
> >>>> -@@ -2183,9 +2201,11 @@ currently:
> >>>> - @item keyboard
> >>>> - Virtual wireless keyboard implementing the HIDP bluetooth profile.
> >>>> - @end table
> >>>> --@end table
> >>>> - ETEXI
> >>>> -
> >>>> -+STEXI
> >>>> -+@end table
> >>>> -+ETEXI
> >>>> - DEFHEADING()
> >>>> -
> >>>> - DEFHEADING(Linux/Multiboot boot specific:)
> >>>> -@@ -2242,11 +2262,9 @@ ETEXI
> >>>> - STEXI
> >>>> - @end table
> >>>> - ETEXI
> >>>> --
> >>>> - DEFHEADING()
> >>>> -
> >>>> - DEFHEADING(Debug/Expert options:)
> >>>> --
> >>>> - STEXI
> >>>> - @table @option
> >>>> - ETEXI
> >>>> ---
> >>>> -1.8.1.5
> >>>> -
> >>>> diff --git
> >>>>
> >>>>
> a/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
> >>>>
> >>>>
> b/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
> >>>> deleted file mode 100644
> >>>> index cabbf0e..0000000
> >>>> ---
> >>>>
> >>>>
> a/meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
> >>>> +++ /dev/null
> >>>> @@ -1,54 +0,0 @@
> >>>> -From f983d4978e1c49ee936ad52bf2de0c531420f5f8 Mon Sep 17 00:00:00
> 2001
> >>>> -From: Cole Robinson <crobinso@redhat.com>
> >>>> -Date: Wed, 20 Feb 2013 07:20:31 +0000
> >>>> -Subject: [PATCH 2/2] docs: Fix generating qemu-doc.html with texinfo
> 5
> >>>> -
> >>>> -LC_ALL=C makeinfo --no-headers --no-split --number-sections --html
> >>>> qemu-doc.texi -o qemu-doc.html
> >>>> -./qemu-options.texi:1521: unknown command `list'
> >>>> -./qemu-options.texi:1521: table requires an argument: the formatter
> for
> >>>> @item
> >>>> -./qemu-options.texi:1521: warning: @table has text but no @item
> >>>> -
> >>>> -Upstream-Status: Pending
> >>>> -http://patchwork.ozlabs.org/patch/222131/
> >>>> -
> >>>> -CC: qemu-stable@nongnu.org
> >>>> -Signed-off-by: Cole Robinson <crobinso@redhat.com>
> >>>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>>> -Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >>>> ----
> >>>> - qemu-options.hx | 19 +++++++------------
> >>>> - 1 file changed, 7 insertions(+), 12 deletions(-)
> >>>> -
> >>>> -diff --git a/qemu-options.hx b/qemu-options.hx
> >>>> -index 54bd92a..5d2d9b8 100644
> >>>> ---- a/qemu-options.hx
> >>>> -+++ b/qemu-options.hx
> >>>> -@@ -2089,18 +2089,13 @@ QEMU supports using either local sheepdog
> >>>> devices
> >>>> or remote networked
> >>>> - devices.
> >>>> -
> >>>> - Syntax for specifying a sheepdog device
> >>>> --@table @list
> >>>> --``sheepdog:<vdiname>''
> >>>> --
> >>>> --``sheepdog:<vdiname>:<snapid>''
> >>>> --
> >>>> --``sheepdog:<vdiname>:<tag>''
> >>>> --
> >>>> --``sheepdog:<host>:<port>:<vdiname>''
> >>>> --
> >>>> --``sheepdog:<host>:<port>:<vdiname>:<snapid>''
> >>>> --
> >>>> --``sheepdog:<host>:<port>:<vdiname>:<tag>''
> >>>> -+@table @code
> >>>> -+@item sheepdog:<vdiname>
> >>>> -+@item sheepdog:<vdiname>:<snapid>
> >>>> -+@item sheepdog:<vdiname>:<tag>
> >>>> -+@item sheepdog:<host>:<port>:<vdiname>
> >>>> -+@item sheepdog:<host>:<port>:<vdiname>:<snapid>
> >>>> -+@item sheepdog:<host>:<port>:<vdiname>:<tag>
> >>>> - @end table
> >>>> -
> >>>> - Example
> >>>> ---
> >>>> -1.8.1.5
> >>>> -
> >>>> diff --git
> >>>>
> >>>>
> a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
> >>>>
> >>>>
> b/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
> >>>> deleted file mode 100644
> >>>> index d56256e..0000000
> >>>> ---
> >>>>
> >>>>
> a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-back-some-info-in-local-state-.patch
> >>>> +++ /dev/null
> >>>> @@ -1,114 +0,0 @@
> >>>> -From 2cf7df441ce4c36525ba4d2d040f8cb0b0c75f14 Mon Sep 17 00:00:00
> 2001
> >>>> -From: Constantin Musca <constantinx.musca@intel.com>
> >>>> -Date: Fri, 7 Dec 2012 12:33:42 +0200
> >>>> -Subject: [PATCH] Revert "vmware_vga: Add back some info in local
> state
> >>>> - partially reverting aa32b38c"
> >>>> -
> >>>> -- this reverts commit 1f202568e0553b416483e5993f1bde219c22cf72
> >>>> -- do not cache the DS depth (the depth might change)
> >>>> -
> >>>> -Upstream-Status: Pending
> >>>> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> >>>> ----
> >>>> - hw/vmware_vga.c | 30 +++++++++---------------------
> >>>> - 1 file changed, 9 insertions(+), 21 deletions(-)
> >>>> -
> >>>> -diff --git a/hw/vmware_vga.c b/hw/vmware_vga.c
> >>>> -index 834588d..7c766fb 100644
> >>>> ---- a/hw/vmware_vga.c
> >>>> -+++ b/hw/vmware_vga.c
> >>>> -@@ -39,8 +39,6 @@ struct vmsvga_state_s {
> >>>> -     VGACommonState vga;
> >>>> -
> >>>> -     int invalidated;
> >>>> --    int depth;
> >>>> --    int bypp;
> >>>> -     int enable;
> >>>> -     int config;
> >>>> -     struct {
> >>>> -@@ -57,9 +55,6 @@ struct vmsvga_state_s {
> >>>> -     int new_height;
> >>>> -     uint32_t guest;
> >>>> -     uint32_t svgaid;
> >>>> --    uint32_t wred;
> >>>> --    uint32_t wgreen;
> >>>> --    uint32_t wblue;
> >>>> -     int syncing;
> >>>> -
> >>>> -     MemoryRegion fifo_ram;
> >>>> -@@ -723,25 +718,25 @@ static uint32_t vmsvga_value_read(void *opaque,
> >>>> uint32_t address)
> >>>> -         return SVGA_MAX_HEIGHT;
> >>>> -
> >>>> -     case SVGA_REG_DEPTH:
> >>>> --        return s->depth;
> >>>> -+        return ds_get_depth(s->vga.ds);
> >>>> -
> >>>> -     case SVGA_REG_BITS_PER_PIXEL:
> >>>> --        return (s->depth + 7) & ~7;
> >>>> -+        return ds_get_bits_per_pixel(s->vga.ds);
> >>>> -
> >>>> -     case SVGA_REG_PSEUDOCOLOR:
> >>>> -         return 0x0;
> >>>> -
> >>>> -     case SVGA_REG_RED_MASK:
> >>>> --        return s->wred;
> >>>> -+        return ds_get_rmask(s->vga.ds);
> >>>> -
> >>>> -     case SVGA_REG_GREEN_MASK:
> >>>> --        return s->wgreen;
> >>>> -+        return ds_get_gmask(s->vga.ds);
> >>>> -
> >>>> -     case SVGA_REG_BLUE_MASK:
> >>>> --        return s->wblue;
> >>>> -+        return ds_get_bmask(s->vga.ds);
> >>>> -
> >>>> -     case SVGA_REG_BYTES_PER_LINE:
> >>>> --        return s->bypp * s->new_width;
> >>>> -+        return ds_get_bytes_per_pixel(s->vga.ds) * s->new_width;
> >>>> -
> >>>> -     case SVGA_REG_FB_START: {
> >>>> -         struct pci_vmsvga_state_s *pci_vmsvga
> >>>> -@@ -806,7 +801,7 @@ static uint32_t vmsvga_value_read(void *opaque,
> >>>> uint32_t address)
> >>>> -         return s->cursor.on;
> >>>> -
> >>>> -     case SVGA_REG_HOST_BITS_PER_PIXEL:
> >>>> --        return (s->depth + 7) & ~7;
> >>>> -+        return ds_get_bits_per_pixel(s->vga.ds);
> >>>> -
> >>>> -     case SVGA_REG_SCRATCH_SIZE:
> >>>> -         return s->scratch_size;
> >>>> -@@ -869,7 +864,7 @@ static void vmsvga_value_write(void *opaque,
> >>>> uint32_t
> >>>> address, uint32_t value)
> >>>> -         break;
> >>>> -
> >>>> -     case SVGA_REG_BITS_PER_PIXEL:
> >>>> --        if (value != s->depth) {
> >>>> -+        if (value != ds_get_bits_per_pixel(s->vga.ds)) {
> >>>> -             printf("%s: Bad bits per pixel: %i bits\n", __func__,
> >>>> value);
> >>>> -             s->config = 0;
> >>>> -         }
> >>>> -@@ -1089,7 +1084,7 @@ static const VMStateDescription
> >>>> vmstate_vmware_vga_internal = {
> >>>> -     .minimum_version_id_old = 0,
> >>>> -     .post_load = vmsvga_post_load,
> >>>> -     .fields      = (VMStateField[]) {
> >>>> --        VMSTATE_INT32_EQUAL(depth, struct vmsvga_state_s),
> >>>> -+        VMSTATE_UNUSED(4), /* was depth */
> >>>> -         VMSTATE_INT32(enable, struct vmsvga_state_s),
> >>>> -         VMSTATE_INT32(config, struct vmsvga_state_s),
> >>>> -         VMSTATE_INT32(cursor.id, struct vmsvga_state_s),
> >>>> -@@ -1142,13 +1137,6 @@ static void vmsvga_init(struct vmsvga_state_s
> >>>> *s,
> >>>> -     vga_common_init(&s->vga);
> >>>> -     vga_init(&s->vga, address_space, io, true);
> >>>> -     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
> >>>> --    /* Save some values here in case they are changed later.
> >>>> --     * This is suspicious and needs more though why it is needed. */
> >>>> --    s->depth = ds_get_bits_per_pixel(s->vga.ds);
> >>>> --    s->bypp = ds_get_bytes_per_pixel(s->vga.ds);
> >>>> --    s->wred = ds_get_rmask(s->vga.ds);
> >>>> --    s->wgreen = ds_get_gmask(s->vga.ds);
> >>>> --    s->wblue = ds_get_bmask(s->vga.ds);
> >>>> - }
> >>>> -
> >>>> - static uint64_t vmsvga_io_read(void *opaque, hwaddr addr, unsigned
> >>>> size)
> >>>> ---
> >>>> -1.7.11.7
> >>>> -
> >>>> diff --git a/meta/recipes-devtools/qemu/files/arm-bgr.patch
> >>>> b/meta/recipes-devtools/qemu/files/arm-bgr.patch
> >>>> deleted file mode 100644
> >>>> index f3ebde6..0000000
> >>>> --- a/meta/recipes-devtools/qemu/files/arm-bgr.patch
> >>>> +++ /dev/null
> >>>> @@ -1,30 +0,0 @@
> >>>> -After kernel commit:
> >>>> -
> >>>>
> >>>>
> >>>> -
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.0/commit/?h=meta&id=9728c1b6a724daefc413b44e10253cdbb5e06d08
> >>>> -
> >>>> -It appears that the emulated colours in qemu are incorrect and that
> >>>> -the red and blue channels are reversed. This patch reverses that
> logic
> >>>> -so the colours are correctly displayed on the versatile platform
> which
> >>>> -doesn't support the BGR bit.
> >>>> -
> >>>> -RP 16/9/2011
> >>>> -
> >>>> -Upstream-Status: Pending
> >>>> -
> >>>> -Index: qemu-1.2.0/hw/pl110.c
> >>>> -===================================================================
> >>>> ---- qemu-1.2.0.orig/hw/pl110.c 2012-09-06 14:07:27.619821133 -0700
> >>>> -+++ qemu-1.2.0/hw/pl110.c      2012-09-06 14:12:07.699829648 -0700
> >>>> -@@ -168,7 +168,11 @@
> >>>> -         fprintf(stderr, "pl110: Bad color depth\n");
> >>>> -         exit(1);
> >>>> -     }
> >>>> --    if (s->cr & PL110_CR_BGR)
> >>>> -+
> >>>> -+    if (s->version && s->bpp == BPP_16)
> >>>> -+        /* Code assumes BPP_16 == 565 and BGR is never set on the
> >>>> versatile in 565 mode */
> >>>> -+        bpp_offset = 0;
> >>>> -+    else if (s->cr & PL110_CR_BGR)
> >>>> -         bpp_offset = 0;
> >>>> -     else
> >>>> -         bpp_offset = 24;
> >>>> diff --git
> >>>>
> a/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
> >>>>
> b/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
> >>>> deleted file mode 100644
> >>>> index 2075386..0000000
> >>>> ---
> >>>>
> a/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min_addr.patch
> >>>> +++ /dev/null
> >>>> @@ -1,39 +0,0 @@
> >>>> -From c313f89c33217ac0e471554dace2144718f86669 Mon Sep 17 00:00:00
> 2001
> >>>> -From: Martin Jansa <Martin.Jansa@gmail.com>
> >>>> -Date: Thu, 13 May 2010 12:23:40 +0200
> >>>> -Subject: [PATCH] linux-user: use default mmap_min_addr 65536 when
> >>>> /proc/sys/vm/mmap_min_addr cannot be read
> >>>> -
> >>>> -* 65536 is default at least for ubuntu and fedora.
> >>>> ----
> >>>> - linux-user/main.c |    5 +++++
> >>>> - 1 files changed, 5 insertions(+), 0 deletions(-)
> >>>> -
> >>>> -Upstream-Status: Pending
> >>>> -
> >>>> -Index: qemu-0.14.0/linux-user/main.c
> >>>> -===================================================================
> >>>> ---- qemu-0.14.0.orig/linux-user/main.c
> >>>> -+++ qemu-0.14.0/linux-user/main.c
> >>>> -@@ -36,6 +36,7 @@
> >>>> - #include "envlist.h"
> >>>> -
> >>>> - #define DEBUG_LOGFILE "/tmp/qemu.log"
> >>>> -+#define MMAP_MIN_ADDR_DEFAULT 65536
> >>>> -
> >>>> - char *exec_path;
> >>>> -
> >>>> -@@ -3010,8 +3011,14 @@ int main(int argc, char **argv, char **e
> >>>> -             if (fscanf(fp, "%lu", &tmp) == 1) {
> >>>> -                 mmap_min_addr = tmp;
> >>>> -                 qemu_log("host mmap_min_addr=0x%lx\n",
> mmap_min_addr);
> >>>> -+            } else {
> >>>> -+                qemu_log("cannot read value from
> >>>> /proc/sys/vm/mmap_min_addr, assuming %d\n", MMAP_MIN_ADDR_DEFAULT);
> >>>> -+                mmap_min_addr = MMAP_MIN_ADDR_DEFAULT;
> >>>> -             }
> >>>> -             fclose(fp);
> >>>> -+        } else {
> >>>> -+            qemu_log("cannot open /proc/sys/vm/mmap_min_addr for
> >>>> reading, assuming %d\n", MMAP_MIN_ADDR_DEFAULT);
> >>>> -+            mmap_min_addr = MMAP_MIN_ADDR_DEFAULT;
> >>>> -         }
> >>>> -     }
> >>>> -
> >>>> diff --git a/meta/recipes-devtools/qemu/files/linker-flags.patch
> >>>> b/meta/recipes-devtools/qemu/files/linker-flags.patch
> >>>> deleted file mode 100644
> >>>> index 0106ae2..0000000
> >>>> --- a/meta/recipes-devtools/qemu/files/linker-flags.patch
> >>>> +++ /dev/null
> >>>> @@ -1,25 +0,0 @@
> >>>> -Fedora 13 switched the default behaviour of the linker to no longer
> >>>> -indirectly link to required libraries (i.e. dependencies of a library
> >>>> -already linked to). Therefore we need to explicitly pass the depended
> >>>> on
> >>>> -libraries into the linker for building to work on Fedora 13.
> >>>> -
> >>>> -More information is available on the Fedora Wiki:
> >>>> -https://fedoraproject.org/wiki/UnderstandingDSOLinkChange
> >>>> -
> >>>> -JL - 15/06/10
> >>>> -
> >>>> -Upstream-Status: Inappropriate [configuration]
> >>>> -
> >>>> -Index: qemu-1.2.0/Makefile.target
> >>>> -===================================================================
> >>>> ---- qemu-1.2.0.orig/Makefile.target    2012-09-05 07:03:06.000000000
> >>>> -0700
> >>>> -+++ qemu-1.2.0/Makefile.target 2012-09-06 13:42:24.819764288 -0700
> >>>> -@@ -130,7 +130,7 @@
> >>>> - obj-$(CONFIG_HAVE_CORE_DUMP) += dump.o
> >>>> - obj-$(CONFIG_NO_GET_MEMORY_MAPPING) += memory_mapping-stub.o
> >>>> - obj-$(CONFIG_NO_CORE_DUMP) += dump-stub.o
> >>>> --LIBS+=-lz
> >>>> -+LIBS+=-lz -lX11 -ldl
> >>>> -
> >>>> - QEMU_CFLAGS += $(VNC_TLS_CFLAGS)
> >>>> - QEMU_CFLAGS += $(VNC_SASL_CFLAGS)
> >>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> >>>> b/meta/recipes-devtools/qemu/qemu.inc
> >>>> index 0a7dc4e..7caef6e 100644
> >>>> --- a/meta/recipes-devtools/qemu/qemu.inc
> >>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
> >>>> @@ -20,13 +20,8 @@ SDL_class-nativesdk ?= ""
> >>>>    SRC_URI = "\
> >>>>        file://powerpc_rom.bin \
> >>>>        file://no-strip.patch \
> >>>> -    file://linker-flags.patch \
> >>>>        file://fix-configure-checks.patch \
> >>>> -    file://fallback-to-safe-mmap_min_addr.patch \
> >>>>        file://larger_default_ram_size.patch \
> >>>> -    file://arm-bgr.patch \
> >>>> -
>  file://Revert-vmware_vga-Add-back-some-info-in-local-state-.patch \
> >>>> -
>  file://0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patch
> >>>> \
> >>>>        "
> >>>>
> >>>>    SRC_URI_append_class-nativesdk = "\
> >>>> @@ -37,7 +32,7 @@ SRC_URI_append_class-native = "\
> >>>>        file://fix-libcap-header-issue-on-some-distro.patch \
> >>>>        "
> >>>>
> >>>> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)}
> >>>> --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa
> >>>> --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg
> >>>> --disable-bluez --with-system-pixman"
> >>>> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)}
> >>>> --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa
> >>>> --disable-curl
> >>>> --disable-vnc-jpeg --disable-bluez --with-system-pixman"
> >>>>
> >>>>    EXTRA_OECONF_class-nativesdk =
> >>>> "--target-list=${@get_qemu_target_list(d)} --disable-werror
> >>>> --disable-vnc-tls \
> >>>>                                  --disable-curl \
> >>>> diff --git a/meta/recipes-devtools/qemu/qemu_1.4.1.bb
> >>>> b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
> >>>> similarity index 67%
> >>>> rename from meta/recipes-devtools/qemu/qemu_1.4.1.bb
> >>>> rename to meta/recipes-devtools/qemu/qemu_1.5.0.bb
> >>>> index f59d28a..2ea4f12 100644
> >>>> --- a/meta/recipes-devtools/qemu/qemu_1.4.1.bb
> >>>> +++ b/meta/recipes-devtools/qemu/qemu_1.5.0.bb
> >>>> @@ -6,5 +6,5 @@ LIC_FILES_CHKSUM =
> >>>> "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
> >>>>    SRC_URI += "file://fdt_header.patch"
> >>>>
> >>>>    SRC_URI_prepend = "
> http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
> >>>> -SRC_URI[md5sum] = "eb2d696956324722b5ecfa46e41f9a75"
> >>>> -SRC_URI[sha256sum] =
> >>>> "75063a9326221607de3599e89fb5af80f2d8080ddc55ca253fff113843432df1"
> >>>> +SRC_URI[md5sum] = "b6f3265b8ed39d77e8f354f35cc26e16"
> >>>> +SRC_URI[sha256sum] =
> >>>> "b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b909646bcf0b4867bb"
> >>>>
> >>>
> >>
> >>
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d041825ac2111d404dee7f823
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It also segfaults when building emacs for x86* architectur=
e, so let&#39;s see if it gets also fixed by 1.5</div><div class=3D"gmail_e=
xtra"><br><br><div class=3D"gmail_quote">On Tue, Jun 11, 2013 at 11:33 PM, =
Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On T=
ue, Jun 11, 2013 at 7:27 AM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.inte=
l.com">sgw@linux.intel.com</a>&gt; wrote:<br>

&gt; On 06/10/2013 04:37 AM, Riku Voipio wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 6 June 2013 16:54, Saul Wold &lt;<a href=3D"mailto:sgw@linux.in=
tel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 06/06/2013 05:08 AM, Riku Voipio wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Patches removed:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; 0001-doc-Fix-texinfo-table-markup-in-qemu-options.hx.patch=
<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0- applied<br>
&gt;&gt;&gt;&gt; 0002-docs-Fix-generating-qemu-doc.html-with-texinfo-5.patc=
h<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0- fixed different upstream<br>
&gt;&gt;&gt;&gt; Revert-vmware_vga-Add-back-some-info-in-local-state-.patch=
<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0- fixed different upstream<br>
&gt;&gt;&gt;&gt; arm-bgr.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0- this should be also fixed upstream, if stil=
l issue please resend.<br>
&gt;&gt;&gt;&gt; fallback-to-safe-mmap_min_addr.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0- this should be also fixed upstream, if stil=
l issue please resend.<br>
&gt;&gt;&gt;&gt; linker-flags.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0- unneeded with makefile changes<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; from configure the obsolete --audio-cards-list option has =
been removed.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; Please describe how this was tested, as Qemu is a core part of=
 OE-core we<br>
&gt;&gt;&gt; have seen past failures on version updates. =C2=A0It&#39;s imp=
ortant to do<br>
&gt;&gt;&gt; multi-architecture builds and execution with graphics.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; Also will it build target binaries (for example the build appl=
iance uses<br>
&gt;&gt;&gt; qemu on the target) we have seen failures there also on update=
s.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve only tested building ARMv5 and ARMv7 systemd-gnome-images=
 (which<br>
&gt;&gt; use qemu-native at some point of build. I just tested also buildin=
g<br>
&gt;&gt; qemu for arm target and it builds fine. Differences between 1.4.1 =
and<br>
&gt;&gt; 1.5 in upstream are not that major that they should cause breakage=
 in<br>
&gt;&gt; typical usecases. Setting IMAGETEST=3D&quot;qemu&quot; did start q=
emu but the<br>
&gt;&gt; image didn&#39;t start. That however didn&#39;t work with 1.4.1 ei=
ther.<br>
&gt;&gt;<br>
&gt;<br>
&gt; It really needs to be tested on more ARCHs other than ARM.<br>
&gt;<br>
&gt; What kind of failure do you see with IMAGETEST, this works as we use i=
t all<br>
&gt; the time for the Autobuilder Sanity Testing.<br>
&gt;<br>
<br>
</div></div>FWIW, I have tested this patch by booting angstrom/systemd-imag=
e on<br>
qemuarm/qemumips/qemumips64/qemuppc/<br>
qemux86/qemux86-6 without a problem.<br>
<br>
Secondly there is a qemu segmentation fault with 1.4.1 qemu when<br>
trying to emulate mips64 is now fixed with 1.5<br>
so thats an improvement.<br>
<br>
Tested-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmai=
l.com</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; Sau!<br>
&gt;<br>
&gt;<br>
&gt;&gt; Riku<br>
&gt;&gt;<br>
&gt;&gt;&gt; Thanks<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sau!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0...x-texinfo-table-markup-in-qemu-options.hx.=
patch | =C2=A0213<br>
&gt;&gt;&gt;&gt; --------------------<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0...x-generating-qemu-doc.html-with-texinfo-5.=
patch | =C2=A0 54 -----<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0...re_vga-Add-back-some-info-in-local-state-.=
patch | =C2=A0114 -----------<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0meta/recipes-devtools/qemu/files/arm-bgr.patc=
h =C2=A0 =C2=A0 | =C2=A0 30 ---<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0.../files/fallback-to-safe-mmap_min_addr.patc=
h =C2=A0 =C2=A0 | =C2=A0 39 ----<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0.../recipes-devtools/qemu/files/linker-flags.=
patch | =C2=A0 25 ---<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0meta/recipes-devtools/qemu/qemu.inc =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A07 +-<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0.../qemu/{<a href=3D"http://qemu_1.4.1.bb" ta=
rget=3D"_blank">qemu_1.4.1.bb</a> =3D&gt; <a href=3D"http://qemu_1.5.0.bb" =
target=3D"_blank">qemu_1.5.0.bb</a>} =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A04 +-<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A08 files changed, 3 insertions(+), 483 deletio=
ns(-)<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-tabl=
e-markup-in-qemu-options.hx.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; meta/recipes-devtools/qemu/files/0002-docs-Fix-generating-=
qemu-doc.html-with-texinfo-5.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-bac=
k-some-info-in-local-state-.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0delete mode 100644 meta/recipes-devtools/qemu=
/files/arm-bgr.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt; meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_min=
_addr.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0delete mode 100644<br>
&gt;&gt;&gt;&gt; meta/recipes-devtools/qemu/files/linker-flags.patch<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0rename meta/recipes-devtools/qemu/{<a href=3D=
"http://qemu_1.4.1.bb" target=3D"_blank">qemu_1.4.1.bb</a> =3D&gt; <a href=
=3D"http://qemu_1.5.0.bb" target=3D"_blank">qemu_1.5.0.bb</a>}<br>
&gt;&gt;&gt;&gt; (67%)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; a/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-ta=
ble-markup-in-qemu-options.hx.patch<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; b/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-ta=
ble-markup-in-qemu-options.hx.patch<br>
&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt; index 9435cfe..0000000<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; a/meta/recipes-devtools/qemu/files/0001-doc-Fix-texinfo-ta=
ble-markup-in-qemu-options.hx.patch<br>
&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt; @@ -1,213 +0,0 @@<br>
&gt;&gt;&gt;&gt; -From 9a7146ca91c04d05af36684d8b3ca79c1254abc2 Mon Sep 17 =
00:00:00 2001<br>
&gt;&gt;&gt;&gt; -From: Markus Armbruster &lt;<a href=3D"mailto:armbru@redh=
at.com">armbru@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Date: Wed, 13 Feb 2013 19:49:40 +0100<br>
&gt;&gt;&gt;&gt; -Subject: [PATCH 1/2] doc: Fix texinfo @table markup in qe=
mu-options.hx<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -End tables before headings, start new ones afterwards. =
=C2=A0Fixes<br>
&gt;&gt;&gt;&gt; -incorrect indentation of headings &quot;File system optio=
ns&quot; and &quot;Virtual<br>
&gt;&gt;&gt;&gt; -File system pass-through options&quot; in manual page and=
 qemu-doc.<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Normalize markup some to increase chances it survives fut=
ure edits.<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Upstream-Status: Backport<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.=
Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:ar=
mbru@redhat.com">armbru@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefan=
ha@redhat.com">stefanha@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Message-id: <a href=3D"mailto:1360781383-28635-5-git-send=
-email-armbru@redhat.com">1360781383-28635-5-git-send-email-armbru@redhat.c=
om</a><br>
&gt;&gt;&gt;&gt; -Signed-off-by: Anthony Liguori &lt;<a href=3D"mailto:alig=
uori@us.ibm.com">aliguori@us.ibm.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt; - qemu-options.hx | 56<br>
&gt;&gt;&gt;&gt; +++++++++++++++++++++++++++++++++++++-------------------<b=
r>
&gt;&gt;&gt;&gt; - 1 file changed, 37 insertions(+), 19 deletions(-)<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt;&gt;&gt;&gt; -index 9d7131a..54bd92a 100644<br>
&gt;&gt;&gt;&gt; ---- a/qemu-options.hx<br>
&gt;&gt;&gt;&gt; -+++ b/qemu-options.hx<br>
&gt;&gt;&gt;&gt; -@@ -537,13 +537,15 @@ STEXI<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; --DEF(&quot;usb&quot;, 0, QEMU_OPTION_usb,<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0&quot;-usb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0enable the USB driver (will be the default<br>
&gt;&gt;&gt;&gt; soon)\n&quot;,<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0QEMU_ARCH_ALL)<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; - USB options:<br>
&gt;&gt;&gt;&gt; - @table @option<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -+DEF(&quot;usb&quot;, 0, QEMU_OPTION_usb,<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0&quot;-usb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0enable the USB driver (will be the default<br>
&gt;&gt;&gt;&gt; soon)\n&quot;,<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0QEMU_ARCH_ALL)<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; - @item -usb<br>
&gt;&gt;&gt;&gt; - @findex -usb<br>
&gt;&gt;&gt;&gt; - Enable the USB driver (will be the default soon)<br>
&gt;&gt;&gt;&gt; -@@ -610,9 +612,15 @@ possible drivers and properties, use=
 @code{-device<br>
&gt;&gt;&gt;&gt; help} and<br>
&gt;&gt;&gt;&gt; - @code{-device @var{driver},help}.<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; -+@end table<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; - DEFHEADING()<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEFHEADING(File system options:)<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; -+@table @option<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEF(&quot;fsdev&quot;, HAS_ARG, QEMU_OPTION_fsdev,<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 &quot;-fsdev<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; fsdriver,id=3Did[,path=3Dpath,][security_model=3D{mapped-x=
attr|mapped-file|passthrough|none}]\n&quot;<br>
&gt;&gt;&gt;&gt; -@@ -676,9 +684,15 @@ Specifies the tag name to be used by=
 the guest to<br>
&gt;&gt;&gt;&gt; mount this export point<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; -+@end table<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; - DEFHEADING()<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEFHEADING(Virtual File system pass-through options:)<br=
>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; -+@table @option<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEF(&quot;virtfs&quot;, HAS_ARG, QEMU_OPTION_virtfs,<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 &quot;-virtfs<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; local,path=3Dpath,mount_tag=3Dtag,security_model=3D[mapped=
-xattr|mapped-file|passthrough|none]\n&quot;<br>
&gt;&gt;&gt;&gt; -@@ -769,11 +783,9 @@ ETEXI<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - DEFHEADING()<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEFHEADING(Display options:)<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; - @table @option<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; -@@ -1215,7 +1227,6 @@ ETEXI<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - ARCHHEADING(, QEMU_ARCH_I386)<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - ARCHHEADING(i386 target only:, QEMU_ARCH_I386)<br>
&gt;&gt;&gt;&gt; -@@ -1301,10 +1312,10 @@ Specify SMBIOS type 0 fields<br>
&gt;&gt;&gt;&gt; - Specify SMBIOS type 1 fields<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; --DEFHEADING()<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; -+DEFHEADING()<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEFHEADING(Network options:)<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; -@@ -1718,13 +1729,19 @@ libpcap, so it can be analyzed wi=
th tools such<br>
&gt;&gt;&gt;&gt; as<br>
&gt;&gt;&gt;&gt; tcpdump or Wireshark.<br>
&gt;&gt;&gt;&gt; - Indicate that no network devices should be configured. I=
t is used to<br>
&gt;&gt;&gt;&gt; - override the default configuration (@option{-net nic -ne=
t user}) which<br>
&gt;&gt;&gt;&gt; - is activated if no @option{-net} options are provided.<b=
r>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - DEFHEADING()<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEFHEADING(Character device options:)<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt; -+The general form of a character device option is:<br>
&gt;&gt;&gt;&gt; -+@table @option<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEF(&quot;chardev&quot;, HAS_ARG, QEMU_OPTION_chardev,<b=
r>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 &quot;-chardev null,id=3Did[,mux=3Don|off]=
\n&quot;<br>
&gt;&gt;&gt;&gt; -@@ -1766,10 +1783,6 @@ DEF(&quot;chardev&quot;, HAS_ARG, =
QEMU_OPTION_chardev,<br>
&gt;&gt;&gt;&gt; - )<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; --The general form of a character device option is:<br>
&gt;&gt;&gt;&gt; --@table @option<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - @item -chardev @var{backend} ,id=3D@var{id} [,mux=3Don|o=
ff]<br>
&gt;&gt;&gt;&gt; [,@var{options}]<br>
&gt;&gt;&gt;&gt; - @findex -chardev<br>
&gt;&gt;&gt;&gt; - Backend is one of:<br>
&gt;&gt;&gt;&gt; -@@ -1990,14 +2003,15 @@ Connect to a spice virtual machin=
e channel,<br>
&gt;&gt;&gt;&gt; such<br>
&gt;&gt;&gt;&gt; as vdiport.<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - Connect to a spice port, allowing a Spice client to hand=
le the traffic<br>
&gt;&gt;&gt;&gt; - identified by a name (preferably a fqdn).<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - DEFHEADING()<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; --STEXI<br>
&gt;&gt;&gt;&gt; - DEFHEADING(Device URL Syntax:)<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - In addition to using normal file images for the emulated=
 storage<br>
&gt;&gt;&gt;&gt; devices,<br>
&gt;&gt;&gt;&gt; - QEMU can also use networked resources such as iSCSI devi=
ces. These are<br>
&gt;&gt;&gt;&gt; -@@ -2113,10 +2127,16 @@ qemu-system-x86_84 --drive<br>
&gt;&gt;&gt;&gt; file=3Dgluster://<a href=3D"http://192.0.2.1/testvol/a.img=
" target=3D"_blank">192.0.2.1/testvol/a.img</a><br>
&gt;&gt;&gt;&gt; - @end example<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - See also @url{<a href=3D"http://www.gluster.org" target=
=3D"_blank">http://www.gluster.org</a>}.<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEFHEADING(Bluetooth(R) options:)<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; -+@table @option<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEF(&quot;bt&quot;, HAS_ARG, QEMU_OPTION_bt, \<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 &quot;-bt hci,null =C2=A0 =C2=A0dumb bluet=
ooth HCI - doesn&#39;t respond to<br>
&gt;&gt;&gt;&gt; commands\n&quot;<br>
&gt;&gt;&gt;&gt; \<br>
&gt;&gt;&gt;&gt; -@@ -2130,8 +2150,6 @@ DEF(&quot;bt&quot;, HAS_ARG, QEMU_O=
PTION_bt, \<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 &quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0emulate a bluetooth device &#39;dev&#39; in scatternet<=
br>
&gt;&gt;&gt;&gt; &#39;n&#39;\n&quot;,<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 QEMU_ARCH_ALL)<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; --@table @option<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - @item -bt hci[...]<br>
&gt;&gt;&gt;&gt; - @findex -bt<br>
&gt;&gt;&gt;&gt; - Defines the function of the corresponding Bluetooth HCI.=
 =C2=A0-bt options<br>
&gt;&gt;&gt;&gt; -@@ -2183,9 +2201,11 @@ currently:<br>
&gt;&gt;&gt;&gt; - @item keyboard<br>
&gt;&gt;&gt;&gt; - Virtual wireless keyboard implementing the HIDP bluetoot=
h profile.<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; --@end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -+STEXI<br>
&gt;&gt;&gt;&gt; -+@end table<br>
&gt;&gt;&gt;&gt; -+ETEXI<br>
&gt;&gt;&gt;&gt; - DEFHEADING()<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEFHEADING(Linux/Multiboot boot specific:)<br>
&gt;&gt;&gt;&gt; -@@ -2242,11 +2262,9 @@ ETEXI<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - DEFHEADING()<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - DEFHEADING(Debug/Expert options:)<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; - STEXI<br>
&gt;&gt;&gt;&gt; - @table @option<br>
&gt;&gt;&gt;&gt; - ETEXI<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; -1.8.1.5<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; a/meta/recipes-devtools/qemu/files/0002-docs-Fix-generatin=
g-qemu-doc.html-with-texinfo-5.patch<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; b/meta/recipes-devtools/qemu/files/0002-docs-Fix-generatin=
g-qemu-doc.html-with-texinfo-5.patch<br>
&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt; index cabbf0e..0000000<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; a/meta/recipes-devtools/qemu/files/0002-docs-Fix-generatin=
g-qemu-doc.html-with-texinfo-5.patch<br>
&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt; @@ -1,54 +0,0 @@<br>
&gt;&gt;&gt;&gt; -From f983d4978e1c49ee936ad52bf2de0c531420f5f8 Mon Sep 17 =
00:00:00 2001<br>
&gt;&gt;&gt;&gt; -From: Cole Robinson &lt;<a href=3D"mailto:crobinso@redhat=
.com">crobinso@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Date: Wed, 20 Feb 2013 07:20:31 +0000<br>
&gt;&gt;&gt;&gt; -Subject: [PATCH 2/2] docs: Fix generating qemu-doc.html w=
ith texinfo 5<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -LC_ALL=3DC makeinfo --no-headers --no-split --number-sect=
ions --html<br>
&gt;&gt;&gt;&gt; qemu-doc.texi -o qemu-doc.html<br>
&gt;&gt;&gt;&gt; -./qemu-options.texi:1521: unknown command `list&#39;<br>
&gt;&gt;&gt;&gt; -./qemu-options.texi:1521: table requires an argument: the=
 formatter for<br>
&gt;&gt;&gt;&gt; @item<br>
&gt;&gt;&gt;&gt; -./qemu-options.texi:1521: warning: @table has text but no=
 @item<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt;&gt;&gt; -<a href=3D"http://patchwork.ozlabs.org/patch/222131/" tar=
get=3D"_blank">http://patchwork.ozlabs.org/patch/222131/</a><br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -CC: <a href=3D"mailto:qemu-stable@nongnu.org">qemu-stable=
@nongnu.org</a><br>
&gt;&gt;&gt;&gt; -Signed-off-by: Cole Robinson &lt;<a href=3D"mailto:crobin=
so@redhat.com">crobinso@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.=
Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armb=
ru@redhat.com">armbru@redhat.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt; - qemu-options.hx | 19 +++++++------------<br>
&gt;&gt;&gt;&gt; - 1 file changed, 7 insertions(+), 12 deletions(-)<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt;&gt;&gt;&gt; -index 54bd92a..5d2d9b8 100644<br>
&gt;&gt;&gt;&gt; ---- a/qemu-options.hx<br>
&gt;&gt;&gt;&gt; -+++ b/qemu-options.hx<br>
&gt;&gt;&gt;&gt; -@@ -2089,18 +2089,13 @@ QEMU supports using either local =
sheepdog<br>
&gt;&gt;&gt;&gt; devices<br>
&gt;&gt;&gt;&gt; or remote networked<br>
&gt;&gt;&gt;&gt; - devices.<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - Syntax for specifying a sheepdog device<br>
&gt;&gt;&gt;&gt; --@table @list<br>
&gt;&gt;&gt;&gt; --``sheepdog:&lt;vdiname&gt;&#39;&#39;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; --``sheepdog:&lt;vdiname&gt;:&lt;snapid&gt;&#39;&#39;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; --``sheepdog:&lt;vdiname&gt;:&lt;tag&gt;&#39;&#39;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; --``sheepdog:&lt;host&gt;:&lt;port&gt;:&lt;vdiname&gt;&#39=
;&#39;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; --``sheepdog:&lt;host&gt;:&lt;port&gt;:&lt;vdiname&gt;:&lt=
;snapid&gt;&#39;&#39;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; --``sheepdog:&lt;host&gt;:&lt;port&gt;:&lt;vdiname&gt;:&lt=
;tag&gt;&#39;&#39;<br>
&gt;&gt;&gt;&gt; -+@table @code<br>
&gt;&gt;&gt;&gt; -+@item sheepdog:&lt;vdiname&gt;<br>
&gt;&gt;&gt;&gt; -+@item sheepdog:&lt;vdiname&gt;:&lt;snapid&gt;<br>
&gt;&gt;&gt;&gt; -+@item sheepdog:&lt;vdiname&gt;:&lt;tag&gt;<br>
&gt;&gt;&gt;&gt; -+@item sheepdog:&lt;host&gt;:&lt;port&gt;:&lt;vdiname&gt;=
<br>
&gt;&gt;&gt;&gt; -+@item sheepdog:&lt;host&gt;:&lt;port&gt;:&lt;vdiname&gt;=
:&lt;snapid&gt;<br>
&gt;&gt;&gt;&gt; -+@item sheepdog:&lt;host&gt;:&lt;port&gt;:&lt;vdiname&gt;=
:&lt;tag&gt;<br>
&gt;&gt;&gt;&gt; - @end table<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - Example<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; -1.8.1.5<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-b=
ack-some-info-in-local-state-.patch<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; b/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-b=
ack-some-info-in-local-state-.patch<br>
&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt; index d56256e..0000000<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; a/meta/recipes-devtools/qemu/files/Revert-vmware_vga-Add-b=
ack-some-info-in-local-state-.patch<br>
&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt; @@ -1,114 +0,0 @@<br>
&gt;&gt;&gt;&gt; -From 2cf7df441ce4c36525ba4d2d040f8cb0b0c75f14 Mon Sep 17 =
00:00:00 2001<br>
&gt;&gt;&gt;&gt; -From: Constantin Musca &lt;<a href=3D"mailto:constantinx.=
musca@intel.com">constantinx.musca@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Date: Fri, 7 Dec 2012 12:33:42 +0200<br>
&gt;&gt;&gt;&gt; -Subject: [PATCH] Revert &quot;vmware_vga: Add back some i=
nfo in local state<br>
&gt;&gt;&gt;&gt; - partially reverting aa32b38c&quot;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -- this reverts commit 1f202568e0553b416483e5993f1bde219c2=
2cf72<br>
&gt;&gt;&gt;&gt; -- do not cache the DS depth (the depth might change)<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt;&gt;&gt; -Signed-off-by: Constantin Musca &lt;<a href=3D"mailto:con=
stantinx.musca@intel.com">constantinx.musca@intel.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt; - hw/vmware_vga.c | 30 +++++++++---------------------<br>
&gt;&gt;&gt;&gt; - 1 file changed, 9 insertions(+), 21 deletions(-)<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -diff --git a/hw/vmware_vga.c b/hw/vmware_vga.c<br>
&gt;&gt;&gt;&gt; -index 834588d..7c766fb 100644<br>
&gt;&gt;&gt;&gt; ---- a/hw/vmware_vga.c<br>
&gt;&gt;&gt;&gt; -+++ b/hw/vmware_vga.c<br>
&gt;&gt;&gt;&gt; -@@ -39,8 +39,6 @@ struct vmsvga_state_s {<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 VGACommonState vga;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 int invalidated;<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0int depth;<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0int bypp;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 int enable;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 int config;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 struct {<br>
&gt;&gt;&gt;&gt; -@@ -57,9 +55,6 @@ struct vmsvga_state_s {<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 int new_height;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 uint32_t guest;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 uint32_t svgaid;<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0uint32_t wred;<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0uint32_t wgreen;<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0uint32_t wblue;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 int syncing;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 MemoryRegion fifo_ram;<br>
&gt;&gt;&gt;&gt; -@@ -723,25 +718,25 @@ static uint32_t vmsvga_value_read(v=
oid *opaque,<br>
&gt;&gt;&gt;&gt; uint32_t address)<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 return SVGA_MAX_HEIGHT;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_DEPTH:<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;depth;<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return ds_get_depth(s-&gt;vg=
a.ds);<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_BITS_PER_PIXEL:<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return (s-&gt;depth + 7) &am=
p; ~7;<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return ds_get_bits_per_pixel=
(s-&gt;vga.ds);<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_PSEUDOCOLOR:<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0x0;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_RED_MASK:<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;wred;<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return ds_get_rmask(s-&gt;vg=
a.ds);<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_GREEN_MASK:<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;wgreen;<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return ds_get_gmask(s-&gt;vg=
a.ds);<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_BLUE_MASK:<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;wblue;<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return ds_get_bmask(s-&gt;vg=
a.ds);<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_BYTES_PER_LINE:<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return s-&gt;bypp * s-&gt;ne=
w_width;<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return ds_get_bytes_per_pixe=
l(s-&gt;vga.ds) * s-&gt;new_width;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_FB_START: {<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pci_vmsvga_state_s *p=
ci_vmsvga<br>
&gt;&gt;&gt;&gt; -@@ -806,7 +801,7 @@ static uint32_t vmsvga_value_read(voi=
d *opaque,<br>
&gt;&gt;&gt;&gt; uint32_t address)<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;cursor.on;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_HOST_BITS_PER_PIXEL:<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return (s-&gt;depth + 7) &am=
p; ~7;<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return ds_get_bits_per_pixel=
(s-&gt;vga.ds);<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_SCRATCH_SIZE:<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s-&gt;scratch_size;<b=
r>
&gt;&gt;&gt;&gt; -@@ -869,7 +864,7 @@ static void vmsvga_value_write(void *=
opaque,<br>
&gt;&gt;&gt;&gt; uint32_t<br>
&gt;&gt;&gt;&gt; address, uint32_t value)<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 case SVGA_REG_BITS_PER_PIXEL:<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value !=3D s-&gt;depth) =
{<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value !=3D ds_get_bits_p=
er_pixel(s-&gt;vga.ds)) {<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%=
s: Bad bits per pixel: %i bits\n&quot;, __func__,<br>
&gt;&gt;&gt;&gt; value);<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;config =
=3D 0;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; -@@ -1089,7 +1084,7 @@ static const VMStateDescription<br>
&gt;&gt;&gt;&gt; vmstate_vmware_vga_internal =3D {<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 .minimum_version_id_old =3D 0,<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 .post_load =3D vmsvga_post_load,<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 .fields =C2=A0 =C2=A0 =C2=A0=3D (VMStateFi=
eld[]) {<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_INT32_EQUAL(depth, s=
truct vmsvga_state_s),<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UNUSED(4), /* was de=
pth */<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_INT32(enable, struct=
 vmsvga_state_s),<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_INT32(config, struct=
 vmsvga_state_s),<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_INT32(<a href=3D"htt=
p://cursor.id" target=3D"_blank">cursor.id</a>, struct vmsvga_state_s),<br>
&gt;&gt;&gt;&gt; -@@ -1142,13 +1137,6 @@ static void vmsvga_init(struct vms=
vga_state_s<br>
&gt;&gt;&gt;&gt; *s,<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 vga_common_init(&amp;s-&gt;vga);<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 vga_init(&amp;s-&gt;vga, address_space, io=
, true);<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 vmstate_register(NULL, 0, &amp;vmstate_vga=
_common, &amp;s-&gt;vga);<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0/* Save some values here in case they are =
changed later.<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0 * This is suspicious and needs more thoug=
h why it is needed. */<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0s-&gt;depth =3D ds_get_bits_per_pixel(s-&g=
t;vga.ds);<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0s-&gt;bypp =3D ds_get_bytes_per_pixel(s-&g=
t;vga.ds);<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0s-&gt;wred =3D ds_get_rmask(s-&gt;vga.ds);=
<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0s-&gt;wgreen =3D ds_get_gmask(s-&gt;vga.ds=
);<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0s-&gt;wblue =3D ds_get_bmask(s-&gt;vga.ds)=
;<br>
&gt;&gt;&gt;&gt; - }<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - static uint64_t vmsvga_io_read(void *opaque, hwaddr addr=
, unsigned<br>
&gt;&gt;&gt;&gt; size)<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; -1.7.11.7<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; diff --git a/meta/recipes-devtools/qemu/files/arm-bgr.patc=
h<br>
&gt;&gt;&gt;&gt; b/meta/recipes-devtools/qemu/files/arm-bgr.patch<br>
&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt; index f3ebde6..0000000<br>
&gt;&gt;&gt;&gt; --- a/meta/recipes-devtools/qemu/files/arm-bgr.patch<br>
&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt; @@ -1,30 +0,0 @@<br>
&gt;&gt;&gt;&gt; -After kernel commit:<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/linu=
x-yocto-3.0/commit/?h=3Dmeta&amp;id=3D9728c1b6a724daefc413b44e10253cdbb5e06=
d08" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/linux-yoct=
o-3.0/commit/?h=3Dmeta&amp;id=3D9728c1b6a724daefc413b44e10253cdbb5e06d08</a=
><br>

&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -It appears that the emulated colours in qemu are incorrec=
t and that<br>
&gt;&gt;&gt;&gt; -the red and blue channels are reversed. This patch revers=
es that logic<br>
&gt;&gt;&gt;&gt; -so the colours are correctly displayed on the versatile p=
latform which<br>
&gt;&gt;&gt;&gt; -doesn&#39;t support the BGR bit.<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -RP 16/9/2011<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Index: qemu-1.2.0/hw/pl110.c<br>
&gt;&gt;&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;&gt;&gt; ---- qemu-1.2.0.orig/hw/pl110.c 2012-09-06 14:07:27.619821=
133 -0700<br>
&gt;&gt;&gt;&gt; -+++ qemu-1.2.0/hw/pl110.c =C2=A0 =C2=A0 =C2=A02012-09-06 =
14:12:07.699829648 -0700<br>
&gt;&gt;&gt;&gt; -@@ -168,7 +168,11 @@<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;pl110:=
 Bad color depth\n&quot;);<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; -- =C2=A0 =C2=A0if (s-&gt;cr &amp; PL110_CR_BGR)<br>
&gt;&gt;&gt;&gt; -+<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0if (s-&gt;version &amp;&amp; s-&gt;bpp =3D=
=3D BPP_16)<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Code assumes BPP_16 =3D=
=3D 565 and BGR is never set on the<br>
&gt;&gt;&gt;&gt; versatile in 565 mode */<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bpp_offset =3D 0;<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0else if (s-&gt;cr &amp; PL110_CR_BGR)<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpp_offset =3D 0;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 else<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpp_offset =3D 24;<br>
&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt; a/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_m=
in_addr.patch<br>
&gt;&gt;&gt;&gt; b/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_m=
in_addr.patch<br>
&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt; index 2075386..0000000<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt; a/meta/recipes-devtools/qemu/files/fallback-to-safe-mmap_m=
in_addr.patch<br>
&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt; @@ -1,39 +0,0 @@<br>
&gt;&gt;&gt;&gt; -From c313f89c33217ac0e471554dace2144718f86669 Mon Sep 17 =
00:00:00 2001<br>
&gt;&gt;&gt;&gt; -From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gma=
il.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; -Date: Thu, 13 May 2010 12:23:40 +0200<br>
&gt;&gt;&gt;&gt; -Subject: [PATCH] linux-user: use default mmap_min_addr 65=
536 when<br>
&gt;&gt;&gt;&gt; /proc/sys/vm/mmap_min_addr cannot be read<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -* 65536 is default at least for ubuntu and fedora.<br>
&gt;&gt;&gt;&gt; ----<br>
&gt;&gt;&gt;&gt; - linux-user/main.c | =C2=A0 =C2=A05 +++++<br>
&gt;&gt;&gt;&gt; - 1 files changed, 5 insertions(+), 0 deletions(-)<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Upstream-Status: Pending<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Index: qemu-0.14.0/linux-user/main.c<br>
&gt;&gt;&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;&gt;&gt; ---- qemu-0.14.0.orig/linux-user/main.c<br>
&gt;&gt;&gt;&gt; -+++ qemu-0.14.0/linux-user/main.c<br>
&gt;&gt;&gt;&gt; -@@ -36,6 +36,7 @@<br>
&gt;&gt;&gt;&gt; - #include &quot;envlist.h&quot;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - #define DEBUG_LOGFILE &quot;/tmp/qemu.log&quot;<br>
&gt;&gt;&gt;&gt; -+#define MMAP_MIN_ADDR_DEFAULT 65536<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - char *exec_path;<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -@@ -3010,8 +3011,14 @@ int main(int argc, char **argv, ch=
ar **e<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fscanf(fp,=
 &quot;%lu&quot;, &amp;tmp) =3D=3D 1) {<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
mmap_min_addr =3D tmp;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
qemu_log(&quot;host mmap_min_addr=3D0x%lx\n&quot;, mmap_min_addr);<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
qemu_log(&quot;cannot read value from<br>
&gt;&gt;&gt;&gt; /proc/sys/vm/mmap_min_addr, assuming %d\n&quot;, MMAP_MIN_=
ADDR_DEFAULT);<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
mmap_min_addr =3D MMAP_MIN_ADDR_DEFAULT;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(fp);<br=
>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot=
;cannot open /proc/sys/vm/mmap_min_addr for<br>
&gt;&gt;&gt;&gt; reading, assuming %d\n&quot;, MMAP_MIN_ADDR_DEFAULT);<br>
&gt;&gt;&gt;&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmap_min_addr =
=3D MMAP_MIN_ADDR_DEFAULT;<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; diff --git a/meta/recipes-devtools/qemu/files/linker-flags=
.patch<br>
&gt;&gt;&gt;&gt; b/meta/recipes-devtools/qemu/files/linker-flags.patch<br>
&gt;&gt;&gt;&gt; deleted file mode 100644<br>
&gt;&gt;&gt;&gt; index 0106ae2..0000000<br>
&gt;&gt;&gt;&gt; --- a/meta/recipes-devtools/qemu/files/linker-flags.patch<=
br>
&gt;&gt;&gt;&gt; +++ /dev/null<br>
&gt;&gt;&gt;&gt; @@ -1,25 +0,0 @@<br>
&gt;&gt;&gt;&gt; -Fedora 13 switched the default behaviour of the linker to=
 no longer<br>
&gt;&gt;&gt;&gt; -indirectly link to required libraries (i.e. dependencies =
of a library<br>
&gt;&gt;&gt;&gt; -already linked to). Therefore we need to explicitly pass =
the depended<br>
&gt;&gt;&gt;&gt; on<br>
&gt;&gt;&gt;&gt; -libraries into the linker for building to work on Fedora =
13.<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -More information is available on the Fedora Wiki:<br>
&gt;&gt;&gt;&gt; -<a href=3D"https://fedoraproject.org/wiki/UnderstandingDS=
OLinkChange" target=3D"_blank">https://fedoraproject.org/wiki/Understanding=
DSOLinkChange</a><br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -JL - 15/06/10<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Upstream-Status: Inappropriate [configuration]<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -Index: qemu-1.2.0/Makefile.target<br>
&gt;&gt;&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt;&gt;&gt; ---- qemu-1.2.0.orig/Makefile.target =C2=A0 =C2=A02012-09-=
05 07:03:06.000000000<br>
&gt;&gt;&gt;&gt; -0700<br>
&gt;&gt;&gt;&gt; -+++ qemu-1.2.0/Makefile.target 2012-09-06 13:42:24.819764=
288 -0700<br>
&gt;&gt;&gt;&gt; -@@ -130,7 +130,7 @@<br>
&gt;&gt;&gt;&gt; - obj-$(CONFIG_HAVE_CORE_DUMP) +=3D dump.o<br>
&gt;&gt;&gt;&gt; - obj-$(CONFIG_NO_GET_MEMORY_MAPPING) +=3D memory_mapping-=
stub.o<br>
&gt;&gt;&gt;&gt; - obj-$(CONFIG_NO_CORE_DUMP) +=3D dump-stub.o<br>
&gt;&gt;&gt;&gt; --LIBS+=3D-lz<br>
&gt;&gt;&gt;&gt; -+LIBS+=3D-lz -lX11 -ldl<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; - QEMU_CFLAGS +=3D $(VNC_TLS_CFLAGS)<br>
&gt;&gt;&gt;&gt; - QEMU_CFLAGS +=3D $(VNC_SASL_CFLAGS)<br>
&gt;&gt;&gt;&gt; diff --git a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt;&gt;&gt;&gt; b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt;&gt;&gt;&gt; index 0a7dc4e..7caef6e 100644<br>
&gt;&gt;&gt;&gt; --- a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt;&gt;&gt;&gt; +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt;&gt;&gt;&gt; @@ -20,13 +20,8 @@ SDL_class-nativesdk ?=3D &quot;&quot;<b=
r>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0SRC_URI =3D &quot;\<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://powerpc_rom.bin \<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://no-strip.patch \<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0file://linker-flags.patch \<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-configure-checks.pat=
ch \<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0file://fallback-to-safe-mmap_min_addr.patch=
 \<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://larger_default_ram_size.=
patch \<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0file://arm-bgr.patch \<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0file://Revert-vmware_vga-Add-back-some-info=
-in-local-state-.patch \<br>
&gt;&gt;&gt;&gt; - =C2=A0 =C2=A0file://0002-docs-Fix-generating-qemu-doc.ht=
ml-with-texinfo-5.patch<br>
&gt;&gt;&gt;&gt; \<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0SRC_URI_append_class-nativesdk =3D &quot;\<br=
>
&gt;&gt;&gt;&gt; @@ -37,7 +32,7 @@ SRC_URI_append_class-native =3D &quot;\<=
br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-libcap-header-issue-=
on-some-distro.patch \<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; -EXTRA_OECONF +=3D &quot;--target-list=3D${@get_qemu_targe=
t_list(d)}<br>
&gt;&gt;&gt;&gt; --disable-werror --disable-vnc-tls --audio-drv-list=3Doss,=
alsa<br>
&gt;&gt;&gt;&gt; --audio-card-list=3Dac97,es1370 ${SDL} --disable-curl --di=
sable-vnc-jpeg<br>
&gt;&gt;&gt;&gt; --disable-bluez --with-system-pixman&quot;<br>
&gt;&gt;&gt;&gt; +EXTRA_OECONF +=3D &quot;--target-list=3D${@get_qemu_targe=
t_list(d)}<br>
&gt;&gt;&gt;&gt; --disable-werror --disable-vnc-tls --audio-drv-list=3Doss,=
alsa<br>
&gt;&gt;&gt;&gt; --disable-curl<br>
&gt;&gt;&gt;&gt; --disable-vnc-jpeg --disable-bluez --with-system-pixman&qu=
ot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0EXTRA_OECONF_class-nativesdk =3D<br>
&gt;&gt;&gt;&gt; &quot;--target-list=3D${@get_qemu_target_list(d)} --disabl=
e-werror<br>
&gt;&gt;&gt;&gt; --disable-vnc-tls \<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-cur=
l \<br>
&gt;&gt;&gt;&gt; diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://=
qemu_1.4.1.bb" target=3D"_blank">qemu_1.4.1.bb</a><br>
&gt;&gt;&gt;&gt; b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.5.0.=
bb" target=3D"_blank">qemu_1.5.0.bb</a><br>
&gt;&gt;&gt;&gt; similarity index 67%<br>
&gt;&gt;&gt;&gt; rename from meta/recipes-devtools/qemu/<a href=3D"http://q=
emu_1.4.1.bb" target=3D"_blank">qemu_1.4.1.bb</a><br>
&gt;&gt;&gt;&gt; rename to meta/recipes-devtools/qemu/<a href=3D"http://qem=
u_1.5.0.bb" target=3D"_blank">qemu_1.5.0.bb</a><br>
&gt;&gt;&gt;&gt; index f59d28a..2ea4f12 100644<br>
&gt;&gt;&gt;&gt; --- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.=
4.1.bb" target=3D"_blank">qemu_1.4.1.bb</a><br>
&gt;&gt;&gt;&gt; +++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_1.=
5.0.bb" target=3D"_blank">qemu_1.5.0.bb</a><br>
&gt;&gt;&gt;&gt; @@ -6,5 +6,5 @@ LIC_FILES_CHKSUM =3D<br>
&gt;&gt;&gt;&gt; &quot;file://COPYING;md5=3D441c28d2cf86e15a37fa47e15a72fba=
c \<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0SRC_URI +=3D &quot;file://fdt_header.patch&qu=
ot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0SRC_URI_prepend =3D &quot;<a href=3D"http://w=
iki.qemu.org/download/qemu-${PV}.tar.bz2" target=3D"_blank">http://wiki.qem=
u.org/download/qemu-${PV}.tar.bz2</a>&quot;<br>
&gt;&gt;&gt;&gt; -SRC_URI[md5sum] =3D &quot;eb2d696956324722b5ecfa46e41f9a7=
5&quot;<br>
&gt;&gt;&gt;&gt; -SRC_URI[sha256sum] =3D<br>
&gt;&gt;&gt;&gt; &quot;75063a9326221607de3599e89fb5af80f2d8080ddc55ca253fff=
113843432df1&quot;<br>
&gt;&gt;&gt;&gt; +SRC_URI[md5sum] =3D &quot;b6f3265b8ed39d77e8f354f35cc26e1=
6&quot;<br>
&gt;&gt;&gt;&gt; +SRC_URI[sha256sum] =3D<br>
&gt;&gt;&gt;&gt; &quot;b22b30ee9712568dfb4eedf76783f4a76546e1cbc41659b90964=
6bcf0b4867bb&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core</a><br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--f46d041825ac2111d404dee7f823--
