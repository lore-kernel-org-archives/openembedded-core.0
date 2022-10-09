Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3601C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 12:02:43 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.1849.1665316962337892742
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 05:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AdEHOHX2;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id u71so761281pgd.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 05:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJY8nM8l4GWKF10brtV5/Mexa1NBh7gr71XfJrJByRM=;
        b=AdEHOHX297YCBe/xmlERSg+ljWR7zTbJ8S69iATDGzSAqONobG54Ch1asTUPjN7VGd
         nb9Ck1AKI8VAEVPZX9UVG1FUbmfdJPuDtUzv2877ztBBGUfci6beLxlx77EJM5U/UmeU
         7K1mxS8H7KEnsLPakgoYpIV4uNTU4hSjBP6UT3meEA0e7DeNUykrtcuL0HCakpKawijU
         utdSiwPx2hY8C+kyBhsDvwr4r/UeG1ZxYX2SV80RN7CVIfY/eGHsziPBGroKpoRHG7se
         J+NR2X+gwwvQ13d/VDnaxDK27Wa9LkUN8k5jyjC/1+67OCsE/5oqHDv+OIVuWI3rIGuO
         y9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJY8nM8l4GWKF10brtV5/Mexa1NBh7gr71XfJrJByRM=;
        b=gcMCKzX5KFH+AzaihbvgVuyyCtmm60uhEJfS7/ZQDbRA13hKXzRLWRaoT53sxeMOWS
         c6TCGzrpE87FSC5PYv6Ox221uGCBH0LzZg0RrPf74AyHZ6T88xN/1cj1F9X80bbItn+t
         6o80Rf4TOCrsn+rXfWOlqqmEORlX4sB8mvZpTSTvVfULg8JgwljWLLOZIcqMDKxPuHM6
         QA/8fTKXIF1dcxBU0lHJCawtMtnVs5JfBMpsK0I97cnALLc7hxOXfaxGGggXlyivUCUg
         o3i49IpjdEHUSXIFu0uwDBxhYK5F5GuhfrRgKwuUYi61wkU1zZfAOvaEgkUMJVOn2Xp0
         qZnA==
X-Gm-Message-State: ACrzQf1PoNU2ru42x70vMlEhqyJf/ZAMqZ4MT8Vs17odfjQbEAXRQ1B0
	CVVguRT2viLV7soB8IWgbL6mAWH1xM2QVKmo
X-Google-Smtp-Source: 
 AMsMyM5IxNPXOfXD6ledt4oAGiOXSqDg3zLAiGhBnHGOU7vFcLj6tWwmMcWAyLmZacEyCevjM2jSuA==
X-Received: by 2002:a63:d845:0:b0:44b:d074:97d with SMTP id
 k5-20020a63d845000000b0044bd074097dmr12726640pgj.32.1665316961269;
        Sun, 09 Oct 2022 05:02:41 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a29-20020a631a1d000000b0045c5a749a8fsm4495838pga.61.2022.10.09.05.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 05:02:40 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 87F82960832; Sun,  9 Oct 2022 02:02:38 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 09 Oct 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221009120238.87F82960832@nuc.router0800d9.com>
Date: Sun,  9 Oct 2022 02:02:38 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Oct 2022 12:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171549

Branch: master

New this week: 1 CVEs
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

Removed this week: 0 CVEs

Full list:  Found 2 unpatched CVEs
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

