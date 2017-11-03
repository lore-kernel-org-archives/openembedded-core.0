Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 18F5D78376
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:55:01 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id m18so3318701pgd.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mD9fC+2S6qkQU3lSw7uqN9QMGIEApXix3q92MJcmByE=;
	b=pG+tILRTjbCXsMf0Aqzg0lvWxenTPZ4OTwB5xDHJt9u7YUS9Dpi3LUPyYhKbu8j7F4
	iFaFyt922D2XH0MKnuXgCQz8Mp56pX89pSKAloi3TpuK/+RZevnGKks7xIvsN5mtIgWi
	BnEliFcEvNXZqQIQwFWy1m7Qb6eMbeYOyWTqBy4cx3BXeZrk7aEpKycnjXeB5G1WNmB8
	Pw2vQ+dPvl7c9XmmkB1FJFVSxwloYlCmviWM3a+uc4hDMMIfjQ4oanide6DKWWtgTZHq
	nsSwz+SmdgpStJsPT3vBVIgIfJOWjl6V+qMGl8eHxb/RGcdWiPNnlo5OSTPw1Gd9HV2F
	VgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mD9fC+2S6qkQU3lSw7uqN9QMGIEApXix3q92MJcmByE=;
	b=lQYS+fpjPG+GHdK2MhFFuugWdkCJBkNwZJgR5bUlMcROyotLJ59814pf+xK/HE1CGM
	kPh5HzrL9m1jrRRqEtcz4FC5oEpTlJBnPfeAgV4Dq3Vtm1DDcMb3J6Ul1urg3Zy5YhcB
	HZ1zowkhL91awhoOhDVsi/aLrmdpzX5BzvPi/dcxq0vBPBqEtd3JfYk0h2Fhfl+EQAF0
	s81mx698i6zh1SzJDPNXVv50t0N1hqcS5nDBszpxUnM4/P859156f3GkBXsW7VigR1NW
	H5zZc2k6oipSTmiZZ34qV2CVVkxlhWRJ6S/LUxllWa+nklZqADsqwFh9/TxawxCnAO86
	5pBQ==
X-Gm-Message-State: AMCzsaX+t108xFWu6kayhkFnGzAMvnaBwo+Xux/EXt43jZhfkinA7jJS
	5KIrx1TqvcJDRDtEqi0V6+Y=
X-Google-Smtp-Source: ABhQp+Sq41mqYHLzRxVMqqq26ddhmhipu+O/x0AVB5mA00igfKJHxwVAjCJK2T3LmO77xAnFipwS+A==
X-Received: by 10.99.135.199 with SMTP id i190mr8163454pge.5.1509738903302;
	Fri, 03 Nov 2017 12:55:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:55:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:45 -0700
Message-Id: <618cc2159ae19c013bbe1f0a9085c62fda1146d9.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 11/15] nss: update to 3.33.0
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
X-List-Received-Date: Fri, 03 Nov 2017 19:55:02 -0000

https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.33_release_notes

* TLS compression is no longer supported. API calls that attempt to enable compression are accepted without failure. However, TLS compression will remain disabled.
* This version of NSS uses a formally verified implementation of Curve25519 on 64-bit systems.
* The compile time flag DISABLE_ECC has been removed.
* When NSS is compiled without NSS_FORCE_FIPS=1 startup checks are not performed anymore.
* Fixes CVE-2017-7805, a potential use-after-free in TLS 1.2 server when verifying client authentication

https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.32_release_notes
The Websites (TLS/SSL) trust bit was turned off for the following root certificates.

*    CN = AddTrust Class 1 CA Root
        SHA-256 Fingerprint: 8C:72:09:27:9A:C0:4E:27:5E:16:D0:7F:D3:B7:75:E8:01:54:B5:96:80:46:E3:1F:52:DD:25:76:63:24:E9:A7
*    CN = Swisscom Root CA 2
        SHA-256 Fingerprint: F0:9B:12:2C:71:14:F4:A0:9B:D4:EA:4F:4A:99:D5:58:B4:6E:4C:25:CD:81:14:0D:29:C0:56:13:91:4C:38:41

The following CA certificates were Removed:

*    CN = AddTrust Public CA Root
        SHA-256 Fingerprint: 07:91:CA:07:49:B2:07:82:AA:D3:C7:D7:BD:0C:DF:C9:48:58:35:84:3E:B2:D7:99:60:09:CE:43:AB:6C:69:27
