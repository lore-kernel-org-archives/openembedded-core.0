Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id E69966EABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:30:15 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id hr17so3231298lab.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 01:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Q8Bhp5ZVY95PgBhjmizcyiTJCebB7eECG5a8CWS0WEs=;
	b=Y2UOx4RNRptgpnBqdANt3vg0Bhz5/sEHDb7hkXea8kYKv/6a/CnMR1lfAZiDvh5ChM
	1faxP0wfPYgH8FUexVbg7aXyYCuVm4rQrjh6Dr+CeEYKbcD+B1zB2fjoXQXlOl4ePOr8
	W/Vnqu9TJJDw9RIgcKEDDbWQ2uUWI5QvmNFk+OeOWDmG0Xiaw6kdEAF2M461Nzh1ryvA
	qU/zwvQyC+t6nQeSQuRsWrJERMWdGeIgfFPesPq19oqFyndQOge0O8HMPjQgjILKvjr3
	VuAt5el0t/Evk0LMSeWJ4WAUoiNjx82e/guOnhdvP6Crpun8krHmMjjYEOCYQRWgnJoJ
	QqCw==
X-Received: by 10.112.133.3 with SMTP id oy3mr118426lbb.63.1391160616297;
	Fri, 31 Jan 2014 01:30:16 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id th3sm9511364lbb.11.2014.01.31.01.30.14
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 01:30:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 6D9E11C6022; Fri, 31 Jan 2014 10:30:08 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 10:30:02 +0100
Message-Id: <1391160604-23629-4-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
References: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2 3/5] nspr: Added nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Fri, 31 Jan 2014 09:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nspr is a dependency of nss. Since shsignlibs is used
from the nss postinstall hook. It should be included in 
nativesdk to make offline rootfs construction possible. 

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-support/nspr/nspr_4.10.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nspr/nspr_4.10.2.bb b/meta/recipes-support/nspr/nspr_4.10.2.bb
index 4db506c..bb8912e 100644
--- a/meta/recipes-support/nspr/nspr_4.10.2.bb
+++ b/meta/recipes-support/nspr/nspr_4.10.2.bb
@@ -175,4 +175,4 @@ FILES_${PN}-dev = "${bindir}/* ${libdir}/nspr/tests/* ${libdir}/pkgconfig \
                 ${includedir}/* ${datadir}/aclocal/* "
 FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


