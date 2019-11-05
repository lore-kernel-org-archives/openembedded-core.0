Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 264C17F8BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739J1FwDzHq
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990292;
	bh=Ol2T4KZgew/WOOytcEkG2EVUm9ka621AjQjNJRab2ps=;
	h=From:To:Subject:Date:From;
	b=O/giXx9ny7jQlWZTijFUpwQgNIlEDOQ6xxK3uooxspPC1RojM0miY70hiHxoIqNBS
	ME5Wwzs4NIiliYvk3SZWSZFqkoJUo7s63PGKkQErJzxa2T8m0/ciWdsGzNSfXbnUns
	SAdhabkI13aPYSC6AggzBv5AZ73adErzVAJbxlEYjWsO6t0eAaomXlddvdauykjIJm
	LTkCePBT0GzmVwh77xr8guhwnKXXo0Vbhn1adRHTI7gYxbA3w7WrCQUXcXqNkHIhqC
	TyFDJF8JUB85z0xjW7P5s6aKXSn076Oz5MwMGzq/X6mc7rFJ+tAl8uDlTQERAeuSvx
	ka1NMgpsWiFbFeHPACmAto94u7ochtDfJ6C8gGXGnI2YzuSD8FGNYtgdmqRpemuavT
	rcK6+LHiTc5f3dFs/8/ZGRp+DI4u4zekFvzMPMsykQ5nBQYd1GNhr1D15W8L2h8+ye
	gohNXVpYnZ8hpjuUvrvTH+51mfG4EJYjbBR7udHyWgV+xj/XmgLfScAa02icbep4lP
	0e0mn3BLvlUM0mFPxvuTz/xjGtO0361NVVI3LEZMbn8nptWqlzS4UfXDJGa3koEDvg
	ZRt0NJN/6JHmCata1FTXpj6iKo9I8LUTEEd7k5k9zJZncybbVvTxg+5iCLKEojsNpg
	ThDG+8SF6d8k9xQMqiQdiuLg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:43 +0200
Message-Id: <20191105214448.2511-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] libpam: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:51 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/pam/libpam_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index c124e3bb02..ad6ac4b701 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -164,3 +164,5 @@ CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-password"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
 CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
 CONFFILES_${PN}-runtime += "${sysconfdir}/security/limits.conf"
+
+CVE_PRODUCT = "linux-pam"
-- 
2.17.1


