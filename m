Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.204.1794239426298949847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 07:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lvotUHIN;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: rybczynska@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b336de3d38so6958927b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 07:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239425; cv=none;
        d=google.com; s=arc-20260327;
        b=MWMUzMWAorjuwUPtc9oKez6uUHc7c3RkS7hvJ/dkK1hO5trCjAviQnpU+S+6fJNqgr
         tFJ7Uo+/3N13IKwtUvc616G9bZ/eqb+/ECzhExOle1/fRQBGOQ6nLU0uA/FGj9Qd1FND
         P98HULd4FiitNkSwlC8v6SONJK23aLr/kSJkV/OBEtS30VsBQkDHIE9lYgx4SdRFamKp
         EDdBIsyz+q1pN/O6jelkBiu3Z8hpwyU3QO5PgN41BDtaqABJ/a/33Ao+U05jZKNb4/58
         ZpFm7jfmfdUKJgbilaw1vgjN+wS2Xy3Y6po1Ug3afmN5VtOPcEpJ9hHPirqZCtI3uvfJ
         Y/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yns0skbocAQs6nd0l7S/s2wE5wvI4HNR5A4VpHovwi8=;
        fh=BSmz6V3vs0K8fjRj1w8/kD5USA8rvC7ZriNB96wJFfo=;
        b=mPwMW7ijULJmduN8ZN6JdQRG6x21NOEXZjapFlIEZpFFaS3z28kxDGkvvRUqrda3Dm
         iA9wXnt9sKUt6TVnodLc1uJ6tA2ZPoJcxVhMhQOpZG0h01x79JDwFiab7vqTa54htlvI
         Ou24rWQ8W8hyLFijiERgVH2ue7LB/j6xULFbc7aZH6lYF3k1jwPUrlLfF7kTUk9BnSD5
         0vlYH8NNmjgpLkIYsZpY6RNOBEqrD1qjGmRbBF9fLy1NiranpEZiAyQBvUBiYuf1o5O/
         14lg0VnrtiY9KU0mbe35kp95gSd3xdc4JYtUvQm6nqnHidppMdvGeaEszQZeekn/WRXC
         a5sg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239425; x=1794844225; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yns0skbocAQs6nd0l7S/s2wE5wvI4HNR5A4VpHovwi8=;
        b=lvotUHINrn9S5eLnW6KYo6ewNQwIcOZ38uq7OFEc0eQ1LC4rdKHb4N9hLrdvb0diaj
         f2VEOdowpbd4yr0zqEG6xGk041ZlLngG5kpXr2RlYI9uO/iv0y8YLEgkVkV0A/4iGZs2
         p5KWZE1z+ZaCEmxxIYlmYYmYJH4LqvWU+jcpQhrqPxrhW5pt25ztBxLiOYoRN+dLwg7f
         l5ZxzWCRYIm15jaAlY+CfUqWiMLYMuQCiKuvKvqeRPiNpofwHhMZF43enBF6kg27pKmj
         Z4dB/MgLfsGQCsEQxRgotp9Yn4tsoTVSDRczjjSK//AET+P7r7ytjKh/zt/a8vvQnweB
         A1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239425; x=1794844225;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yns0skbocAQs6nd0l7S/s2wE5wvI4HNR5A4VpHovwi8=;
        b=gab3ixe08wpIBhAIq+g44JlHD/XARiKJBLMDrbIl7U2OQEZsY5lC4wp3D6fS8VG1Bj
         y4yzfs4KLs84IylNceJlaZXFlxDGrdDRUR62EC1ss4gTPmzzLft+8P6aq2yFoafEbA5a
         AjqjFKp/59hzHlwDh2MeLrRY5Hr/Of6+e1dNxCu2n7gwL+Nc7v4s+QUQHXpCk6Y9PNcv
         8JoRqH02P58N99rtnKDvgn1WnvlIKRY96GM3VJEqcaP2PWyhgpPq6Vbyu6MdiUVSk9pF
         uCCiW2YJ6S72Qn2nSmk1Kgq/KYvDWv0R91AlVUMDXnzN5admslK3Jw/zkFxOwRyDaSfi
         3ziQ==
X-Forwarded-Encrypted: i=1; AL+hErGr4LwnkGfw9gdcPMrP3eTgzGK0wAORYk6UwXO6ge/qTc34xs2DAdxL20t6gQ/VFfXhNotu56EdWgEmq7MDfZ789g==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9dBVMlY6v8/yUUHzY0O9sI7pPV4E1Mp40MPr9jIOmrvujJI/0K
	eufriCRmGfsIUtJOhrxaGfhYuR6ct3hT06fr60roRl6l9sO7wJ10wpf/0QBlG9bZ/OUp4kf9b2W
	HLrL3/tbDfc5+r2DgnevlubqE60IX2UTaxW6Y
