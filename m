Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FE8C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 12:03:08 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.6064.1661083380512604564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 05:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=eMWKSA5C;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 o14-20020a17090a0a0e00b001fabfd3369cso8786833pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Aug 2022 05:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc;
        bh=KObZ8MuTZK8ZCohHRpp8sItLKic5qlzN/EmUFzdwRK0=;
        b=eMWKSA5CgDYQrHG4XVCzU2ocApBILqMHdd59CLXg+0wDVXna63XZbFSsEP2SNXpEK2
         TreOUHcO5SSIUgJmrP3UGMC/mMfaB2ZyKIU2J1k4+3ZEuDZjfA9wRttR2KwlgpTPnvnw
         M9GtJdmey50AXUnBAOfD1ovQwv+GYqLSZeLpklOUpL1NPfI0t1HrHQ5iuxJvzUWwh3Cz
         IIcg3BCTG2WGCqXlmatLkjWj6cMBaMzLs08ySItIueseopZLhg9lVj+OEzFm0KRYW+Jy
         vwPDIFnUUsqq7XtEVL5HxMxwGgb36AiGnVLduIh39xCZosnVwsT+vQBiZfFDDS9RpVKe
         4mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc;
        bh=KObZ8MuTZK8ZCohHRpp8sItLKic5qlzN/EmUFzdwRK0=;
        b=MTU7BDl4y/wwdoxxI7m5q1jDNzkEC6H4R8eA3iJYTVso62dCjGDakPgugblDNlCuWj
         J10b+XvgHP/YEZGvZhO2RvFIBOp9u2zbXFD2u57q4lsFmRafgOn8qm5cjplwZpraVl7R
         MuvKqB5Yal3cDyCaty9ScfPAYE0Hnm6zK9mtXkJxfFB7+p/4RzBcvhKoi/w//HGqDxWB
         zHFc1lQXLB8PAxk/QC52wHfRIKlr5urGPn43kasdGQHRX2yIKskLsVFDpE245qZfQ21d
         HY1EzvnUnPR8W+6wfNmRq1OMNJD/B6YEhdREMgdY0yQFfnUIn0v5oCW1deRa1wFO2Waj
         Mcmg==
X-Gm-Message-State: ACgBeo1MKanImeJj18arlKTqR5r13r4JLfZXrJPH6dvxc/xHJQMl4LQj
	Y82TPc8aSaC8TmHAUhaEFR8uFLSEnvCbcEhU
X-Google-Smtp-Source: 
 AA6agR5BfohKYHkusJ/Qcjtz1VjRZoQO1BHtn8eCMTYUUyPgi1iY2WWfQTAkro8EOo3uCysQSUoZ8Q==
X-Received: by 2002:a17:90b:4c42:b0:1fb:1c32:8e50 with SMTP id
 np2-20020a17090b4c4200b001fb1c328e50mr2889284pjb.98.1661083379391;
        Sun, 21 Aug 2022 05:02:59 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i13-20020a170902cf0d00b0016c0eb202a5sm6324453plg.225.2022.08.21.05.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 05:02:58 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 32F1996070D; Sun, 21 Aug 2022 02:02:56 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 21 Aug 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220821120256.32F1996070D@nuc.router0800d9.com>
Date: Sun, 21 Aug 2022 02:02:56 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Aug 2022 12:03:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169652

Branch: master

New this week: 11 CVEs
CVE-2022-2816 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2816 *
CVE-2022-2817 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2817 *
CVE-2022-2819 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2819 *
CVE-2022-2845 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2845 *
CVE-2022-2849 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2849 *
CVE-2022-2862 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2862 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-2874 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2874 *
CVE-2022-2889 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2889 *

Removed this week: 6 CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32292 *
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32293 *
CVE-2022-34526 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34526 *
CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37434 *

Full list:  Found 12 unpatched CVEs
CVE-2021-46828 (CVSS3: 7.5 HIGH): libtirpc:libtirpc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46828 *
CVE-2022-2816 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2816 *
CVE-2022-2817 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2817 *
CVE-2022-2819 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2819 *
CVE-2022-2845 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2845 *
CVE-2022-2849 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2849 *
CVE-2022-2862 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2862 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-2874 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2874 *
CVE-2022-2889 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2889 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

