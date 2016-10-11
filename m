Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 46D9971A0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:19:49 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id b75so38275350lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 05:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PkqfqaJZgK0v8YN9uCB2Kv1ZBGpcx40NBR8ZD+FlaL8=;
	b=iSdzAxQ8rXKwsg4wxMb2SMuLu8v2r0dAq8S3isdCgNZg6stDhdDrDkUG+fO8Uspg7W
	9u7sFFq+IOZge/RlH8yBZ7qmzoDWN6uDcLdFtbhxgr3gwmWux+b3qwyHVW7QOkvD4dPg
	szNhr1H7fLPVCj8acdbkwltzfoeastmRxl3LUIEB0NM5VTQMe1dBd5P1Sb6msuKAf7+V
	dePYrtDweVZ234VmxlIkWpuNysC6r9ySpGQjKBrxYEoFcaZJDs6iMSgaaI+Ibc9hLwng
	ZwmCyEkSqPA4Hi16NzCJDUE+GHgOMxVgivTd7UZz/TC4PuJ145XGbMC1IPWrx2K4WXnA
	IFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PkqfqaJZgK0v8YN9uCB2Kv1ZBGpcx40NBR8ZD+FlaL8=;
	b=bvhQeh0J9ESeFEoiPPmeJyu5f0dOJ4R9gAE9NKonSWUUPi1bWDfjS0YIxU7zbic5LE
	dGXQna8P1J45S5iLp9rPB/xT6DvH1S8BlDh8hrUyGD9LBDl4v9L2donPo321CHEVT0Z8
	KXsh+Lt+S1di7btx6vFCa8pRsXKQG3FqrYPZ4bRpx5rpX0QuBKWEWDUkKpZJsWiHQ38N
	KT11vcXL1AQs4qRrFZumvHkuaViUTCah0EiFixpH8ZbnKKoCoclJ2LtOLxJ5p0VJpBye
	fjAeAZEiMiOOUPhgJGBA22895niib+kgQwOS1xFg5qHkVSnnx+qJ5uvV3RPjWNoM0esT
	imeg==
X-Gm-Message-State: AA6/9RkXa4YZdau2ydiXUMGa3fFT4oeVo06KDMJsr8KtnA6nIT4SxER08BD7v67HhWCsBFDb
X-Received: by 10.194.28.166 with SMTP id c6mr4682006wjh.40.1476188390878;
	Tue, 11 Oct 2016 05:19:50 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yo1sm6005196wjc.16.2016.10.11.05.19.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Oct 2016 05:19:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 13:19:44 +0100
Message-Id: <1476188384-16064-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1476188384-16064-1-git-send-email-ross.burton@intel.com>
References: <1476188384-16064-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] insane: display names instead of ELF machine numbers
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
X-List-Received-Date: Tue, 11 Oct 2016 12:19:51 -0000

The 'arch' QA test currently simply outputs the ELF machine field as a number
which isn't helpful.  Display this as a human-readable name to make it clearer
to the user what the problem is.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/insane.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b347638..17c9284 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -543,8 +543,8 @@ def package_qa_check_arch(path,name,d, elf, messages):
     # Check the architecture and endiannes of the binary
     if not ((machine == elf.machine()) or \
         ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
-        package_qa_add_message(messages, "arch", "Architecture did not match (%d to %d) on %s" % \
-                 (machine, elf.machine(), package_qa_clean_path(path,d)))
+        package_qa_add_message(messages, "arch", "Architecture did not match (%s, expected %s) on %s" % \
+                 (oe.qa.elf_machine_to_string(elf.machine()), oe.qa.elf_machine_to_string(machine), package_qa_clean_path(path,d)))
     elif not ((bits == elf.abiSize()) or  \
         ((("virtual/kernel" in provides) or bb.data.inherits_class("module", d) ) and (target_os == "linux-gnux32" or target_os == "linux-gnun32"))):
         package_qa_add_message(messages, "arch", "Bit size did not match (%d to %d) %s on %s" % \
-- 
2.8.1


