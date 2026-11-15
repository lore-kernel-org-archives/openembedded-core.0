Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4372.1794732545181152162
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E9Y28zqT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so10182555e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732543; x=1795337343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mwPeoKvd7dATDQ+NfIudsGtsRXIkuGzNEZiaPump97o=;
        b=E9Y28zqTrmDNUhoC3fFEE4EvijqTLFheZxrz8NvopmJI1t7/f/pGsWAIapMKRjDDJo
         OWyX9yjwJXdSObvPyO52EwX6ejAVsuo1OcOjTMxbg5t8mvV0u3GdhQL0kyasnUCnaQrI
         5ZzMXFiXPxRQS7oHQxe0506zvTxM76yiqDayQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732543; x=1795337343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mwPeoKvd7dATDQ+NfIudsGtsRXIkuGzNEZiaPump97o=;
        b=Oh0Nt6wsliENHFZq+j6dujNW0CdTZK6bpXHFazGN+TVjaaJGZptwiNHXyvG6lEp6iz
         ESH+FBP2VS+Hn6g9he3IIC9ti4T0C3SCEmLWwXF2QznJiMhQQgNTPTMhoZkKf35pGaNA
         ZnCkM5MMQ5ItpgP36pivyqKyO/CgxxbV5GGSDhjo9azzM/emYyWYLYBaUPrmerEXUq1R
         R/+R9z6DAJHNygwk3kl0BP/S10ujSfpi8CzqhAe0O2pW7YxKF0Jf7mERpqPQQ1VjzXlc
         x3xOYxKwQBTSxTuS2hMA68ykZvLa891qsOOKFz4ndxJieu7KVaLxWBpCrm4L/cuYbyx9
         yVSA==
X-Gm-Message-State: APuU4Z9353tVIjdFyyywO4cM3VyTV9/gktzEkfqA5nzOWU4UqvORDQdN
	A6eQO3p8B3ljtxU+qt2Ca4B7I5OLjFPOrxwdvIV0l0Pw5iv6NQdHzSAZmBjwT0I828zQITXciok
	yvNh+SFQ=
X-Gm-Gg: AYBFou1Ln9ebW9VAgEcHEDoPWwfriWUgNzv3v5CoBpHx16FlVxhNVxVKtqyrGmZCgM9
	Vxe0YPynnbxfyMWXtUZ/CZ/RapRYEaLjYwhxuVmnD8fz61+VWAmoU/aGPOJrFJXEmdA9maR9mHz
	wwjo0VGEWeFrE4MyHxbxcCX+USscJ3YI/J9OiZxBNTyPhUhZvbcpJk7FfRiHAe6neZkKddijfSO
	Wx0VYUPNHiQIWCIpfepWgkEcT9X+zzqk6uTeP5g1Fk86F/gsdTZ/diW9qGItzoXw7+17mjasbNj
	IWpZ0b3u265E8AmbrcXugsWkMdyW7Kvdash6h+XA9sG9qFwKkPJHdhNg01BCyzb8x5jjvCC5sgS
	t6ikwMHiwK1+tY3+Jv+fWrgLgJuMvSohq+kBmFHUDZoSSNPw3Z7Y8VC4DMKUEhvnjtgFYvcTdT4
	LsCWJZh/vf9tqwryMQe1hZEjNe4e3AS14d2qHRU8jANW6gRycYZSwn2NZrpH4ipB+7+SnyUzj1S
	7tf/4VEDK8pNgk+4Y5K+heGLYdIHwLAqMEfW3Z9wmwSs1igm0PitSj7+81vwArSSSJWZuqyfPOh
	ncf+YbnQvbRqCS8pOhxWaauaxeLoK0ugB40ZUnu5xfUD7gk5hxNvultycQ==
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr89489695e9.11.1794732543184;
        Sun, 15 Nov 2026 00:49:03 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/41] oeqa: Use OSError instead of IOError and socket.error
Date: Sun, 15 Nov 2026 08:48:12 +0000
Message-ID: <20261115084845.701136-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250240
Content-Type: text/plain; charset="utf-8"

IOError and socket.error are aliases of OSError in Python 3.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/oetest.py                  |  2 +-
 meta/lib/oeqa/selftest/cases/manifest.py | 12 ++++++------
 meta/lib/oeqa/utils/ftools.py            |  2 +-
 meta/lib/oeqa/utils/qemurunner.py        |  6 +++---
 meta/lib/oeqa/utils/qemutinyrunner.py    |  2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index ac972cfb223..a57cea74b46 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -360,7 +360,7 @@ class RuntimeTestContext(TestContext):
                     for line in f:
                         (pkg, arch, version) = line.strip().split()
                         self.pkgmanifest[pkg] = (version, arch)
