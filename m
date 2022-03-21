Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98465C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 15:23:04 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web09.32145.1647876183259573402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 08:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lq4vfQh6;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id o6so20347547ljp.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 08:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsmZykErtL8S55MtO3m9q6x159oMzpWtdxuzk955iWE=;
        b=Lq4vfQh6I3uo6Na710ITurWhxYFjkEDbIVqp6iUVHCUhViEhxcsT0ynhuYE6Szg+Kt
         h5lWZy1lc4rHdgIWFnyBK1FscgKwJZVfamuNEsE/qoSsnBGCSEQ+aIOA28yFziBgQx3C
         3YqowMFBVDUiPqrlZtYE3SpWl++AVmCZth3VeYYd//MEqDgCjKAz1N5zD44LZ3eXQ3lg
         aY6d2yxXc6yTK76Yfdzhap3eeBJDTAdRNLj/OTi6p4oZJB4pkI6xoJZ/IPhoCri7itid
         ez/HdZM6Fb22dDp8cHhsH4iOIWQ3uZJYPlpY5BJ8uLNPCrrBvLuBdwJ40sfPSdugYhg8
         kf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsmZykErtL8S55MtO3m9q6x159oMzpWtdxuzk955iWE=;
        b=Xm8pFt2tz9Kn5qP1OgLe+vC8AfZnBf4zPCMScNkRuxgd974b8JYDPTevThS0vE3oKV
         l8UJMIqdZjyz8cuAytor3GcF1j4DpdbJT/i3G8Un5kP+bOTrm7+CULWEBPVnyWhl4aa5
         agTmObmMvxo9hiQj8bCFdzqGIporyXObt4HQkrUrTgzoj+zTbBjwHwrUHEn+Qdj7721u
         Ow87XyBWDmQDlv4dpPBpVh+4a7Ae02HSbaa6qQAV7Cj9WDIi3wncLcxGWJVUZae+TlA8
         7dDMQyeYtRi0LQTPwTX/JYNNRZ3kF6zidShAKGywZUDpfK0ALxYFbKUXQIiYGRv41BHa
         CpbA==
X-Gm-Message-State: AOAM531X9KV+lo8xBrRaO5+r+akFv7rWiXHogVJOe5ZH3QqfeSIz2Hk8
	LSgUx9zfb6mKWTu8FQ3Gpt5GHyFo8vvsZLglOi0=
X-Google-Smtp-Source: 
 ABdhPJwQVLw4vZkwkQtOaWyqjCO0hXn+PfJ5fbieLCszeAWY7izmF1olGXVw1MIgO5HlKfEKcT9KMLuUI9Xv+2uVrNE=
X-Received: by 2002:a2e:80c2:0:b0:249:808b:590c with SMTP id
 r2-20020a2e80c2000000b00249808b590cmr6045441ljg.496.1647876181246; Mon, 21
 Mar 2022 08:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <bed867f3-8226-701c-0ee7-ac8f02723edc@bootlin.com>
In-Reply-To: <bed867f3-8226-701c-0ee7-ac8f02723edc@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 21 Mar 2022 16:22:49 +0100
Message-ID: 
 <CAApg2=Q5PufyYtb5B6ZXevZwRBTEzAzJHeLJ5-5ej1_KJYT=qA@mail.gmail.com>
Subject: Re: [OE-core] List of changes for Kirkstone migration notes
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000006ac84205dabc12bd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 15:23:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163510

--0000000000006ac84205dabc12bd
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 10, 2022 at 11:25 AM Michael Opdenacker via
lists.openembedded.org <michael.opdenacker=
bootlin.com@lists.openembedded.org> wrote:

