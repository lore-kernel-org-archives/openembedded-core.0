Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1A478443
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 18:11:12 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id d124so34761423vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QLto4aq0pVUR/bHqaJv0z5dxLpMV6QSf8hEcYFd4JAU=;
	b=UTkJK/wgWrAqAS3aiY6ohOrdVtFtyz3gM8D2vUB5u5y0S+hMn5x4I5AgwK0Qy/XM/x
	K7Iyq7DMbXCVy5rAruecDOa+Rq3U3jc7f+rOP5l3/Pz5CtmgPQ2tfHW4AmCZiTbdzWm+
	tFcq50XvO180hl3v5KyFink5e6IGs35lCqGBHAwkGH0pzEBgf6GlwEdm+6wmMz+7D4tJ
	Qb0vTaLW09fQz/rt6E2SzzCC1Udu3acWKtAM/4bicJVP+Ds0uCtfFf2jkMwhprAl9Pmp
	/HSHf3JhQ7dFGCpVSj3GY2Tzrw+6oMVr0WfhtmXxGIqNuSyNvLX3D67idPENdOyDtemQ
	FPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QLto4aq0pVUR/bHqaJv0z5dxLpMV6QSf8hEcYFd4JAU=;
	b=gnULWXbIsiB3MOGPOg+M9F3dWMnBy9JLdGeEopkpRVSi/rlIDIAOyyUC5m3qrzn3CN
	ON43mSMyHgYw8y6QPNJtT11cxTu9I8m3VGd4hUcLS7h43bVkD0oijnPoibrOryj3HdTg
	4VTI9lFfDNtZs+y1R/kjzkix5t8PZ0IyNF8TfFBBZwuWjT9pN1OWMHi6gHXB364D94n/
	+mtrCIHsMen/enNZzUZ+DVlrxXNYsfeRN6PvCJhRCnsW1t2tKjUUizpyHNCGTW8Nnaed
	RlSO9UjR3LHWYa84FHmn3MvRq4atj8M6INB+dzrXN7ziMYcQ0+vinVZpOcw3kUESNAxh
	AFeA==
X-Gm-Message-State: AHYfb5hRSYFJv1xxqcJBl3247blfI6A2SQGEgKfmCmXs8Z+9bzxKrcyG
	BbX/ID5xf4NXrmna0Lx+3pl4xHwHEQ==
X-Received: by 10.31.150.6 with SMTP id y6mr6271741vkd.1.1503079873959; Fri,
	18 Aug 2017 11:11:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Fri, 18 Aug 2017 11:11:13 -0700 (PDT)
In-Reply-To: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 18 Aug 2017 20:11:13 +0200
Message-ID: <CA+chaQcb27Zvu_Hd6pDZ8KHkyF86sJkB3rm4rvzfb_gy98pu4A@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 00/11] Reproducible binaries
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
X-List-Received-Date: Fri, 18 Aug 2017 18:11:13 -0000
Content-Type: multipart/alternative; boundary="001a1141f98cf4daac05570b0d4f"

--001a1141f98cf4daac05570b0d4f
Content-Type: text/plain; charset="UTF-8"

I've seen that some of these patches were already merged to master.

Can you please resend remaining patches for oe-core? I'm testing some
slightly older version of your patches and I see couple recipes failing
e.g. like this one:
http://errors.yoctoproject.org/Errors/Details/151939/

