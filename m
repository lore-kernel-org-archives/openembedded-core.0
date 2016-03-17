Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9593860116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:19:49 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l68so495143wml.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Z64eXt0VcRF4YwSP6J90dmTS2RxpCC29A7XCY4hLITA=;
	b=xksZT5ipyUlJnawrZa6eD0nchApIQVGcBiBqGfw0G+W9vzhKzwjjf+R2yRd7nyrViX
	LGg5kEe5troDpL3t6LuMSzBd/+lWOyAvoslcMsLBk/XzTHhYIt4ERXb6TdU/XuEzRi3R
	/yHh/uUHF/4xPjdl9PiwfkBLByp8WResjYD7GYODsMP0Rz+yXm1eSXQPk8lCzoPn+Ug5
	rZ0URNXjL/Pk9NlrMIaileNefeBApJp38ie5n4kjB/pL/wjKryVO+nowpYoEKByI2zHp
	P+uA+mJAL2IFdZPxCtWxm0ItMsjn0Hi3cFju/eW5pIxTZ25aP3Lv76fILGSfUpQHFuYH
	AmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Z64eXt0VcRF4YwSP6J90dmTS2RxpCC29A7XCY4hLITA=;
	b=hA0oAnoMx9FaMXN7FuSNKNyWilvD3G7JvDTVNObq1CI5bZRO1ty7jMvYRd7w65WOvq
	GOJtv0/VIVrAuIARcjy/abfErmatEqGCbL3XcZ28P7eAuM0enrSJ5Qp0ly2sxoFQRPOy
	P+OFlg9hqzIg18ya8DGQBr/xEgOO5X/B9MrP6NKD6GMzfpEBxmW0EdMDKIW2EUrAi0q8
	0wsRYPHV+1qY1blpkSsatfNHCNL/ToVJ7VrrSSvFO5KSUT8Ddn7SxCty//a5AOZqgdGb
	4P8lgjAnIgVja1hKM9UX2zKmaIkYJGjFv9ncPgeqDtKFewF0pDj7d6GdhePFdZK1gE0l
	w4sA==
X-Gm-Message-State: AD7BkJIVUdJVdSgli6Emj8kWQDHOTsrF3M5u32kykUgU8F7ElD9t4JssqJCINUGkT37fCw==
X-Received: by 10.194.83.134 with SMTP id q6mr11174482wjy.131.1458235190234;
	Thu, 17 Mar 2016 10:19:50 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	e25sm31066139wmi.21.2016.03.17.10.19.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Mar 2016 10:19:49 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 10:19:29 -0700
Message-Id: <1458235169-9267-9-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 8/8] gobject-introspection.bbclass: mark as machine specific due to COMBINED_FEATURES
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
X-List-Received-Date: Thu, 17 Mar 2016 17:19:49 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/gobject-introspection.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index eb0e7ad..8a09e34 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -35,3 +35,6 @@ FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
 # .gir files go to dev package, as they're needed for developing (but not for
 # running) things that depends on introspection.
 FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+
+# Due to use of COMBINED_FEATURES
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


