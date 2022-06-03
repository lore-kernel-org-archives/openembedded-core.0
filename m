Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912B2C43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 20:53:25 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.3307.1654289601988299145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 13:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z74guB8m;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id c8so6561056qtj.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 13:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7bjrvLH+PtmLHT2XsyrEZZdFHM64LvKAg9Qn6HcTqRk=;
        b=Z74guB8mT+djBZBl0V4765X010wytFBNMsLHwbnzUaXcQvXM22+NrtSNrfFABjcj5u
         hbmv0GOmicjmar9G6JQVLRJHmNv/TRJzMiPaMNrDEf54YLaaL7t7qhs8f3AnG1XwauQn
         j266SXdxwJswT6UWh04ONsbdJR/WENfHEkT0T5Z7xcLuUh3dQ3AugaYmbl62l+t40Vof
         svtXIojp1hrBpkuErZzLjVztYYtYau44VHNQGbtRRqNx2cGfzozNihz68se7IpwROFCo
         URaj+aKdOgP7UgS+oL/0KNKVZwZGohUX4CTv5f6O3bVFySSuE9uA4+NQvfNUprILvJAE
         E4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bjrvLH+PtmLHT2XsyrEZZdFHM64LvKAg9Qn6HcTqRk=;
        b=ENNpPDkkfLx+OFR7IFS2sSN49hpHwWrZJvlYywa66n+Z54gNWF+ieRAYr3wMXXN6hQ
         dmvPZ+PTL9dcrmTx8RTaN9c9L6bPsb6Dhwcvx6ZclFh03S1tTFn6XGlu3dROFVz6kj+Z
         +vaJW+b8GVYF3uMI5GOumX0OXKN5WoFzeJW3rietoDmLbFX3iRScUnP4Vidgz5DI/Rph
         0ngRyJ5zQHoVXRbzjx9KMVUvVr37c6oVb69/U/y9NHLp569mWF7UZXI8jD2N9zxRAc/F
         n+ql3x7P/rneKaySH1USxm1MCh6y6ibWl41/p+ufcgvnCeW6PGmv//aN892CIRZbq8c4
         zYPQ==
X-Gm-Message-State: AOAM533v4syhwTTK2+rfKjkqT3nWGgFD+/JXlqTw89NNT4T7czHitlG3
	7QotZDb8n3LgjjF835Imnf0lz7q7CBIBoTe6Itdzhf7vW/U=
X-Google-Smtp-Source: 
 ABdhPJz6IuD5H7eW8McH9UV9wEsqMJK+bFQC5BIb4vSsqROIp1Vi8zG90MSrHAhPSc6A+QvUDPSWDvVQW0yYnOjYDd0=
X-Received: by 2002:a05:622a:4c9:b0:304:b650:683d with SMTP id
 q9-20020a05622a04c900b00304b650683dmr9187021qtx.229.1654289601052; Fri, 03
 Jun 2022 13:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220603200317.385216-1-alex.stewart@ni.com>
 <CAMKF1srVLKrQ4m2u_yfDRi2vuXcHKVfjt3cvj9mbiu82_8J8JQ@mail.gmail.com>
 <a1dc7d51-e3fd-c70a-6eda-683525dc8104@ni.com>
In-Reply-To: <a1dc7d51-e3fd-c70a-6eda-683525dc8104@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jun 2022 13:52:55 -0700
Message-ID: 
 <CAMKF1srrGUa_BE7Fp_KBGS8qsVnJCDnttKynqfRY6aW=9nYxnQ@mail.gmail.com>
Subject: Re: Re: [OE-core] [PATCH] opkg: upgrade to version 0.6.0
To: Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 20:53:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166526

thanks may be add this info into commit msg too.

