Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29828.1793868243688578430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=ReBKhHcT;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso200461f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868242; x=1794473042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ZK7KLXRf7KqRO6q0xuet/RjZlEUD2k8g+iXW4yDPt8=;
        b=ReBKhHcTW6Pud/mBPQL/h0XZjJhjSDqPTuLDC6CCjwaZdd8c6bHiMYUTkaQkGpypI0
         3LnV4jlVVuTyy9agtA8P74AKRV4IRmG3WjP1eIBrc4qyPPA+tvDEHGV/H7rSF6DFhULU
         aqpa/Sti3g7Gisgf2MbczWjnJr0LNTYb2ddDfsgcoPf+GlJBXDjFiztA1Ux8SrXdpad9
         0Oxa551p+iyGKAHpxkRwvxBfEmOfycbrZWpLl8GqGXBscOBV+ecJomA9YaikO7EII/yz
         Je0Oi2KSFoSy2x2ZsfMLp/2w9mvzhwMw98Pqz4gESgu3PWdPzXyryWgdH1PFPKgECBB5
         i+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868242; x=1794473042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7ZK7KLXRf7KqRO6q0xuet/RjZlEUD2k8g+iXW4yDPt8=;
        b=EDCIIBdlWcYLk9DsTqJEI3pXQtW8OHuSGt9orHzqoWgP98EfngRYD9+nTddjeoN24r
         haPf3kcq7iMDUqaMwxotrpfOjXPtnd1lOdd2e6xew2OdeVgalLYbDLaxIdq+joI2a2m5
         tiTcyN0zoqaeK6UKYjcJLOvNFr50zdTxgcJrNvQ0OrkOgxTyyJuH+NCzxNF6VgnuYNY1
         BIYyAOAak8G3OVSaxYXMMpkrfrG6hFDxnDc9Zjaco/bxQGqzYl9WepCgZFmM3x5bI24x
         uKrwZrqYHTGAa9OCrHpUFFCX8JHIG1klWQYsuXL2dJos9zKB9vFzZ1XKLlAHBGcij3Yg
         mYJA==
X-Gm-Message-State: APuU4Z+OhoNKI1pqftuKc5xiR1Xtmlm61k3cC5+a79uT0cXZHMiqhi5h
	ouF4Jj+qLbAtr5tGYzjJQ4cmYhrc+Y3+emPv9Y5tV6DrSU8zMaJjF9YKTOI6m+a4F/+gG5mQIND
	8v/myTHY=
X-Gm-Gg: AYBFou0G9FasBH44rQPo+Gq3u5DpXNpQ9Cs1/7loBAm3uQPFnBmGppQCYsjnww41bSh
	f7/gPi622q8FqssgWjy/itzA+rd02/LvsNHgFEQ/GkjP3rsFi25mfhulv1j/LqnrFzFnqG4pp5m
	16963Wy3CXs8rLQ8b1MGE15PLFB8PZwffYyKhSLiikw/FktYyBQ++bIlg+sSH9cpDcZuBxLtG8M
	zyQy2sXUS2imWqlez8TMUzreEJxX+MxWYDCmWXhdAU7HmlSFi/3jjAz53xr3SkpKp4Zg+1JA6Ym
	bo7yrsVm2QsfyFKKPyCvk0OZsppafr5J2YVK53jORQAhxYLtQeBZ9dTQ6rAm4jdFHUFY1nz+Uc0
	IKiXNMgs1V0nAFnUfZhn2NYa7pjKoWLv9rl7AEXer4NfFUQCdjBmQk+SW3ruL8Ydn6ZIhW7UnuZ
	HTm9iwNX5Jlll9CxwFfCtjLiscUCF9SdFjvEtenmvN4XETZWi9/Kd7txVlBSH2cCikR6h1kaNS4
	QhjLC25z2JPNzzl2FGkLH2musaA7JZmhQYdFve9+WELpnUCqrb01x3MAeStYD/oy6rlZSdbGmn2
	8GOheG40bNf0g2XnOrSBjG787UdPkcTrTqbr2KAj16R2KdS6f4rHg6EAhBnVIgxmAdWZHlXs9VK
	tFeQnK14EDhef3N4RW6NSqivSWjISuf+qfq2sOvAbGre6HmSSNw==
