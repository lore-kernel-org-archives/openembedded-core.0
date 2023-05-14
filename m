Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94384C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 11:29:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.64834.1684063760653993503
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 04:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=R8jndMaB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1aaed87d8bdso82094275ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 04:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684063760; x=1686655760;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mI1Ebx0nJ7nUhKGkhqyvk528U71uMP2hKIXakYvFxog=;
        b=R8jndMaBn0LnolcGQFVqAebBd+BMl6UzCg3Gc4UTCwwIboDUP37czRb5274/z9hugk
         PyH33bjSt8HanKivrjFxmLoypDWfvPjJTGDXdLftBy9cyzlHtN5/ifAlh1w4wWh6Ujlx
         Du46iig1aLucogXTnkE2+/pis+z8JPyjyAakhx9KMDZ2x6VIFNkwdzfey6/ayVq2K7pb
         cOOIFkgz4SIvn+ROheqGWDced5FwDwwYHrl0LVZM6NkQeiofIkB16AlpLZmSdlzz8aor
         Egdi4OoOMEr/Ro7Bc4u/9HAXZAf9JMPzbV4GZ3C+1Z57gdPUv8MZ/RcBVpURS4fY92bX
         1YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684063760; x=1686655760;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mI1Ebx0nJ7nUhKGkhqyvk528U71uMP2hKIXakYvFxog=;
        b=borz3U/L93uLwDEGnpRTRYfNF6pWvtw31e2CEYVxw75PpH2tH88eAjnSF4UKcF/Vim
         Ix6vYvkmpqYIlpqx3Bl6iGHSblPFbqyr8Dx5tFP3deHRQ9y2YlCHSzkrLlv8mXke+/jh
         YDD0HJHZg/c2iqQm9zNaKhAM/OH5hGCOG1YyVaMNlxEMPeUTcu9zdKZcdPLBg7Tcr+bV
         unMvqCpECHfVUnS4Vw1Q8xnU/unY/PwUWy06uJN/SLyBWkrfG9X0TY8VgNZov1dqyHtG
         yvCLStEbXeyTAkSgT0FPfajhkPW3Dn33o2viCH/DxU2FRB17tPiySIqFfVXXeWDPGy6/
         rvJA==
X-Gm-Message-State: AC+VfDz+eb4RsATn9yR621s+4ConYb1G07Ep38xkm+s1+HExksSG3FKy
	l2ugUvREwjVHLSr24+09et18MVssHA9vEvptUuU=
X-Google-Smtp-Source: ACHHUZ51+veOeonDBOhLJruLnNIIqXF1cMOtfmzAN16TKXXbGJvQxubFh01f7GRgPBNwpz0q2p30vg==
X-Received: by 2002:a17:902:c115:b0:1a0:4ebd:15d5 with SMTP id 21-20020a170902c11500b001a04ebd15d5mr30203986pli.67.1684063759447;
        Sun, 14 May 2023 04:29:19 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n21-20020a170902969500b001a634e79af0sm11263200plp.283.2023.05.14.04.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 04:29:18 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id DBC579603D3; Sun, 14 May 2023 01:29:15 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 14 May 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 14 May 2023 01:29:15 -1000
Message-Id: <20230514112915.DBC579603D3@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 11:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181197

Branch: master

New this week: 3 CVEs
CVE-2022-21227 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21227 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *

Removed this week: 1 CVEs
CVE-2023-2248 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2248 *

Full list:  Found 44 unpatched CVEs
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-21227 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21227 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3533 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3533 *
CVE-2022-3606 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3606 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-44370 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44370 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-48425 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48425 *
CVE-2023-0465 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0465 *
CVE-2023-0466 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0466 *
CVE-2023-0615 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0615 *
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-1380 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1380 *
CVE-2023-1611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1611 *
CVE-2023-1855 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1855 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-1989 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1989 *
CVE-2023-1990 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1990 *
CVE-2023-1998 (CVSS3: 5.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1998 *
CVE-2023-2162 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2162 *
CVE-2023-2194 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2194 *
CVE-2023-2235 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2235 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24534 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24534 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-24537 (CVSS3: 7.5 HIGH): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24538 (CVSS3: 9.8 CRITICAL): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24538 *
CVE-2023-25652 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25652 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-28328 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28328 *
CVE-2023-28464 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28464 *
CVE-2023-28866 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28866 *
CVE-2023-29007 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29007 *
CVE-2023-30456 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30456 *
CVE-2023-30772 (CVSS3: 6.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30772 *
CVE-2023-31436 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31436 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

