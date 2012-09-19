Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TED1b-0005hW-FN
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 07:40:40 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 18 Sep 2012 22:27:48 -0700
Received: by pbcwy7 with SMTP id wy7so1545151pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=uloxB1l5Gjw4kImMT4Hp/dkIrHo4ck1xTaOM0X7GOnA=;
	b=UT7hjD+/927VpSkaYz5KkpOJNgeDDviEpaKpYwchRGwIvXsZoOHVDzTI6pbC2J6bjF
	vfCgiKWFqmwgYiVoXP3knGrsyLBcL/iDJQyPGPnZuCB1IAf9QQl+EO1H8G2D/sCaervS
	NsC//e7FWjrzQdGe98twMZjAQRvgfETPA55KIKVD9oH9OTssr2HXeOnyxzyQIzxYjGxS
	rT2fttihL7QcNPJk2QRgsSP3bK1/mrDz3F4KoGU7H1eWidDPFV2bsqi7gF50UQ8X66AA
	r9WKr2o2i1/YxsnXtzirn3D/ybChCmaR5EGLMBOZotpb6VaV1b6tEHYwOEhNpRW6TkDg
	iwhQ==
Received: by 10.68.233.136 with SMTP id tw8mr2414869pbc.133.1348032467623;
	Tue, 18 Sep 2012 22:27:47 -0700 (PDT)
Received: from [192.168.1.104] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id ou6sm1220068pbc.9.2012.09.18.22.27.45
	(version=SSLv3 cipher=OTHER); Tue, 18 Sep 2012 22:27:46 -0700 (PDT)
Message-ID: <505957D0.8070009@intel.com>
Date: Tue, 18 Sep 2012 22:27:44 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
	<1346136108-13062-9-git-send-email-koen@dominion.thruhere.net>
	<70CC66F5C30A414DADDA6973E4CA391A64E50F@039-SN1MPN1-001.039d.mgd.msft.net>
	<5047F316.8030808@linux.intel.com>
	<E5E839E2-8D4D-4B80-BC93-BD72FA95F5FA@dominion.thruhere.net>
