Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E8DC433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 14:42:00 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.6401.1668436916980456256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Nov 2022 06:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NX1wp19V;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id 13so28936356ejn.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 06:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xd1KYf40GIticDw3J4Zy4lMuXSjqN/hnDCDseeMurCU=;
        b=NX1wp19V9hmBwf2zmAPfUXWuXDDyS0WAB9oFGhUQe3KNZeSiSvhq5J/N0QmkXYEIp/
         cUotTZjKoH6TzJ8eMYDr8TkBpZKHGPW6YiX1523KH4DobMYCHPZMRyCDK4hvWz/bgJdP
         d2n3idtRdnq79bFI9HsZ/5MgXBAvKrK5ZHPE/BKbJxHWgzvzmgzvWUY8BG/Cy4sMmY8X
         1ivgJnWl7QQB/ui0047kunAzJRb4ZzertiGPPOTMQ++zXXbCuMfG/sgQO/6/jwbmn4s2
         q2LYwcJVZxh3DcujyfjPIMNV6dqaCOCttu1201o4ZP3Cr284QJYqQ1sy8Cb7TPvZDRjN
         ryrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xd1KYf40GIticDw3J4Zy4lMuXSjqN/hnDCDseeMurCU=;
        b=mx3ejiGcSa1z/e75m8wsiwFkRefI4pAIuqBrrBWNdI4KasKzR8GFuLQIIkRWr8a309
         qEnxJUXOiGq6MAu63i0ZdqEMabP0w4gHf0z5iILaWcg/gl+s45KFvqcdJgJOh/K3mLGc
         Hn00uHCbPLtV9cBgVALZ04FPgH1CO9UICfxSnFElm0aumUoiS+NxYRpUdlrKROHL/xxM
         Dei/yc9e4Q+uw/+25DqmRTaAmsKUCDdUpXaggmdC3lXmGdgokrnUXsdxvHGeUhJ3kf6I
         HSBP3Y3f4axg2wDbqXy8LbUbFkpBcv3RDBqqqu4M82rR4rBCVYuBoVAPh1rDcwLPsBZL
         v3IA==
X-Gm-Message-State: ANoB5pnBU9EzlxTgV8xIjcpFT0rmvdxPrTcHbIMqL0RvrRKRe2AoAGv7
	gcibj8WF0uW6S2vABIe7BSGl247PdSZAcloaR/so0ixxXugfVWce
X-Google-Smtp-Source: AA0mqf7JkRLe7NJcj62RbSldy/AAGQf/myPM6LhbD+nWL41CmjVo5/UGkSHJ1JJ4ydeLX/oJmdL7tdYD3CPHzzPivVc=
X-Received: by 2002:a17:906:b102:b0:7ae:129b:2ce7 with SMTP id
 u2-20020a170906b10200b007ae129b2ce7mr10151805ejy.92.1668436914865; Mon, 14
 Nov 2022 06:41:54 -0800 (PST)
MIME-Version: 1.0
References: <20221109011421.1257186-1-xiangyu.chen@eng.windriver.com>
 <CAOSpxdZBZdKoE-vZaz4fZoSz03ToKn-AQcEGF1G6rLgVAPF5YQ@mail.gmail.com> <0af62566-0fd0-e862-c3b5-401a17fa168e@windriver.com>
In-Reply-To: <0af62566-0fd0-e862-c3b5-401a17fa168e@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 14 Nov 2022 04:41:43 -1000
Message-ID: <CAOSpxdY1qjAgBAZBg_ejaU3txfBtptFmkgqKMcdW0RaGjo9c7A@mail.gmail.com>
Subject: Re: [OE-Core][kirkstone][PATCH] lttng-tools: Upgrade 2.13.4 -> 2.13.8
To: xiangyu.chen@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Nov 2022 14:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173245

On Sun, Nov 13, 2022 at 4:17 PM <xiangyu.chen@eng.windriver.com> wrote:
>
>
> On 11/11/22 22:34, Steve Sakoman wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and know the content is safe.
> >
> > Master branch is currently at 2.13.7, so you will need to submit the
> > version bump to 2.13.8 for master first.  I will then cherry-pick the
> > version bumps to langdale and kirkstone.
> >
> > Thanks!
> >
> > Steve
>
> Hi Steve,
>
>
> The lttng-tools on master already upgraded to 2.13.8
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb

You are correct of course :-)  I was mistakenly looking at the version
of lttng-modules when reviewing!

I did try this lttng-tools update previously and encountered ptest issues:

https://lists.openembedded.org/g/openembedded-core/message/172187

If you could fix this I'd be able to take the patch.

Thanks for your help!

Steve

> > On Tue, Nov 8, 2022 at 3:14 PM Xiangyu Chen
> > <xiangyu.chen@eng.windriver.com> wrote:
> >> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>
> >> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> >> ---
> >>   .../{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}  | 11 +++++++++--
> >>   1 file changed, 9 insertions(+), 2 deletions(-)
> >>   rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (90%)
> >>
> >> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> >> similarity index 90%
> >> rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> >> rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> >> index 0ea4da05ce..a814eb79f9 100644
> >> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> >> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> >> @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
> >>              file://disable-tests.patch \
> >>              "
> >>
> >> -SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
> >> +SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
> >>
> >>   inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
> >>
> >> @@ -113,7 +113,7 @@ do_install_ptest () {
> >>           for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
> >>               cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
> >>               case $f in
> >> -                *.so|userspace-probe-elf-binary)
> >> +                *.so|userspace-probe-elf-*)
> >>                       install -d ${D}${PTEST_PATH}/tests/$d/
> >>                       ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
> >>                       # Remove any rpath/runpath to pass QA check.
> >> @@ -124,6 +124,7 @@ do_install_ptest () {
> >>       done
> >>
> >>       chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
> >> +    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
> >>       chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
> >>       chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
> >>
> >> @@ -185,4 +186,10 @@ do_install_ptest () {
> >>   INHIBIT_PACKAGE_STRIP_FILES = "\
> >>       ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
> >>       ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
> >> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary \
> >> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/.libs/userspace-probe-elf-cxx-binary \
> >> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/gen-syscall-events \
> >> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/.libs/gen-syscall-events \
> >> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack \
> >> +    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/.libs/gen-syscall-events-callstack \
> >>       "
> >> --
> >> 2.34.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#173006): https://lists.openembedded.org/g/openembedded-core/message/173006
> >> Mute This Topic: https://lists.openembedded.org/mt/94904524/3620601
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>