> Greetings
>
> We need to prepare the final migration notes for Kirkstone and need your
> help. Here is a quick list of already documented changes (see
>
> https://git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migration-3.5.rst
> ),
> and changes that haven't been documented yet:
>
> Already documented
> - Branch name required in git:// and gitsm:// SRC_URI entries
> - ";protocol=https" required at the end of GitHub URLs
> - Network access disabled for tasks
> - TOPDIR and current directory no longer modified while parsing recipes
> - ``append``, ``prepend`` and ``remove`` only working with "=" and ":="
> - allarch packagegroups can no longer depend on packages using PKG renaming
> - distutils* classes moved to meta-python
> - `blacklist.bbclass`` removed and introduction of SKIP_RECIPE
>
>
> Not documented yet
> - Shared State reuse from the autobuilder, speeding up builds if the
> network is fast enough
> - License fields now using SPDX identifiers
> - Inclusive language updates, conversion script available
> - Python build process based on wheels. New python packaging classes:
> setuptools_build_meta.bbclass, pip_install_wheel.bbclass,
> flit_core.bbclass;
> - prelink support dropped
> - New overlayfs and overlayfs-etc classes
> - Support for AlmaLinux replacing CentOS, dropped CentOS 8, Ubuntu
> 16.04, Fedora 30-32...
> - State cache: use ZStandard (zstd) instead of Gzip compression
> - Fixed the reproducibility issues with rust-llvm and golang. Full
> reprocibility in OE-Core
> - BitBake: improve setscene task display
> - New "crate" fetcher for Rust
>
>
Heads up: I'm on the inclusive language migration + migration script docs.

Regards,
Marta

--0000000000006ac84205dabc12bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 10, 2022 at 11:25 AM Mich=
ael Opdenacker via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.com@lists.o=
penembedded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Greetings<br>
<br>
We need to prepare the final migration notes for Kirkstone and need your<br=
>
help. Here is a quick list of already documented changes (see<br>
<a href=3D"https://git.yoctoproject.org/yocto-docs/tree/documentation/migra=
tion-guides/migration-3.5.rst" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.yoctoproject.org/yocto-docs/tree/documentation/migration-guides/migrat=
ion-3.5.rst</a>),<br>
and changes that haven&#39;t been documented yet:<br>
<br>
Already documented<br>
- Branch name required in git:// and gitsm:// SRC_URI entries<br>
- &quot;;protocol=3Dhttps&quot; required at the end of GitHub URLs<br>
- Network access disabled for tasks<br>
- TOPDIR and current directory no longer modified while parsing recipes<br>
- ``append``, ``prepend`` and ``remove`` only working with &quot;=3D&quot; =
and &quot;:=3D&quot;<br>
- allarch packagegroups can no longer depend on packages using PKG renaming=
<br>
- distutils* classes moved to meta-python<br>
- `blacklist.bbclass`` removed and introduction of SKIP_RECIPE<br>
<br>
<br>
Not documented yet<br>
- Shared State reuse from the autobuilder, speeding up builds if the<br>
network is fast enough<br>
- License fields now using SPDX identifiers<br>
- Inclusive language updates, conversion script available<br>
- Python build process based on wheels. New python packaging classes:<br>
setuptools_build_meta.bbclass, pip_install_wheel.bbclass,<br>
flit_core.bbclass;<br>
- prelink support dropped<br>
- New overlayfs and overlayfs-etc classes<br>
- Support for AlmaLinux replacing CentOS, dropped CentOS 8, Ubuntu<br>
16.04, Fedora 30-32...<br>
- State cache: use ZStandard (zstd) instead of Gzip compression<br>
- Fixed the reproducibility issues with rust-llvm and golang. Full<br>
reprocibility in OE-Core<br>
- BitBake: improve setscene task display<br>
- New &quot;crate&quot; fetcher for Rust<br><br></blockquote><div><br></div=
><div>Heads up: I&#39;m on the inclusive language migration=C2=A0+ migratio=
n script docs.</div><div><br></div><div>Regards,</div><div>Marta<br></div><=
/div></div>

--0000000000006ac84205dabc12bd--