In-Reply-To: <E5E839E2-8D4D-4B80-BC93-BD72FA95F5FA@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlPDBYtqCzsGEdw1QkQNHr+1qIgW+2E/eQ1qu+J+idTUw7Ds04fLTdUOszoJz9zOKK6aNhq
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Darren Hart <dvhart@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-denzil][meta-oe][PATCH 09/11] kernel: Add kernel headers to kernel-dev package
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
X-List-Received-Date: Wed, 19 Sep 2012 05:40:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2012 10:52 PM, Koen Kooi wrote:
>
> Op 6 sep. 2012, om 02:49 heeft Darren Hart <dvhart@linux.intel.com> het volgende geschreven:
>
>>
>>
>> On 09/05/2012 02:42 PM, McClintock Matthew-B29882 wrote:
>>> On Tue, Aug 28, 2012 at 1:41 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>> From: Darren Hart <dvhart@linux.intel.com>
>>>>
>>>> [YOCTO #1614]
>>>>
>>>> Add the kernel headers to the kernel-dev package. This packages what was
>>>> already built and kept in sysroots for building modules with bitbake.
>>>> Making this available on the target requires removing some additional
>>>> host binaries.
>>>>
>>>> Move the location to /usr/src/kernel
>>>>
>>>> Before use on the target, the user will need to:
>>>>
>>>>     # cd /usr/src/kernel
>>>>     # make scripts
>>>>
>>>> This renders the kernel-misc recipe empty, so remove it.
>>>>
>>>> As we use /usr/src/kernel in several places (and I missed one in the
>>>> previous version), add a KERNEL_SRC_DIR variable and use that throughout
>>>> the class to avoid update errors in the future.
>>>>
>>>> Now that we package the kernel headers, drop the
>>>> kernel_package_preprocess function which removed them from PKGD.
>>>>
>>>> All *-sdk image recipes include dev-pkgs, so the kernel-dev package will
>>>> be installed by default on all such images.
>>>>
>>>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>>>> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
>>>> CC: Tom Zanussi <tom.zanussi@intel.com>
>>>> CC: Khem Raj <raj.khem@gmail.com>
>>>>
>>>> ---
>>>> meta/classes/kernel.bbclass |   25 +++++++++++--------------
>>>> meta/conf/bitbake.conf      |    2 +-
>>>> 2 files changed, 12 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>> index 3ccd753..d79ba9f 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -77,6 +77,10 @@ EXTRA_OEMAKE = ""
>>>>
>>>> KERNEL_ALT_IMAGETYPE ??= ""
>>>>
>>>> +# Define where the kernel headers are installed on the target as well as where
>>>> +# they are staged.
>>>> +KERNEL_SRC_PATH = "/usr/src/kernel"
>>>> +
>>>> KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>>>>
>>>> kernel_do_compile() {
>>>> @@ -130,7 +134,7 @@ kernel_do_install() {
>>>>         # Support for external module building - create a minimal copy of the
>>>>         # kernel source tree.
>>>>         #
>>>> -       kerneldir=${D}/kernel
>>>> +       kerneldir=${D}${KERNEL_SRC_PATH}
>>>>         install -d $kerneldir
>>>>
>>>>         #
>>>> @@ -191,20 +195,15 @@ kernel_do_install() {
>>>>         # Remove the following binaries which cause strip errors
>>>>         # during do_package for cross-compiled platforms
>>>>         bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
>>>> -                  arch/powerpc/boot/mktree"
>>>> +                  arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
>>>> +                  scripts/kconfig/conf.o"
>>>>         for entry in $bin_files; do
>>>>                 rm -f $kerneldir/$entry
>>>>         done
>>>> }
>>>>
>>>> -PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
>>>> -
>>>> -kernel_package_preprocess () {
>>>> -       rm -rf ${PKGD}/kernel
>>>> -}
>>>> -
>>>> sysroot_stage_all_append() {
>>>> -       sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
>>>> +       sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>>>> }
>>>>
>>>> kernel_do_configure() {
>>>> @@ -252,13 +251,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>>>
>>>> # kernel-base becomes kernel-${KERNEL_VERSION}
>>>> # kernel-image becomes kernel-image-${KERNEL_VERISON}
>>>> -PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux kernel-misc"
>>>> +PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
>>>> FILES = ""
>>>> FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>>>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
>>>> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
>>>
>>> This patch is causing the following on denzil (which Scott applied to
>>> his denzil-next branch)
>>>
>>> ERROR: QA Issue: non debug package contains .debug directory:
>>> kernel-dev path
>>> /work/p5020ds_64b-poky-linux/linux-qoriq-sdk-3.0.34-r4/packages-split/kernel-dev/usr/src/kernel/tools/perf/.debug/perf
>>> ERROR: QA run found fatal errors. Please consider fixing them.
>>> ERROR: Function failed: do_package_qa
>>> ERROR: Logfile of failure stored in:
>>> /local/home/mattsm/git/poky/build-denzil/tmp/work/p5020ds_64b-poky-linux/linux-qoriq-sdk-3.0.34-r4/temp/log.do_package.26851
>>> NOTE: package linux-qoriq-sdk-3.0.34-r4: task do_package: Failed
>>> ERROR: Task 13 (/local/home/mattsm/git/poky/build-denzil/../meta-fsl-ppc/recipes-kernel/linux/linux-qoriq-sdk.bb,
>>> do_package) failed with exit code '1'
>>>
>>> At first glance, it looks like we should:
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 7ae2a53..511b22b 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -546,4 +546,5 @@ EXPORT_FUNCTIONS do_deploy
>>> PACKAGES =+ "perf-dbg perf"
>>> FILES_perf = "${bindir}/* \
>>>                ${libexecdir}"
>>> -FILES_perf-dbg = "${FILES_${PN}-dbg}"
>>> +FILES_perf-dbg = "${FILES_${PN}-dbg} \
>>> +                 ${KERNEL_SRC_PATH}/tools/perf/.debug"
>>>
>>> Thoughts?
>>
>> I suppose that or pull in the patches to separate perf into a separate
>> recipe, although that's 13+ patches.
>
> I kept the perf change out on purpose in this patchset :)
>
>> I prefer your solution for the
>> stable tree.
>
> Me too. I haven't run into that bug yet, but the fix is valid.

I've include Matthew's fix in my sgarman/denzil-next branches, 
"kernel.bbclass: put perf .debug dir in -dbg package", 
11cc90715be0ece185d736133d4fcd1a3288366f.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


