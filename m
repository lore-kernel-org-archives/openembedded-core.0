Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Ricardo Salveti" <ricardo@foundries.io>
Subject: [PATCH v2] libpam: use /run instead of /var/run in systemd tmpfiles
Date: Thu, 17 Mar 2022 12:23:28 -0300
Message-Id: <20220317152328.2915582-1-ricardo@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: daiane.angolini@foundries.io

/var/run in deprecated by systemd, use /run instead, as suggested by systemd.

This fixes the following systemd boot warning:

systemd-tmpfiles[340]: /etc/tmpfiles.d/pam.conf:1: Line references path
below legacy directory /var/run/, updating /var/run/sepermit →
/run/sepermit; please update the tmpfiles.d/ drop-in file accordingly.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---

Change in v2:
- Extended commit message to include the systemd boot warning when using
  /var/run

 meta/recipes-extended/pam/libpam/pam-volatiles.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam/pam-volatiles.conf b/meta/recipes-extended/pam/libpam/pam-volatiles.conf
index d8b8259a93..1263feb03d 100644
--- a/meta/recipes-extended/pam/libpam/pam-volatiles.conf
+++ b/meta/recipes-extended/pam/libpam/pam-volatiles.conf
@@ -1 +1 @@
-d /var/run/sepermit 0755 root root - -
+d /run/sepermit 0755 root root - -
-- 
2.35.1

