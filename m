Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE50C4167B
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.7131.1667530901419952956
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=chYflXX5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso3528273pjc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q33k6dm08Pi7V2PEK5W3pUT7zfJnC05ua39Se6HIbu8=;
        b=chYflXX5c0lPxU6o5tp/F05g/QRXM72ZaYTfA1gRVRvNU7EEQCunBXnHFla+driLWu
         gplrVXM2f2Ihg0b2aBqoQlHSb+/Oj+9tNg5K6wmdXuhYyKlIRZ3l2QBayqXmsZJI8WAL
         OTlTzWksveT7zPHAaD2FQGxVx0cE2PVrtWRgYsqoeZbu5x/RrV9upNEvyBLDU+gLNZUF
         6KRhM53kLtfiyWj8NW1YSg6JmvLcbUUZeW3LBbHjVjAFTN5Xpv59PcvvcGHSW+qhoD+6
         6x0iz40YWBDBjB63Eei5IUSYBrcY4dd3j7AVaYKQN5EYbNGZD6qq+Md5usprtIuNVzd2
         Ef5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q33k6dm08Pi7V2PEK5W3pUT7zfJnC05ua39Se6HIbu8=;
        b=VOhXi7xtX3y8c+nOfej0ekgUTpQdlGVYZe6fQZ8QvpYnYryJ0uwWalfX8UeFPJ7WpT
         OlBu9uCJzIaDlSgsjWP9aDp9KIcDVdTc15aY0IVZujG62fqfFAj86+6Njzyck/fQ3ZwM
         kNfFy05u3uJbgqOESMyg093NiZFImnuHGsC09fiS/0Xc8Ar8TfPVrmmmb5BleiW7tcIY
         qBk6Z15dYwG/25TstHz3aKfkiIcSrcmE6Fc3gZmspTsFeRHNN/UuXnUNdJjlt6Fe0GWT
         i2izv8E+OE/lq291zn9Odek9rmfoj0mZfksNATnWJriz9pwxRUjPqajKKrkLokIXqpEn
         Niqw==
X-Gm-Message-State: ACrzQf0Pm1++S8UARXpIvrUS82wMR84eEdMOnFwJftbDiDR6Hv4r3XRJ
	9oV8qZ4Zgjn4aaxiCzwj6Ur17x70HPLDGovt
X-Google-Smtp-Source: AMsMyM4nRPQAZGrqEWqWQD8OpiPXuOi+U5Zdd7pDD+ooPIhXyw37+Xlo9NdSwsaLIEMr/25Z6i5DxQ==
X-Received: by 2002:a17:902:ec8e:b0:187:1c64:7c32 with SMTP id x14-20020a170902ec8e00b001871c647c32mr25562200plg.24.1667530900575;
        Thu, 03 Nov 2022 20:01:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/31] vim: upgrade 9.0.0614 -> 9.0.0820
Date: Thu,  3 Nov 2022 17:00:46 -1000
Message-Id: <d319dcf76880ff80192dde748f8a8554531b8256.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172672

From: Tim Orling <ticotimo@gmail.com>

Includes fixes for CVE-2022-3705
https://nvd.nist.gov/vuln/detail/CVE-2022-3705

For a short list of important changes, see:
https://www.arp242.net/vimlog/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6d917bd0f8810b5ed8d403ad25d59cda2fc9574)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 0710f6afbf..298a111853 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0614"
-SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
+PV .= ".0820"
+SRCREV = "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


