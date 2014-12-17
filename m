Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 32906726CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 16:25:12 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id l2so20852675wgh.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 08:25:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OuEgYxyyioqG8h+3Xl2ovR0YWGc8lq76YVIvHchgz38=;
	b=V4FJYGf7Bq8oKbho67Lb2Dgkyj85zhGfpIUOJPGjlGm84ZWCyCb93BTa0cQ1KWzOnC
	Hx6lK1zgIpSktBvUt3I8TLnwYW7nE6mAQ6RKIyoJ9bUHpo+2FQeCHhJTfPwx9wEeyBCi
	YklOqrgcdeDwqqABzy7YHprv6xQgTMpX5yfHbD/NSlst7wGcpDzSoefM93qQxpl5bD/I
	+YcQKExvVfRPnaLUxvCuJVd917QqL3ImrRiZxapiwxOETQLNfREhP731KypntwX9YntT
	ezoH3itmUUOA1Vq7mr+t6YELluCIg+naurLdJIme7Fl2dcYBXoF1XATcMJ3e97+7PLMS
	YoxA==
X-Gm-Message-State: ALoCoQnt0JbKL1G4syAuf5cBfm49TmX604abRQC6FjjTqy0Qx5o7MAzLoX+d9h6om1IrsfXQbyku
X-Received: by 10.180.9.241 with SMTP id d17mr10847016wib.13.1418833512457;
	Wed, 17 Dec 2014 08:25:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id cs8sm21527940wib.1.2014.12.17.08.25.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Dec 2014 08:25:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Dec 2014 16:24:18 +0000
Message-Id: <1418833458-5858-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1418833458-5858-1-git-send-email-ross.burton@intel.com>
References: <1418833458-5858-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] oprofile: add missing Upstream-Status
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
X-List-Received-Date: Wed, 17 Dec 2014 16:25:15 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch b/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
index e82a381..b9bb6c5 100644
--- a/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
+++ b/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
@@ -1,3 +1,8 @@
+oprofile doesn't want GNU-levels of automake strictness so tell it to be "foreign".
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
 diff --git a/configure.ac b/configure.ac
 index 5740585..cf6c316 100644
 --- a/configure.ac
-- 
1.7.10.4


