Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF99C64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 08:56:28 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.13646.1677228980357151307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 00:56:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SuF1nYIp;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id b13so14409890ljf.6
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 00:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677228978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sJIPcpnK4vfx3wAFDSzerL/hiFmwKN7l4k1GSQexheg=;
        b=SuF1nYIpR1wvvC3h67w3axy9dBT2I9vLoq+BR1WP2yenaM9dhpp59cS73rzniB90i3
         pCJljE7HQ7/DwbiqP1Eq2pxYLMIhsj3HKPIx1ZyHLggX2UiqtbiXtkVsNXx5re/8F21q
         +d9QIk9ktU2jd46iAsPbMJrMcLo5gle50shzEmLUZVWP4mAKZy0DSBQqTqILZJMMxLdk
         xumAnFifdQJvC/dJW8ih08lBnAQspWFauZs5NSfIdT4MS7KmkSj+07vJfG45BVpO62xU
         68M9K1gYIcXmUnoqM2LBDbVdOhGiNpcGf7/3TBsZ+b3SOSVtJMk31uoBTSst7qar4jhm
         cE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677228978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJIPcpnK4vfx3wAFDSzerL/hiFmwKN7l4k1GSQexheg=;
        b=Qv5mZLyBj+U7Knyh9CtwH7d5L+HRIvqHbFQ//UEiUa3d9XOENRf+LpX5J2zpc6em+q
         jc1a4LkwStBVDYFhCtH8mJ8boNDII9pfn3wnYrdJacx72Y1BULvkTVzJxdqL99V5hSKa
         prmR3YJ4jp5r6ADmATmZr+LxZU8+Mebzl5yQOdumNDHL83hg2cCKqIBli1dOgnXpA+i+
         2QiZKKtLxXj+vRWbOM2xPBJwuqtSu5G/8fjGsJ0vkCyuga5pnsnLsl6zj9bjk8Gddtep
         7wn2SUvkp/kUEGP+sNhtJe//1B7RJfaBbCIHG78AL19FBbPFkJq6nFuGSrv+qFS4ERd6
         DBFQ==
X-Gm-Message-State: AO0yUKWH+drVjEgHSznhikgI4W2bT36F7et1SnijRW3HC5HROYgwF2i2
	i7NULsGdCPheRlC/x+bVG6XnQokbUqJW08r4jkgqOU52
X-Google-Smtp-Source: AK7set9enTbRzxv3HNHQI8Ne8uLBV+BfWZwAbF9h8GqVka//mGUuiTnGfD0TrYFMJLwL4jxHVKt9z63ZrMRbRyPAq3Y=
X-Received: by 2002:a2e:aa1c:0:b0:295:a64f:9d50 with SMTP id
 bf28-20020a2eaa1c000000b00295a64f9d50mr263855ljb.5.1677228978061; Fri, 24 Feb
 2023 00:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20230224085317.2931394-1-vkumbhar@mvista.com>
In-Reply-To: <20230224085317.2931394-1-vkumbhar@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Feb 2023 09:56:06 +0100
Message-ID: <CANNYZj_bt9w7L8m83srjiLyH3v5SUak89oKyixP5QqBQ+Ps_mw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] bind: Upgrade bind-9.18.11 -> bind-9.19.9
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 08:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177663

9.19 is a development branch. You need to update to the latest version
in 9.18 series. Also, the patch needs to be submitted for master
first.

Alex

On Fri, 24 Feb 2023 at 09:53, vkumbhar <vkumbhar@mvista.com> wrote:
>
> Fix below security CVEs:
> CVE-2022-3094
> CVE-2022-3736
> CVE-2022-3924
>
> Fix serve-stale crash when recursive clients soft quota
> is reached. (CVE-2022-3924) [GL #3619]
>
> Handle RRSIG lookups when serve-stale is active.
> (CVE-2022-3736) [GL #3622]
>
> An UPDATE message flood could cause named to exhaust all
> available memory. This flaw was addressed by adding a
> new "update-quota" statement that controls the number of
> simultaneous UPDATE messages that can be processed or
> forwarded. The default is 100. A stats counter has been
> added to record events when the update quota is
> exceeded, and the XML and JSON statistics version
> numbers have been updated. (CVE-2022-3094) [GL #3523]
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  .../0001-avoid-start-failure-with-bind-user.patch               | 0
>  .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
>  .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
>  .../bind/{bind-9.18.11 => bind-9.19.9}/bind9                    | 0
>  .../bind/{bind-9.18.11 => bind-9.19.9}/conf.patch               | 0
>  .../bind/{bind-9.18.11 => bind-9.19.9}/generate-rndc-key.sh     | 0
>  .../init.d-add-support-for-read-only-rootfs.patch               | 0
>  .../make-etc-initd-bind-stop-work.patch                         | 0
>  .../bind/{bind-9.18.11 => bind-9.19.9}/named.service            | 0
>  .../bind/{bind_9.18.11.bb => bind_9.19.9.bb}                    | 2 +-
>  10 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/0001-avoid-start-failure-with-bind-user.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/bind9 (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/conf.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/generate-rndc-key.sh (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/init.d-add-support-for-read-only-rootfs.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/make-etc-initd-bind-stop-work.patch (100%)
>  rename meta/recipes-connectivity/bind/{bind-9.18.11 => bind-9.19.9}/named.service (100%)
>  rename meta/recipes-connectivity/bind/{bind_9.18.11.bb => bind_9.19.9.bb} (97%)
>
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.19.9/0001-avoid-start-failure-with-bind-user.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-avoid-start-failure-with-bind-user.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/0001-avoid-start-failure-with-bind-user.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.19.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.19.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/bind-ensure-searching-for-json-headers-searches-sysr.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/bind-ensure-searching-for-json-headers-searches-sysr.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/bind9 b/meta/recipes-connectivity/bind/bind-9.19.9/bind9
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/bind9
> rename to meta/recipes-connectivity/bind/bind-9.19.9/bind9
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/conf.patch b/meta/recipes-connectivity/bind/bind-9.19.9/conf.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/conf.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/conf.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.19.9/generate-rndc-key.sh
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/generate-rndc-key.sh
> rename to meta/recipes-connectivity/bind/bind-9.19.9/generate-rndc-key.sh
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.19.9/init.d-add-support-for-read-only-rootfs.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/init.d-add-support-for-read-only-rootfs.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/init.d-add-support-for-read-only-rootfs.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.19.9/make-etc-initd-bind-stop-work.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/make-etc-initd-bind-stop-work.patch
> rename to meta/recipes-connectivity/bind/bind-9.19.9/make-etc-initd-bind-stop-work.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.11/named.service b/meta/recipes-connectivity/bind/bind-9.19.9/named.service
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.11/named.service
> rename to meta/recipes-connectivity/bind/bind-9.19.9/named.service
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.11.bb b/meta/recipes-connectivity/bind/bind_9.19.9.bb
> similarity index 97%
> rename from meta/recipes-connectivity/bind/bind_9.18.11.bb
> rename to meta/recipes-connectivity/bind/bind_9.19.9.bb
> index 0618129318..7bb7bbce7f 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.11.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.19.9.bb
> @@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
>
> -SRC_URI[sha256sum] = "8ff3352812230cbcbda42df87cad961f94163d3da457c5e4bef8057fd5df2158"
> +SRC_URI[sha256sum] = "d8916799832370edeeaa216111b5577675b99d47fc2554e0f93656afa8d5fb71"
>
>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>  # follow the ESV versions divisible by 2
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177662): https://lists.openembedded.org/g/openembedded-core/message/177662
> Mute This Topic: https://lists.openembedded.org/mt/97202405/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

