Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9AED972F24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 22:56:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id k15so7002473wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 15:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UANftDcubZAXxXu4qnN3rlgTKKlqvCTJOwVBAYYA+LU=;
	b=VTvejR1ULLBbuIIdrj230QoBrhhtV9TJ9B9S3c1o23fMxruLuCN+lEL6LRtG4ebcZ0
	d9xNfOaOWbi35LFjnhXs27UiR3NL/ABQ/3dZ8UYmPXcmyXqR+xCOtl8P8eSOz0yQPEaY
	aHRbsOr2jqvjOHVnX1JyHbKRoxXJ5TpPJ02uOG6tDKG9NGsVBaiQaO+PSmlQYAGzaXBh
	O9WA+0cQcdbevVfHJAeou7/7R7ALFTf+J6zA2bnQhH6C1bbc1ThHn8Wh26LVRyEUw1tM
	nBD8rkVbXUvZtkLvHIONJZrD3U7F2Cmwm91tH6feixBW7mENF39FJgSItz2tZCOeeXHM
	02KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UANftDcubZAXxXu4qnN3rlgTKKlqvCTJOwVBAYYA+LU=;
	b=Z7F14F2osdggCR5Y1eGjMctSNRJSzCn0KmF4r/HS2VUonrZVI7AEMDeRub04vyl0Tf
	kFFFfyo/HBQBdJpzayoTI7ZEBdLfwjT3aZPtW2MARwOgpEquePNWU1vSPURgG68r1cUz
	DMUDjMdhrfbwVCZucKenzOCxi7qEqpgtqWGu+n8oEIibT9pp+m18U+8jvxqvHFPEyJg0
	+Vja644sjQp1jCaETz11ZfEkjW/cOufIY+a61nVac9JwUXUPfOmgCKLjrnATc+lFBYGB
	IoibBeM94e+BXIxqI48LhTW7dcdl4pBdrrCJMYic0GqCH5b1NGrQI10EtEEWCOzLxT5b
	DBjw==
X-Gm-Message-State: AODbwcCfRHC4kHRRv2Tk8Nf8dzVoOQ/Q1KxJijmOSSm67DF2uDa62jJC
	Wm2dXUI35d+eTd9Bev/YYubuXUF8rQ==
X-Received: by 10.28.24.207 with SMTP id 198mr6640987wmy.86.1496271363167;
	Wed, 31 May 2017 15:56:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.148 with HTTP; Wed, 31 May 2017 15:56:02 -0700 (PDT)
In-Reply-To: <CAJ86T=U73sCUS8uPCRAe5X_c0o-b-ukp9oy0Xr=8=woV9X1TsQ@mail.gmail.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
	<CAJ86T=VS+ThYpfakL=oHDbDt9ogmoq4E6A95S0YVdxXNxfwRRg@mail.gmail.com>
	<CAP71WjwsNYDZZttAqUwxh0+=QkY6H7HVvLbvBXc-po6y6C77uA@mail.gmail.com>
	<CAJ86T=XDeMu5yAvqymWQ3Lbe+FDhLzGobyhx8SR6h9cVpX3OvA@mail.gmail.com>
	<CAP71WjyPL-ZsPnGDV_oq7rkWZpJCGNYyfvXQ9CVKNE6k3w9XJQ@mail.gmail.com>
	<CAJ86T=U73sCUS8uPCRAe5X_c0o-b-ukp9oy0Xr=8=woV9X1TsQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 31 May 2017 15:56:02 -0700
Message-ID: <CAJ86T=Xg7Mn_EPj-z3G6ezbHq_Yrp9R1j9Qdd5UTORUKWnYkdw@mail.gmail.com>
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
X-List-Received-Date: Wed, 31 May 2017 22:56:03 -0000
Content-Type: text/plain; charset="UTF-8"

 On Wed, May 31, 2017 at 3:04 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, May 31, 2017 at 3:26 AM, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> On Tue, May 30, 2017 at 11:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Tue, May 30, 2017 at 1:26 PM, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>>>> so, to backtrack a bit, i think it should be safe to only treat