On Wed, Aug 9, 2017 at 7:48 PM, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> This patch-set contains basic changes needed in order to support building
> of
> reproducible bianries. The set containes the following patches:
>
> 0001-reproducible_build.bbclass-initial-support-for-binar.patch
> 0002-image-prelink.bbclass-support-binary-reproducibility.patch
> 0003-rootfs-postcommands.bbclass-support-binary-reproduci.patch
> 0004-busybox.inc-improve-reproducibility.patch
> 0005-image.bbclass-support-binary-reproducibility.patch
> 0006-cpio-provide-cpio-replacement-native.patch
> 0007-image_types.bbclass-improve-cpio-image-reproducibili.patch
> 0008-python2.7-improve-reproducibility.patch
> 0009-python3-improve-reproducibility.patch
> 0010-kernel.bbclass-improve-reproducibility.patch
> 0011-poky-reproducible.conf-Initial-version.patch
>
> Using this patch set while building core-image minimal (two clean builds,
> same
> machine/OS, same date, two different folders, at two different times) I
> got the
> following results:
>
> Same:
>
> core-image-minimal-initramfs-qemux86
> bzImage-qemux86.bin
> vmlinux.gz-qemux86.bin
> (Some binaries i.e. ext4 differ, but the differnce is due to conversion to
> .ext4)
>
> Comparing Debian packages in tmp/deploy/deb:
>
> Same:  4005
> Different:  38
> Total: 4043
>
> (The remaining packages that still differ can be dealt with on an
> individual basis)
>
>
> Although the patches contain commit messages explaining the purpose and
> implementation,
> a somewhat more detailed description of selected patches seems prudent:
>
> 0001-reproducible_build.bbclass-initial-support-for-binar.patch
> ===============================================================
>
> This patch creates a new class "reproducible_build.bbclass",
> introducing two new variables:
>
> BUILD_REPRODUCIBLE_BINARIES: "0" (default) business as usual, "1" turn on
> various pieces of
> codes to improve reproducible builds
>
> REPRODUCIBLE_TIMESTAMP_ROOTFS: only used if BUILD_REPRODUCIBLE_BINARIES="
> 1".
> Catch-all timestamp for various rootfs files, pre-linker, etc. If needed,
> timestamps can
> be better granulated later on, right now we use a single value.
>
> Having a new variable BUILD_REPRODUCIBLE_BINARIES serves two purposes:
> 1. Lets user decide (there are minor trade-offs)
> 2. Setting to "0" will guarantee to cause zero regressions.
> 3. Setting to "1" will force the the environment to contain
> SOURCE_DATE_EPOCH
>
> BUILD_REPRODUCIBLE_BINARIES is globally exported, as this will initially
> force all kinds
> of rebuilds. I know no simple way around this, though. This variable is
> needed in numerous
> places: configuration, compilation, rootfs creation, packaging etc.
> REPRODUCIBLE_TIMESTAMP_ROOTFS does not need to be globally exported, it is
> exported locally
> based on the need.
> Once these variables are "official", various classes and recipes can be
> modified to conditionally
> support binary reproducibility.
>
> Setting SOURCE_DATE_EPOCH is essential for binary reproducibility.
> We need to set a recipe specific SOURCE_DATE_EPOCH in each recipe
> environment for various tasks.
> One way would be to modify all recipes one-by-one, but that is not
> realistic. So determining
> SOURCE_DATE_EPOCH is done in this class automatically: After sources are
> unpacked (but
> before they are patched), we try to determine the value for
> SOURCE_DATE_EPOCH.
>
> There are 4 ways to determine SOURCE_DATE_EPOCH:
> 1. Use value from src-data-epoch.txt file if this file exists. This file
> was most likely created
>   in the previous build by one of the following methods 2,3,4.
>   (But it could be actually provided by a recipe via SRC_URI)
>
> If the file does not exist:
> 2. Use .git last commit date timestamp (git does not allow checking out
> files and preserving their
>    timestamps)
> 3. Use "known" files such as NEWS, CHANGLELOG, ...
> 4. Use the youngest file of the source tree.
>
> Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the
> recipe source tree in
> a text file "src-date-epoch.txt'.
>
> If this file is found by other recipe task, the value is placed in the
> SOURCE_DATE_EPOCH var in
> the task environment. This is done in an anonymous python function, so
> SOURCE_DATE_EPOCH is
> guaranteed to exist for all tasks. (If the file is not found
> SOURCE_DATE_EPOCH is set to 0)
> This can optimized in the future, as some tasks (all tasks before fetch,
> tasks such as package QA,
> rm_work, ...) do not need SOURCE_DATE_EPOCH in the environment.
>
>
> 0008-python2.7-improve-reproducibility.patch
> 0009-python3-improve-reproducibility.patch
> ============================================
> These are back ports of existing patches. They ensure the compiled .pyc
> files
> contain timestamp based on SOURCE_DATE_EPOCH (if defined in the
> environment).
> (May not be needed in the future, my understanding is support for
> SOURCE_DATE_EPOCH is already
> upstreamed in master)
>
>
> 0010-kernel.bbclass-improve-reproducibility.patch
> =================================================
>
> This patch contains several changes, was created by squashing several
> commits.
> Several tweaks to improve reproducibility:
>
> We want to set KBUILD_BUILD_TIMESTAMP to some reproducible value. Normally,
> we would use the value for SOURCE_DATE_EPOCH. However, to accommodate
> local kernel sources,
> these are not obtained the usual way via do_unpack and hHence we end up
> with
> SOURCE_DATE_EPOCH set to 0. In this case we obtain the timestamp from top
> entry of GIT repo,
> or (if there is no GIT repo) fallback to REPRODUCIBLE_TIMESTAMP_ROOTFS as
> the last resort.
>
> Kernel and kernel modules contain hard coded paths referencing the host
> build system. This is usually because the source code contains __FILE__
> at some place. This prevents binary reproducibility. However, some
> compilers
> allow remapping of the __FILE__ value. If we detect the compiler is capable
> of doing this, we replace the source path $(S) part of __FILE__ by a
> string "/kernel-source".
> This works very well for oe-embedded cross-compilers, but it is not
> guaranteed to work for
> external toolchains. Hence, the check for the option being supported. Note
> that this
> is done regardless of the value od BUILD_REPRODUCIBLE_BINARIES.
>
> When compressing vmlinux.gz, use gzip "-n" option as recommended in all
> guidelines to achieve
> binary reproducibility.
>
>
> 0011-poky-reproducible.conf-Initial-version.patch
> =================================================
> Support building of reproducible images by setting
> DISTRO="poky-reproducible"
>
> This is mostly for convenience so the user does not have to modify
> local.conf.
>
> Please note setting LDCONFIGDEPEND = ""
> This prevents building of ldconfig cache, which (when built) breaks binary
> reproducibility.
>
> Also, it should avoid reproducibility issue with etc/passwd, where for
> example
> two different builds can lead to two different values i.e:
>
> build 1:
> distcc:x:993:65534::/dev/null:/bin/sh
> pulse:x:994:1001::/var/run/pulse:/bin/false
>
> build 2:
> pulse:x:993:1001::/var/run/pulse:/bin/false
> distcc:x:994:65534::/dev/null:/bin/sh
>
>
>
> Juro Bystricky (11):
>   reproducible_build.bbclass: initial support for binary reproducibility
>   image-prelink.bbclass: support binary reproducibility
>   rootfs-postcommands.bbclass: support binary reproducibility
>   busybox.inc: improve reproducibility
>   image.bbclass: support binary reproducibility
>   cpio: provide cpio-replacement-native
>   image_types.bbclass: improve cpio image reproducibility
>   python2.7: improve reproducibility
>   python3: improve reproducibility
>   kernel.bbclass: improve reproducibility
>   poky-reproducible.conf: Initial version
>
>  meta-poky/conf/distro/include/reproducible-group   |  50 ++++++++++
>  meta-poky/conf/distro/include/reproducible-passwd  |  25 +++++
>  meta-poky/conf/distro/poky-reproducible.conf       |  38 ++++++++
>  meta/classes/base.bbclass                          |   4 +
>  meta/classes/image-prelink.bbclass                 |  12 ++-
>  meta/classes/image.bbclass                         |  16 ++-
>  meta/classes/image_types.bbclass                   |  14 ++-
>  meta/classes/kernel.bbclass                        |  39 +++++++-
>  meta/classes/reproducible_build.bbclass            | 108
> +++++++++++++++++++++
>  meta/classes/rootfs-postcommands.bbclass           |  27 +++++-
>  meta/recipes-core/busybox/busybox.inc              |   7 ++
>  .../python/python-native_2.7.13.bb                 |   1 +
>  .../python/python/reproducible.patch               |  34 +++++++
>  .../python/python3-native_3.5.3.bb                 |   1 +
>  .../support_SOURCE_DATE_EPOCH_in_py_compile.patch  |  97
> ++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.3.bb      |   1 +
>  meta/recipes-devtools/python/python_2.7.13.bb      |   1 +
>  meta/recipes-extended/cpio/cpio_v2.inc             |   2 +
>  18 files changed, 467 insertions(+), 10 deletions(-)
>  create mode 100644 meta-poky/conf/distro/include/reproducible-group
>  create mode 100644 meta-poky/conf/distro/include/reproducible-passwd
>  create mode 100644 meta-poky/conf/distro/poky-reproducible.conf
>  create mode 100644 meta/classes/reproducible_build.bbclass
>  create mode 100644 meta/recipes-devtools/python/python/reproducible.patch
>  create mode 100644 meta/recipes-devtools/python/
> python3/support_SOURCE_DATE_EPOCH_in_py_compile.patch
>
> --
> 2.7.4
>
>

