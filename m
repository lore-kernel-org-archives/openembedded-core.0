Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0443D78CF4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 08:29:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5C8Tg1i016250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 01:29:42 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 12 Jun 2018 01:29:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2018 16:39:17 +0800
Message-ID: <067ca88b3cda3f822955c50fa560416f19227a72.1528792722.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528792722.git.liezhi.yang@windriver.com>
References: <cover.1528792722.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] send-error-report: decode response from server
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
X-List-Received-Date: Tue, 12 Jun 2018 08:29:42 -0000
Content-Type: text/plain

Fixed:
b'Your entry can be found here: http://<snip>'

Now looks like:
Your entry can be found here: http://<snip>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 15b5e84..cd2e7f4 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -143,7 +143,7 @@ def send_data(data, args):
         logging.error(e.reason)
         sys.exit(1)
 
-    print(response.read())
+    print(response.read().decode('utf-8'))
 
 
 if __name__ == '__main__':
-- 
2.7.4


