Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 35BEF7F7B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:32 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 15so1597474pgh.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NHiwr4BCHCUhA+FQbhoYAGHXT1DkyaIKh+cLjD2PDyM=;
	b=TUOOGxcIL6zHzEZFgo6rttI4W+sJJyxNfUVoK8Jeckb/KXL8HesrdwairAjRQEsDyt
	JRO0/npgQiEZEZGcbC/rZb6vrlX+m4cqvIya8udpmFeYvDTKWclKi1UtSNRFHioZTJ95
	tWnk/VYX8falzuLXsTQJj5kr7UqZAS+q3FPVPsLgOCh4x2aQWVl48CnuODgJ5nZnyvY1
	8WRM3fYsnNJA84z9rIRJcCj6k2WQUjZb9J9/HVGoL8HSFWwjYxzTyvXTW2ux4eiXI/b7
	CwynCZW3SJgMFXsA0Tn3S8Q7cyN0SqKn9IEZQDxuVtOnrJ/8wAr+7Kz2iJcT/7W8P/ci
	XJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NHiwr4BCHCUhA+FQbhoYAGHXT1DkyaIKh+cLjD2PDyM=;
	b=UWoQIU53BKaQrp13xTtf4uxANPdpvzenZn8pbE3MDwe/Coyk18Ccyc75CMlYkVk5GS
	YfVcB424BF1H9Bx+rwJkawahsr5QeQjHfNtyzcS3sZZMJBEPUNMPDmyx5FWNqAuGclvO
	9jYpqL4Gnw/UKdsuh9jEGTZqluUGgV/RawYinUXj/3alpNQPk3Dmp6Mh+WoUg73SsiCq
	7glOtoL2If0WRkZzXKqQvQUsvPXKZzcms26DZo6kYNe2QFMLeZ/Azlse2NozAgM0867G
	IixfTOfyadcwqMViooENWg0Jpt2GpYkEGXvkEfexaBMLgLGcD7AVRRhrtQTDzpYSCvLG
	+zZw==
X-Gm-Message-State: APjAAAU04iXd4ctxwY26Wv/Rxvo9E3WieqJgqulvoLiXqcCq/OdtDOiU
	RlmgGzZ83GTbDYQb9vxVi4DHocyi
X-Google-Smtp-Source: APXvYqzgmFtwMVccSdTdISFbKbM+rl8bjsdE0FVI96JfNgMkdL12jXLsht8wLRsin/t6Olq+9dAcfA==
X-Received: by 2002:a62:ac06:: with SMTP id v6mr5024078pfe.210.1573659153309; 
	Wed, 13 Nov 2019 07:32:33 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:50 -0800
Message-Id: <d764ed9515d10db636ef63e0d05ac66f2a454ad4.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 08/31] libpam: set CVE_PRODUCT
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:32 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/pam/libpam_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.3.1.bb b/meta/recipes-extended/pam/libpam_1.3.1.bb
index 6b73f0a..a2aa1ec 100644
--- a/meta/recipes-extended/pam/libpam_1.3.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.1.bb
@@ -163,3 +163,5 @@ CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
 CONFFILES_${PN}-runtime += "${sysconfdir}/security/limits.conf"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-pam/linux-pam/releases"
+
+CVE_PRODUCT = "linux-pam"
-- 
2.7.4