--001a1141f98cf4daac05570b0d4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;ve seen that some of these patches were already=
 merged to master.</div><div><br></div><div>Can you please resend remaining=
 patches for oe-core? I&#39;m testing some slightly older version of your p=
atches and I see couple recipes failing e.g. like this one:</div><a href=3D=
"http://errors.yoctoproject.org/Errors/Details/151939/">http://errors.yocto=
project.org/Errors/Details/151939/</a></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Wed, Aug 9, 2017 at 7:48 PM, Juro Bystricky <=
span dir=3D"ltr">&lt;<a href=3D"mailto:juro.bystricky@intel.com" target=3D"=
_blank">juro.bystricky@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">This patch-set contains basic changes needed in order to supp=
ort building of<br>
reproducible bianries. The set containes the following patches:<br>
<br>
0001-reproducible_build.<wbr>bbclass-initial-support-for-<wbr>binar.patch<b=
r>
0002-image-prelink.bbclass-<wbr>support-binary-<wbr>reproducibility.patch<b=
r>
0003-rootfs-postcommands.<wbr>bbclass-support-binary-<wbr>reproduci.patch<b=
r>
0004-busybox.inc-improve-<wbr>reproducibility.patch<br>
0005-image.bbclass-support-<wbr>binary-reproducibility.patch<br>
0006-cpio-provide-cpio-<wbr>replacement-native.patch<br>
0007-image_types.bbclass-<wbr>improve-cpio-image-<wbr>reproducibili.patch<b=
r>
0008-python2.7-improve-<wbr>reproducibility.patch<br>
0009-python3-improve-<wbr>reproducibility.patch<br>
0010-kernel.bbclass-improve-<wbr>reproducibility.patch<br>
0011-poky-reproducible.conf-<wbr>Initial-version.patch<br>
<br>
Using this patch set while building core-image minimal (two clean builds, s=
ame<br>
machine/OS, same date, two different folders, at two different times) I got=
 the<br>