>>>> vmlinux.gz as a 'special' case, and then it is there in
>>>> KERNEL_IMAGETYPE, then we do a "make vmlinux" and we manually compress
>>>> the file, otherwise we just trust that KERNEL_IMAGETYPE is a valid
>>>> type and give it to kernel make command line.  that should be enough
>>>> to fix the Image.gz cases on all platforms where it's relevant (like
>>>> arm).
>>>
>>> That sounds reasonable.
>>
>> I've been playing with this today, and that *seems* to work fine. At
>> least I can still build vmlinux, vmlinux.gz and it fixes the  build of
>> Image.gz as well..
>>
>> I would appreciate some feedback on this one. I can then send a proper
>> patch. Could that break badly for anyone?
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 7a134d5c29..459b6d66a3 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -44,7 +44,10 @@ python __anonymous () {
>>          types = (alttype + ' ' + types).strip()
>>      d.setVar('KERNEL_IMAGETYPES', types)
>>
>> -    typeformake = re.sub(r'\.gz', '', types)
>> +    # some commonly used kernel images aren't generated by the kernel
>> build system, such as vmlinux.gz
>> +    # typeformake lists only valid kernel make targets, and post
>> processing can be done after the kernel
>> +    # is built (such as using gzip to compress vmlinux)
>> +    typeformake = re.sub(r'vmlinux\.gz', 'vmlinux', types)
>>      d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
>>
>>      for type in types.split():
>>
>
> Looks good to me. Below is a version which takes the cleanup slightly
> further (it will no doubt get mangled since I'm copying and pasting
> into gmail, but maybe gives some more ideas for the final patch).
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 8954b28..264d5b7 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -32,8 +32,6 @@ KERNEL_VERSION_PKG_NAME =
> "${@legitimize_package_name(d.getVar('KERNEL_VERSION')
>  KERNEL_VERSION_PKG_NAME[vardepvalue] = "${LINUX_VERSION}"
>
>  python __anonymous () {
> -    import re
> -
>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
>      type = d.getVar('KERNEL_IMAGETYPE') or ""
>      alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
> @@ -44,7 +42,13 @@ python __anonymous () {
>          types = (alttype + ' ' + types).strip()
>      d.setVar('KERNEL_IMAGETYPES', types)
>
> -    typeformake = re.sub(r'\.gz', '', types)
> +    # Almost all commonly used kernel images are generated by the kernel build
> +    # system directly. However some, such as vmlinux.gz, are created as special
> +    # cases by post-processing steps in kernel_do_compile() and
> should therefore
> +    # not be included in typeformake.
> +
> +    typeformake = types.replace('vmlinux.gz', '').strip()

Unfortunately this doesn't work if "vmlinux" isn't already included in
KERNEL_IMAGETYPES etc, so we either need to search and replace as
before, or add something like:

    typeformake = types
    if 'vmlinux.gz' in types.split():
        typeformake = typeformake.replace('vmlinux.gz', '').strip()
        if 'vmlinux' not in typeformake.split():
            typeformake = typeformake + ' vmlinux'

which is a little more complex, but has the advantage of not risking
duplicating "vmlinux" in typeformake, and therefore not calling "make
vmlinux" twice in kernel_do_compile(), which I guess we sometimes do
now...

> +
>      d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
>
>      for type in types.split():
> @@ -266,14 +270,11 @@ kernel_do_compile() {
>         fi
>         for typeformake in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
>                 oe_runmake ${typeformake} CC="${KERNEL_CC}"
> LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
> -               for type in ${KERNEL_IMAGETYPES} ; do
> -                       if test "${typeformake}.gz" = "${type}"; then
> -                               mkdir -p "${KERNEL_OUTPUT_DIR}"
> -                               gzip -9c < "${typeformake}" >
> "${KERNEL_OUTPUT_DIR}/${type}"
> -                               break;
> -                       fi
> -               done
>         done
> +       if (echo "${KERNEL_IMAGETYPES}" | grep -wq "vmlinux\.gz"); then
> +               mkdir -p "${KERNEL_OUTPUT_DIR}"
> +               gzip -9c < ${B}/vmlinux > "${KERNEL_OUTPUT_DIR}/vmlinux.gz"
> +       fi
>  }
>
>  do_compile_kernelmodules() {

