Received: from nebuchadnezzar.corp.vecima.com (nebuchadnezzar.corp.vecima.com [204.83.204.143])
 by mx.groups.io with SMTP id smtpd.web12.3564.1621375779501434577
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 15:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: nebuchadnezzar.corp.vecima.com, ip: 204.83.204.143, mailfrom: dan@nebuchadnezzar.corp.vecima.com)
Received: by nebuchadnezzar.corp.vecima.com (Postfix, from userid 1001)
	id 5268B5C0753; Tue, 18 May 2021 16:09:38 -0600 (CST)
From: "Dan McGregor" <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [PATCH 1/2] lib/oe/gpg_sign.py: Fix gpg verification
Date: Tue, 18 May 2021 16:09:29 -0600
Message-Id: <20210518220930.172832-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Daniel McGregor <daniel.mcgregor@vecima.com>

A stray space made it into the command for verifying gpg signatures.
This caused verification to fail, at least on my host. Removing the
space makes it work as expected.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/lib/oe/gpg_sign.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 7634d7ef1d..492f096eaa 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -111,7 +111,7 @@ class LocalSigner(object):
=20
     def verify(self, sig_file):
         """Verify signature"""
-        cmd =3D self.gpg_cmd + [" --verify", "--no-permission-warning"]
+        cmd =3D self.gpg_cmd + ["--verify", "--no-permission-warning"]
         if self.gpg_path:
             cmd +=3D ["--homedir", self.gpg_path]
=20
--=20
2.31.1

