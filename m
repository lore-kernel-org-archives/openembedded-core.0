Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id C79DD7867F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 18:06:50 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id j29so10961336oth.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=meQQhFYOevgLu0HgCG67oPo9ja0k9PJWQ7z7NwHv3yE=;
	b=Mre4hUyrCECbulgHRZaMKVo6ibPpMZ026/jAolD5KTUd7x2vHTt+aEtLZ1QV2bQe25
	nOuEpqr0HhADwSx2cM1tty98U6i0VzJC7BMHsrN+L5RutPUAVQIo0fR/xyUqOtKBUsOX
	3ufk/ZJ/h/7WUji4vH47lCIrmcl9qzVYnuDCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=meQQhFYOevgLu0HgCG67oPo9ja0k9PJWQ7z7NwHv3yE=;
	b=VT4a0NLoXKQpr39u/J9jO+V81Oleu3TJvJ6e8UNS82YYL9IdEjl3CfagCSv+U+Ffj7
	XKs2q8a87BRpTj4ibhtDLJCywN3odCBRfMf356lLXNHPBcoKF12Q7xLoAoxIkZuPOlyn
	h5/3uvP5s0BFojezC7h4m1SURxF+ioIXDuJCGKGaAOmlacoHbVgYzflddAxboYucsZc1
	iMHKCQ9nvi90TInhPkl8e0O+lbEUpXIYxirUNbPUMG0dZow/xuy/YNYna5ROkyqXg2t/
	KoOnn2ZVV2WGVJ3YjVV0TB2Zv9BU/limSovTVL1pJbG3obgTeq6jNfOTso1Z2NfzmX6U
	M7IQ==
X-Gm-Message-State: AJaThX7rQ338X19+LHEaC3z6v3hJd6YtoUovYH5h1ucNPSEt7dw2GwEL
	AG9PnLtADRKLcd/DvlNViyW9DIy8xVw=
X-Google-Smtp-Source: AGs4zMa/pnhdQn/O8Cd3whPIpXHp5ZNLkDGe+tyyjl6Lq7aGSwculY3HLiikVGDP3ozEQ3ddJiOt4A==
X-Received: by 10.157.85.221 with SMTP id z29mr5943481oti.14.1510596411389;
	Mon, 13 Nov 2017 10:06:51 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink65-176.telefonia.InterCable.net. [201.172.65.176])
	by smtp.googlemail.com with ESMTPSA id
	q51sm1504974otb.71.2017.11.13.10.06.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Nov 2017 10:06:50 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 12:06:26 -0600
Message-Id: <1510596387-27934-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510596387-27934-1-git-send-email-daniel.diaz@linaro.org>
References: <1510596387-27934-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] siteinfo: add support for ARM64 ILP32
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
X-List-Received-Date: Mon, 13 Nov 2017 18:06:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

More information about ARM64 ILP32 can be found here:
* https://wiki.debian.org/Arm64ilp32Port
* https://wiki.linaro.org/Platform/arm64-ilp32

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/classes/siteinfo.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 29cd2aa..7f7af36 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -60,6 +60,7 @@ def siteinfo_data(d):
         "darwin9": "common-darwin",
         "linux": "common-linux common-glibc",
         "linux-gnu": "common-linux common-glibc",
+        "linux-gnu_ilp32": "common-linux common-glibc",
         "linux-gnux32": "common-linux common-glibc",
         "linux-gnun32": "common-linux common-glibc",
         "linux-gnueabi": "common-linux common-glibc",
@@ -75,6 +76,8 @@ def siteinfo_data(d):
     targetinfo = {
         "aarch64-linux-gnu": "aarch64-linux",
         "aarch64_be-linux-gnu": "aarch64_be-linux",
+        "aarch64-linux-gnu_ilp32": "bit-32 aarch64_be-linux arm-32",
+        "aarch64_be-linux-gnu_ilp32": "bit-32 aarch64_be-linux arm-32",
         "aarch64-linux-musl": "aarch64-linux",
         "aarch64_be-linux-musl": "aarch64_be-linux",
         "arm-linux-gnueabi": "arm-linux",
-- 
2.7.4


