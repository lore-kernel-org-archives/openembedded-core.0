Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.27.1610114812548281229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 06:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F646ED1
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD5493F70D
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:46 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][pseudo 5/7] makewrappers: fix Python 2 hangover
Date: Fri,  8 Jan 2021 14:06:38 +0000
Message-Id: <20210108140640.1069133-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108140640.1069133-1-ross.burton@arm.com>
References: <20210108140640.1069133-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

An except statement was still using Python 2 syntax so caused
SyntaxErrors if the exception was raised.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 makewrappers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/makewrappers b/makewrappers
index 232c08d..e68f6a9 100755
--- a/makewrappers
+++ b/makewrappers
@@ -593,7 +593,7 @@ def process_wrapfuncs(port):
             func.directory =3D directory
             funcs[func.name] =3D func
             sys.stdout.write(".")
-        except Exception(e):
+        except Exception as e:
             print("Parsing failed:", e)
             exit(1)
     funclist.close()
--=20
2.25.1

