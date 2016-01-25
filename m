Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0ABFD77103
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:45 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id 6so115247501qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8/uYpK2KRIE2IfdDAKT63Rga9KGiR+OIVbpUwrcX5Zg=;
	b=aGbzkqWnlhzZLUnwap+qOGshTaxS3dz42YNh4MlF2tTi0fJvrJDB2SJQKFrfcv+Cnp
	bF5CN4HuzNYyhkC0Bop51UVfCWlRksdyWe3DTAkNRIOSw5lpfzYNydAu3HxHRbs8cgBb
	B16PyLY9OfZkX/bXuiTCGRMcSYvcb7e5TwLMeaGxSaiOJc7VxPveuxgcK4bX5qUklnZ5
	o9N3NQGtn3tPvGeG9u7NqskfY3Hcmy6C8vhW952Rtcm9M7IrMSylINLYldCONumABiH+
	//ffE8mANBvTb+cX9oDzcvxJ4WRoiRE9myAX3akO4dcQtgFghw9/ieyEmAfiSM//nkps
	l64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=8/uYpK2KRIE2IfdDAKT63Rga9KGiR+OIVbpUwrcX5Zg=;
	b=QKLs2oiWOsJ1b1TuF4xeh6dVYeTlJ29bX1oh0NJBmpjc/sQvVG7XC/AtozOvz8+Tcr
	LsXycO9VNIIl6qR4TuEY8QPsGrUpcdQ47HrX4sjaQdOkdwvmIjOdLgoqpVSV/gidforW
	V5HJ0MRY5NYEjifPTagWdQHup/UaEY5HFlVbTFvuGBDJGpqba6YYz9DXM3lcQHhc55oj
	bBkdX8q+7LQSBzXFFYzJcvjfi/YY1ndelgHYVT1KuhnnM6CyxcUwqsR0apJoiKjNMyqK
	2qrvBHWOXv/NNmosdNqY/QzeNCuUIsVU/3uafQGHZFv52iebEvky5PSZJC+my3KW6CES
	XPeQ==
X-Gm-Message-State: AG10YOTmwdvi+kdVGVfzZ0GkB3kImMtzsIc8VHQuJVotHl3BbOX7tIQOzAecHdZoByC7tQ==
X-Received: by 10.140.195.136 with SMTP id q130mr24192641qha.45.1453746766001; 
	Mon, 25 Jan 2016 10:32:46 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:23 +0000
Message-Id: <aa0761de05941fbf51f0197adb424c9902cc0756.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 07/11] ltp: Add rdep on ldd
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:46 -0000

Fixes runtime errors e.g.

/opt/ltp/ver_linux: line 50: ldd: command not found
awk: cmd. line:2: (FILENAME=- FNR=1) fatal: attempt to access field -1
/opt/ltp/ver_linux: line 54: ldd: command not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20150903.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20150903.bb b/meta/recipes-extended/ltp/ltp_20150903.bb
index a15c704..f018dae 100644
--- a/meta/recipes-extended/ltp/ltp_20150903.bb
+++ b/meta/recipes-extended/ltp/ltp_20150903.bb
@@ -63,7 +63,7 @@ do_install(){
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect"
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd"
 
 FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
 
-- 
2.7.0


