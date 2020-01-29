Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1F47F60226
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 16:20:48 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id j17so4438617edp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 08:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iCZ9xYJMO81aYIXN3+Oi1x8mMiGMJ6Hjm+tKDH0yHOU=;
	b=OzygGQEpHg1EQahuqwMjkcTbq/+woCedY3gtnGGPxmY7GxD2TAdXPUMlHn6TPglFBs
	HK7MH92zN52gQLlxAfCpQXOVFjLm4sUlrWdEif6jNYgpCC1AmIrT/ZIMPpWLBVlG5a8z
	pTviQcnWscpYtLvKrXdROi3iLt0R7nkoSQ9dAU5hUMmA09HoXsXNRY3eFqhuKbuzXtbX
	YFvNx7RDn+LNsuZLq1xgVL9EnOCcg1xAYyxxgojsX4GaLlliLx/KI2ge7LoJjMzArIGV
	EZ6C3jd21Cz1/i7KrQOyBB08lnNC9JHS8BOnfkhU5afwLvv4/fqcsktdvVO0Z4/5Dtbz
	b0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iCZ9xYJMO81aYIXN3+Oi1x8mMiGMJ6Hjm+tKDH0yHOU=;
	b=LsSmNlzhS7wyocARtB9Jsr34g6oQN1cKJkJvfPR3w3ceDTzEDRiv4NTgwpHW4HZah8
	6J1xY6/2u8D/Q/h+oghcKb0tmhyzx0ZLCZM/Dbk2kzjWIcBKsHgm7wqkzXOdZNHSf4oI
	Qcgv1vSjnHBFmnKRf7bQLe6UTmnkJxAB089VYy0bUCbJ5icdDn4swOdS9ajSdZgFg+39
	SmzLCqHqQsn6bdHdymVzCHsT0W12NE+HBN+1ybaqsImAYuIlN9mDjQp2Qnb8qPwD9B7k
	/4kqXxrv3DG4ckkuEwFmPbuBis8P0ok+K/eOdeKB+9i89GMkp9sqa5m63Z81gbgQyW49
	UB8Q==
X-Gm-Message-State: APjAAAX8v1CGXP6WdrMFvIghjaim2Z9lulw1Adzb4pnUK8hQKGsm2MW8
	4UqxhNtx3usxiKDcF+Np0zs4Axfn
X-Google-Smtp-Source: APXvYqzXoq0FH1mKrfrsphFd5zT5AVftmz1XfzPmtsJqn9JDYl6esMFZ3DXomDE7OEtprTUYtILdNA==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr32768424wrf.385.1580288905906;
	Wed, 29 Jan 2020 01:08:25 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:38 +0100
Message-Id: <20200129090738.1398-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 24/24] libpcre2: upgrade 10.33 -> 10.34
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jan 2020 16:20:49 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libpcre/{libpcre2_10.33.bb => libpcre2_10.34.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.33.bb => libpcre2_10.34.bb} (93%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.33.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
similarity index 93%
rename from meta/recipes-support/libpcre/libpcre2_10.33.bb
rename to meta/recipes-support/libpcre/libpcre2_10.34.bb
index 87da3137696..fa8655e0276 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.33.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
 "
 
-SRC_URI[md5sum] = "80b355f2dce909a2e2424f5c79eddb44"
-SRC_URI[sha256sum] = "35514dff0ccdf02b55bd2e9fa586a1b9d01f62332c3356e379eabb75f789d8aa"
+SRC_URI[md5sum] = "d280b62ded13f9ccf2fac16ee5286366"
+SRC_URI[sha256sum] = "74c473ffaba9e13db6951fd146e0143fe9887852ce73406a03277af1d9b798ca"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.25.0


