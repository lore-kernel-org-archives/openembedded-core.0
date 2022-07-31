Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50F8C00140
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 12:02:30 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.12484.1659268948952907727
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 05:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2HqT6WEU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id v18so8155335plo.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=hdDzapNxBqJAxTkjy6/cEfPqUF4iglxSw4w9H3KrrXY=;
        b=2HqT6WEUGTAQJRPrYPJNFIHsJiXW/q9mGV8M688JKGG/efDm+OLytEdXdBiImlaA0w
         Y7JbVEeyWhTIVOkzs4ZME+UcjDe78lJrAWNfRkNiH+ik/3HODusgS0lR/d5VUqJ13Jl8
         JpuPaSul7CRHnUwXx53VpQymc91wwjcIILzKuhmofzMalkWMyQex+NXozcbcqEICK7qz
         KJZE/yFaFFXoQUE+DzKu4EZPVyqDl6ntWpsAmcYOKIcsHjeP9zp11m53mgdTPZEGuyGR
         Atu1FHUOz2i4zvrEF8BAuqIMw3cUS2ZigFNx2X3h/Gd51iCdY/fPcoeTt58jxmNFc0aB
         o1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=hdDzapNxBqJAxTkjy6/cEfPqUF4iglxSw4w9H3KrrXY=;
        b=I+uVg/D6OtZp8Q5ciZQrX/8yZyea4nPpPyCtLrX0TXcHxvyzTk14vK+mdB6BT8i6MV
         Tp4ITTKPyK5E5OuRXk7JmAx12/oqAplU7V36TO/ULtqfI7er3SVSZvuj+hzozh+uAwdd
         jRXEWmIDQOoY2zf6cqD7VHlUzmUJZkfcHQnfX4FOisqBZSui3qjFJTUbzDRgiTL01pAL
         CbtkssZMzE5Bybn7B5/RJJoxFvp54fn32dnyIv4C4HLcqpfJfDIh2anN5/EcGQuddpLe
         yfWLMfWS4vKgfl9RFcb+Sz2lslG52w3ckPR+dX07CSLIGqUA2Y/lfMCKcEZU00UAxHyX
         7gyw==
X-Gm-Message-State: ACgBeo17xNSGNRgZj4NyGnq3m8dJabVyw379lu3epjFlW8Ijf5B4ZMGG
	17w31BMb1dHwBx+2xfGvwd/jgMQ3sGl+Co3f
X-Google-Smtp-Source: 
 AA6agR7UTzIP8exUURVyjdMPCdPDLV6JJUXOnEoJSfsR2KNRQizkXZuzcvQ2EiFObANFoWRJUfbdeg==
X-Received: by 2002:a17:90b:3143:b0:1f0:3971:37ae with SMTP id
 ip3-20020a17090b314300b001f0397137aemr13782410pjb.223.1659268947624;
        Sun, 31 Jul 2022 05:02:27 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w69-20020a627b48000000b0052d5f32ef47sm686693pfc.169.2022.07.31.05.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 05:02:26 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2705B9609AE; Sun, 31 Jul 2022 02:02:24 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 31 Jul 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220731120224.2705B9609AE@nuc.router0800d9.com>
Date: Sun, 31 Jul 2022 02:02:24 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Jul 2022 12:02:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168685

Branch: master

New this week: 0 CVEs

Removed this week: 6 CVEs
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *

Full list:  Found 1 unpatched CVEs
CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *

\nFor further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

