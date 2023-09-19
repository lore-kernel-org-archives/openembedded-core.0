Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71199CD5BBC
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 13:21:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.8388.1695129673387575224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 06:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H4CZzuR1;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c012573498so30672221fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 06:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695129671; x=1695734471; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSKrgAfHRXYLObItzJ+uxCSzWlF5RN4NxNt5O829p0s=;
        b=H4CZzuR1CglgYBscpKi+IjgIYfaKXhG6Xd6rvugw7bvr1WkUPtrdOva055cTQQkCz+
         5yX3HpHQeF/ah+rYz0PfKsyDN1KkviGVoNhP5gdBJc0wCYGwFLUxPtKlZATFOWQ4ka9Y
         YReZb6HcV7AXNjyErpNQpqEhtkLCtNuNGgWm0vfsVBZxlBKtOWbdSJeEzv0csv8gQva3
         hSqMqBec73CXnUitXo+R9PWCsozQLf15ruA90MuPctdyj8hYmi/cbEWYNwtMtazH2lHQ
         1xeJVs/3lJcBp8DgZdhZ9AMJS4JUUqBowmKs2it6E2qVbh9FOh+AZ37Jr+KVFYsxktCZ
         klaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695129671; x=1695734471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSKrgAfHRXYLObItzJ+uxCSzWlF5RN4NxNt5O829p0s=;
        b=CrnoWTAJGf7PiY8glukJ6QagACaF/TqX0HjqG6k6CI1FqE35qeCa3hoi84DwydweUS
         274IvjaCHI1Ig3m8kFa1Q2P1KAZ+aZ/6LzqOruvAb/Whn8lJnffv/nUwtOxzBj6Yi0lv
         T39pRTQID1g9Bc0+pFkjKH9ID3QG9FCpB1mDxI6Kv6VDQq/0I8P00JuKypkxJrFO4Yiz
         WT7YQICfFwRBHiRLLhDRa99ZYZU+4d/4p73UP6mgpfHr5nyVm8TbvbRVVs3ZL2burDrr
         qtaOj7Sm96DGn7CKRZUxPvXCi2RdOx6xsIEct0M3sUmhuMTJsfawFkdRwpIxujRUCkgL
         pxZA==
X-Gm-Message-State: AOJu0YzkKp+fzj7RRr1scmFL6AXcWvL8uXFnAnCq0tIQWkUv5cs52SAC
	mGglH2V1NnBkyXsWRYsoRWbFGC8k9gR/KWBbFmk=
X-Google-Smtp-Source: AGHT+IFrDx7rTdyZ0UJU65xeIfwi88odnKFp6ZrimZpMI+taJ/BcnSedpoMtd4vjLBAJJ1w2luB5iJYuJjOh/2b0+jk=
X-Received: by 2002:a2e:9401:0:b0:2be:4d3a:ad6a with SMTP id
 i1-20020a2e9401000000b002be4d3aad6amr8808761ljh.26.1695129671380; Tue, 19 Sep
 2023 06:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230919114941.1819808-1-f_l_k@t-online.de> <CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
 <9RH81S.9NI7WQZ7L6QX@t-online.de>
In-Reply-To: <9RH81S.9NI7WQZ7L6QX@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Sep 2023 15:20:59 +0200
Message-ID: <CANNYZj967eyFsoO2uuQ0U185MFe9Dk9NXwDMWdp3Z-FYrPQkfA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] vte: upgrade 2.72.2 -> 2.74.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 13:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187865

Having gpl3-only recipes in core is not a problem. Ability to build
basic images without gpl3 items is tested, since that kind of thing is
important to certain industries, but otherwise there are no hard
feelings towards gpl3. It is open source, and products do ship with
gpl3, with all gpl3 license obligations fulfilled.

Alex

On Tue, 19 Sept 2023 at 15:06, Markus Volk <f_l_k@t-online.de> wrote:
>
> On Tue, Sep 19 2023 at 02:02:48 PM +02:00:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> we need to find a different terminal (rxvt or indeed gnome-terminal).
>
>
> gnome-console is a simple thing. but it is necessary to build vte with gtk4 support (by the way, the default of vte is to build gtk3 and gtk4 support). Maybe the problem with both gnome-console and gnome-terminal is that they are GPL-3.0-only.
>
> SUMMARY = "GNOME Console"
> LICENSE = "GPL-3.0-only"
> LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
>
> GNOMEBASEBUILDCLASS = "meson"
> inherit gtk-icon-cache gnomebase pkgconfig meson gsettings gnome-help upstream-version-is-even
>
> DEPENDS = " \
>     desktop-file-utils-native \
>     gtk4-native \
>     gtk4 \
>     libadwaita \
>     vte \
>     libgtop \
>     pcre2 \
>     gsettings-desktop-schemas \
> "
>
> SRC_URI[archive.sha256sum] = "24cbd5680e525c2c0c57ad8d8c1ad199ef5b45b1ff1c80be22a37848e46e93ac"
>
> FILES:${PN} += "${datadir}"
>
> RRECOMMENDS:${PN} += "gsettings-desktop-schemas hicolor-icon-theme"

