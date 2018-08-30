Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 299AA792BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:55:52 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id m4-v6so3262207pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SGAmLHmM9pIJXLD4nWdapW3IWEKTWe6IgDMEkdvFqMI=;
	b=rKmcMyBR7gZdphT/RzDrCABTAVS1qlzMpUUrJwwG1gPaynRgERiJXgdUHBM+gJYpYp
	nx5GG4emUlmD9RfaDpziExCXktiDt6L7aBRln2rFD5ddOvn5YWXxz8JrbxXgrYP7357M
	+YcwbfD2yUg6SFf/tpPhFjG26grlkhjn2EkPwF741rg8s2exmdsAomckTXu+F9QfqKVq
	DG/NP3gBhfxzsQoTluOiO9lcnpKWNrZwsKpfWhzLY7D4dBvDnOisVl4GLRaCY/JfNZbc
	LFirczcuScVUfeGIbK/DrsSl4GR+vK4UBX5zz9VdQszPy3n8/nOy6+pFxkAOISKrfEVE
	S2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SGAmLHmM9pIJXLD4nWdapW3IWEKTWe6IgDMEkdvFqMI=;
	b=e4IbD6ditsbVl0Y6Ie+RHwXBxCkN5UcphAobA2Ph9Z+cq1IeJBB7n6xEI2qoH7kwlK
	6HhSQUua1IBvm8P2lQ7J7B8mdDqHiwc+2VBtvDHMPuAkxdkWK2tfnLfCJ0/BT6fCI6gs
	sDCZ06ECea/8Des90y8PmgOjbjz4cHkcUYOaTzTLB+zXE95YKk4KJ2hQGFfGXk/yfZRe
	7rFGXgfF80AZWp+ODR8rqoFvmEgZ5wrAXLK05NcvBu5hAmtzmRoZt/6qsNnBUNJJSSe1
	Wzy6jzZlezM/KzuvQjXKmsKz9vSn+2+RS/1dI8u5ZWNsiGcPAf0+3sci1PpYebSaAm1k
	ATSg==
X-Gm-Message-State: APzg51DpWBZYvb0E2UV/2QdMfHE6i+MkuWTjTwhEpjza+c6PehxPQ9Fm
	NhiYZD64WYqbABdgenZaDbBdMNwv
X-Google-Smtp-Source: ANB0Vdasx4ncfV86MlqNX/TibXjKnRlUzq0CwUx4gnzapVjMNloK7D5UWplGYYySN4dBQj76huW9Zg==
X-Received: by 2002:a63:8442:: with SMTP id
	k63-v6mr8040213pgd.388.1535601352964; 
	Wed, 29 Aug 2018 20:55:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm8056381pga.40.2018.08.29.20.55.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 20:55:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 20:55:38 -0700
Message-Id: <41323c1d99de5dbf9ee55a9f4b3576d478e2016a.1535601148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535601148.git.raj.khem@gmail.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] tcf-agent: Disable non-building features on riscv64
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
X-List-Received-Date: Thu, 30 Aug 2018 03:55:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 20cb9a844d..d901c18c39 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -45,6 +45,7 @@ CFLAGS_append_mips = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_mips64 = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_libc-musl = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_powerpc64 = " ${LCL_STOP_SERVICES}"
+CFLAGS_append_riscv64 = " ${LCL_STOP_SERVICES}"
 
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
-- 
2.18.0


