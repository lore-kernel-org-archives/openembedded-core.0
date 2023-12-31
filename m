Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E0AC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 13:18:44 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.219695.1704028718700131306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Dec 2023 05:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HEfcD7Ts;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.169, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-427f21ced6aso20971151cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 05:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704028717; x=1704633517; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQer85yVvisjtGBoPOP5IbfFPNxwxyEwYv9IM4tOqss=;
        b=HEfcD7Ts3o3dck8LK5bwlLSG5OAf76zrk1CbfeAaL2WFI5VcjL9CuZTKKW25ljEUMN
         SfHg5GGy6dWSifRh7Ufq6sxA4n9KwIzx35NMeflILDn2QncMpy8z/NR8pr+RA22NFEpE
         kBECccgkho87KKRI84EvCZbu7LgcF0RiOpvKSJQS6XarW/PM7ohRVP7TBWl9LsqBjsDk
         G0FlejTuCp2kscrGd5gMYpP0dbFX4tLZsZ06Kt5uleiTUSEXW/mMnWUEUqgKa29x2ToY
         Tjif1FAyq/LMSsnYogz1aAItErDd9CX9G2AghDEXk5l5QznN7VQF/kWUEngogDIGcRLM
         tCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704028717; x=1704633517;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gQer85yVvisjtGBoPOP5IbfFPNxwxyEwYv9IM4tOqss=;
        b=U/AbDZPxHFfebmcrF4lBnHVuPWbZs+BGW1VfsZQ7nRhTE0SXSDO9z+dD9sKQgn/2C8
         vg/q+zeM9Vvaeb5+vvA9YHNdbv4W1lRj1D9+FvatmQzU6F+4Ng+1ASOCSc+hGitguBgS
         VMYKNSNh5R2FlHQShF8agG/3Tv2HTrQyoT6BDdm4VZEMiV3W7FKqXpkV6YT+uGss2XlA
         rB0xFC/7cczGWZw3i8XvGNgH3kfE8DnTYqVgT1XTiyPf7HpxiB7j8EsUtj+jClvKdPov
         qLYPlYBpzX0mylAt0cDobhKy/bJ0p1//b/+nIObm+w5/M3FWU5W3Yyukvwr6WQLkDrGr
         xY+Q==
X-Gm-Message-State: AOJu0YyNUNVG8kTTITHtvwh1GAlYD3ZcBjZzQ3E8JkHodyFIboQbKdCa
	4GTcwzpqYhSn0CUu+yX7uAG7eT9aLtAcpnTj+WYGmWY9A/b0bQ==
X-Google-Smtp-Source: AGHT+IF60LeRaSOb3JrAyTtxF6Ss0kZSJj+Sa0bc2Hjfv4JyV8sAZmqmjTqBIQuqhJKvKHwbUgeqgQ==
X-Received: by 2002:a05:622a:18a6:b0:425:4043:18b6 with SMTP id v38-20020a05622a18a600b00425404318b6mr20842874qtc.105.1704028716926;
        Sun, 31 Dec 2023 05:18:36 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id cf23-20020a05622a401700b004276963b28asm11079940qtb.15.2023.12.31.05.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 05:18:36 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 54180106987; Sun, 31 Dec 2023 03:18:35 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 31 Dec 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 31 Dec 2023 03:18:35 -1000
Message-Id: <20231231131835.54180106987@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 13:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193090

Branch: kirkstone

New this week: 2 CVEs
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): dropbear:libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-6228 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6228 *

Removed this week: 0 CVEs

Full list:  Found 37 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-39323 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45285 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45285 *
CVE-2023-45287 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45287 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47100 (CVSS3: 9.8 CRITICAL): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47100 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): dropbear:libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
CVE-2023-51385 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-6228 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6228 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *
CVE-2023-6377 (CVSS3: 7.8 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xserver-xorg:xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

