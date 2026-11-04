Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14194.1793811889911120557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 09:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aTrC62Tf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026110417044618c1d8e84b0002075e-2mgysk@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026110417044618c1d8e84b0002075e
        for <openembedded-core@lists.openembedded.org>;
        Wed, 04 Nov 2026 18:04:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3QS/RqBeZg7iSC8/ohy2bAxo/JoMwbSTvsT+ASlhECk=;
 b=aTrC62Tf5/uKvalHHHGY77yZRg3C6TczLRqUr5N6LYQkWpt1QTTIydggWy0ALpg73+GOu1
 vMYcBgExv+Yxu0kiMLms9/Z0eELEPuFd/vlcnHtVTlvqPjvWJec690/3kQAQST2LyuAch5WJ
 +i2LqeWklhT4z4oxD+6Rs4r/QcA7nKKZgtjSm2RZaA/Ro9F17zvawxoa6XhC1KEcscaTyUXL
 Jta8Kt4eRcExgr6h06qRKG2v2UYvMMHRZsxQxT3N+wTV3fslxNYd9DtGT+Xj+K7+/2nOXBcY
 0hgZfeR7QhO9RFYUQTxnkLQWxfByUj+wFThAn2d53IokNlqVpvLAFA9w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] popt: correct CVE-2026-18739.patch metadata
Date: Wed,  4 Nov 2026 18:04:19 +0100
Message-ID: <20261104170419.23054-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 17:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249406
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

There was a typo in CVE tag in this patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/popt/popt/CVE-2026-18739.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18739.patch b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
index 0a1e8f35907..94366f63437 100644
--- a/meta/recipes-support/popt/popt/CVE-2026-18739.patch
+++ b/meta/recipes-support/popt/popt/CVE-2026-18739.patch
@@ -14,7 +14,7 @@ Co-authored-by: Panu Matilainen <pmatilai@redhat.com>
 
 Fixes: CVE-2026-18739
 
-CVE: CVE-2026-18743
+CVE: CVE-2026-18739
 Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/14c42b415ba0c11640f7d4ee80920452d0287058]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---
