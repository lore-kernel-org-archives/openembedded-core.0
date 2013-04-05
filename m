Received: from mail-we0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UO8zG-0003wH-Qc
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 17:55:35 +0200
Received: by mail-we0-f169.google.com with SMTP id x43so3005223wey.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 08:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=rbeENY41iq+5iUAoQeLFkNchohlrlVwBJHpfuckG/W0=;
	b=ahi0MXfch1MN/8MAyU8UJLVnJrmM6dFJkCRCK02t36GoQMgrFehwr+uZ0azLbXe8xg
	d/ucikUHK9jgAV0dY23qWtZC4Qz0Tyz/Asl5WI0dB7NDTAkDj54Eh/1Af7+99TW7jTQi
	lOcIUo4kfzIZWHDGzWdMTgzjkMlkcsk8oGPGE0afttphkK+PKxJ6IXtCaXZi4r+Hc3pz
	3a113QD7h/GOrm+r6E3wPUsIIlZzKqWIHd5tvPNeWX7ALw4lazkpADw9FfoHARxSGXmF
	uqk/5Ts+4YFB9H2C0/FJUuG1bKK+6MSy+EkkF9GODUaN2fhEzgQzhzIGIlzWDZkhqbWJ
	Uyew==
X-Received: by 10.180.94.133 with SMTP id dc5mr5011863wib.1.1365176300727;
	Fri, 05 Apr 2013 08:38:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id g4sm4950796wib.11.2013.04.05.08.38.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 08:38:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 16:35:32 +0100
Message-Id: <1365176132-17102-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1365176132-17102-1-git-send-email-ross.burton@intel.com>
References: <1365176132-17102-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQktVyfjQCxvKWuvgcjJFMVTWVBCjLECRkQbbn60vrx6FRjcS6eEfcuvJTizEcjeuzAgESBq
Subject: [PATCH 4/4] sanity/connman: when connman test fails, dump syslog
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 15:55:35 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/qemuimage-tests/sanity/connman |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qemuimage-tests/sanity/connman b/scripts/qemuimage-tests/sanity/connman
index 0c62902..b333201 100755
--- a/scripts/qemuimage-tests/sanity/connman
+++ b/scripts/qemuimage-tests/sanity/connman
@@ -46,6 +46,7 @@ if [ ${RET} -eq 0 ]; then
 	exit 0
 else
 	Test_Info "Connman Test FAIL, Pls. check above error log"
+        Test_Display_Syslog
 	Test_Kill_Qemu
 	Test_Print_Result "connman" 1
 	exit 1
-- 
1.7.10.4