following results:<br>
<br>
Same:<br>
<br>
core-image-minimal-initramfs-<wbr>qemux86<br>
bzImage-qemux86.bin<br>
vmlinux.gz-qemux86.bin<br>
(Some binaries i.e. ext4 differ, but the differnce is due to conversion to<=
br>
.ext4)<br>
<br>
Comparing Debian packages in tmp/deploy/deb:<br>
<br>
Same:=C2=A0 4005<br>
Different:=C2=A0 38<br>
Total: 4043<br>
<br>
(The remaining packages that still differ can be dealt with on an individua=
l basis)<br>
<br>
<br>
Although the patches contain commit messages explaining the purpose and imp=
lementation,<br>
a somewhat more detailed description of selected patches seems prudent:<br>
<br>
0001-reproducible_build.<wbr>bbclass-initial-support-for-<wbr>binar.patch<b=
r>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D<br>
<br>
This patch creates a new class &quot;reproducible_build.bbclass&quot;,<br>
introducing two new variables:<br>
<br>
BUILD_REPRODUCIBLE_BINARIES: &quot;0&quot; (default) business as usual, &qu=
ot;1&quot; turn on various pieces of<br>
codes to improve reproducible builds<br>
<br>
REPRODUCIBLE_TIMESTAMP_ROOTFS: only used if BUILD_REPRODUCIBLE_BINARIES=3D&=
quot;<wbr>1&quot;.<br>
Catch-all timestamp for various rootfs files, pre-linker, etc. If needed, t=
imestamps can<br>
be better granulated later on, right now we use a single value.<br>
<br>
Having a new variable BUILD_REPRODUCIBLE_BINARIES serves two purposes:<br>
1. Lets user decide (there are minor trade-offs)<br>
2. Setting to &quot;0&quot; will guarantee to cause zero regressions.<br>
3. Setting to &quot;1&quot; will force the the environment to contain SOURC=
E_DATE_EPOCH<br>
<br>
BUILD_REPRODUCIBLE_BINARIES is globally exported, as this will initially fo=
rce all kinds<br>
of rebuilds. I know no simple way around this, though. This variable is nee=
ded in numerous<br>
places: configuration, compilation, rootfs creation, packaging etc.<br>
REPRODUCIBLE_TIMESTAMP_ROOTFS does not need to be globally exported, it is =
exported locally<br>
based on the need.<br>
Once these variables are &quot;official&quot;, various classes and recipes =
can be modified to conditionally<br>
support binary reproducibility.<br>
<br>
Setting SOURCE_DATE_EPOCH is essential for binary reproducibility.<br>
We need to set a recipe specific SOURCE_DATE_EPOCH in each recipe environme=
nt for various tasks.<br>
One way would be to modify all recipes one-by-one, but that is not realisti=
c. So determining<br>
SOURCE_DATE_EPOCH is done in this class automatically: After sources are un=
packed (but<br>
before they are patched), we try to determine the value for SOURCE_DATE_EPO=
CH.<br>
<br>
There are 4 ways to determine SOURCE_DATE_EPOCH:<br>
1. Use value from src-data-epoch.txt file if this file exists. This file wa=
s most likely created<br>
=C2=A0 in the previous build by one of the following methods 2,3,4.<br>
=C2=A0 (But it could be actually provided by a recipe via SRC_URI)<br>
<br>
If the file does not exist:<br>
2. Use .git last commit date timestamp (git does not allow checking out fil=
es and preserving their<br>
=C2=A0 =C2=A0timestamps)<br>
3. Use &quot;known&quot; files such as NEWS, CHANGLELOG, ...<br>
4. Use the youngest file of the source tree.<br>
<br>
Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the reci=
pe source tree in<br>
a text file &quot;src-date-epoch.txt&#39;.<br>
<br>
If this file is found by other recipe task, the value is placed in the SOUR=
CE_DATE_EPOCH var in<br>
the task environment. This is done in an anonymous python function, so SOUR=
CE_DATE_EPOCH is<br>
guaranteed to exist for all tasks. (If the file is not found SOURCE_DATE_EP=
OCH is set to 0)<br>
This can optimized in the future, as some tasks (all tasks before fetch, ta=
sks such as package QA,<br>
rm_work, ...) do not need SOURCE_DATE_EPOCH in the environment.<br>
<br>
<br>
0008-python2.7-improve-<wbr>reproducibility.patch<br>
0009-python3-improve-<wbr>reproducibility.patch<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
These are back ports of existing patches. They ensure the compiled .pyc fil=
es<br>
contain timestamp based on SOURCE_DATE_EPOCH (if defined in the environment=
).<br>
(May not be needed in the future, my understanding is support for SOURCE_DA=
TE_EPOCH is already<br>
upstreamed in master)<br>
<br>
<br>
0010-kernel.bbclass-improve-<wbr>reproducibility.patch<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
This patch contains several changes, was created by squashing several commi=
ts.<br>
Several tweaks to improve reproducibility:<br>
<br>
We want to set KBUILD_BUILD_TIMESTAMP to some reproducible value. Normally,=
<br>
we would use the value for SOURCE_DATE_EPOCH. However, to accommodate local=
 kernel sources,<br>
