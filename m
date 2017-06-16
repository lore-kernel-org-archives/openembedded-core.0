Return-Path: <Aaron_Wright@selinc.com>
X-Greylist: delayed 1894 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Jun 2017 00:47:02 UTC
Received: from valiant.selinc.com (valiant.selinc.com [74.117.214.141])
	by mail.openembedded.org (Postfix) with ESMTP id 346A378415
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 00:47:02 +0000 (UTC)
Received: from pps.filterd (valiant.selinc.com [127.0.0.1])
	by valiant.selinc.com (8.16.0.20/8.16.0.20) with SMTP id v5G0Ckrr003592
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:15:29 -0700
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by valiant.selinc.com with ESMTP id 2b32fv3m5b-1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:15:29 -0700
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: C3B840C2:31FE1246-88258141:0000F82B;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP6 April 21, 2016
Message-ID: <OFC3B840C2.31FE1246-ON88258141.0000F82B-88258141.00016B00@selinc.com>
From: Aaron_Wright@selinc.com
Date: Thu, 15 Jun 2017 17:15:29 -0700
X-MIMETrack: Serialize by Router on Edison/SEL(Release 9.0.1FP3 HF515|April 25,
	2015) at 06/15/2017 05:15:29 PM,
	Serialize complete at 06/15/2017 05:15:29 PM
X-Proofpoint-Virus-Version: vendor=nai engine=5800 definitions=8561
	signatures=668475
Subject: Re: extensible SDK doesn't install when initramfs is bundled with kernel?
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
X-List-Received-Date: Fri, 16 Jun 2017 00:47:03 -0000
Content-Type: multipart/alternative;
	boundary="=_alternative 00016B0088258141_="

--=_alternative 00016B0088258141_=
Content-Type: text/plain; charset="US-ASCII"

> Hi,
> 
> It looks like I can't install the extensible SDK if my initramfs is 
bundled
> with the kernel.
> 
> I am building two images - my-image & my-image-initramfs (which are 
mostly
> identical at the moment). I have also set
> INITRAMFS_IMAGE = "my-image-initramfs"
> INITRAMFS_IMAGE_BUNDLE = "1"
> 
> So far so good and things work as expected, I can build image +
> kernel/initramfs fine.
> 
> 
> Installation of the extensible SDK generated using
> bitbake -c populate_sdk_ext my-image or
> bitbake -c populate_sdk_ext my-image-initramfs
> fails though:
> 
> ---snip---
> Parsing recipes...done.
> Parsing of 1804 .bb files complete (0 cached, 1804 parsed). 2362 
targets, 384 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> Initialising tasks...Initialising tasks...WARNING: The 
linux-ramips:do_bundle_initramfs sig is computed to be 
e434881eda830ba400719204a1e49b8d, but the sig is locked to 
2b272ac304fd389f7a0745bbe3d4efe8 in SIGGEN_LOCKEDSIGS_t-tgm-r1a
> done.
> NOTE: Executing SetScene Tasks
> NOTE: Running setscene task 7 of 516 
(/space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_qa_setscene)
> NOTE: Running setscene task 8 of 516 
/space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-core/util-linux/util-linux_2.28.bb:do_package_qa_setscene)
> [...]
> NOTE: Running setscene task 516 of 516 
/space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-devtools/quilt/quilt-native_0.64.bb:do_populate_sysroot_setscene)
> NOTE: recipe quilt-native-0.64-r0: task do_populate_sysroot_setscene: 
Started
> NOTE: recipe quilt-native-0.64-r0: task do_populate_sysroot_setscene: 
Succeeded
> NOTE: Executing RunQueue Tasks
> ERROR: Task linux-ramips.do_fetch attempted to execute unexpectedly
> ERROR: Task linux-ramips.do_unpack attempted to execute unexpectedly
> ERROR: Task linux-ramips.do_kernel_checkout attempted to execute 
unexpectedly
> ERROR: Task linux-ramips.do_validate_branches attempted to execute 
unexpectedly
> ERROR: Task linux-ramips.do_kernel_metadata attempted to execute 
unexpectedly
> ERROR: Task linux-ramips.do_patch attempted to execute unexpectedly
> ERROR: Task linux-ramips.do_kernel_configme attempted to execute 
unexpectedly
> ERROR: Task linux-ramips.do_configure attempted to execute unexpectedly
> ERROR: Task linux-ramips.do_kernel_configcheck attempted to execute 
unexpectedly
> ERROR: Task linux-ramips.do_compile attempted to execute unexpectedly
> ERROR: Task linux-ramips.do_kernel_link_images attempted to execute 
unexpectedly
> ERROR: Task linux-ramips.do_compile_kernelmodules attempted to execute 
unexpectedly
> ERROR: Task linux-ramips.do_strip attempted to execute unexpectedly
> ERROR: Task linux-ramips.do_sizecheck attempted to execute unexpectedly
> ERROR: Task linux-ramips.do_uboot_mkimage attempted to execute 
unexpectedly
> ERROR: Task linux-ramips.do_install attempted to execute unexpectedly
> ERROR: Task linux-ramips.do_populate_sysroot attempted to execute 
unexpectedly and should have been setscened
> ERROR: Task linux-ramips.do_bundle_initramfs attempted to execute 
unexpectedly
> NOTE: Tasks Summary: Attempted 1541 tasks of which 1541 didn't need to 
be rerun and all succeeded.
> 
> Summary: There were 2 WARNING messages shown.
> Summary: There were 18 ERROR messages shown, returning a non-zero exit 
code.
> ---snap---
> 
> 
> Installation works fine though once I comment out INITRAMFS_IMAGE.
> 
> Any pointers for to how to resolve this while keeping kernel and 
initramfs
> bundled would be greatly appreciated!
> 
> 
> Cheers,
> Andre'

