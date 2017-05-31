Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3D06060F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 22:04:40 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id k15so6799735wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 15:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oGP9gSKHjw3TQC98ys1Ae79Fnrgrd+/vkzQmWtzZENE=;
	b=IyTyKzdETn7urC2epxPHBCjj6a0Tz6JOQCae5GAUFZVM5+V2o4dqeQ4wTdjcfQvRg9
	x6AknX0HDysnmyKDhtn6Yq/dEGra+pBcpjbsEFfxF4LBn+mKRLetCLN0JqbNqIGqnfCS
	GLRaH6yRgp8/V43aQq+YTLFlLmMWJJAv+tv1o0SFpGGyF6k/Jj0w99ivQ81s5vwfwhp/
	IydEKFolwxExKn/zcgI9oIsk+UmAEJXT8W9rn4K/L+Rfmhr1BXWOGBLKiivt/ktcWLhi
	v8h0Cq2E4xj92UJxy9KyKZHIIm50jkwUlIIGnWkmyjMA63jc3YtOk0OjKKFggg0zaFPm
	RbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oGP9gSKHjw3TQC98ys1Ae79Fnrgrd+/vkzQmWtzZENE=;
	b=rm/jR2CpO+GOHuox3m1G7k41vc0GSWeUNvbf7OY3OX21KQw/HvOIV9S486qqVEoYc4
	9SDsAuSiJX4CX+Z3S4Gwayd1T65+iU7+8CxiA9G9M03Pwh9eTMQk9S0bC+LmIoTChqUr
	p+CIkiXsybv4RI9hylaC+yvED16Ac+Bni9CqmGCfSMzkI7j3sWtf57MRFZ8g5Zei0Fbp
	EuKgf0AF7y6sY+wcTh8zcS6I7HG+be64PdU/SeGb3lRavSm93Y2Pv7Xb9lwecjZRKimo
	PkITt16O9tydpx36s2GA4Hhusf+nulzbeG028D4legFuIpPfJAdiMBZ3l2HbDcoe8b3z
	Qacg==
X-Gm-Message-State: AODbwcBwwkV9xu0gNiHt3XCe6DHAjuHqbYrXSl0BwwLhDdppg3HvRyi7
	7XkW4VBFYyS2syfF8D290h4JheJeTA==
X-Received: by 10.223.179.199 with SMTP id x7mr22124568wrd.72.1496268281785;
	Wed, 31 May 2017 15:04:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.148 with HTTP; Wed, 31 May 2017 15:04:41 -0700 (PDT)
In-Reply-To: <CAP71WjyPL-ZsPnGDV_oq7rkWZpJCGNYyfvXQ9CVKNE6k3w9XJQ@mail.gmail.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
	<CAJ86T=VS+ThYpfakL=oHDbDt9ogmoq4E6A95S0YVdxXNxfwRRg@mail.gmail.com>
	<CAP71WjwsNYDZZttAqUwxh0+=QkY6H7HVvLbvBXc-po6y6C77uA@mail.gmail.com>
	<CAJ86T=XDeMu5yAvqymWQ3Lbe+FDhLzGobyhx8SR6h9cVpX3OvA@mail.gmail.com>
	<CAP71WjyPL-ZsPnGDV_oq7rkWZpJCGNYyfvXQ9CVKNE6k3w9XJQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 31 May 2017 15:04:41 -0700
Message-ID: <CAJ86T=U73sCUS8uPCRAe5X_c0o-b-ukp9oy0Xr=8=woV9X1TsQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Wed, 31 May 2017 22:04:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 31, 2017 at 3:26 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Tue, May 30, 2017 at 11:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Tue, May 30, 2017 at 1:26 PM, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>>> so, to backtrack a bit, i think it should be safe to only treat
>>> vmlinux.gz as a 'special' case, and then it is there in
>>> KERNEL_IMAGETYPE, then we do a "make vmlinux" and we manually compress
>>> the file, otherwise we just trust that KERNEL_IMAGETYPE is a valid
>>> type and give it to kernel make command line.  that should be enough
>>> to fix the Image.gz cases on all platforms where it's relevant (like
>>> arm).
>>
>> That sounds reasonable.
>
> I've been playing with this today, and that *seems* to work fine. At
> least I can still build vmlinux, vmlinux.gz and it fixes the  build of
> Image.gz as well..
>
> I would appreciate some feedback on this one. I can then send a proper
> patch. Could that break badly for anyone?
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 7a134d5c29..459b6d66a3 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -44,7 +44,10 @@ python __anonymous () {
>          types = (alttype + ' ' + types).strip()
>      d.setVar('KERNEL_IMAGETYPES', types)
>
> -    typeformake = re.sub(r'\.gz', '', types)
> +    # some commonly used kernel images aren't generated by the kernel
> build system, such as vmlinux.gz
> +    # typeformake lists only valid kernel make targets, and post
> processing can be done after the kernel
> +    # is built (such as using gzip to compress vmlinux)
> +    typeformake = re.sub(r'vmlinux\.gz', 'vmlinux', types)
>      d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
>
>      for type in types.split():
>

Looks good to me. Below is a version which takes the cleanup slightly
further (it will no doubt get mangled since I'm copying and pasting
into gmail, but maybe gives some more ideas for the final patch).

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8954b28..264d5b7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -32,8 +32,6 @@ KERNEL_VERSION_PKG_NAME =
"${@legitimize_package_name(d.getVar('KERNEL_VERSION')
 KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"

 python __anonymous () {
-    import re
-
     # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
     type = d.getVar('KERNEL_IMAGETYPE') or ""
     alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
@@ -44,7 +42,13 @@ python __anonymous () {
         types = (alttype + ' ' + types).strip()
     d.setVar('KERNEL_IMAGETYPES', types)

-    typeformake = re.sub(r'\.gz', '', types)
+    # Almost all commonly used kernel images are generated by the kernel build
+    # system directly. However some, such as vmlinux.gz, are created as special
+    # cases by post-processing steps in kernel_do_compile() and
should therefore
+    # not be included in typeformake.
+
+    typeformake = types.replace('vmlinux.gz', '').strip()
+
     d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)

     for type in types.split():
@@ -266,14 +270,11 @@ kernel_do_compile() {
        fi
        for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
                oe_runmake ${typeformake} CC="${KERNEL_CC}"
LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
-               for type in ${KERNEL_IMAGETYPES} ; do
-                       if test "${typeformake}.gz" = "${type}"; then
-                               mkdir -p "${KERNEL_OUTPUT_DIR}"
-                               gzip -9c < "${typeformake}" >
"${KERNEL_OUTPUT_DIR}/${type}"
-                               break;
-                       fi
-               done
        done
+       if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
+               mkdir -p "${KERNEL_OUTPUT_DIR}"
+               gzip -9c < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
+       fi
 }

 do_compile_kernelmodules() {

