Return-Path: <nathan@nathanrossi.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8A277B1A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:43:09 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id r5so1634487qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fg+KF4v7NCv9mFYOoF8EnoY2TRdWE9Nu1Q3JGhmbBME=;
	b=SBHDYhKOPfXQQV/U55cf/f7+Brn2uV6q3McyN4/gX/jO2jwKIw3cF17kpuvZcaWhLo
	O3q+thCkv2ADFP56OT6AKWUn8Mg0lG9U8g04F0azNXj6SO6NMEUXJ/FTCZpNZv4PqMGa
	pwkepXPTVEMis+bs/5fqNNoIolU5MErQmhKMsaeQruJEKxrgQ0DLUWLcoiF+y3RYfwAp
	q90ZDaLuTz7xypILKG91tMH6I3VpiWhvdY8zW5/THbsvvJaKEB9YegFvEDWQmR3NmGOE
	UjXtTKqHUYFigYTKbsCVTXNJrpFx0kkUa5DaJNDB9aA71Dq1PmSTt3rHyaiE5M3qjUEI
	Jeqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fg+KF4v7NCv9mFYOoF8EnoY2TRdWE9Nu1Q3JGhmbBME=;
	b=oFqkq48g2tadTso2V2MNA01zS3kqcdhGF8vUfRCM6GnsbpFxKrFqh/qsw1oHMZx6cG
	QWJ7YxLcZBtM6u02axow930GbT8LV+6EJXiNwiOKwqXbUkM7yJBtevbaSjObdDL1qi69
	UhvIBPYdFV4O88WjD5Tj66MqXlUHGnvgpYQUU+y706eawG7GvwULL2OPrAQcHIW/HmYm
	G4rCd8RhmTfIbiLEqtFPEJpjhPOpGS5MUyuxV9xH/77mEw2eQ2YETtsiEb5XdzcaSqwL
	Srzdhh4VfYVVmccKx5pLk5L74nqPeBVr9M/ou7wMK/Vr+i1QNiY+kZqBSdT7njqKMlsO
	7L3w==
X-Gm-Message-State: AFeK/H3XF5wwHEiq05oKuDu3kCgdGoPgDAnM+tWvrpMg2fqTFKgvzBQkomVQUiGYxT34PUz5KWC/gT+uGRkwHg==
X-Received: by 10.200.47.47 with SMTP id j44mr31367494qta.244.1491399791177;
	Wed, 05 Apr 2017 06:43:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.134.130 with HTTP; Wed, 5 Apr 2017 06:43:10 -0700 (PDT)
In-Reply-To: <1491391320.17200.8.camel@linuxfoundation.org>
References: <cover.1490850708.git.Qi.Chen@windriver.com>
	<d6b2737e706f743644df63f21a8f061b9e2f83c7.1490850708.git.Qi.Chen@windriver.com>
	<CA+aJhH1JjWONYpOFi8S4QsDzUdfoPSJS_0FZf=5dQTm-O_4wEQ@mail.gmail.com>
	<1491391320.17200.8.camel@linuxfoundation.org>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 5 Apr 2017 23:43:10 +1000
Message-ID: <CA+aJhH35gLeUW0McW3y37HwFzFv0RB-wd+9+42JGnz9YPrbM0Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.inc/qemu.inc: preserve directories to be used by runqemu
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
X-List-Received-Date: Wed, 05 Apr 2017 13:43:10 -0000
Content-Type: text/plain; charset=UTF-8

On 5 April 2017 at 21:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2017-04-05 at 20:06 +1000, Nathan Rossi wrote:
>> On 30 March 2017 at 15:12, Chen Qi <Qi.Chen@windriver.com> wrote:
>> >
>> > The 'recipe-sysroot' and 'recipe-sysroot-native' directories need
>> > to
>> > be preserved for runqemu to work correctly. Otherwise, when
>> > 'rm_work'
>> > is enabled, these directories are removed, thus causing errors when
>> > using runqemu .
>> >
>> > [YOCTO #11266]
>> > [YOCTO #11193]
>> >
>> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> > ---
>> >  meta/classes/image.bbclass         | 1 +
>> >  meta/conf/machine/include/qemu.inc | 3 +++
>> >  2 files changed, 4 insertions(+)
>> >
>> > diff --git a/meta/classes/image.bbclass
>> > b/meta/classes/image.bbclass
>> > index 405fd73..cac3a5f 100644
>> > --- a/meta/classes/image.bbclass
>> > +++ b/meta/classes/image.bbclass
>> > @@ -8,6 +8,7 @@ inherit ${SDKEXTCLASS}
>> >  TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
>> >  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY +=
>> > "${PACKAGE_INSTALL_ATTEMPTONLY}"
>> >  POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks;
>> > "
>> > +RM_WORK_EXCLUDE_ITEMS_append = " ${IMAGE_RM_WORK_EXCLUDE_ITEMS}"
>> >
>> >  LICENSE = "MIT"
>> >  PACKAGES = ""
>> > diff --git a/meta/conf/machine/include/qemu.inc
>> > b/meta/conf/machine/include/qemu.inc
>> > index 0e4103b..8345c08 100644
>> > --- a/meta/conf/machine/include/qemu.inc
>> > +++ b/meta/conf/machine/include/qemu.inc
>> > @@ -29,3 +29,6 @@ KERNEL_FEATURES_append_pn-linux-yocto = "
>> > features/nfsd/nfsd-enable.scc"
>> >  MACHINE_EXTRA_RRECOMMENDS += "rng-tools"
>> >
>> >  IMAGE_CLASSES += "qemuboot"
>> > +
>> > +# These two directories need to be preserved for runqemu to work
>> > well
>> > +IMAGE_RM_WORK_EXCLUDE_ITEMS = "recipe-sysroot recipe-sysroot-
>> > native"
>> Should this be setup by qemuboot.bbclass instead, so that it applies
>> to any image/machine (even those that do not use qemu.inc) that is
>> intended to be used by runqemu?
>
> I'm trying to decide what the best approach here is. I'm thinking it
> might be better to:
>
> a) make qemu builds depend on qemu-helper-native
> b) make that preserve its native sysroot (not the target one).
> c) have runqemu look at qemu-helper-native
>
> I think that should solve problems and work better than the above?

That sounds like a good solution.

This would however change how meta-xilinx would need to handle
providing an additional version of QEMU (for which it currently sets
EXTRA_IMAGEDEPENDS, and subdirs the native binaries). But this change
means that the custom QEMU version would be built for all QEMU targets
(when the layer is used), although this is something that should be
sorted out with runqemu now that it can be given a different sysroot
(and a different sysroot can be built alongside). This would remove
the need for the workarounds that were used to get runqemu to use the
alternative QEMU in the first place. So your proposed solution works
better in that regard as well (as meta-xilinx could provide an
alternate qemu-helper-native for those qemu machines that use it).

Regards,
Nathan

