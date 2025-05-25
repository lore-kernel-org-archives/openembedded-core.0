Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FD8C54E90
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 11:54:34 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.8042.1748174066685199787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 04:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TQT+yK+t;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742c7a52e97so1084644b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 04:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748174066; x=1748778866; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig+VZDlDAMZZerHRqP3A7lgwXpSmqnXFb1zn8mJbKYw=;
        b=TQT+yK+tvTLy45YhG0xL/LsBhV9GSyBWiItknyj1MlOMg1wGwnxrM372EkAHwvN4mn
         SPw63lantmVcHmdaM5o2xkjR2EC1KrcM62z8H0X3xnJYphXAMz6dFT6nSiqjXTV3LSqa
         S8hPyWkhgWxoIAp/k72aT3wxecUQdMADaBthGsXt8SbJP+P4PXNuQHsFUvA+4ZeWoyuz
         NR9QCkLfo0kPGQGzpHxyEkIXn1ML9RUhS7moAqMMVxa/pc2GAHTYZqDa+zPQBDDVRLsR
         zMTRfZVIejKtWuHvb2Zs8ePgzMy1NYY2RvBzixVP8TigmxIU7rnvpvRhhTiy+mMDHlhC
         oWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748174066; x=1748778866;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ig+VZDlDAMZZerHRqP3A7lgwXpSmqnXFb1zn8mJbKYw=;
        b=BlcoThmgEbTRt/WsUNRh6lP7k2N0dFqWSab5swObvyytiCpPs1dROo6sWplznDmtoX
         TVD4Gxa+WvYfxXd1DLWz7PgTtmCHsj3qoPTrqGo+j4QxNVF5e7LtmJOKX6p788GcxbFB
         kr55+iVZ25XLfk1jfFD2WpmSkdpcywN8JyccMRMmq4NTifo92EuO87p5cPEH0+7bU13w
         nB3Glu7ec5/bK5/T/d2UvgnwkoQXqo1l+qdlU4DGETmFKUA1+qQ541IU7tsoAK+XAd+U
         Dv2GoqHokPQG1fyU8olI0Fs9ygEUzXeuGSJBBbh5BK9hLAVnyChFXctVyAzktV0yqQDM
         RE/w==
X-Gm-Message-State: AOJu0YwPwfMUilh7EfiP1L1cLLLO4vgnuTRTVuydUJAEOoj2iHXNrrPw
	jYBO1RuXxOOhh3fS0AuwjAnjyOCcMJgWUUpywPeG9CcujGZpo/brTI7dLOYFV4Bqsxz5ohXi3CN
	YcLbHVfY=
X-Gm-Gg: ASbGncvRwjXbZb4HeAtUra6UvxoynsgbxfqyfbURYJBlBNN2xD8Wcp8SaHUgZOSLEVD
	fFk1US4S0/IOjXDNsJokyUnze7SmlOuTcD8n5sVRjmr5fADqyn9jyrm3O+QCgjTIOIb6M/w8SSE
	285cA6/IG32B9P1InrHWS58rPsCPpWHOUrgZ+1DpIrcEc+X3sJEIxruLLj7qbdt0kr2Zjx4k3dD
	NsOuI3WshxpalQ/vl+3gcdSTr2VBAOaAJOs9cdowEkDBN+kdMIdy4yfaSMGIO39tSj+ChUH7L6H
	uz64ZQMb9LT0d3q66R8Ge9/41/QlW7X4a2i011sTvg4ndxitjPM5kppW
X-Google-Smtp-Source: AGHT+IHv5kIui6+K0VdL6bO6imOfGBk420K2A/hlRqKqpsebbKdIXeqRBcWsTsPf3eQK0aUpMmCsUw==
X-Received: by 2002:a05:6a00:2e84:b0:736:ff65:3fcc with SMTP id d2e1a72fcca58-745fe034b6amr8086368b3a.16.1748174065933;
        Sun, 25 May 2025 04:54:25 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a08esm15373568b3a.112.2025.05.25.04.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 04:54:25 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 42B6710038B; Sun, 25 May 2025 01:54:25 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 25 May 2025 01:51:23 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 25 May 2025 01:54:25 -1000
Message-Id: <20250525115425.42B6710038B@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 11:54:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217246

Branch: walnascar

New this week: 1 CVEs
CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-1153 *

Removed this week: 3 CVEs
CVE-2024-56406 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56406 *
CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32414 *
CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32415 *

Full list:  Found 30 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-1153 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

