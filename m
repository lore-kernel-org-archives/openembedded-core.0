Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5610DC433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 14:03:46 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.23397.1634479425475122971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 07:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7EYOE/As;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id t184so348428pgd.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 07:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=sKzTEEg2JsAiRMSZWeuFIe5ajNaGioTtBSzx/GZyNJc=;
        b=7EYOE/AsKbTpKfZLiZQQfbpobcddcxM2GgGFpHNufKNYObSBHeu2lp7+urToRtuQwh
         khY4yRbdodIxiOSuSLdqA1e/0wiPiFSQ5rMfwLaKPxuNJ+2hD1JW0bsZPkzNdbeQTaPy
         5hvBoNv7x3bjB/kRDp62Ywy1FFtXTW3+81dCLv396ScixGfzJi1AHQUckOkYlz5aJvTa
         1PzsJy7d3ZgjWrtDvUpHwOcnNfE5pOO0ss3r3pDRWF+QNKQAnbwrOdusDpaRIo1oc2B5
         ylHcX0O2LpdUrKNt6J4DT5E0xsDOZOu/onrFkNKbiOO134qo97K9lpoQDlWlp7hdj1Ky
         Gfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=sKzTEEg2JsAiRMSZWeuFIe5ajNaGioTtBSzx/GZyNJc=;
        b=oNwg8/PtV+jfP9RuMq9egE8eX6FpwRudk7h90NYeCiCJJu5Yt7B83e0AXc2SnQIsF+
         1bqHNNDs1HawlC3I5QBerzWJ9+EnvSTgU4G4K870Nc2ig2yOEWWs+VDuohHv5FtMLv4w
         KUgnEx29U46G6PXNCWr7ehpHgPxLeUW01bbmYYBF1/IAo1BljwkZr6lAAIy3VTBDd6/v
         Q5BYyF9ovGLoPMsJrCsmtjd8zWpjhvlaBkZE/bZFeGyoZDkuRyKoT0yb4Wo10Mri6w66
         oIqscGwGyobeCShVgoofLShuE6NMd0PqLEHfVPPGo2SjI83qYb/RmH/NrMx9NV7wOkfJ
         6K6w==
X-Gm-Message-State: AOAM532LsLza/vEMRWxtIH9Jnuk3AdZaQIzE7FGS6BONzx+97Cgi8s2A
	DZGIPQh2P7L/n02rH2QsL59b2n2JcmHHX4YzRE4=
X-Google-Smtp-Source: 
 ABdhPJwKmmpwAGLMvRARaxcSD5zRPg2o2oIAW9/45KkcIkip/BBHzBrusubaRCXpnT7OS2eG0CklVA==
X-Received: by 2002:a05:6a00:1945:b0:44c:a955:35ea with SMTP id
 s5-20020a056a00194500b0044ca95535eamr23050119pfk.85.1634479424235;
        Sun, 17 Oct 2021 07:03:44 -0700 (PDT)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 t22sm6229706pfg.148.2021.10.17.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 07:03:43 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B8FEB9602D9; Sun, 17 Oct 2021 04:03:33 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 17 Oct 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211017140333.B8FEB9602D9@nuc.router0800d9.com>
Date: Sun, 17 Oct 2021 04:03:33 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 14:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157040

Branch: master

New this week: 2 CVEs
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *

Removed this week: 6 CVEs
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-22945: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22945 *
CVE-2021-22946: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22946 *
CVE-2021-22947: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22947 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *

Full list:  Found 11 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

