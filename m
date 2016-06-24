Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id E66B060745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 03:44:53 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id d132so16015958oig.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 20:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=1pdTNZ6teMyEQ28FLoixdOa+PmS+khXVbjAfQrRm1fY=;
	b=PmiFIt3bfpwR6bHaQXe0FW8nXQbXT8MGQjmj7oaY43RjRA/QckJ5kbxKtrdNbyPAKQ
	eKKNM3w49QRtR3OLOF6TyZmh8DGnuHab0zqUKKX2sxl+Q/xvpBsltrfC4aM6CxeEAyC/
	suelBd1rWJIChDxZR31IjI+2wIAhefiMRBICxVuvpmOOEw5cVhUWtPvAA/DwcsR8ueyi
	1yxy4MuQ+fRIZNVbSKjAe+nkO+iTMy341QeUxM+2hd04tKWFUJD3f6MJ3Jtxxtx2gNai
	9hufKsunogku8hKwJjTp7Kwpgs6v1dMiRqAHZSx83a28+XFyzymhoppZHRs3T5qY2bFx
	gGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=1pdTNZ6teMyEQ28FLoixdOa+PmS+khXVbjAfQrRm1fY=;
	b=BGSq5NERO0Q8+6siJV6h21xM5bVdHhniYUWK1Tvq5m0gjXhe1dv848tOBn0rVTq5mG
	LDGVAYKPjCo28fIPgiDepD3R6QRFjQeoCz7L3om2eY6XRqM7qJeGUn25IODLMosohJtQ
	alIKuMqFtvOij4Faioyd4eqnIDvPQkFEgOJ/ZFbVbubBSFRUvRjjKxSDwS1GnRUiaM+4
	o3zmk9uDUve7ZCjZIAP5fb4QH1WlHSgDftJ8eiYlRj4AnImx00NRuykP+NSu6qO793uI
	9dpqGnQHDKLryFN1In73EDykDL+LxeKcKjPxJd6FqRK6cBUIAwa+loQ0hrDkZCmQLh5a
	zWNg==
X-Gm-Message-State: ALyK8tLLM7TED61VGjXISDsp6NosQkHQsTF3+XnqOGyOcnJsIzO6Bw2VNtSK/Rs6Xm5C0jTHotXztRma0rGwIA==
X-Received: by 10.202.213.67 with SMTP id m64mr1402929oig.114.1466739894056;
	Thu, 23 Jun 2016 20:44:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.248.164 with HTTP; Thu, 23 Jun 2016 20:44:53 -0700 (PDT)
In-Reply-To: <DB3PR04MB0422B332B7EE939EE1BB31D992E0@DB3PR04MB042.eurprd04.prod.outlook.com>
References: <CAOLEWZUQRF1LBjviUmbHqLO6kTM=ExC=4soBBTmdhvpuRekbmw@mail.gmail.com>
	<576B95C8.7070002@windriver.com>
	<DB3PR04MB0422B332B7EE939EE1BB31D992E0@DB3PR04MB042.eurprd04.prod.outlook.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Thu, 23 Jun 2016 20:44:53 -0700
Message-ID: <CAOLEWZV7BhnN=1h8g6mBeMMLrv49yxnp6xE3Z-KUtBvUwzhmng@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Fri, 24 Jun 2016 03:44:54 -0000
Content-Type: text/plain; charset=UTF-8

The fuse-ld=bfd flag is not in the v4 patch, can you go back and try
the most recent one on the list?

Thanks...