these are not obtained the usual way via do_unpack and hHence we end up wit=
h<br>
SOURCE_DATE_EPOCH set to 0. In this case we obtain the timestamp from top e=
ntry of GIT repo,<br>
or (if there is no GIT repo) fallback to REPRODUCIBLE_TIMESTAMP_ROOTFS as t=
he last resort.<br>
<br>
Kernel and kernel modules contain hard coded paths referencing the host<br>
build system. This is usually because the source code contains __FILE__<br>
at some place. This prevents binary reproducibility. However, some compiler=
s<br>
allow remapping of the __FILE__ value. If we detect the compiler is capable=
<br>
of doing this, we replace the source path $(S) part of __FILE__ by a string=
 &quot;/kernel-source&quot;.<br>
This works very well for oe-embedded cross-compilers, but it is not guarant=
eed to work for<br>
external toolchains. Hence, the check for the option being supported. Note =
that this<br>
is done regardless of the value od BUILD_REPRODUCIBLE_BINARIES.<br>
<br>
When compressing vmlinux.gz, use gzip &quot;-n&quot; option as recommended =
in all guidelines to achieve<br>
binary reproducibility.<br>
<br>
<br>
0011-poky-reproducible.conf-<wbr>Initial-version.patch<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Support building of reproducible images by setting<br>
DISTRO=3D&quot;poky-reproducible&quot;<br>
<br>
This is mostly for convenience so the user does not have to modify<br>
local.conf.<br>
<br>
Please note setting LDCONFIGDEPEND =3D &quot;&quot;<br>
This prevents building of ldconfig cache, which (when built) breaks binary<=
br>
reproducibility.<br>
<br>
Also, it should avoid reproducibility issue with etc/passwd, where for exam=
ple<br>
two different builds can lead to two different values i.e:<br>
<br>
build 1:<br>
distcc:x:993:65534::/dev/null:<wbr>/bin/sh<br>
pulse:x:994:1001::/var/run/<wbr>pulse:/bin/false<br>
<br>
build 2:<br>
pulse:x:993:1001::/var/run/<wbr>pulse:/bin/false<br>
distcc:x:994:65534::/dev/null:<wbr>/bin/sh<br>
<br>
<br>
<br>
Juro Bystricky (11):<br>
=C2=A0 reproducible_build.bbclass: initial support for binary reproducibili=
ty<br>
=C2=A0 image-prelink.bbclass: support binary reproducibility<br>
=C2=A0 rootfs-postcommands.bbclass: support binary reproducibility<br>
=C2=A0 busybox.inc: improve reproducibility<br>
=C2=A0 image.bbclass: support binary reproducibility<br>
=C2=A0 cpio: provide cpio-replacement-native<br>
=C2=A0 image_types.bbclass: improve cpio image reproducibility<br>
=C2=A0 python2.7: improve reproducibility<br>
=C2=A0 python3: improve reproducibility<br>
=C2=A0 kernel.bbclass: improve reproducibility<br>
=C2=A0 poky-reproducible.conf: Initial version<br>
<br>
=C2=A0meta-poky/conf/distro/include/<wbr>reproducible-group=C2=A0 =C2=A0|=
=C2=A0 50 ++++++++++<br>
=C2=A0meta-poky/conf/distro/include/<wbr>reproducible-passwd=C2=A0 |=C2=A0 =
25 +++++<br>
=C2=A0meta-poky/conf/distro/poky-<wbr>reproducible.conf=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 38 ++++++++<br>
=C2=A0meta/classes/base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
=C2=A0meta/classes/image-prelink.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 ++-<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 16 ++-<br>
=C2=A0meta/classes/image_types.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ++-<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 39 +++++++-<br>
=C2=A0meta/classes/reproducible_<wbr>build.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 108 +++++++++++++++++++++<br>
=C2=A0meta/classes/rootfs-<wbr>postcommands.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 27 +++++-<br>
=C2=A0meta/recipes-core/busybox/<wbr>busybox.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 ++<br>
=C2=A0.../python/<a href=3D"http://python-native_2.7.13.bb" rel=3D"noreferr=
er" target=3D"_blank">python-native_2.7.<wbr>13.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../python/python/<wbr>reproducible.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 34 +++++++<br>
=C2=A0.../python/<a href=3D"http://python3-native_3.5.3.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-native_3.5.<wbr>3.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../support_SOURCE_DATE_EPOCH_<wbr>in_py_compile.patch=C2=A0 |=C2=A0 =
97 ++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.5.3.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>ython3_3.5.3.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python_2.7.13.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>ython_2.7.13.bb</a>=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-extended/cpio/<wbr>cpio_v2.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A018 files changed, 467 insertions(+), 10 deletions(-)<br>
=C2=A0create mode 100644 meta-poky/conf/distro/include/<wbr>reproducible-gr=
oup<br>
=C2=A0create mode 100644 meta-poky/conf/distro/include/<wbr>reproducible-pa=
sswd<br>
=C2=A0create mode 100644 meta-poky/conf/distro/poky-<wbr>reproducible.conf<=
br>
=C2=A0create mode 100644 meta/classes/reproducible_<wbr>build.bbclass<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<wbr>python/reproduci=
ble.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<wbr>python3/support_=
SOURCE_DATE_<wbr>EPOCH_in_py_compile.patch<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a1141f98cf4daac05570b0d4f--