I'm running up against this problem right now on morty. Was this ever 
resolved?

--=_alternative 00016B0088258141_=
Content-Type: text/html; charset="US-ASCII"

<tt><font size=3>&gt; Hi,</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; It looks like I can't install the extensible
SDK if my initramfs is bundled</font></tt>
<br><tt><font size=3>&gt; with the kernel.</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; I am building two images - my-image &amp; my-image-initramfs
(which are mostly</font></tt>
<br><tt><font size=3>&gt; identical at the moment). I have also set</font></tt>
<br><tt><font size=3>&gt; INITRAMFS_IMAGE = &quot;my-image-initramfs&quot;</font></tt>
<br><tt><font size=3>&gt; INITRAMFS_IMAGE_BUNDLE = &quot;1&quot;</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; So far so good and things work as expected, I
can build image +</font></tt>
<br><tt><font size=3>&gt; kernel/initramfs fine.</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; Installation of the extensible SDK generated
using</font></tt>
<br><tt><font size=3>&gt; bitbake -c populate_sdk_ext my-image or</font></tt>
<br><tt><font size=3>&gt; bitbake -c populate_sdk_ext my-image-initramfs</font></tt>
<br><tt><font size=3>&gt; fails though:</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; ---snip---</font></tt>
<br><tt><font size=3>&gt; Parsing recipes...done.</font></tt>
<br><tt><font size=3>&gt; Parsing of 1804 .bb files complete (0 cached,
1804 parsed). 2362 targets, 384 skipped, 0 masked, 0 errors.</font></tt>
<br><tt><font size=3>&gt; NOTE: Resolving any missing task queue dependencies</font></tt>
<br><tt><font size=3>&gt; Initialising tasks...Initialising tasks...WARNING:
The linux-ramips:do_bundle_initramfs sig is computed to be e434881eda830ba400719204a1e49b8d,
but the sig is locked to 2b272ac304fd389f7a0745bbe3d4efe8 in SIGGEN_LOCKEDSIGS_t-tgm-r1a</font></tt>
<br><tt><font size=3>&gt; done.</font></tt>
<br><tt><font size=3>&gt; NOTE: Executing SetScene Tasks</font></tt>
<br><tt><font size=3>&gt; NOTE: Running setscene task 7 of 516 (/space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_qa_setscene)</font></tt>
<br><tt><font size=3>&gt; NOTE: Running setscene task 8 of 516 /space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-core/util-linux/util-linux_2.28.bb:do_package_qa_setscene)</font></tt>
<br><tt><font size=3>&gt; [...]</font></tt>
<br><tt><font size=3>&gt; NOTE: Running setscene task 516 of 516 /space/rel-test/poky-rootfs_sdk/layers/poky/meta/recipes-devtools/quilt/quilt-native_0.64.bb:do_populate_sysroot_setscene)</font></tt>
<br><tt><font size=3>&gt; NOTE: recipe quilt-native-0.64-r0: task do_populate_sysroot_setscene:
Started</font></tt>
<br><tt><font size=3>&gt; NOTE: recipe quilt-native-0.64-r0: task do_populate_sysroot_setscene:
Succeeded</font></tt>
<br><tt><font size=3>&gt; NOTE: Executing RunQueue Tasks</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_fetch attempted to
execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_unpack attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_kernel_checkout attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_validate_branches
attempted to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_kernel_metadata attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_patch attempted to
execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_kernel_configme attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_configure attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_kernel_configcheck
attempted to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_compile attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_kernel_link_images
attempted to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_compile_kernelmodules
attempted to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_strip attempted to
execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_sizecheck attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_uboot_mkimage attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_install attempted
to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_populate_sysroot
attempted to execute unexpectedly and should have been setscened</font></tt>
<br><tt><font size=3>&gt; ERROR: Task linux-ramips.do_bundle_initramfs
attempted to execute unexpectedly</font></tt>
<br><tt><font size=3>&gt; NOTE: Tasks Summary: Attempted 1541 tasks of
which 1541 didn't need to be rerun and all succeeded.</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; Summary: There were 2 WARNING messages shown.</font></tt>
<br><tt><font size=3>&gt; Summary: There were 18 ERROR messages shown,
returning a non-zero exit code.</font></tt>
<br><tt><font size=3>&gt; ---snap---</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; Installation works fine though once I comment
out INITRAMFS_IMAGE.</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; Any pointers for to how to resolve this while
keeping kernel and initramfs</font></tt>
<br><tt><font size=3>&gt; bundled would be greatly appreciated!</font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; </font></tt>
<br><tt><font size=3>&gt; Cheers,</font></tt>
<br><tt><font size=3>&gt; Andre'</font></tt>
<br>
<br><tt><font size=3>I'm running up against this problem right now on morty.
Was this ever resolved?</font></tt>

--=_alternative 00016B0088258141_=--