On Thu, Jun 23, 2016 at 7:29 PM, Ting Liu <ting.liu@nxp.com> wrote:
> Same issue on CentOS 6.7. Older gcc does not support -fuse-ld=bfd.
>
> -Ting
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Robert Yang
>> Sent: Thursday, June 23, 2016 3:55 PM
>> To: Stephen Arnold <stephen.arnold42@gmail.com>; Patches and
>> discussions about the oe-core layer <openembedded-
>> core@lists.openembedded.org>
>> Subject: Re: [OE-core] [PATCH v4] qemu-native: set ld.bfd, fix cflags, and set
>> some environment vars
>>
>>
>> Hi, I got build errors on Ubuntu 12.04 with this patch:
>>
>> | DEBUG: Executing shell function do_configure
>> |
>> | ERROR: "gcc " cannot build an executable (is your linker broken?)
>>
>>
>> // Robert
>>
>> On 06/21/2016 09:18 AM, Stephen Arnold wrote:
>> > And I finally figured out git send-email no longer has a
>> > --subject-prefix= option so it looks like --compose and hand-edit the
>> > Subject line in the patch is the only way to increment the version.
>> >
>> > This is [PATCH v4] btw...
>> >
>> > Steve
>> >
>> > On Mon, Jun 20, 2016 at 5:54 PM, Stephen Arnold <sarnold@vctlabs.com>
>> wrote:
>> >> The main thing is build failures with gold linker, but qemu is also a
>> >> little too aggressive at finding random tools on the build host, so
>> >> we also set the build env for qemu-native and make sure it doesn't
>> >> reset its own (hard-coded) cflags when we don't want it to.
>> >>
>> >> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
>> >>
>> >> The cflags patch was imported from Gentoo Portage and has been
>> >> manitained over several versions; this version was rebased against
>> >> upstream qemu git.
>> >>
>> >> Upstream-Status: Inappropriate
>> >>   - Patch addresses distribution maintenance and build environment
>> >>     sanity.
>> >>
>> >> Signed-off-by: Stephen Arnold <nerdboy@gentoo.org>
>> >> ---
>> >>   meta/recipes-devtools/qemu/qemu.inc                | 11 ++++++--
>> >>   .../qemu/qemu/qemu-2.6.0-cflags.patch              | 31
>> ++++++++++++++++++++++
>> >>   meta/recipes-devtools/qemu/qemu_2.6.0.bb           |  1 +
>> >>   3 files changed, 41 insertions(+), 2 deletions(-)
>> >>   create mode 100644
>> >> meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
>> >>
>> >> diff --git a/meta/recipes-devtools/qemu/qemu.inc
>> >> b/meta/recipes-devtools/qemu/qemu.inc
>> >> index bf689bb..0a68f05 100644
>> >> --- a/meta/recipes-devtools/qemu/qemu.inc
>> >> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> >> @@ -30,8 +30,10 @@ SRC_URI_append_class-native = "\
>> >>
>> >>   EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --
>> disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --
>> extra-cflags='${CFLAGS}'"
>> >>
>> >> -EXTRA_OECONF_class-nativesdk = "--target-
>> list=${@get_qemu_target_list(d)} --disable-werror \
>> >> -                               "
>> >> +EXTRA_OECONF_class-nativesdk = "--target-
>> list=${@get_qemu_target_list(d)} --disable-werror"
>> >> +
>> >> +EXTRA_OEMAKE_append_class-native = "
>> LD="${TARGET_PREFIX}ld.bfd" AR="${AR}" OBJCOPY="${OBJCOPY}"
>> LDFLAGS="${LDFLAGS}""
>> >> +
>> >>   export LIBTOOL="${HOST_SYS}-libtool"
>> >>
>> >>   do_configure_prepend_class-native() { @@ -40,6 +42,11 @@
>> >> do_configure_prepend_class-native() {
>> >>          if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
>> >>                  export
>> PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
>> >>          fi
>> >> +
>> >> +       # Alter target makefiles to accept CFLAGS set via env
>> >> +       sed -i -r \
>> >> +               -e 's/^(C|OP_C|HELPER_C)FLAGS=/\1FLAGS+=/' \
>> >> +               "${S}"/Makefile "${S}"/Makefile.target
>> >>   }
>> >>
>> >>   KVMENABLE = "--enable-kvm"
>> >> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
>> >> b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
>> >> new file mode 100644
>> >> index 0000000..5b78edf
>> >> --- /dev/null
>> >> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
>> >> @@ -0,0 +1,31 @@
>> >> +From 5d29baaf7a8c09f2f97231116e0f396b0402b23d Mon Sep 17 00:00:00
>> >> +2001
>> >> +From: Steve Arnold <stephen.arnold42@gmail.com>
>> >> +Date: Sun, 19 Jun 2016 11:29:44 -0700
>> >> +Subject: [PATCH] configure: remove hard-coded flags and let build
>> >> +env handle  it
>> >> +
>> >> +Apply distribution patch for handling debug and fortify source options.
>> >> +
>> >> +Signed-off-by: Steve Arnold <nerdboy@gentoo.org>
>> >> +---
>> >> + configure | 4 ----
>> >> + 1 file changed, 4 deletions(-)
>> >> +
>> >> +diff --git a/configure b/configure
>> >> +index 10cb212..6f1b10c 100755
>> >> +--- a/configure
>> >> ++++ b/configure
>> >> +@@ -4539,10 +4539,6 @@ fi
>> >> + if test "$gcov" = "yes" ; then
>> >> +   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
>> >> +   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
>> >> +-elif test "$fortify_source" = "yes" ; then
>> >> +-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
>> >> +-elif test "$debug" = "no"; then
>> >> +-  CFLAGS="-O2 $CFLAGS"
>> >> + fi
>> >> +
>> >> + ##########################################
>> >> +--
>> >> +2.8.1
>> >> +
>> >> diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> >> b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> >> index e391326..62c509b 100644
>> >> --- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> >> +++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> >> @@ -8,6 +8,7 @@ SRC_URI += "file://configure-fix-Darwin-target-
>> detection.patch \
>> >>               file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>> >>               file://no-valgrind.patch \
>> >>               file://pathlimit.patch \
>> >> +            file://qemu-2.5.0-cflags.patch \
>> >>              "
>> >>   SRC_URI_prepend = "http://wiki.qemu-
>> project.org/download/${BP}.tar.bz2"
>> >>   SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
>> >> --
>> >> 2.8.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