X-Received: by 2002:a05:6000:4552:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-49115c978eamr1817748f8f.13.1793868241893;
        Thu, 05 Nov 2026 00:44:01 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 44/60] oe.patch: fix Git note identity in commitIgnored
Date: Thu,  5 Nov 2026 09:43:03 +0100
Message-ID: <79609753a4c670406715f60df30aa9475d80de5b.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249503
Content-Type: text/plain; charset="utf-8"

From: Roy Cohen <roy@0xbadcaffe.dev>

GitApplyTree.commitIgnored() passes the Git user name and email
as positional arguments to addNote(), incorrectly assigning them
to value and commituser.

Pass these as keyword arguments to ensure Git notes can be created
without relying on global Git configuration.

Add a regression test verifying the note content and Git identity.

Fixes [YOCTO #15989]

Signed-off-by: Roy Cohen <roy@0xbadcaffe.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit f3e5fcda44e6a4b4d047d4f276b4cdb7b4e6346f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/patch.py                        |  2 +-
 meta/lib/oeqa/selftest/cases/oelib/patch.py | 46 +++++++++++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2277e8835d5..f8fc63ac006 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -520,7 +520,7 @@ class GitApplyTree(PatchTree):
         GitApplyTree.gitCommandUserOptions(cmd, d=d)
         cmd += ["commit", "-m", subject, "--no-verify", "--no-gpg-sign"]
         runcmd(cmd, dir)
-        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit, d.getVar('PATCH_GIT_USER_NAME'), d.getVar('PATCH_GIT_USER_EMAIL'))
+        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit, commituser=d.getVar('PATCH_GIT_USER_NAME'), commitemail=d.getVar('PATCH_GIT_USER_EMAIL'))
 
     @staticmethod
     def extractPatches(tree, startcommits, outdir, paths=None):
diff --git a/meta/lib/oeqa/selftest/cases/oelib/patch.py b/meta/lib/oeqa/selftest/cases/oelib/patch.py
index 8492549764b..1b7d17813e0 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/patch.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/patch.py
@@ -10,6 +10,7 @@ import subprocess
 import sys
 import tempfile
 from unittest.case import TestCase
+from unittest.mock import patch
 
 import oe.patch
 
@@ -280,3 +281,48 @@ class TestGitApplyTree(TestCase):
                 "2021-01-01T12:34:56Z",
             ))
             self.assert_note_and_extract(repo, patchname, "+plain diff change")
+
+    def test_commit_ignored_uses_explicit_identity(self):
+        with tempfile.TemporaryDirectory(prefix="oe-gitapply-note-") as tmpdir:
+            repo = self.make_repo(tmpdir, "source")
+
+            self.git(repo, "config", "--local", "--unset", "user.name")
+            self.git(repo, "config", "--local", "--unset", "user.email")
+
+            with open(os.path.join(repo, "file.txt"), "a") as f:
+                f.write("generated change\n")
+
+            env = {
+                "PATH": os.environ.get("PATH", os.defpath),
+                "HOME": tmpdir,
+                "GIT_CONFIG_GLOBAL": os.devnull,
+                "GIT_CONFIG_NOSYSTEM": "1",
+            }
+
+            with patch.dict(os.environ, env, clear=True):
+                oe.patch.GitApplyTree.commitIgnored(
+                    "Add generated changes",
+                    dir=repo,
+                    files=["file.txt"],
+                    d=PatchTestDataStore(tmpdir),
+                )
+
+                note = oe.patch.runcmd([
+                    "git", "notes", "--ref",
+                    oe.patch.GitApplyTree.notes_ref,
+                    "show", "HEAD",
+                ], repo)
+
+                identity = oe.patch.runcmd([
+                    "git", "log", "-1",
+                    "--format=%an%n%ae%n%cn%n%ce",
+                    oe.patch.GitApplyTree.notes_ref,
+                ], repo).splitlines()
+
+            self.assertEqual(note.strip(), oe.patch.GitApplyTree.ignore_commit)
+            self.assertEqual(identity, [
+                "OE Test",
+                "oe-test@example.com",
+                "OE Test",
+                "oe-test@example.com",
+            ])
