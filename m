Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE006061F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:45:31 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c26so2631983eds.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Fs223h9ld0S9dJtJ/Yh4oGod1uZBqNla4AcO1n4SZE=;
	b=XNGETiCQ763jVlgVWcyiYynwU0jOUjiqH/cAtx5zAx42W5l5VuFihzLrRwwvmN1Z9G
	VU68/YUWT8W110iXVDGcfeJ1xI0rkPVWUzjbVNd/tWKsCXAddunTBwrvwrTfUe/EiBtd
	bKnPVmQL/JI10TZIXb8j2bnYueuj5bRa5a7wXjA3kjfm8k3RP6H6yYSJJ/U807CAUTXl
	mQ1ginZwJxf1ydSoG1qoyK0BRH/q2h5k282faGpCGwWGlrxkk/jZff60IQPXnEUB+dLT
	GMTZCVy+dqUUv2WYv3s1E44waiBGlu9paOYonP8YzM6FQx2hENXKXDwQb/4eSQzZC9Q1
	mXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Fs223h9ld0S9dJtJ/Yh4oGod1uZBqNla4AcO1n4SZE=;
	b=mqFnrjBx9hNO66y0182XFasdsOt8mFNg8cn44g0G0+fI7s27rRW6JZoQ5f9SFR3Tzq
	Reld4Rp2pW1hoObR1S960VuayPsn8yuZFN6QmNxJN40sO5s4FmCs1cLCRrfs5IuEC3Ld
	Xx4dYdVX50SYhrebJuIz8lU33NdvhP9hxdcs3slHeNyZ4Rc9wZt3R0DRgZnsCOmNv/Q4
	q7LByQSX3V7KU7WT5QLH8HJfwN1tlIEGoT0SevWCWzokkbY5k96sIOjq0btgFolQIMNj
	Dk1r5Fb1IVsAryjDqoBsOJz8y2nWJ0cMygAPcCiSWpTerzEMuLGwybLVEZJodFoHSZOD
	Bs2g==
X-Gm-Message-State: APjAAAWenM4TVBUNN4nMu21JYLw/lqoagI8Vu6MXLYe4gqOkgMlmSIt8
	sf/7RVSLjh8nO4lMWixmIIIPpHa6qVCE49j2Ddw=
X-Google-Smtp-Source: APXvYqzsX5hrNwWA373NGonMnNojq9ytFKdWaCzKddk+aC79+81yQdLln5I/nTruYC4COHEIDsi8S0fdOiQF5UZbvik=
X-Received: by 2002:a17:906:20c5:: with SMTP id
	c5mr8562634ejc.330.1581086731937; 
	Fri, 07 Feb 2020 06:45:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581010425.git.bruce.ashfield@gmail.com>
	<fc9272a1b06a8efeb155b229967eb25ef4dff7c9.1581010425.git.bruce.ashfield@gmail.com>
	<CA+chaQcEQUrMQDb=TZCy5NJnP7wz1J_mxnty68-wOTD4B=1AEQ@mail.gmail.com>
In-Reply-To: <CA+chaQcEQUrMQDb=TZCy5NJnP7wz1J_mxnty68-wOTD4B=1AEQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 7 Feb 2020 09:45:21 -0500
Message-ID: <CADkTA4NuBR=ZVv-ypvbWd6p=wh0Km5_hrxZ47C-f7JKaz_YDGQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] kern-tools: fix merge_config when LD contains parameters
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
X-List-Received-Date: Fri, 07 Feb 2020 14:45:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 9:20 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> With the LD="${KERNEL_LD}" removed here, the build with ld-is-gold doesn't work anymore again.
>
> Why did you remove it?

I removed it by mistake, and fixed it .. but apparently sent the wrong
version of the patch.

I'll send a v2 shortly!

Bruce

>
> On Thu, Feb 6, 2020 at 6:37 PM <bruce.ashfield@gmail.com> wrote:
>>
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> To ensure that the kernel linker is used when allno/mod/yes config
>> merge_config steps were executed, the call to make was tweaked to
>> explicitly pass LD.
>>
>> But since the variable wasn't quoted, any parameters to LD (like
>> the sysroot) were mistakenly passed to make, and hence could trigger
>> an error on some architectures.
>>
>> We also tweak the logging to hightlight errors like this in the
>> future and avoid losing it in the noise of merge configs sometimes
>> overly verbose output.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass                      | 10 +++++++---
>>  .../recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
>>  2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
>> index 918d101d3d..31ea42580c 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -352,10 +352,14 @@ do_kernel_configme() {
>>                 bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
>>         fi
>>
>> -       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs}
>> -
>> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
>>         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
>> -               bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
>> +               bberror "Could not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}"
>> +               if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
>> +                       bbfatal_log "`cat ${meta_dir}/cfg/merge_config_build.log`"
>> +               else
>> +                       bbfatal_log "Details can be found at: ${S}/${meta_dir}/cfg/merge_config_build.log"
>> +               fi
>>         fi
>>
>>         if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index f263421234..4f1af731d6 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
>>
>>  DEPENDS = "git-native"
>>
>> -SRCREV = "388b67974deb2176c06994a325676cbf23e5fce8"
>> +SRCREV = "c66833e1caac25279a5052fceb13213f5e4f79f9"
>>  PR = "r12"
>>  PV = "0.2+git${SRCPV}"
>>
>> --
>> 2.19.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

