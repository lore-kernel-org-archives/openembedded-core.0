Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639CDC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:50:47 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web08.17504.1665561040034871438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FHtx9O2t;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id y17so8356893ilq.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjvMgMz/MRTN7mA0IVb+Og8BgHFBnZygfsZFxcBFhMs=;
        b=FHtx9O2tKb873uxRy1yp89dw4nwhbI2Hw6cS7Jml1yuZOmGrReqGbzAIQbcq6gN0Yg
         xthilGw/1OOid/KMSR26WclGLdM9ZU6U3v9UfOoqkR+2V/OOgtQzdLKpTtgmnevsep7q
         +qIwmz44jhbhZNXs1+8MpVBajU6h3F+CUPGfXV0N8nK3r2j18oU+9NXz+5f0Teoeaa2Q
         cIJketUh0wlssUnx47Qmq3RJWvDJReyUKdv0whnWzpmfvTpvEfwBmkSVJo/3Mom4CPSQ
         WjdeNo1uc9Dp6FVtZnBXFp/TDXXfzvJPHauJY2bY81d/V2gEdruRlLxmfad71mr6ifly
         vEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjvMgMz/MRTN7mA0IVb+Og8BgHFBnZygfsZFxcBFhMs=;
        b=LECaDvIEeIiTkmimwNyB8CmH6x1OTumHWSrRfdlkbj8LPARc8j07KZcd5oyfXmJoc6
         AfHfQTc12nza9vf5kGtdSq2w/L7oHt2M9sCrTtpVBsc87upMZeTmSueTmNEailbKjZve
         1vxp39f0Swb4eE4d2yljvHdcdW1ZfR7u9Hdsq9iXzO8A4e9txoOoU0GJeJbrjefJ/6A3
         2ZUMU6qWOmWWvzGyrVIoYBla4rDH/IZELxy0rXRgMI0p9iEjdRQUc5R5CgXQXHvpw3rP
         3ulFEDehh1AdvjQRs1llYBsqlnzEp7HEMYGrASJG3eWveqT9T6Qc7lBOIkENct5K805C
         Q7Gg==
X-Gm-Message-State: ACrzQf1HX/qDLZJs+jK7/0ooK6V/ejVKUDdsPTQhs3aobb/2WowGzHCd
	HqlxYa0mnFtbzab4IQk+t3kOaCgBgSh7jANiOxo=
X-Google-Smtp-Source: AMsMyM6yGNhZX4pjJ3lbgZW6yd8w7VvnCRNpQ32v/t3hVqByLyNtq/lBq11woXCFVr/8q1k2ANYE0I1wrsp/EHh/Lss=
X-Received: by 2002:a05:6e02:17cb:b0:2f9:1fb4:ba3b with SMTP id
 z11-20020a056e0217cb00b002f91fb4ba3bmr13404829ilu.257.1665561039379; Wed, 12
 Oct 2022 00:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <233c014c169e00e6a9ce464f3ab2bf79@pianon.eu>
In-Reply-To: <233c014c169e00e6a9ce464f3ab2bf79@pianon.eu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Oct 2022 09:50:27 +0200
Message-ID: <CANNYZj_MhYekau2ufotcMe8atj79F+NkYPg0FhasMdu1TvVBqA@mail.gmail.com>
Subject: Re: [OE-core] severe issue in CVE checker
To: Alberto Pianon <alberto@pianon.eu>
Cc: openembedded-core@lists.openembedded.org, marta.rybczynska@linaro.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Carlo Piana <carlo@piana.eu>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171657

Thanks for the information, can you send a patch?

Alex

On Wed, 12 Oct 2022 at 09:25, Alberto Pianon <alberto@pianon.eu> wrote:
>
> All, Marta, Richard,
>
> while implementing stats aggregation for CVE metadata in the Oniro
> project, I encountered a severe issue in Yocto's CVE checker, apparently
> due to this:
> https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-db-native.bb#n81
>
> It appears that when cve-update-db-native fails to fetch some years of
> NIST CVE db, it just issues a warning but goes on anyway.
>
> The result is that in some builds, randomly (depending on NIST webserver
> timeouts or other connection problems), CVE db is not complete, so the
> CVE check returns false negatives (i.e. no vulnerabilities found in some
> components even if such vulnerabilities do exist)
>
> I ran into such problem because in Oniro we need aggregate data from
> different builds for a large target matrix; I added a check to check
> that CVE metadata for each component are the same in all builds, and it
> failed, so I tried to figure out the cause and I found this:
>
> - in a build where cve-check found a vulnerability for acl:
>      $ sqlite3 build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
>      sqlite> SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS "acl";
>      CVE-2009-4411
>      sqlite>
>
> - in another build where cve-check did not found any vulnerability for
> the very same version of acl:
>      $ sqlite3 build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
>      sqlite> SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS "acl";
>      sqlite>
>
> so I listed both CVE db files in those two builds and this is what I
> got:
>
>      $ ls -ll build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
> build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
>      -rw-r--r-- 1 ubuntu ubuntu 215093248 Oct 11 10:56
> build-linux-clang-qemuarm-efi/tmp/CVE_CHECK/nvdcve_1.1.db
>      -rw-r--r-- 1 ubuntu ubuntu     28672 Oct 11 10:00
> build-linux-clang-qemux86/tmp/CVE_CHECK/nvdcve_1.1.db
>
> The two CVE db files were fetched just about 1h apart, but the second
> file is apparently incomplete.
>
> I checked the log for the second build, and I found this:
>
>      WARNING: cve-update-db-native-1.0-r0 do_fetch: Failed to fetch CVE
> data ([Errno 99] Cannot assign requested address)
>      NOTE: recipe cve-update-db-native-1.0-r0: task do_fetch: Succeeded
>
> Fetch fails, but do_fetch task succeeds.
>
> So I looked into the recipe's code, and I found this:
> https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-db-native.bb#n81
>
> It iterates over NIST CVE db years, but if some year fail to download,
> it goes on anyway, and it still merges the successful downloads into
> nvdcve_1.1.db, without returning error.
>
> IMHO this is a severe issue because it may silently lead to false
> negatives in the CVE check. If some downloads fail due to timeouts or
> other connection problems, cve-check should retry a number of times, and
> if any download still fails, cve-update-db-native do_fecth should fail,
> and it turn all do_cve_check tasks should fail, since doing a CVE check
> against a corrupted/incomplete CVE database is clearly useless
>
> Regards,
>
> Alberto
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171653): https://lists.openembedded.org/g/openembedded-core/message/171653
> Mute This Topic: https://lists.openembedded.org/mt/94276393/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

