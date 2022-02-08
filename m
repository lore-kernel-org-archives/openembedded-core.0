Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5516BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 08:26:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.8676.1644308758011331493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 00:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gcdYG0Da;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644308756; i=@fujitsu.com;
	bh=ASYXa3gN9Xefoyff2P8XvkfDkNGuZYzP5LOPdmZz2BE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gcdYG0DadqpmoQ5ywnjCtXe9atYeI3racJT9Fkz8fOcAtjvLLX4G70qa2xKCmMlm8
	 cB3f7kecl8UBtd0/a+VsQAf9Lwitct1+imXtvcyXBXvQ6CvF7Ijrz6nJd6Qd7jxBDF
	 uV69o9oYpVQQsjWRNg3D7gs2IuwVbc5wdeKj1K8O5jjw97J8seuZWa/Y4s5P6Kkpt3
	 xeBHQpOvkrLBk60s+4Tc3wGuUGEM88wMytdz3g3ZbCO+ElgVxemLkUw0VtH7HMCrYM
	 dwHRgFRrlnein05rsdnAY3O3WoRJuGVaKh5KR6anXSUUyiWpfuIqM2X16yxwptf06q
	 RUWCDaIa+FYTg==
Received: from [100.115.34.36] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id D0/29-12680-31922026;
 Tue, 08 Feb 2022 08:25:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqCusyZR
  kcPy3vMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFi1jaWgo9CFf9u7GBuYNwh0MXIxSEk8JhR
  Yk7zXSYI5zyTxIHOySwQznFGiXOf5rB3MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z1gJcICphLvp35iBLFZgOKb5veCxXkFHCXeTZrKBmJLCChITHn4nhnE5hRwkjj07yoLiC0EVN
  N1aQ8jRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkbrpKLM9IyS3MTMHF1DAwNdQ0NTXWMjXUMLS73EKt1EvdRS3fLU4hJdI73E8mK91OJi
  veLK3OScFL281JJNjMAwTilW2LuD8fLKn3qHGCU5mJREeZNUmZKE+JLyUyozEosz4otKc1KLD
  zHKcHAoSfCeEQfKCRalpqdWpGXmAGMKJi3BwaMkwntcHSjNW1yQmFucmQ6ROsWoKCXOmwySEA
  BJZJTmwbXB4vgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHemyBTeDLzSuCmvwJazAS0+Ou
  if4lAi0sSEVJSDUzG81PvXe/JaQxyO7X0ZM7ZKU7uU1+IrFkyiyd3ks3iuwujtZyYV+wpvXbu
  74Eg7w3Tj8/OWFZjLvnLVthjm+u53P3/A0XswzZo7C4LebDt1rYf8gUbF5zreZskuneCRqrCI
  u95qyIsrpuZW96KELZ98/fSGsl/PPsn7N1ww1v3Xa7Mu77uKI8VKbJPz+1d3j/j4QNN5f9HUm
  bxPF21oWpBA1NBR9K8RfxhsirzPs/Inasjl7tAdtVOxeoba4R/Le9d+MbtvPyU1bOUnuiXfmt
  c+P3gpM3mMz2vOeblyC5hq80K0eUsyGu5kODqy7E8cMsfFXf7b65OO5KPb+qbsaynplPE/cPf
  bNe0gGi/r7wJSizFGYmGWsxFxYkA0Kf2Wl4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1644308755!60245!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8754 invoked from network); 8 Feb 2022 08:25:55 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Feb 2022 08:25:55 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 174711001AA
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:25:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 07988100192
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Feb 2022 08:25:55 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Feb 2022 08:25:45 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] gdbm: upgrade 1.22 -> 1.23
Date: Tue, 8 Feb 2022 16:25:24 +0800
Message-ID: <1644308725-5262-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
References: <1644308725-5262-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 08:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161476

refresh ptest.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/gdbm/files/ptest.patch      | 16 ++++++++++------
 .../gdbm/{gdbm_1.22.bb => gdbm_1.23.bb}          |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)
 rename meta/recipes-support/gdbm/{gdbm_1.22.bb => gdbm_1.23.bb} (94%)

diff --git a/meta/recipes-support/gdbm/files/ptest.patch b/meta/recipes-support/gdbm/files/ptest.patch
index 187f09655d..25fb6bb2f4 100644
--- a/meta/recipes-support/gdbm/files/ptest.patch
+++ b/meta/recipes-support/gdbm/files/ptest.patch
@@ -9,11 +9,11 @@ Upstream-Status: Pending
 
 ---
  Makefile.am       |  5 +++++
- tests/Makefile.am | 11 +++++++++++
- 2 files changed, 16 insertions(+)
+ tests/Makefile.am | 12 ++++++++++++
+ 2 files changed, 17 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 25e200d..03d5ef0 100644
+index 59e2643..5f3ceb0 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -64,3 +64,8 @@ ChangeLog:
@@ -26,13 +26,14 @@ index 25e200d..03d5ef0 100644
 +		$(MAKE) -C $$subdir DESTDIR=$(DESTDIR)/$$subdir $@; \
 +	done
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 337cbed..92ec3be 100644
+index fac6826..5dc2091 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -139,3 +139,14 @@ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+@@ -143,3 +143,15 @@ d_creat_ce_LDADD = ../src/libgdbm.la ../compat/libgdbm_compat.la
+ t_wordwrap_LDADD = ../tools/libgdbmapp.a
  
  SUBDIRS = gdbmtool
- 
++
 +buildtests: $(check_PROGRAMS) $(TESTSUITE)
 +
 +install-ptest: $(check_PROGRAMS) $(TESTSUITE)
@@ -44,3 +45,6 @@ index 337cbed..92ec3be 100644
 +			$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
 +		fi \
 +	done
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gdbm/gdbm_1.22.bb b/meta/recipes-support/gdbm/gdbm_1.23.bb
similarity index 94%
rename from meta/recipes-support/gdbm/gdbm_1.22.bb
rename to meta/recipes-support/gdbm/gdbm_1.23.bb
index 5cb12cd57c..4ec80b5b7e 100644
--- a/meta/recipes-support/gdbm/gdbm_1.22.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.23.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
            file://ptest.patch \
           "
 
-SRC_URI[sha256sum] = "f366c823a6724af313b6bbe975b2809f9a157e5f6a43612a72949138d161d762"
+SRC_URI[sha256sum] = "74b1081d21fff13ae4bd7c16e5d6e504a4c26f7cde1dca0d963a484174bbcacd"
 
 inherit autotools gettext texinfo lib_package ptest
 
-- 
2.25.1


