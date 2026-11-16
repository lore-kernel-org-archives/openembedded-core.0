Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30993.1794845355184849057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:09:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pbFobBUr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9144F1A16A1
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61EA06023F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C65E511BC17FB;
	Mon, 16 Nov 2026 17:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hyxQjLpkhfDwko0vCWvsgY1ltOi+RMZDFstg+0CBEfI=;
	b=pbFobBUrBmsUmMZsKcnJNNzA9+H8pLe20KEq+fNh1/D+G8Lo2j7Jx/m3NHuT+qTwXPmio/
	iZ1FX2nhMQxhzeZ8/69VP5EDi/LuLLjeWhN/LKnvPon2iUqOJeD+tD/5lOaOSrj2rY6KAo
	pSKdi8AHF/uDex/iod0JPNIjVTF/QVoyUCtCMQkUBwj+G53LApkCchL3SF+wr1+50n9CSN
	CkeGzVP2iYnWMiP+5znwCuvE9O9P7btVk3A063CFNFGA/IvdxMfqPuwhe0P27yVdjnUCpr
	lbyEZmHy+ZFYWojgiV+AU8O7pzd9e2/P/THW/b4k3IYLDQfi6L5TnrcVlpV92A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 16 Nov 2026 17:09:02 +0100
Subject: [PATCH 04/13] lib/oe/utils: drop all_multilib_tune_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-oe-lib-docstrings-v1-4-0c894f6a1064@bootlin.com>
References: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
In-Reply-To: <20261116-oe-lib-docstrings-v1-0-0c894f6a1064@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=+RyAN+gimrAfLw/L/Dz0wxeRzQC4D1Vmog+h0vlgx0E=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBq+yqeWkWvKpfVj5+U2JPDya36E+C4M180UK5pB
 44dE+lYBA+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCavsqngAKCRDRgEFAKaOo
 NhV5EACk5qDya2tsnC0vJLPH08LlibjyQOH9zJ0xbZAgU0FvQ/fjm2n7PF3D8vtMeDi/ThkDZJr
 3KSPbjddVGB2Q8khMYZBgyy0jkGDJii7CVTLG0Wny7IiADNCH6lojIItP1sZ0J9Ae1eCgSLWzcD
 7MQHhUxF37uuW0ZdI4CzPD2FHhftMvIWtsjiAAT571BGYl9zt+iRwRi/EGCmyIw2Qtu6/5d/+7u
 XYHrCAET8906+x3aQb/E+AqAYQh7FNrXqQW2SnFnx0LEBigBGHZadL7rcgtfrt/NNFO1OAKMy/3
 +tjEp8G2juy4dP5X/WbX/aSf8+Lian7AAFuIyiEf5MVGckeGnc3qD7qFGqj1n55yPt2eKCVwIpw
 e4SS3RHx7AF5hGJOJGHL2WMj+3cjHycbcrl2gnizsKQ/RMZVTTvYeGTv+X9+QAThZ7MOqePzk9B
 tmYRdQuuKzL8t/rHbG3IyqHVrBU+Bw80/ext4dgXV6L0S3lcdbl6o5ETutbJNgilhfyodxyi4nx
 TMwfaTAry6epMZ4zxKpGIDxIbh7t5xeV1vcCB1DXHbrFaa6d6rVnQC1AUnMqC8G9cobLh2ton5N
 G0P1Yjbnc2EM8QX9d40dlT1wdmTGQDk1OgAvhJO3IF/a3uVNfvI37PazD5pbLPeHS1nbwROwQ2Z
 cTTYHAeFJzf3n4Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250354

The last user of all_multilib_tune_list was prelink, which was dropped in
2022 with 23c0be78106f ("prelink: Drop support for it"). There are no
other users of this function, and the current function is broken due to
its usage of oe.utils.get_multilib_datastore(...) which should be
replaced by get_multilib_datastore(...) directly. Drop it.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/oe/utils.py | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 5d4f4056f7..a17938803e 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -601,25 +601,6 @@ def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = '
         ret = values
     return " ".join(ret)
 
-def all_multilib_tune_list(vars, d):
-    """
-    Return a list of ${VAR} for each variable VAR in vars from each
-    multilib tune configuration.
-    Is safe to be called from a multilib recipe/context as it can
-    figure out the original tune and remove the multilib overrides.
-    """
-    values = {}
-    for v in vars:
-        values[v] = []
-    values['ml'] = ['']
-
-    variants = (d.getVar("MULTILIB_VARIANTS") or "").split() + ['']
-    for item in variants:
-        localdata = oe.utils.get_multilib_datastore(item, d)
-        values[v].append(localdata.getVar(v))
-        values['ml'].append(item)
-    return values
-
 def extend_variants(d, var, extend, delim=':'):
     """Return a string of all bb class extend variants for the given extend"""
     variants = []

-- 
2.56.0