*    CN = AddTrust Qualified CA Root
        SHA-256 Fingerprint: 80:95:21:08:05:DB:4B:BC:35:5E:44:28:D8:FD:6E:C2:CD:E3:AB:5F:B9:7A:99:42:98:8E:B8:F4:DC:D0:60:16
*    CN = China Internet Network Information Center EV Certificates Root
        SHA-256 Fingerprint: 1C:01:C6:F4:DB:B2:FE:FC:22:55:8B:2B:CA:32:56:3F:49:84:4A:CF:C3:2B:7B:E4:B0:FF:59:9F:9E:8C:7A:F7
*    CN = CNNIC ROOT
        SHA-256 Fingerprint: E2:83:93:77:3D:A8:45:A6:79:F2:08:0C:C7:FB:44:A3:B7:A1:C3:79:2C:B7:EB:77:29:FD:CB:6A:8D:99:AE:A7
*    CN = ComSign Secured CA
        SHA-256 Fingerprint: 50:79:41:C7:44:60:A0:B4:70:86:22:0D:4E:99:32:57:2A:B5:D1:B5:BB:CB:89:80:AB:1C:B1:76:51:A8:44:D2
*    CN = GeoTrust Global CA 2
        SHA-256 Fingerprint: CA:2D:82:A0:86:77:07:2F:8A:B6:76:4F:F0:35:67:6C:FE:3E:5E:32:5E:01:21:72:DF:3F:92:09:6D:B7:9B:85
*    CN = Secure Certificate Services
        SHA-256 Fingerprint: BD:81:CE:3B:4F:65:91:D1:1A:67:B5:FC:7A:47:FD:EF:25:52:1B:F9:AA:4E:18:B9:E3:DF:2E:34:A7:80:3B:E8
*    CN = Swisscom Root CA 1
        SHA-256 Fingerprint: 21:DB:20:12:36:60:BB:2E:D4:18:20:5D:A1:1E:E7:A8:5A:65:E2:BC:6E:55:B5:AF:7E:78:99:C8:A2:66:D9:2E
*    CN = Swisscom Root EV CA 2
        SHA-256 Fingerprint: D9:5F:EA:3C:A4:EE:DC:E7:4C:D7:6E:75:FC:6D:1F:F6:2C:44:1F:0F:A8:BC:77:F0:34:B1:9E:5D:B2:58:01:5D
*    CN = Trusted Certificate Services
        SHA-256 Fingerprint: 3F:06:E5:56:81:D4:96:F5:BE:16:9E:B5:38:9F:9F:2B:8F:F6:1E:17:08:DF:68:81:72:48:49:CD:5D:27:CB:69
*    CN = UTN-USERFirst-Hardware
        SHA-256 Fingerprint: 6E:A5:47:41:D0:04:66:7E:ED:1B:48:16:63:4A:A3:A7:9E:6E:4B:96:95:0F:82:79:DA:FC:8D:9B:D8:81:21:37
*    CN = UTN-USERFirst-Object
        SHA-256 Fingerprint: 6F:FF:78:E4:00:A7:0C:11:01:1C:D8:59:77:C4:59:FB:5A:F9:6A:3D:F0:54:08:20:D0:F4:B8:60:78:75:E5:8F

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/nss/{nss_3.31.1.bb => nss_3.33.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.31.1.bb => nss_3.33.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.31.1.bb b/meta/recipes-support/nss/nss_3.33.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.31.1.bb
rename to meta/recipes-support/nss/nss_3.33.bb
index 588708f..e3d4f96 100644
--- a/meta/recipes-support/nss/nss_3.31.1.bb
+++ b/meta/recipes-support/nss/nss_3.33.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://Fix-compilation-for-X32.patch \
            "
 
-SRC_URI[md5sum] = "ebb44f1394250d2cf6ec3c2e3d71fa20"
-SRC_URI[sha256sum] = "933439214dc03ee60e86d1419c19e1568998b0776dde987f41fa70ced6cd08dc"
+SRC_URI[md5sum] = "43663c850e2b2ed48ecb8910b055f5a9"
+SRC_URI[sha256sum] = "98f0dabd36408e83dd3a11727336cc3cdfee4cbdd9aede2b2831eb2389c284e4"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


