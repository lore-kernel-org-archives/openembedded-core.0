Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 64B3B73D30
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:10 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so26765506igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=oP2N2GNCddFtscxVB+fNq/qfOX5LvspXIIlHYwAho8c=;
	b=cBnkj+Il97oKg9oQhfW3VBePxeGOH1OmciiuQs8OhaONl1g9h6RdsYQKYKolb41tBR
	0lqWRO//YarJP5APW6IMMsMdM/8BzY7bzr3+xgwnqIzucxA2OJct8YPln023w6SfrxpM
	vwfhcqmXeZKCngkbFeYvoO5KhM8cj1gy4huDZbnBnYoeV8t9POHkp08a6ENEr982b8EK
	ExDVoCh4j8XA48u9d/NeAFzs0ua6LWSNjbr2q574Dk+SoHRcAcwBBQ7GGSN7Zc0vRvdc
	eW5JbLdSRqIq4KMbbbh8bFIs0VPmlxSMP9UsUAAFWKzopD+6sDDAfaoRWrY2cKSG44Tp
	7a9A==
X-Received: by 10.51.17.7 with SMTP id ga7mr47990721igd.42.1428341831485;
	Mon, 06 Apr 2015 10:37:11 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:42 +0000
Message-Id: <f273b8193f9185582a1446983020904f577adaf4.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 14/24] common-licenses: Add BSD-0-Clause
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:10 -0000

Some packages like toybox use it

Change-Id: I2ae4fd024e310bce644581e4c63ed2980ee1998f
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/files/common-licenses/BSD-0-Clause | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/files/common-licenses/BSD-0-Clause

diff --git a/meta/files/common-licenses/BSD-0-Clause b/meta/files/common-licenses/BSD-0-Clause
new file mode 100644
index 0000000..328bdd6
--- /dev/null
+++ b/meta/files/common-licenses/BSD-0-Clause
@@ -0,0 +1,12 @@
+Copyright (C) <YEAR> by <OWNER>
+
+Permission to use, copy, modify, and/or distribute this software for any
+purpose with or without fee is hereby granted.
+
+THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-- 
2.1.4


