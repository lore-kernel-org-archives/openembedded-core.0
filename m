Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82C0C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:08:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.11582.1634033296150388090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=s8zIDP4C;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id r10so65314827wra.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+NkXTkHpAd5UZatyS0zbtyF420owlnxI9P4bgIZheU=;
        b=s8zIDP4C1OIfvm8oi/8O96+VraWKUMGjEU0HTBF+JBYZ1eX4DLcmBtSaTwNiki5F6J
         Nz3I3NCKQRsSzxG8kzyRXHIj/946tjhFOTfd0K7rKLZ8q296a1vfmPbV4XlqTyrHO8oa
         cuJfgI7taCGT7/0D8JO0SRYSyqiTya5paSRRuJGloLgjeV4BQCjpWMVZbuukSZXgVMDH
         FtkXDUhChKBgopXgQVFCd1aQgw3uEWorzRNJSUb7tBVwfH6mJwUnLJjuyhAUowfwR9nq
         sTGtqGGifmOpF+GZFH2UTThbELUh0TKT5gp4JOwIB9NgDku7FGn/t0bwHbotqGija+49
         k88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+NkXTkHpAd5UZatyS0zbtyF420owlnxI9P4bgIZheU=;
        b=O5xP9Ce5eVGYLoOqrI1edzct89o/AOC7xsPyGE5isXZxG77UaiyZFwAiRmL6idSrHh
         vaStMgkpfht9TINm5IdpvyUrEMtd+/WRB72KCB5FV3qLghb7A7GKP9Yq/PGz8SezuFzR
         LXIWFMWiMQ5OXqJNx2Er4yhpQZ6eWh2CWrcYWJVfnFuLCSfkRhtBjctJUfG5Pvqm2E6Z
         lyOTvnh5Q/rFwQ0YDbNbi7f/EdlLOqrK8PNJBhgC74TR/Bff1cjuwOvHSSa/fpK5RFsx
         29JDcZf+ka6RB3Lz/8BZZDl5IDINbmCq4C+WHp3pP5646Z5VpFqVnUdpKd66gIYH+dHp
         KDFA==
X-Gm-Message-State: AOAM530TMwWru5eM2jeED5antNL2GPSW1lC8aH2TZtOOXo3m8WSOUlxI
	Wq7qC0x+MbozhRrXpX/65Ca7OJSdhqApVLQlJ67DYQ==
X-Google-Smtp-Source: 
 ABdhPJxvTeaQLpGp3xfhq5PKhtkRviomeSVda1SFwf5Jxcz1If+cRceFAwcABgtA1JOXzifkPP8gQHu6fPZSOz1iors=
X-Received: by 2002:adf:f48d:: with SMTP id l13mr30346785wro.94.1634033294464;
 Tue, 12 Oct 2021 03:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211011094059.4184654-1-alex@linutronix.de>
 <20211011094059.4184654-21-alex@linutronix.de>
In-Reply-To: <20211011094059.4184654-21-alex@linutronix.de>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 12 Oct 2021 11:08:03 +0100
Message-ID: 
 <CAAnfSTvdESuiPyKYzVohcF=gAfJjo_GnaZn-c7XJkHCNEbT1_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 21/25] libsoup: add a 3.x recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 10:08:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156863

On Mon, 11 Oct 2021 at 10:41, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> +DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"

libxml2 was removed as a build dependency.

> +PROVIDES = "libsoup-3.0"

As they appear to be continuing the parallel installable theme, should
we just name the recipe libsoup-3.0 as we did with the 2.4 series?
Otherwise when a hypothetical 4.0 comes out, what is that called?

> +S = "${WORKDIR}/libsoup-${PV}"

Redundant if you keep PN as libsoup.

> +# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards. Disable by default.

Redundant comment, libsoup-gnome is entirely gone now.

> +EXTRA_OEMESON:append = " -Dvapi=disabled -Dtls_check=false"

Might be worth adding -Dtests=false to make that explicit.

> +# When built without gnome support, libsoup will contain only one shared lib
> +# and will therefore become subject to renaming by debian.bbclass. Prevent
> +# renaming in order to keep the package name consistent regardless of whether
> +# gnome support is enabled or disabled.
> +DEBIAN_NOAUTONAME:${PN} = "1"

Redundant, as above.

Ross

