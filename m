Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59CCC43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 13:03:00 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.16282.1658667771554936981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 06:02:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Hw7v1hTy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id q16so8095096pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 06:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=3vRtUFseTkXeL6mPCwWCg72KzOGI3wcX1vWQVF3+XAo=;
        b=Hw7v1hTyR7e6uW86aDhHhI9HcrkI/OZ7gVegrspWHkL3bpR99wrUh2gdvmXXfvlrUr
         RZHOFjR1xA9E4QsUSCM+V68LIQsDpaaMD5vFEwCbwnIsMUZkk5o62OMTh3Y64k6clQrL
         yqycvZZDbcYgxDgJQBhYV57ua1DRhNhkkpZjwajfIZ7dV0PFgoXD53ueTBRfbC0M9lOw
         mKOB+NHIghrYI+/0Y1Qm1K3nFXGDQQEb3X5zEavcjmpxx1tXQsfCNjbXnPnxm44ytOqF
         cShH0YVdVGGOpMp3lpV/W8GzEdaQqIRy6bCCIIboPR5ij93Jy6pVi1A8UWVvZjXrVwMT
         tJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=3vRtUFseTkXeL6mPCwWCg72KzOGI3wcX1vWQVF3+XAo=;
        b=LaW28WABFlvuIg2xCtOtGewi1WZNkRFpjL61eKSWLdhwRnoUVFGmVvaFe8hPmrBAYZ
         Xmw7rIHAvu5iq9s1k011YETUvDNn3wJExDF1vrUiUbg9btN+sQVe1LtkmlOtgPZ2JUIJ
         +NLrMyj+Ulphwcil7U+tcFoJ1lIjY5XloGWooBA9IH8ybnR3iEisjsNNoAIs8aERxZty
         1ca2l0dtntcm4jJ9djayfEOTb2KxsCX56Ka/zfiTH9c189l0+2JkWBR9h8HSrpSwIuWk
         AWEJ2nneNcrCPKoA4iI5VFpxv/7b0rdqPbvd1UxIDVLtqn0wpzXaUL/UqdQjM3TwFZ21
         CKBg==
X-Gm-Message-State: AJIora/OiBtruaIfs7ZZQ6VokNnirZtgn9wPVoNZfVm+U129uyv6hhx5
	q02iz5uIpmLW4cnqBURKRyfT3aMyiP9NNB2b
X-Google-Smtp-Source: 
 AGRyM1ubZ011D1thIzzQ0uM+afhIEN/AEI/LaJTdJAVd3bZ9IDZvglip4zq8U22FhqlPO6F09KQYyw==
X-Received: by 2002:a63:eb02:0:b0:41a:716c:bfb1 with SMTP id
 t2-20020a63eb02000000b0041a716cbfb1mr7395687pgh.198.1658667770217;
        Sun, 24 Jul 2022 06:02:50 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q10-20020a170903204a00b0016a1e2d148csm7067095pla.32.2022.07.24.06.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 06:02:46 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 94AB0962535; Sun, 24 Jul 2022 03:02:44 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 24 Jul 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220724130244.94AB0962535@nuc.router0800d9.com>
Date: Sun, 24 Jul 2022 03:02:44 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 13:03:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168454

Branch: kirkstone

New this week: 4 CVEs
CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
CVE-2022-29187 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29187 *
CVE-2022-30634 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30634 *
CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *

Removed this week: 0 CVEs

Full list:  Found 19 unpatched CVEs
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
CVE-2022-29187 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29187 *
CVE-2022-30634 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30634 *
CVE-2022-32205 (CVSS3: 4.3 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32205 *
CVE-2022-32206 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32206 *
CVE-2022-32207 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32207 *
CVE-2022-32208 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32208 *
CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *
CVE-2022-34903 (CVSS3: 6.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34903 *
CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *


