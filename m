Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DBEC43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 13:23:55 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.7366.1657286634822733989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gUfnzADp;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id o25so37718493ejm.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=05nv5AH66Lb9iMOCnT1L3H/n9/Rv/ol4fPQyNepPNLE=;
        b=gUfnzADpJ75sB88VSIpoOPfVlRGGV68RHQkNJzNZ2o4iVEorOdAmZq0DDF0Gp5gTVE
         ABwUdnCHA3iqbH9PEPJcd44Lv+WrY3XeIpzxX+F0TTNeyALLeHtKgs7GaJd1koSRzTNd
         c31lYiMgyd/JH/pZHJ3z5uZkaBsP4H5gw9b9v2aNDSPk0+AuQfZdUUswcvADksYDLpfz
         DiYJZuikbpFcczrgpWhGEuHxh18NElbw0PN0LIMwOVv/9R/ZazUBaIvvrVNSUut8gDgP
         ZbFkpIJg9vfpiGXYyIzVhzh2/emCbLjW0GGEaNQR/Y4k0T2SYzaZaoeX3eAITta8hcvJ
         f49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=05nv5AH66Lb9iMOCnT1L3H/n9/Rv/ol4fPQyNepPNLE=;
        b=Rd/ktVNgQoVxPtweZfJWZTDBM/qoo+rPnKU19TPFt8X1fk68echbEiJW/2U0tzWal2
         gLWLxr1Kum0ltD81+t+OTPm7tRJd5HkULbjYn3jXFFvRE23+3etMmGn6wGNatLH5d1uP
         EOtn7w63erKaxIXwcivvLMrvPPlA2KaILV0wQEUGveMa5bYlVrD+OSpI6HlNCA7MavoA
         lFrm41Al7sWIr8xDDb7JN4of8WhPk1OLh5nXQbPXmhFgueX5bGVbh08Rbkukcci8SGNg
         fYd/oj7JTANSbutZ42YY28KStFNTW257PjTV7IFBZFG8fVv/NxJ0/0FffcVjiEIvmenW
         XhuQ==
X-Gm-Message-State: AJIora8KItUE2S5OGnX+L3XVHq2SI9ZjREGALAo+mn5bnvin6w6qtzNB
	bOAbMLXgj5S6ltxcTu7Fx9AIQWQpn22QJU+kTo4=
X-Google-Smtp-Source: 
 AGRyM1vOrItf7n+/XGsEhMXjC/SemisFsPCeFQFIpg7JiUyt6KKByyAHkbd5vE5QRYQtzj0BrlCO1u4PXCnYlQh2dyk=
X-Received: by 2002:a17:906:31d9:b0:726:a68b:b666 with SMTP id
 f25-20020a17090631d900b00726a68bb666mr3579569ejf.159.1657286633028; Fri, 08
 Jul 2022 06:23:53 -0700 (PDT)
MIME-Version: 1.0
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
In-Reply-To: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 8 Jul 2022 14:23:41 +0100
Message-ID: 
 <CAO5Uq5Tfj-CR=x1Haa71zeEAh3pY8vrVugfc1oC6ECkrQpG+-A@mail.gmail.com>
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 13:23:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167823

On Fri, Jul 8, 2022 at 12:07 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi All,
>
> We've made good progress and I appreciate the help from people. I ran a
> fresh build on the autobuilder and I forced it to rerun the QA checks
> for all recipes. The tricky bit about warnings is that they don't show
> up for objects from sstate and the addition of the buildpaths QA check
> doesn't cause the checks to rerun. Due to that a few more previsouly
> unseen issues cropped up.
>
> The list of issues now stands are:
>
> qemuppc:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428
> WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
>
> meta-arm:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2629
> stdio: WARNING: perl-5.36.0-r0 do_package_qa: QA Issue: File /usr/lib/perl/ptest/dist/threads-shared/Makefile.old in package perl-ptest contains reference to TMPDIR
>
> meta-gplv2:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/5460
> WARNING: bash-3.2.57-r0 do_package_qa: QA Issue: File /usr/bin/bashbug in package bash contains reference to TMPDIR [buildpaths]
> WARNING: tar-1.17-r3 do_package_qa: QA Issue: File /usr/src/debug/tar/1.17-r3/build/lib/string.h in package tar-src contains reference to TMPDIR
> WARNING: diffutils-2.8.1-r7.0 do_package_qa: QA Issue: File /usr/bin/diff.diffutils in package diffutils contains reference to TMPDIR [buildpaths]
> WARNING: findutils-4.2.31-r4 do_package_qa: QA Issue: File /usr/bin/updatedb in package findutils contains reference to TMPDIR [buildpaths]
> WARNING: mc-4.7.5.2-r3 do_package_qa: QA Issue: File /usr/libexec/mc/extfs.d/iso9660 in package mc-helpers contains reference to TMPDIR [buildpaths]
>
> There is a proposal on the oe-architecture list about simply disabling
> this layer going forward. The increased number of issues reinforces my
> view on that.
>

I tried explicitly building all the recipes in there, the list is even
longer and there's two which don't build at all (msmtp - can't find
the source, rxvt-unicode - compiler is too new). I agree, think it's
time for it to get retired.

> meta-virt:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/292
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/xen/boot/xen-shim in package xen-tools-shim contains reference to TMPDIR [buildpaths]
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/src/debug/xen-tools/4.16+stableAUTOINC+f265444922-r0/git/tools/libs/light/dsdt_pvh.c in package xen-tools-src contains reference to TMPDIR [buildpaths]
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.so.4.16.0 in package xen-tools-libxenlight contains reference to TMPDIR [buildpaths]
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/libxenlight.a in package xen-tools-staticdev contains reference to TMPDIR [buildpaths]
> WARNING: xen-tools-4.16+stableAUTOINC+f265444922-r0 do_package_qa: QA Issue: File /usr/lib/debug/usr/lib/xen/boot/xen-shim-syms in package xen-tools-dbg contains reference to TMPDIR [buildpaths]
>
> There is also still the lttng-modules issue if we enable .debug
> checking. I disabled that for these tests to reduce the noise.
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167819): https://lists.openembedded.org/g/openembedded-core/message/167819
> Mute This Topic: https://lists.openembedded.org/mt/92248896/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

