Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web09.9618.1625830368619579215
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 04:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FmVUJcOq;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: uvv.mail@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e13so9989497ilc.1
        for <Openembedded-core@lists.openembedded.org>; Fri, 09 Jul 2021 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PWFnVWt3wFsz+lTHLjcxErGZZdCY02gc9cUxdhG4PUU=;
        b=FmVUJcOqS9sStT4EgYF+kovbmFYCsdHty6Rh2GCP/AE2ZIP+gQ1f/VaNYucAM7u6VJ
         m3SmMEBnQqmNURS2faG5P7eLKEIn26CaT17Hy8JoP3vqBIkx2cTigv0L77b7jKV8xjH6
         aQROEKIy5zuMBjhcYLpa6closPhexoLvnEMYtfF4NFnGam20T7QI2X83oZ7pSYWIB/6i
         iqU7xqtqQAWHLwiusckwkrmTQyBIRPtBT6NaIfRHUKfCM1kBe+70BAgcYptuQPIH9hFL
         1aYLSZiLh3BmDQ8qYNcQno9usw/Qq0iQh2YcgiLAOFU15clMF0uDHX2JNAn0Eslwcw3K
         VHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PWFnVWt3wFsz+lTHLjcxErGZZdCY02gc9cUxdhG4PUU=;
        b=IpPmcxfphMCW+MR7WZ6eF2inXnCJajwAPwhqtD2Qgc9h/3QjxqK/3lfoXJnOB82ElD
         k2ysobLoqWec7jBsl63iq/GSN3V2Hxl4jy70UnnkKh0mzQd17B7199bAcQmejo3CD+Z5
         AcLwvLv2RASwoxW9VX6WbFpoyoiJdGNyabk0yUvPoAYlDrnUZjVGtwf6CFQda1ahnw6g
         JRV0/vTqK3gGKrnwMQNrvffw2Hws0Bpzrql1StB5w/drY6Z+P+nwVwK4T0SN9vyRdLVp
         f+GUmcsTt8NHc9ZO9FPg5vFh5YoXvV4jyGnNWXhAAzGcDVHtpWrl7kw/Bus8WDLZtTV9
         HtAw==
X-Gm-Message-State: AOAM531GFKdqfw5GRtDgyjPAqndkyibszIxUq7DtekbK6NuRAcHlMBZ9
	SFe+7mGDZrltsrlqEMwdMRJJK4PHpTVF0w==
X-Google-Smtp-Source: ABdhPJz+gHflehWTsQg3Kf6E3cEPOyzU+3uymkxnWnzBMwr4KDt4V/z/TNvKLNY7Vdyy3wl7tgZyyw==
X-Received: by 2002:a05:6e02:1568:: with SMTP id k8mr24494015ilu.92.1625830367899;
        Fri, 09 Jul 2021 04:32:47 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([37.120.205.173])
        by smtp.gmail.com with ESMTPSA id q7sm2570463ilv.17.2021.07.09.04.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 04:32:47 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 3/8] maintainers.inc: overlayfs bbclass maintainer
Date: Fri,  9 Jul 2021 13:31:41 +0200
Message-Id: <20210709113146.69020-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210709113146.69020-1-uvv.mail@gmail.com>
References: <20210709113146.69020-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e59f01d66a..90b20c9223 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -808,3 +808,5 @@ RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
+BBCLASS_MAINTAINER_overlayfs = "Vyacheslav Yurkov <uvv.mail@gmail.com>"
+BBCLASS_MAINTAINER_overlayfs-qa = "Vyacheslav Yurkov <uvv.mail@gmail.com>"
-- 
2.28.0

