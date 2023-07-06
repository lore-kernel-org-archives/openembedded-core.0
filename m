Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840F4C0015E
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 09:47:59 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.18206.1688636878564430384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 02:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Bhufq/G5;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so6526141fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688636876; x=1691228876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IOb67WAbAK/YzUnfcFiujBWVNEz0B99iquMKCy2UJoA=;
        b=Bhufq/G5QY2kHAhlQI5zf7zngxz+QgbJ+DBtGCabihOFZVUD7cvAueIFf8gk4gLu+O
         1nJnsdnX7eEhgDlwnOLDJgbWOHXaqyRuXMH8t3iv8qYUa2s/3kwkTqCjAgUqQ5gtENRk
         ylqgswnLwEw6Ea4WTPNm4PECTpWBaOkej1/kIbT6MEvlRdozLAViYwFQWWYB4NZMit4X
         SJMtDl+zJdbfbpieH5JBx/ue5j8b3tUlPEKYW9s0HEHQijD0nIDn/dNEVC/lcJ62Kaub
         EaN0Zd6NeEo++1KABmny09To1rIBY2TKoDDXgwF1WESzcYh66AnmVebTpWVqkLDgk7AZ
         hvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688636876; x=1691228876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOb67WAbAK/YzUnfcFiujBWVNEz0B99iquMKCy2UJoA=;
        b=A+XYUTKKYM3L9zBzuDlA0FkwYZypcFpMXnRcwhpB5UNUrMCtlok8tu7C6vhHxDR80a
         IzqybDQYT8RkeZPeReQgj+dNtpXAKCWcJKtoW/DP6IBXC83GzyR24RR8H5oILcadg+I8
         6IIVuev4fGPSTmFedJUReXx/VrzRpbt3iRy7F2k6MvEr4SZbcTrUFXpdkRHifRGJviJK
         9JYe+mEYtUqRFpn5MPiqFA7li2mKpI2iDRRH8tVNM1+pzOrN65NvdXLQKBMlkFJo7sq4
         F2Em48d28L8+Vakfp9kTjartKRXhXBgNVvQgaq63RTla4QUABlLygAMtrvGg4B+MKzIC
         cVsQ==
X-Gm-Message-State: ABy/qLZ8lAjfMaEnx1Z4N/YRCjvWuovpoDwahZmWwo2nlDGhSJGhDAq/
	4w+vvN1tz+/nSBsrsxOQcViKNn5Wps3b7BlVrJU=
X-Google-Smtp-Source: APBJJlEYp3fpMAIq2EEPljBBeFlTcnxyNtG2ns1Tp8bGx0vxesxi0o+d1y9RQUn34iUAMiHyyD65ng0dVcvWDzfbecg=
X-Received: by 2002:a2e:3204:0:b0:2b6:d8ea:6650 with SMTP id
 y4-20020a2e3204000000b002b6d8ea6650mr897497ljy.27.1688636876305; Thu, 06 Jul
 2023 02:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230706092806.507075-1-jstephan@baylibre.com> <20230706092806.507075-2-jstephan@baylibre.com>
In-Reply-To: <20230706092806.507075-2-jstephan@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Jul 2023 11:47:45 +0200
Message-ID: <CANNYZj8kizDEJMMuf4Bvn5yuyW2cej9HphjDOtm1RVg1Uefe3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] less: switch to github URI
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 09:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183922

I have to say no to this I'm afraid. Less has a weird version scheme
where beta releases are mixed in with final releases, and there's no
way to tell from git tags which is which. We have argued with them
about it, and they couldn't be convinced, except that tarballs now
have -beta suffix if they're beta:

http://www.greenwoodsoftware.com/less/download.html

Let's postpone this until tests are bundled into tarballs.

Alex

On Thu, 6 Jul 2023 at 11:28, Julien Stephan <jstephan@baylibre.com> wrote:
>
> as of today, release tarballs are fetched from [1] but the less test code is not
> bundled within these releases. A github issue has been opened asking for
> maintainer to bundle it [2]
>
> In order to add ptest for less, switch to github URI. This commit can be reverted
> if release tarballs from [1] bundle the test code in the future.
>
> [YOCTO #15073]
>
> [1]: http://www.greenwoodsoftware.com/
> [2]: https://github.com/gwsw/less/issues/344
>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  meta/recipes-extended/less/less_633.bb | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-extended/less/less_633.bb b/meta/recipes-extended/less/less_633.bb
> index 2defb5ccb7a..e6535d16a78 100644
> --- a/meta/recipes-extended/less/less_633.bb
> +++ b/meta/recipes-extended/less/less_633.bb
> @@ -23,16 +23,23 @@ LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
>                      file://LICENSE;md5=1b2446f5c8632bf63a97d7a49750e1c6 \
>                      "
> -DEPENDS = "ncurses"
> +DEPENDS = "ncurses groff-native"
>
> -SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
> +SRC_URI = "git://github.com/gwsw/less.git;protocol=https;branch=master"
> +SRCREV = "0d7ca880375bde651313f03f7115d26921b43722"
>
> -SRC_URI[sha256sum] = "2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f"
> -
> -UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
> +S = "${WORKDIR}/git"
>
>  inherit autotools update-alternatives
>
> +# According to the README of the project when getting code from git we should run
> +# the following command before running the configure script
> +do_configure:prepend () {
> +        cd ${S}
> +        make -f Makefile.aut distfiles
> +        cd -
> +}
> +
>  do_install () {
>          oe_runmake 'bindir=${D}${bindir}' 'mandir=${D}${mandir}' install
>  }
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183920): https://lists.openembedded.org/g/openembedded-core/message/183920
> Mute This Topic: https://lists.openembedded.org/mt/99982300/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

