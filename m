Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81263C4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:27:43 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.8438.1705393657258347874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iD4NfeC3;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e7ddd999bso10504242e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393655; x=1705998455; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1dMsj6mwlXdC5SGh16n9AFuFBhSbg2LERzNAQf2pnHI=;
        b=iD4NfeC39228ry5gZcREdlFS5bpSPJmg01NaAubgppEXYf3gKL1oqICeMDak7C1jnC
         9xbV/RAKxIIJSRzk/j+HmUZavYSD2j4rkWuBxD9+yASHM+4bkka9ei5PwxLE+PhOqApo
         ePj+cbrbPxGW3neJKzgPvR6eKrEjeQI0wMs1Yt8SWNaojMG3uCojgd8F++W3/Qb9DGpj
         V+DIvLbAQaZtSLjExjWKoxj3YfqGCwVuAhsDeR3B6cWd2jR61RloW1tTVKGnP0eNhwuR
         hyAtsOVBy7xAI9XV2kfo+cbklTpSUJIJoc7R65T/cz0kBcbEsMAj7XFwK+vlPhMvIJvd
         oAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393655; x=1705998455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dMsj6mwlXdC5SGh16n9AFuFBhSbg2LERzNAQf2pnHI=;
        b=VVBB5Ty2V9RF77JYqnlY+RP0Nk31HhHyyNHRGQ/Fisg6XSJhYwVD88FK9VTI134uT8
         dN77lJUvvdZIWu3fMJqkUDemkD/ai8j96C9WO71Z3U4bQn4GbZebsBrUXzvqPrjPQPCI
         JITfXOGCH7+6tI4UkNiYg/+qgl/uCrWVijEC27CvEkOTB6DKXnQvsDSIxc9uiN/tdLDL
         wwNSKFpwGjDHAO8le9dPWE52E4wvcbaSx3AlfjRdW1/dqb8IyDxrCIriO5f2iMJGRJ96
         QcL345W7+oyhh24toQIeZHtyaOy++zy62tYJmHnw9eWl+INXF32JZKGndwPIMz4Yun2a
         BhNg==
X-Gm-Message-State: AOJu0YyqfY1Qj+CDeHvAe+TiH73j5xwLgkUHvbcpi/3SJSgC/ApNS4qs
	qshqBLgwYFm3kjCXI/QppU3+bQw/WSOFOGxW9Mg=
X-Google-Smtp-Source: AGHT+IELVKOgVfw9j0tnwBfR9Rra5iDObN/exmi1cS0exC54pGsjpAuAiCei3Kixjxn3jEPnF0qa+D03iq45QLQw/rY=
X-Received: by 2002:ac2:4ec3:0:b0:50e:7b9e:359c with SMTP id
 p3-20020ac24ec3000000b0050e7b9e359cmr2624540lfr.29.1705393655336; Tue, 16 Jan
 2024 00:27:35 -0800 (PST)
MIME-Version: 1.0
References: <1705362852-30067-1-git-send-email-wangmy@fujitsu.com> <1705362852-30067-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1705362852-30067-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 09:27:23 +0100
Message-ID: <CANNYZj_rzWa-2gbrHokgvRaA6_6o79nfeYB=V3=FwULhZXcN9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libtest-warnings-perl: upgrade 0.031 -> 0.032
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193834

Thanks!

Alex

On Tue, 16 Jan 2024 at 00:55, wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update:
>  basic artistic license changed to perl artistic license.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ings-perl_0.031.bb => libtest-warnings-perl_0.032.bb} | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>  rename meta/recipes-devtools/perl/{libtest-warnings-perl_0.031.bb => libtest-warnings-perl_0.032.bb} (78%)
>
> diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
> similarity index 78%
> rename from meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
> rename to meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
> index e03deaf15f..5876e8a63c 100644
> --- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.031.bb
> +++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.032.bb
> @@ -1,6 +1,3 @@
> -# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
> -# Released under the MIT license (see COPYING.MIT for the terms)
> -
>  SUMMARY = "Test::Warnings - Test for warnings and the lack of them"
>  DESCRIPTION = "If you've ever tried to use Test::NoWarnings to confirm there are no \
>  warnings generated by your tests, combined with the convenience of \
> @@ -12,13 +9,13 @@ demonstration.)"
>  HOMEPAGE = "https://github.com/karenetheridge/Test-Warnings"
>  BUGTRACKER = "https://rt.cpan.org/Public/Dist/Display.html?Name=Test-Warnings"
>  SECTION = "libs"
> -LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
> +LICENSE = "Artistic-1.0-Perl | GPL-1.0-or-later"
>
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=6f2b02f39e7d359efd9525fbc56c84a1"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=f98106ac3cc05d9cbebcdb8fbf7b7815"
>
>  SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
>
> -SRC_URI[sha256sum] = "1e542909fef305e45563e9878ea1c3b0c7cef1b28bb7ae07eba2e1efabec477b"
> +SRC_URI[sha256sum] = "4727dae2416e9f07e41e2dc3a9143ba6affc1ec57652117c99d50038e313e9d9"
>
>  S = "${WORKDIR}/Test-Warnings-${PV}"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193806): https://lists.openembedded.org/g/openembedded-core/message/193806
> Mute This Topic: https://lists.openembedded.org/mt/103752132/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

