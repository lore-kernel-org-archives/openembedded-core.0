Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 547747D380
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 10:57:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a184so13778656wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2019 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ANUGMSUHaIB98BJHfPvYIe5/xf3lUxqNOkjDzK+rQtg=;
	b=fmwkKDJhfvPqRCT9Y87ZTjKrJuSubaBR0UmPkLTJ18/y/zyatLAW5FtThWzYosutzs
	7LZRgUnhsBIjsXYWgO3UZ7PNrquCEAOTX6KdfrwIEMOpTmEB4BSRc8wouG9V7tMlB2X/
	NlM+oAG81vaYhMeRnOP3DxKVCCKIkGL94Z48WSjIkbG+VvG4ED7AAh4dnbaOHKAIcb+1
	jL2G8/qo469KRGxWBa3X9T7Ay5djEIK91zMBH0Mt3MjxXz9LcIQYIF0LHaZXokQgkrhI
	kU0+aLHHDS6/i8MM8uAl2Q8hCeaGTASr6TsRrpvJzqxGOV8B4AO6musJFKt+p3MnAK6S
	3R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ANUGMSUHaIB98BJHfPvYIe5/xf3lUxqNOkjDzK+rQtg=;
	b=sJQY6Ci8ZxQi8NdCI4KkJkc5CNX8IjSDYb/RRetL1C4lly6LF4vuRl0IDm6AoNezuS
	yAUcrk/DngvUf8HWFbJUCadcd/Y3wBHnsl0CgegsfZ1Bv2cJb/C9/NRK1d1qQTapk6Ah
	RwhLdmv1TNQK1bIrxva87BgKBS9nEBcKbDJ9x7b/8wxKbxs7WAMHy1ULkshj8QZw60AP
	hnCDjferLf3UUlqMpIHmFSiJ8itW4TQJxpg2u3YVstjFp0QyWp9hs/GHzmH/3VnFawop
	MW0EUVkXR08b9Blcwdy8CIWIxHH1Jn/wNquRHbxopxDhS9Q6kV5OsChka3ZhIbDj5168
	nxMA==
X-Gm-Message-State: APjAAAU/nG92j3H8SH7Xu4eBw5cMaVuCcJISHu/h5VVhKGM380b8xyOM
	Lfbl0cUsdo6TTn4Yi3pDYQVC/XIiJl4=
X-Google-Smtp-Source: APXvYqwk+FOTaFKJe3zcDqD+nKikJuyehFIn4zmNCDJM0VVI7nqzS+2loSHBLnMbNu89D7Xne9EKRw==
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr15748385wmf.97.1554721050697; 
	Mon, 08 Apr 2019 03:57:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h12sm26688449wrq.95.2019.04.08.03.57.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 03:57:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2019 11:57:27 +0100
Message-Id: <20190408105727.18055-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] insane: fix gettext dependency warning
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
X-List-Received-Date: Mon, 08 Apr 2019 10:57:30 -0000

This message was using %s markers but nothing was being passed in.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c8d18c07f55..43df0046201 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1087,7 +1087,7 @@ Rerun configure task after fixing this."""
             for config in configs:
                 gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
                 if subprocess.call(gnu, shell=True) == 0:
-                    error_msg = "%s required but not in DEPENDS for file %s. Missing inherit gettext?"
+                    error_msg = "AM_GNU_GETTEXT used but no inherit gettext"
                     package_qa_handle_error("configure-gettext", error_msg, d)
 
     ###########################################################################
-- 
2.11.0