X-Gm-Gg: AYBFou2iqSV+Por/DuohKa5WAnl7SlXtdXJgAcxAoexonPwn1BDuOjLFiZ95IApF4eO
	ORwcoMc3zI2dQT/zDNMqJYAcAyO+QniLoa1QiRP6vk5fJxxa7CYA/+/LW5yq7f39NxRFT+6ELiY
	SeDkqnEU7jBGH3gmEs36OXCXz2tHDJ3F45yyZV+mXFiyTJ5Csxx0F9736LtO61omXeVPXn+yPvQ
	8P6Fmx42vmYxTE2IbRI3rpBnG0zMJCE2GfHNmQOiAwt5FX1V6/Pch28z7f98D4sbn2VFynbH0/I
	hSdQzagID3MkeRN/ztY7fyU7XIJtXu//HRU/HO95M2JuJt9pcwu6YVDMFC2bO/8ulyrqIw0JAIy
	mbJwx4QAMF73WlRBH3HGQD1NbAt7pF+q+Kc8MWyZbbseyuSPtkoYghiIci4UC3T8lI73ozj4Gkn
	ZpRathACmpFnP2O0Bt3FtkpH5GXh3ds8Nj5BTl8K2gzZ3GEUN6MUo9FPk=
X-Received: by 2002:a05:690e:4147:b0:67c:23f2:4268 with SMTP id
 956f58d0204a3-67c564391b6mr14313d50.6.1794239425301; Mon, 09 Nov 2026
 07:50:25 -0800 (PST)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Mon, 9 Nov 2026 16:50:08 +0100
X-Gm-Features: AclHuK_1IqqPmeWFvt7bEFnvsWXFiad1AlTo5Eq_8fJIA9eUrMY_jp5tYlezm0E
Message-ID: <CAApg2=RBygWWkQi9HtLHAbzdyTJGb7SLo=RJn8tcFyve21LdRA@mail.gmail.com>
Subject: Yocto Project Security Advisory: CVE-2026-123158 (openssh with musl)
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 15:50:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249857

Yocto Project Security Advisory:  CVE-2026-123158 (openssh with musl)
=======================================================

Published: 2026-11-09
Version: 1.0
CVE: CVE-2026-123158
Severity: High
Affected component: openembedded-core

Description
========
In OpenSSH before 10.6p2 with musl, in some specific configuration
with pam disabled and password authentication enabled, password
set as '*' (disabled), any password between 256 and 1024 characters
succeeds.

The issue affects systems running openssh with musl, and PAM disabled
in the openssh configuration. Therefore, the issue does not affect the
default OpenEmbedded configuration that
uses glibc and not musl.

The vulnerability of a system depends on the user configuration of
system users. Accounts present by default have a configuration
not allowing a remote login (except the root). The root account access
is not affected if the default 'PermitRootLogin=prohibit-password' stays
set. However, in the default configuration, PAM is disabled by default
and password login is enabled by default.

Affected releases
=============
- master, before commit 5247d0d8862c3402ac061fede5844da4d5c4be4c
- blacksail, before commit 3bbd2a4f81f368ae7eac580949e4717f7aeb4f06
(6.x up to 6.1 included)
- wrynose, before commit 2285da08068a6d1b4a64c9a52d85a58be50e4679
(6.0.x up to 6.0.4 included)
- scarthgap (fix in progress)

Mitigation
=======
The recommended solution is to update (see the section above)

If an update is not possible, and you are running a potentially affected
system, follow one or more of those mitigations:
- Make sure that for all accounts that have passwords disabled (* in
  /etc/shadow), home directory and shell are set to values not allowing
  system access even if a password were set, for example
  :/nonexistent:/usr/sbin/nologin
- Disable password authentication (key authentication is not affected)
- Switch your ssh server temporarily to dropbear
- Manually update openssh to v10.6p2 or later, or manually backport the
   patch linked below.

References:
=========
- CVE entry: https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/123xxx/CVE-2026-123158.json
- Fix commit in openssh:
https://github.com/openssh/openssh-portable/commit/4353fdc43ef646c43a8dda7025cc1a898caf1482

Security contact: security@yoctoproject.org

Changelog:
========
1.0 - initial advisory
