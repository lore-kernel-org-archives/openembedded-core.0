Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 869A860670
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 05:54:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB25sgOA014674
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Dec 2014 21:54:42 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Dec 2014 21:54:41 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Dec 2014 13:53:34 +0800
Message-ID: <9435ff3fb4896147fc6448ac91d466aaaa74c97e.1417499570.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417499570.git.Chong.Lu@windriver.com>
References: <cover.1417499570.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gnutls: disable tpm
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
X-List-Received-Date: Tue, 02 Dec 2014 05:54:46 -0000
Content-Type: text/plain

Disable tpm to solve following error:

.../usr/lib64/libtspi.la: No such file or directory

trousers isn't an oe-core recipe, disable it for now.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 27aba26..12b26cc 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -35,6 +35,9 @@ do_configure_prepend() {
 	done
 }
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
+
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
 FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
-- 
1.9.1


