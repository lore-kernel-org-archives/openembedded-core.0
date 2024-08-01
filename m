Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA26C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 16:45:39 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.73362.1722530729360835775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 09:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Df6kcDbA;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f008aa351so10392793e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722530727; x=1723135527; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0oar+Mp9xBmDlM0GVdBez/ut+cml2rIommu5VONWKs=;
        b=Df6kcDbAutxHnEtPKkwgSjwuHAl922191EXt35kLPeQeQbm/VyY5rAO+jy7J/ngUVC
         D+mYT/cOEsfEqkc8ja4MAv0O97yr6nqqXkF6TVxPUn8AT/RR6uzienMNPFFzO9LRgEoz
         gt8PNjAXYzYdkO1nRMgBQAqq914dguYA7DWQV7db2IpxDdjUHlAl9eWJzxpqVUvKZFGb
         etVtsz5U4j9ru5Hd0mvWErEzyFdd9RnLZMeKPsfCU5CBtRU0PlADyyj5dPn0IvL8z3Le
         7JBZS1vo15Z4ImjvgBwH8M/Xid6q8cY0lgGUL2hmFZ6i87qHyedvpBXpY7FeT4XWN7DP
         JtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722530727; x=1723135527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0oar+Mp9xBmDlM0GVdBez/ut+cml2rIommu5VONWKs=;
        b=hOWQEEtSkOmrDHULoeYSwkPVVKGL8XhjGfsup7/L+2Ii+eZ+XdrzYndGN/7NFUNv3y
         x7cGPD+2sglXEcUYbPhjd1SkDbN3cHOYilF+Gxjpc3hvwE/ySAvrdgoSJpJFNi+AxHKw
         nYSFSO17TPdmf07HMP2bxmnRV0TqAphTR37XqerIO6/U+z/hKja8FQjIKTEuZjh/KL1B
         S/LbeqVxVSnb7t6y3NM+r0cyc0S8UOD++Hhk1RUxXR/LEtArWJJqZ8HmvzpUxRNdBNbv
         ZZiMLlYt3ML7cjzuQ88yxbNcl2fSbBvy9C4xCFYHLj1j2Sus9ytI7J/CVXkgSVWPLoy8
         YfMw==
X-Gm-Message-State: AOJu0YzuH1T6Kpuj59IKWiEsgUjRsh+rzN88NcJ4HmKyu5WCuEpOYYhf
	kmjwPbdmyA6ECuELrTVWYayMKgsfg+M6oopSdtt19hmvr7bzOjHXzYL2Uz4YB7oQytx73Vb6ZNc
	xzyPpew3wfby3aIq2m0NEsvQ2SR4=
X-Google-Smtp-Source: AGHT+IFUxGhI/MyUt4sDGzRNADfL2IRcdF7V0LfG1zOZLw9M7yptySLFu1op5FvQgKwdQoXKtx3K/nv8ZZitjoqI9rc=
X-Received: by 2002:a05:6512:281a:b0:52e:9f76:53dc with SMTP id
 2adb3069b0e04-530bb30726bmr428143e87.0.1722530726960; Thu, 01 Aug 2024
 09:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240801153419.3011935-1-tgamblin@baylibre.com>
In-Reply-To: <20240801153419.3011935-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Aug 2024 18:45:14 +0200
Message-ID: <CANNYZj8XjyadwqTUnPe9=K9hOC3aUx2eHyxQQsYtETPXup0jxw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kea: upgrade 2.4.1 -> 2.7.1
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 16:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202759

2.7.1 can't be accepted as it is a development version, and the
automated version check/upgrade should have given you the latest
stable (2.6.1).


Alex

On Thu, 1 Aug 2024 at 17:34, Trevor Gamblin via lists.openembedded.org
<tgamblin=baylibre.com@lists.openembedded.org> wrote:
>
> Refresh patch 'fix_pid_keactrl.patch' to apply on new version.
>
> Add an extra sed call to do_install:append() to remove a reference to
> TMPDIR from ${D}/usr/sbin/kea-admin.
>
> License-Update: Update copyright year
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../kea/files/fix_pid_keactrl.patch            | 18 ++++++++++++------
>  .../kea/{kea_2.4.1.bb => kea_2.7.1.bb}         |  5 +++--
>  2 files changed, 15 insertions(+), 8 deletions(-)
>  rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.7.1.bb} (93%)
>
> diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> index 63a6a2805b..98400212a5 100644
> --- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> +++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> @@ -1,4 +1,4 @@
> -From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
> +From 18f84773f992c64e07fb82949552e38a01aace4e Mon Sep 17 00:00:00 2001
>  From: Armin kuster <akuster808@gmail.com>
>  Date: Wed, 14 Oct 2020 22:48:31 -0700
>  Subject: [PATCH] Busybox does not support ps -p so use pgrep
> @@ -8,22 +8,28 @@ Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
>
>  Signed-off-by: Armin kuster <akuster808@gmail.com>
>
> +Refresh to apply on top of 2.7.1.
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>  ---
>   src/bin/keactrl/keactrl.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
> -index 450e997..c353ca9 100644
> +index a7cf355630..c3565f7204 100644
>  --- a/src/bin/keactrl/keactrl.in
>  +++ b/src/bin/keactrl/keactrl.in
> -@@ -149,8 +149,8 @@ check_running() {
> +@@ -152,8 +152,8 @@ check_running() {
>       # Get the PID from the PID file (if it exists)
>       get_pid_from_file "${proc_name}"
> -     if [ ${_pid} -gt 0 ]; then
> +     if [ "${_pid}" -gt 0 ]; then
>  -        # Use ps to check if PID is alive
> --        if ps -p ${_pid} 1>/dev/null; then
> +-        if ps -p "${_pid}" 1>/dev/null; then
>  +        # Use pgrep and grep to check if PID is alive
> -+        if pgrep -v 1 | grep ${_pid} 1>/dev/null; then
> ++        if pgrep -v 1 | grep "${_pid}" 1>/dev/null; then
>               # No error, so PID IS ALIVE
>               _running=1
>           fi
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.7.1.bb
> similarity index 93%
> rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
> rename to meta/recipes-connectivity/kea/kea_2.7.1.bb
> index 19309ce314..228d2fff34 100644
> --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_2.7.1.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
>  HOMEPAGE = "http://kea.isc.org"
>  SECTION = "connectivity"
>  LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
>
>  DEPENDS = "boost log4cplus openssl"
>
> @@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
>             file://fix_pid_keactrl.patch \
>             file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
>             "
> -SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
> +SRC_URI[sha256sum] = "036bdfcc8b815199dc7c1d0edff01a1057462771b8c4bcc2f323c32bddf1bd5c"
>
>  inherit autotools systemd update-rc.d upstream-version-is-even
>
> @@ -64,6 +64,7 @@ do_install:append() {
>      sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
>             -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>             ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
> +    sed -i "s:${B}/../kea-2.7.1::g" ${D}/usr/sbin/kea-admin
>  }
>
>  do_install:append() {
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202758): https://lists.openembedded.org/g/openembedded-core/message/202758
> Mute This Topic: https://lists.openembedded.org/mt/107668433/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

