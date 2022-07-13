Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF579C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 14:03:36 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.22313.1657721012061147276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 07:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X/V2QTeP;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: festevam@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso3802374pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5XMFMyyA6cbUDOkcMFyOAINYHl/qvSnx+7I4vZGxyE8=;
        b=X/V2QTeP0KbZSQTOtJwvhMK8KT3mkJp7Uo2jqdYsmx2xz1NA/nep25eOI1CjzGFx+R
         PzEl9SUaWie/vdmOTh+jxh3SwbRrm5FDBQSf3bHMRJe6I8y6f9MxgTmwCrpxCWayAUEH
         /7iw0g4F7+q1mrEghdQ+5QhXo98o7iINQQ6PQdUrkax4EYzrhoS4HhKqp5CVkL86ZD9e
         jZED28W0InMESrGW2KOobe31fIFoQAhzCxk4v06CEPAXPuJx9pLMfQAPuVKyOLbhU1Ph
         ZY6ai3jnI7QbIlLwCqEEBzLHmkiFLGBv+k8eWKgvv1/KH8C/JR8jM1tN+HAzipAGjwf2
         kN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5XMFMyyA6cbUDOkcMFyOAINYHl/qvSnx+7I4vZGxyE8=;
        b=0I17ArKUO9v1bLjOaVwo8u1NLQWvbXP0kIbJjejLcSmRdkjPkBDrw24/IAvmRSFOwb
         e7XTbTsNRYQSZB9DhmDMhhDEgMvMeGRNiSHdBHGytrPXFqgO4dbuZWji0gyG3izbRlt3
         yevoMo9FTJ54L9IXnFNVv+wpkxMtUlgz0puBz9px4G835okmK02BirgwfHBauOlTRxJF
         8tnI1rgcF6BLpLQHvVAXir7p0O2+R7PPCo+rhL9xziTRJ7+3sDJVJ5EgjfkASpkghBnn
         o9NCgLGXJrvxZATdi5Jl4hAx/CNwjH2Pe/HAaZSgldTDvfnB/uqgxmqsIucIjT+/KFEi
         +E+Q==
X-Gm-Message-State: AJIora9mZhtM9VnkdLjJrEFPBVdJzu25A5un2z9g6YdJCITmN9vkuq6n
	z6lOAf6z1RhDee11BSXcyK6sFNsAewa1pfgDBaQ=
X-Google-Smtp-Source: 
 AGRyM1vjS6hfXAbN6PT2aR6R3UyIeN+YUmQO5e+9UV+O/0WILgBFKSzAcXMFGmAJ/FaLoT7x92Jc1navut5yQa0GvA0=
X-Received: by 2002:a17:902:ce86:b0:16c:8a4e:746a with SMTP id
 f6-20020a170902ce8600b0016c8a4e746amr1563256plg.168.1657721011157; Wed, 13
 Jul 2022 07:03:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220712151730.10465-1-sakib.sajal@windriver.com>
 <Ys50UcQEs9EzTimU@mail.local>
In-Reply-To: <Ys50UcQEs9EzTimU@mail.local>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Jul 2022 11:03:19 -0300
Message-ID: 
 <CAOMZO5AVAhvb5nsgXhX0AV6vrZmqT6MFHuvpoYyT7rQz+ehE3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][V2] u-boot: upgrade 2022.04 -> 2022.07
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
	oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 14:03:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167958

Hi Alexandre and Sakib,

On Wed, Jul 13, 2022 at 4:29 AM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:

> | /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/core2-6=
4-poky-linux/u-boot-tools/1_2022.07-r0/git/scripts/dtc/pylibfdt/setup.py:21=
: DeprecationWarning: The distutils package is deprecated and slated for re=
moval in Python 3.12. Use setuptools or check PEP 632 for potential alterna=
tives
> |   from distutils.core import setup, Extension
> | error: command 'swig' failed: No such file or directory

Does the change below fix the build problem?

--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "U-Boot bootloader tools"
-DEPENDS +=3D "gnutls openssl util-linux"
+DEPENDS +=3D "gnutls openssl util-linux swig-native"

 PROVIDES =3D "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
 PROVIDES:class-native =3D "u-boot-mkimage-native u-boot-mkenvimage-native"