-            except IOError as e:
+            except OSError as e:
                 bb.fatal("No package manifest file found. Did you build the image?\n%s" % e)
 
     def _get_test_namespace(self):
diff --git a/meta/lib/oeqa/selftest/cases/manifest.py b/meta/lib/oeqa/selftest/cases/manifest.py
index bbb92c17409..2c103c06fe3 100644
--- a/meta/lib/oeqa/selftest/cases/manifest.py
+++ b/meta/lib/oeqa/selftest/cases/manifest.py
@@ -94,7 +94,7 @@ class VerifyManifest(OESelftestTestCase):
                 if not os.path.isfile(mpath[k]):
                     self.logger.debug("{}: {} does not exist".format(
                         self.classname, mpath[k]))
-                    raise IOError
+                    raise OSError
                 m_entry[k] = ManifestEntry(mpath[k])
 
                 pkgdata_dir[k] = self.get_dir_from_bb_var('PKGDATA_DIR',
@@ -104,11 +104,11 @@ class VerifyManifest(OESelftestTestCase):
                 if not os.path.exists(reverse_dir[k]):
                     self.logger.debug("{}: {} does not exist".format(
                         self.classname, reverse_dir[k]))
-                    raise IOError
+                    raise OSError
         except OSError:
             raise self.skipTest("{}: Error in obtaining manifest dirs"\
                 .format(self.classname))
-        except IOError:
+        except OSError:
             msg = "{}: Error cannot find manifests in the specified dir:\n{}"\
                     .format(self.classname, mdir)
             self.fail(msg)
@@ -137,18 +137,18 @@ class VerifyManifest(OESelftestTestCase):
             mfilename = get_bb_var("IMAGE_LINK_NAME", self.buildtarget)\
                     + ".manifest"
             mpath = os.path.join(mdir, mfilename)
-            if not os.path.isfile(mpath): raise IOError
+            if not os.path.isfile(mpath): raise OSError
             m_entry = ManifestEntry(mpath)
 
             pkgdata_dir = {}
             pkgdata_dir = self.get_dir_from_bb_var('PKGDATA_DIR',
                                                 self.buildtarget)
             revdir = os.path.join(pkgdata_dir, 'runtime-reverse')
-            if not os.path.exists(revdir): raise IOError
+            if not os.path.exists(revdir): raise OSError
         except OSError:
             raise self.skipTest("{}: Error in obtaining manifest dirs"\
                 .format(self.classname))
-        except IOError:
+        except OSError:
             msg = "{}: Error cannot find manifests in dir:\n{}"\
                     .format(self.classname, mdir)
             self.fail(msg)
diff --git a/meta/lib/oeqa/utils/ftools.py b/meta/lib/oeqa/utils/ftools.py
index a50aaa84c29..3a10ae79d45 100644
--- a/meta/lib/oeqa/utils/ftools.py
+++ b/meta/lib/oeqa/utils/ftools.py
@@ -36,7 +36,7 @@ def remove_from_file(path, data):
         return
     try:
         rdata = read_file(path)
-    except IOError as e:
+    except OSError as e:
         # if file does not exit, just quit, otherwise raise an exception
         if e.errno == errno.ENOENT:
             return
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index dada3166187..26782518e4e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -119,7 +119,7 @@ class QemuRunner:
             self.logger.debug("Created listening socket for qemu serial console on: 127.0.0.1:%s" % port)
             return (sock, port)
 
-        except socket.error:
+        except OSError:
             sock.close()
             raise
 
@@ -216,7 +216,7 @@ class QemuRunner:
             if self.serial_ports >= 2:
                 self.threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
-        except socket.error as msg:
+        except OSError as msg:
             self.logger.error("Failed to create listening socket: %s" % msg[1])
             return False
 
@@ -858,7 +858,7 @@ class LoggingThread(threading.Thread):
     def recv(self, count, sock):
         try:
             data = sock.recv(count)
-        except socket.error as e:
+        except OSError as e:
             if e.errno == errno.EAGAIN or e.errno == errno.EWOULDBLOCK:
                 return b''
             else:
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index d1ccf65223f..d4a42304e23 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -55,7 +55,7 @@ class QemuTinyRunner(QemuRunner):
                 self.server_socket.connect(self.socketfile)
                 bb.note("Created listening socket for qemu serial console.")
                 tries = 0
-            except socket.error as msg:
+            except OSError as msg:
                 self.server_socket.close()
                 bb.fatal("Failed to create listening socket.")
                 tries -= 1
