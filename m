Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10018C43217
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 18:10:02 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web12.1261.1667844597744921438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 10:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jYO8uhsM;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-13ae8117023so13563284fac.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 10:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TUZJ1QqUQ3HVu14iVUOKqzIRxphLv5LWq1T0HHO3dlY=;
        b=jYO8uhsMFQ5U8ALpvU5DeFeJ8zr7aG98bNUu4VqhgsTFNkagXzAkZKpNFLZLWJ7jav
         qWSj1tB2Bs6qUwc27HkgAMKOl8DbOkuGqKfzrBPEhyH1DWgwlrEk8PZ+dkd5RBe3y1X2
         VK3nls3WjsLoVuAKWPepQ48tFc+uoY+Oz1KkCad5ikccG9Y2v9EmEpZKW9SJuQ5nWH0D
         4HjVH7vDik1hGD6ccmX2XGFfnbYz81viKxn2XbK9Kr06qdtWdOP1b0O9VkM+r6sEENDi
         CR1Sly45/3HxIEAn1PSMy7c092V+Ixb9/Q6bZGKUlTf116yxE9VG6cS3PJwcBazSlCkP
         EzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUZJ1QqUQ3HVu14iVUOKqzIRxphLv5LWq1T0HHO3dlY=;
        b=716BgG4An6FD8hQ4+D/9Q2Mm4rz560tRv0atOafQorTbyj3QLwhUPTVcUn5sP0JhqP
         ayezLdFlPvGol+zDpq+YIm7+88UaSA0yOeFahnqO9eDK6n98+QVuKY/UhSLoVB+Vfkrq
         34JPJE+rBF6Poe5ALzPxCLQb/IJcpFE1DXhxYEcJFd7P5yZeNUFNlZk4CMURwMc5dSRa
         hNe+r+6T/yAClJI5AXIYljDkdrpLBOtgzaw3wHYCWCJU32SDbSdGfMuMTZKpIr3cM20y
         wOGX0owSvNl8TcDokWkNCgLR2STtj64a48X8dDBo76bp3ZhNGvpyf/OOTo1xBo2zoxvX
         HjhA==
X-Gm-Message-State: ACrzQf1ad6cIs23sLNcwtzNEoZlQBLU/Mqt8A7CdpxEngdyx41x299HN
	TLmHnSed+pjPj6Z6GjJPc85VzIBM2uG93vA6IC0=
X-Google-Smtp-Source: AMsMyM41mrpFERGELt+6xZ6TvcfSWcYylMe9MVmspioyCNbueCOme3Dxb0K+W9KCDklZ71agFBuCQTiba2rA7bCDzmI=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr39709114oae.262.1667844596891; Mon, 07
 Nov 2022 10:09:56 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-35-alex@linutronix.de>
In-Reply-To: <20221107145508.1051404-35-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Nov 2022 10:09:30 -0800
Message-ID: <CAMKF1sqCg_V_-aSv7BeEBfvbzJNy2xq+N9fb21gfK78xbrWg_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/48] netbase: upgrade 6.3 -> 6.4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 18:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172928

On Mon, Nov 7, 2022 at 6:56 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> License-Update: formatting, copyright years
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../recipes-core/netbase/{netbase_6.3.bb => netbase_6.4.bb} | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta/recipes-core/netbase/{netbase_6.3.bb => netbase_6.4.bb} (77%)
>
> diff --git a/meta/recipes-core/netbase/netbase_6.3.bb b/meta/recipes-core/netbase/netbase_6.4.bb
> similarity index 77%
> rename from meta/recipes-core/netbase/netbase_6.3.bb
> rename to meta/recipes-core/netbase/netbase_6.4.bb
> index bec6498cdd..5a448a4b91 100644
> --- a/meta/recipes-core/netbase/netbase_6.3.bb
> +++ b/meta/recipes-core/netbase/netbase_6.4.bb
> @@ -3,14 +3,14 @@ DESCRIPTION = "This package provides the necessary infrastructure for basic TCP/
>  HOMEPAGE = "http://packages.debian.org/netbase"
>  SECTION = "base"
>  LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=78dd2c7c6f487348e4a0092c17a19d42"
>  PE = "1"
>
>  SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
>
>  inherit allarch
>
> -SRC_URI[sha256sum] = "7c42a6a1cafa0c64103c71cab6431fc8613179b2449a1a00e55e3584e860d81c"
> +SRC_URI[sha256sum] = "fa6621826ff1150e581bd90bc3c8a4ecafe5df90404f207db6dcdf2c75f26ad7"
>
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
>
> @@ -21,3 +21,5 @@ do_install () {
>         install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
>         install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
>  }
> +
> +S = "${WORKDIR}/netbase"

Is there a change in path name in the new tarball?

> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172885): https://lists.openembedded.org/g/openembedded-core/message/172885
> Mute This Topic: https://lists.openembedded.org/mt/94867607/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

