Return-Path: <a.novikov@yadro.com>
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
	by mail.openembedded.org (Postfix) with ESMTP id D6F8B77972
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 08:04:34 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 6FBBB40418
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-language:content-type:content-type:mime-version
	:user-agent:date:date:message-id:subject:subject:from:from
	:received:received:received; s=mta-01; t=1498032273; x=
	1499846674; bh=Pf5OS5Raf6qhCZU/eekZQ1RYtQoIu9nW8OKPXgd+lFg=; b=W
	pAL8WBiem3LxyieCTpW914nEwmLYEWhrMjrYfWiBDcxCvwpSl6wSUN1hBrvXgGnr
	qIHCSspM9HEluXN2JebOyxy9UBzp8QbMDYghgcx1BwxH0iKGT4x06LbU2oxFj5X5
	OiAwalZIuJ2wFRmOcEoWkgq8Mfcqw6QgQyKti+56hE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwRw-qcKna1z
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:04:33 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id D530F400FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 11:04:33 +0300 (MSK)
Received: from [172.17.15.41] (172.17.15.41) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Wed, 21 Jun 2017 11:04:33 +0300
To: <openembedded-core@lists.openembedded.org>
From: Anton Novikov <a.novikov@yadro.com>
Message-ID: <da612536-8f62-1de5-45d1-e4f660ed0c64@yadro.com>
Date: Wed, 21 Jun 2017 11:04:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
X-Originating-IP: [172.17.15.41]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
Subject: [PATCH] master: fix perl regex in Automake
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
X-List-Received-Date: Wed, 21 Jun 2017 08:04:35 -0000
X-Groupsio-MsgNum: 99162
Content-Type: multipart/mixed; boundary="------------8C48F577FE023A2BB0C59F96"
Content-Language: en-US

--------------8C48F577FE023A2BB0C59F96
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I haven't setup git-send-email yet, so will try to send the patches as

plain attachments. Sorry if it looks wrong.

This patch affects master branch, so I send it separately.

Morty branch does have the same bug, but the patch is somewhat different,

so I will send it separately.

Thanks,

Anton


--------------8C48F577FE023A2BB0C59F96
Content-Type: text/x-patch;
	name="0001-add-perl-regex-fix-for-Automake.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-add-perl-regex-fix-for-Automake.patch"

From 499c844cf49ac8b0e25a700639de9c288d25575b Mon Sep 17 00:00:00 2001
From: Anton Novikov <a.novikov@yadro.com>
Date: Tue, 20 Jun 2017 14:33:20 +0300
Subject: [PATCH] add perl regex fix for Automake

Build was failing on Arch Linux due to recent Perl giving error on unescaped
curly braces. Patch fixing it was copied from Arch Build System.

Signed-off-by: Anton Novikov <a.novikov@yadro.com>
---
 .../automake/automake/perl-regex-curly.patch       | 26 ++++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.15.bb    |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/automake/automake/perl-regex-curly.patch

diff --git a/meta/recipes-devtools/automake/automake/perl-regex-curly.patch b/meta/recipes-devtools/automake/automake/perl-regex-curly.patch
new file mode 100644
index 0000000000..20cb96b74b
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/perl-regex-curly.patch
@@ -0,0 +1,26 @@
+From 13f00eb4493c217269b76614759e452d8302955e Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 31 Mar 2016 23:35:29 +0000
+Subject: automake: port to Perl 5.22 and later
+
+Without this change, Perl 5.22 complains "Unescaped left brace in
+regex is deprecated" and this is planned to become a hard error in
+Perl 5.26.  See:
+http://search.cpan.org/dist/perl-5.22.0/pod/perldelta.pod#A_literal_%22{%22_should_now_be_escaped_in_a_pattern
+* bin/automake.in (substitute_ac_subst_variables): Escape left brace.
+---
+diff --git a/bin/automake.in b/bin/automake.in
+index a3a0aa3..2c8f31e 100644
+--- a/bin/automake.in
++++ b/bin/automake.in
+@@ -3878,7 +3878,7 @@ sub substitute_ac_subst_variables_worker
+ sub substitute_ac_subst_variables
+ {
+   my ($text) = @_;
+-  $text =~ s/\${([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
++  $text =~ s/\$[{]([^ \t=:+{}]+)}/substitute_ac_subst_variables_worker ($1)/ge;
+   return $text;
+ }
+ 
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-devtools/automake/automake_1.15.bb b/meta/recipes-devtools/automake/automake_1.15.bb
index 902dd63db1..0046cd4f0f 100644
--- a/meta/recipes-devtools/automake/automake_1.15.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -22,6 +22,7 @@ RDEPENDS_${PN}_class-nativesdk = "nativesdk-autoconf"
 SRC_URI += "file://python-libdir.patch \
             file://buildtest.patch \
             file://performance.patch \
+            file://perl-regex-curly.patch \
             file://new_rt_path_for_test-driver.patch \
             file://automake-replace-w-option-in-shebangs-with-modern-use-warnings.patch \
             file://0001-automake-port-to-Perl-5.22-and-later.patch \
-- 
2.13.1


--------------8C48F577FE023A2BB0C59F96--
