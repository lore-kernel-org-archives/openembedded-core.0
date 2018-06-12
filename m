Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 21E3D78ED7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 13:37:09 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v131-v6so23407990wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 06:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=zEiVmyNzDETqZQft2ByhrbpG52FrD9+lnKLP7WB1auE=;
	b=hewoMZiUjSV6l/UTaC5oHfkmXKP9DTPWtgGwlvgTVvT9+hxTXebwzJQREJTRNwGDMA
	xLxCbTuPqZGsOfgeEBjx3Ceku0K8p3KPa6O9YWjbSso2IihlP6on5Puk8jZ5j6bN3pDw
	Etrd0yFIRAJmmtVxkf0aNAa3gSCI/EgadOanf6hrtqzDJUYJvzz66L6dQmU81I+30ZR9
	40zSTG/1XPq6a8O945HSDMnHUEpbvGwrbj3PxZ0uhXntycZqhDXMopQRsrlyYRIQ3M8T
	UjkqlIAcimHQgt5dVmqYFbuL/83iNRd9atMi45zyZztnbTrPnoVGxsEw2x2XMzcUAy2V
	jshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zEiVmyNzDETqZQft2ByhrbpG52FrD9+lnKLP7WB1auE=;
	b=FddVTpaMp/SyBJz8w9YBP4Vfgz6TvFgACmxUrBlI51Krc9NGRaUqgla6rOq0Tbfnxo
	+bKWB5CrVFGjFyUgys6/KSCg81mcytii2pRMWv7RGWTnDDLtB5TnC4P+JzaY3eLdHZsp
	8bqiCeBcB8l8noOfpAoWAamz9uWefWa2VUlLczizitl0d9d1qD0xyC2LSudB387SczMr
	F8mhYgiLJ9xQJ1SfcPP/Zz4fmS4d9BCR+scp4JqEWZ+rd4EDKod4daBbOzj3Zb0NtYyN
	NJm3eHIz/vYvf+13FUlSWTmKnll7okn7NoLq9QymyEpmlMkn5Yi2EEdXLucPMYjpcJIW
	dbRQ==
X-Gm-Message-State: APt69E1mXbCFP2ieVwmf89+6tuzw6SH6ZzzQWLFD5j882I8mQEt5+/Xg
	HIhC0HlWov95m8oZJaCD3/kzqRiC
X-Google-Smtp-Source: ADUXVKKIb3k4m2dwGZZzaETkQkCPRPudN++rhtgs7I/4zDRVIuCOVRbqoIVWNUs5ILYZCdZ6iyLJQg==
X-Received: by 2002:a1c:8b52:: with SMTP id
	n79-v6mr287976wmd.148.1528810629398; 
	Tue, 12 Jun 2018 06:37:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e13-v6sm245727wrm.45.2018.06.12.06.37.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 06:37:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:37:05 +0100
Message-Id: <20180612133705.876-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] rm_work: remove obsolete rm_work_all task
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
X-List-Received-Date: Tue, 12 Jun 2018 13:37:09 -0000

*all tasks have been deprecated and replaced by bitbake --runall.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/rm_work.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 318d121d2b5..ff74d232c97 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -115,12 +115,6 @@ do_rm_work () {
         fi
     done
 }
-do_rm_work_all () {
-    :
-}
-do_rm_work_all[recrdeptask] = "do_rm_work"
-do_rm_work_all[noexec] = "1"
-addtask rm_work_all after before do_build
 
 do_populate_sdk[postfuncs] += "rm_work_populatesdk"
 rm_work_populatesdk () {
-- 
2.11.0


