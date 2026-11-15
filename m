Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15460.1794778977277419515
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=APB3tsC6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261115214255959e3384680002073f-ewsvbc@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261115214255959e3384680002073f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:42:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=CzVFTQ/ub59iDWkH87bgTodhJdqgUMJXMDBAB8BItNE=;
 b=APB3tsC6oUARDD0Ave6lZvDKBIRrzEJX02g44uQXNdc7/BMRqvI/B3KwEWwNtXG7rmZLDV
 EYMn2VxutXGvIJUMnGd94iQV9F68K0E2+7d46PBVVkY3wGo6yXMcmqAYxu2kvIvklqu9Hdp6
 BSGv0D+FtgEmadPo5Jko0u6+SpV1seB15zEYtmhxqKUZm4Y8aZXp3jxgFvhiY7b5OtuqFKHQ
 c4h+tqTl71kyGCAUvnQ6/OFIjfHv+jTIDEl1N6JzGgYuek9Q5zVsMgIxsmExbIw2cI4m0+Eh
 L6R6kBfwUS/G9Sd0qO8wehf4XgxD/NLezeXwhbOjYqAQbvxleExxFu9g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 6/9] python3-pyasn1: upgrade 0.6.4 -> 0.6.5
Date: Sun, 15 Nov 2026 22:39:40 +0100
Message-ID: <20261115213944.1653468-6-peter.marko@siemens.com>
In-Reply-To: <20261115213944.1653468-1-peter.marko@siemens.com>
References: <20261115213944.1653468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250295
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

ChangeLog: https://github.com/pyasn1/pyasn1/blob/v0.6/CHANGES.rst#revision-065-released-26-10-2026

Revision 0.6.5, released 26-10-2026
---------------------------------------

- GHSA-mm57-4v3p-rchx: Decoded binary REAL mantissas in linear time
  instead of repeatedly shifting a growing integer and slicing the
  remaining bytes (thanks for reporting, manus-use, manus-pi, ucsurf,
  adriank31)
- GHSA-2qm8-x737-gmw5: Reassembled constructed BIT STRING fragments
  in linear time while preserving their decoded bit values, including
  intermediate fragment padding (thanks for reporting, manus-use)
- GHSA-9m75-vc3g-4x39: Reassembled constructed OCTET STRING and
  character-string fragments and indefinite-length ANY content in
  linear time. Nested constructed OCTET STRING fragments now contribute
  their decoded octets (thanks for reporting, alimony, manus-pi, adriank31)
- GHSA-fm9c-5rcf-2q5p: Bounded schemaless container type tracking
  after two distinct tag sets to prevent quadratic CPU use from
  colliding long tag IDs (thanks for reporting, droideck)

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 3be99337f4195aa4d005342f3098caeba78e02fc)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3-pyasn1_0.6.4.bb => python3-pyasn1_0.6.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.4.bb => python3-pyasn1_0.6.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.5.bb
index 086a21ffe8..08b8255a8f 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81"
+SRC_URI[sha256sum] = "6b11616a6bcf3a40e635f082bb232fa57b5e0dd7f517bd7ddd69ec3794508a47"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