On Fri, Jun 3, 2022 at 1:45 PM Alex Stewart <alex.stewart@ni.com> wrote:
>
> Here are the release notes from 0.5.0 -> 0.6.0.
>
> http://downloads.yoctoproject.org/releases/opkg/opkg-0.6.0.release-notes
>
> ```
> Release Notes for opkg-0.6.0
> ====
>
> ### Changed
> - When using package signature verification, the signature file is now
> only downloaded when (a) it is not present in the local cache or (b) the
> package file must be downloaded again. This makes signature verification
> more reliable in cases where the connection to the package feed is
> unreliable, or stored on a removable device that is not always connected.
> - Package `pre-depends` are now recorded in the opkg `status` file.
> - Package `pre-depends` are now considered when removing packages. Opkg
> will now (correctly) fail, when the user asks to remove a package which
> is a pre-depends of another installed package.
> - libsolv will now return a solver error if the user asks to install a
> package which does not exist in the feeds.
> - The `opkg search` command now prints a newline character at the end of
> its output when the search path cannot be found - which looks a little
> nicer when using opkg interactively.
> ```
>
> I don't expect these changes to directly impact the normal OE build
> workflows. But they do resolve some corner-cases that yocto community
> members have brought up in the previous 6 months.
>
> On 6/3/22 15:30, Khem Raj wrote:
> > What major changes does this change bring
> >
> > On Fri, Jun 3, 2022 at 1:04 PM Alex Stewart <alex.stewart@ni.com> wrote:
> >
> >     Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> >     ---
> >      meta/recipes-devtools/opkg/{opkg_0.5.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyGRaxSW$>
> >     => opkg_0.6.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk519KcS6$>}
> >     | 2 +-
> >      1 file changed, 1 insertion(+), 1 deletion(-)
> >      rename meta/recipes-devtools/opkg/{opkg_0.5.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyGRaxSW$>
> >     => opkg_0.6.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk519KcS6$>}
> >     (96%)
> >
> >     diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyGRaxSW$>
> >     b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk519KcS6$>
> >     similarity index 96%
> >     rename from meta/recipes-devtools/opkg/opkg_0.5.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyGRaxSW$>
> >     rename to meta/recipes-devtools/opkg/opkg_0.6.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk519KcS6$>
> >     index
> >     e91d7250bc9f7fde73395335f008108578515b77..7b351e81231df48b2c493542a00d95911606248f
> >     100644
> >     --- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.5.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkyGRaxSW$>
> >     +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> >     <https://urldefense.com/v3/__http://opkg_0.6.0.bb__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk519KcS6$>
> >     @@ -18,7 +18,7 @@ SRC_URI =
> >     "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
> >     <https://urldefense.com/v3/__http://downloads.yoctoproject.org/releases/$*7BBPN*7D/$*7BBPN*7D-$*7BPV*7D.tar.gz__;JSUlJSUl!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrkxvKubIz$>
> >                 file://run-ptest \
> >      "
> >
> >     -SRC_URI[sha256sum] =
> >     "559c3e1b893abaa1dd473ce3a9a5f7dd3f60ceb6cd14caaef76ddf0f7721ad1c"
> >     +SRC_URI[sha256sum] =
> >     "56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c"
> >
> >      # This needs to be before ptest inherit, otherwise all ptest
> >     files end packaged
> >      # in libopkg package if OPKGLIBDIR == libdir, because default
> >     --
> >     2.36.1
> >
> >
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#166522):
> >     https://lists.openembedded.org/g/openembedded-core/message/166522
> >     <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/166522__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk4U_MoD4$>
> >     Mute This Topic:
> >     https://lists.openembedded.org/mt/91528903/1997914
> >     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/91528903/1997914__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk0VgFDB8$>
> >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-core/unsub
> >     <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!t7LQ5Tn2xfZcGCBb9Lo82Js_VL1kRRFZT1SGzcnDNu6rwrB6gpBuMnECUpqAP96zc8Kg8tRrk4RxujTf$>
> >     [raj.khem@gmail.com]
> >     -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>

