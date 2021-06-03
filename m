Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.5701.1622714274819272916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 02:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yBPckPwZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622714273; i=@fujitsu.com;
	bh=w/gtcgVsAWEbA+/0IbutNhRsr6zVOCr/+EbZWynqcgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yBPckPwZRqF2kVdUgt/j/UgkC6CwEOMvL2OQSujH3IjIkHJcHX+VNx46NqIPrkJq+
	 79mteDx+7HFsVWUhzQSaUiFtiLVd0OMVF7MKJ+j4EI4a/wfbirAJENmpj90LEnAhY8
	 AjFAS86r6652r+jahil2NDJm7Y+FlvCz8Z5+2cjaMke2fvPh2qBWXHSpRJx9GFVwD0
	 Vf/rz2lv8O4huwhOFOJCKnhVrLa1QX20mmkD0VHgaG3NK2Pj0gB0QxFrzt49DSxP7s
	 aouA3WdE7IP8bwYyn44PVhYmpDq97bqCCmJfCI1viWEh2e5GMJgWBDSUt74eSyivCY
	 2NeeLiQ7MzaaA==
Received: from [100.112.194.111] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id 07/49-27560-F97A8B06; Thu, 03 Jun 2021 09:57:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeJIrShJLcpLzFFi42Kxs+GYojt/+Y4
  Eg/fXtCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozJV+4wFSzgrOja5tfAeI6ji5GLQ0hgJpPE
  4tPtzBDObkaJ2StbWboYOTnYBHQlzj1ey97FyMEhIqAncfWfKEhYWMBXYvaD0+wgNouAikTz4
  vWMIDavgLvErmVf2UBsCQEFiSkP3zNDxAUlTs58AjaSWUBC4uCLF8wgIyUEFCVmT5eHKK+QmD
  FjG9sERp5ZSDpmIelYwMi0itE8qSgzPaMkNzEzR9fQwEDX0NBI19DSVNfYRC+xSjdRL7VUtzy
  1uETXUC+xvFivuDI3OSdFLy+1ZBMjMIBSCg4r7WB89/qD3iFGSQ4mJVHeO+07EoT4kvJTKjMS
  izPii0pzUosPMcpwcChJ8FouA8oJFqWmp1akZeYAgxkmLcHBoyTCO2UxUJq3uCAxtzgzHSJ1i
  lFRSpy3CqRPACSRUZoH1waLoEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHm9QKbwZOaVwE
  1/BbSYCWixgNc2kMUliQgpqQYm1cSIparF7CaJ/6c8/KZ1/lXax6hj1xgYX1Q1HetJEL3PwaP
  e8sIoKipmXv+JuaLqOxa68VczNJhul87577K5Z8Jz9l/v5J9arlhYuV5T9ExL78uZLMXfzHZs
  4IhRWZl3vnFHxKxQ3vAn52LPreJRi7Rbw12k836HUceSiFe/vgWvvfhy2lLTY8k8STLH1N4nX
  jOpD7g/58X1C0+LIjdx326d/e/QAm1G9b+ljLJp1r5qugt0Xi3VSLra1csbEbVJqnJr4wKRcr
  VP2hnLA9X7Nkpe/rjp9VrtH7svlzxU2c72+taf1eULzfTEzeVjj+uc35cr2aOrE9LK6n1G6Ke
  n6b09hfkhu38Vqcz6M3u2EktxRqKhFnNRcSIAccuYKRsDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-267.messagelabs.com!1622714271!146535!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5029 invoked from network); 3 Jun 2021 09:57:51 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 09:57:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1539vjhO029224
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jun 2021 10:57:51 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 10:57:44 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.3.0 -> 4.4.0
Date: Fri, 4 Jun 2021 02:57:33 +0800
Message-ID: <1622746653-4284-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ib-metadata_4.3.0.bb => python3-importlib-metadata_4.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.3.0.bb => python3-importlib-metadata_4.4.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.4.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.4.0.bb
index f4ac3c44ec..9d22f97a6b 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.4.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "c4646abbce80191bb548636f846e353ff1edc46a06bc536ea0a60d53211dc690"
+SRC_URI[sha256sum] = "e592faad8de1bda9fe920cf41e15261e7131bcf266c30306eec00e8e225c1dd5"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1

