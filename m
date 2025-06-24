Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FC2C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 13:48:49 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.8807.1750772923768512187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 06:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFOF2ITB;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso4752026d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 06:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750772923; x=1751377723; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DiYvudmU9sJEPV8kCiLpILo0UHaL243XDIc+IFPhH2o=;
        b=AFOF2ITBFC2Lo6AHeOZT0hwuNFRLooC+08zEtne5TuvX0dVjUSgJ6B4s9wWpsnm2sV
         VFtk4YSb6q8lo+SW4c+HUCUxUnAdN67JhwLyNz0+FFRrBIiUaeJJ2Ero7mS0Oiw+pJo/
         PMpnTgaifhpZUnOsu6zDKaxf9CoSMUcGQQujFjAtEw+EJxdA/XSyA+54K6QldT+plWlr
         Z1/HSKj687Tcwk6GIifkSI37/7/J8mHd3dzH0IXqv784zAkW1kUSx+46R3oZssvm3KQS
         UOtRw+hNIv0+LB5YBjX4sKN8lgx3rcJ6TP2Qh09eZl7g8XOqWq5gquTR+eemgRaEW6Gy
         WM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772923; x=1751377723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiYvudmU9sJEPV8kCiLpILo0UHaL243XDIc+IFPhH2o=;
        b=n8nX1NkqsyhNzA6ipicP2RgOjJIU/lbVr2LDImwzv/HtnJLmOBXnm+tBiISaCAcGCv
         Qb5Yl3ZkMtPjN/YjgNdpbWfkTOSdR9L7y9iUP1NjW3mj0iKkJIJc17JB/cEGosmkNY7H
         KMdQEsGfNM3CPYRCZnyh7s46E+7mau+MCR6LJ+pfAFeT27MJSMrWDanACtW4eKZxW1Ox
         PeN6rKMyXRNRBuSiYhIy4bJxDItfPhJjmnacTLqyPBN8neU8qaMcs7BGe49H8kVWTnb7
         gwPbyMf1/aXFVHVkydFzkZ/KfuJ9y1vR0bzdxs7A5snnP5oYbZjma6L4mU9VffcEjNzY
         +fcQ==
X-Gm-Message-State: AOJu0YxKwEwedWNf6p8Qzv8LUUIMbQYsbQP/UhGUsP7tRoOIvLFgXp2Y
	xCSHHyIBqW6uN8/ICSDSt03cHIomzzTbceYXdilWO2Z31sDgtxvqgFFinTzaC7DXLA7v4Dg8T1K
	gUyYIcl85l4d9W/V6Jyqf+D+lvgs1tyRG7A==
X-Gm-Gg: ASbGncskBn5ntrZPLzyi8yvl0rLQIgwfaRvBiBvHv+uJwkewaDAda7LWgNquvncMKrd
	zVFJ9PvAOI4uzFxMsBTxXnKLsU/1d74F9XCrZPsXhjujdgt5AyJiMYyX78MAsxgXwKNS5zpHiJC
	Ql78LveovF3bIaEYopw71AyCqOUgclWqSLDOD9qoSg1oiDsbvy4SvvVW8TV6+cb1yheQ3/dn5bj
	L+TQdxbl4PLsKxd
X-Google-Smtp-Source: AGHT+IGe4FtF+oLThxH8TkKpACRFAjw4jyzDMfmhKgacXODHh7dORJk1FHrQs9hVIOAfGC13tShxS8KmN39P6nfE8qc=
X-Received: by 2002:a05:6214:1d24:b0:6fa:be7e:c0be with SMTP id
 6a1803df08f44-6fd0a5b1b4cmr305322086d6.34.1750772922726; Tue, 24 Jun 2025
 06:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250404154702.441150-1-mikko.rapeli@linaro.org> <20250404154702.441150-2-mikko.rapeli@linaro.org>
In-Reply-To: <20250404154702.441150-2-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Jun 2025 15:48:31 +0200
X-Gm-Features: Ac12FXwznEcqvsvbdJ0vYiKrzfJi8i7PKJ3L5ozeHt0eoDdp5cshrHN0SA4aJ64
Message-ID: <CANNYZj_6+9PkRrddeKd6mbgix_c4UaKRXdJHNakyA=z6=-kCcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] selftest pokybleeding.py: add test for poky-bleeding.bbclass
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 13:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219268

This was added to meta-yocto repository, rather than oe-core, by
mistake I believe.

I'll send a correction.

Alex

On Fri, 4 Apr 2025 at 17:47, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> The class sets SRCREV to AUTOINC for recipes with single
> or multiple repositories. Test those cases.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/selftest/cases/pokybleeding.py | 32 ++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/pokybleeding.py
>
> diff --git a/meta/lib/oeqa/selftest/cases/pokybleeding.py b/meta/lib/oeqa/selftest/cases/pokybleeding.py
> new file mode 100644
> index 0000000000..dc12f761b9
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/pokybleeding.py
> @@ -0,0 +1,32 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.utils.commands import bitbake, get_bb_var
> +from oeqa.selftest.case import OESelftestTestCase
> +
> +class PokyBleeding(OESelftestTestCase):
> +
> +    def test_poky_bleeding_autorev(self):
> +        """
> +        Test that poky-bleeding.bbclass sets SRCREV to "AUTOINC" for recipe
> +        with a single scm in SRC_URI and for recipe with two scm's in SRC_URI.
> +        """
> +
> +        self.assertNotEqual( get_bb_var('SRCREV', 'mtd-utils-selftest'), "AUTOINC")
> +
> +        self.assertNotEqual( get_bb_var('SRCREV', 'hello-rs'), "AUTOINC")
> +        self.assertNotEqual( get_bb_var('SRCREV_hello-lib', 'hello-rs'), "AUTOINC")
> +
> +        features = '''
> +INHERIT += "poky-bleeding"
> +POKY_AUTOREV_RECIPES = "hello-rs mtd-utils-selftest"
> +'''
> +        self.write_config(features)
> +
> +        self.assertEqual( get_bb_var('SRCREV', 'mtd-utils-selftest'), "AUTOINC")
> +
> +        self.assertEqual( get_bb_var('SRCREV', 'hello-rs'), "AUTOINC")
> +        self.assertEqual( get_bb_var('SRCREV_hello-lib', 'hello-rs'), "AUTOINC")
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214350): https://lists.openembedded.org/g/openembedded-core/message/214350
> Mute This Topic: https://lists.openembedded.org/mt/112086625/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

