Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 431CA6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 19:54:52 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 20so6874549uak.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=tuYVxvEnN/o6J3dao4nZe+OeWvemhCtyFO+4qc0eA3k=;
	b=pncU+rpb4HxCQyvrI3sbuNexdxoBfoIIh5Uz7da7TKoGJqtkMDv6vvfs0YrZa3VUxp
	4oEUnVAN74Fm/AN7ozV01EtSN353hZBShtDr4vWCDQtM+v0JerYMIrhdOY88CQ0TUX1I
	NNFl41u4uhumAV5s7L1Ji/bXVh9ZtA3giblCxWp49ZnFceX2jt4vnxdqUjSl8rsdnbTG
	UQ5a7N5IU/xS6HODJP7PmVSMbjaKwc0OkhaC62lFeMba/t/YTiU/7BhIm5sbrfgJd18v
	XhJT/xj+UE8PGUO3fRqjQ5kUabnD4Yv8Yz2XoWenkSO7FY6cKISlwBxpu1ZOVfN5S9Hs
	BUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=tuYVxvEnN/o6J3dao4nZe+OeWvemhCtyFO+4qc0eA3k=;
	b=mpx98mrSdvtSprJM8qsyeapMtQ6r/4hD0mGqbUB7cvGH1oQ3z13fOqxVUFM2hshWGC
	02TTG3gjV3DCsBNkevHDENh+aGuQD3bllcqSUGXYbGMN7XJcPusO4b4KoTxJ8vXtrGss
	fvRkXUkOK8TAay7McGFZVVlamh83fOebAFJulQf8IU0j5m4rdlwdlKP4MfEa/EopV9MM
	IVb9FjR+rG+ijA94ebJMROmNwRa6hdMLgBwYlT/tC4uDGiLBPczR2lxl15TtmyJb94FD
	nQNKDrlhiei5v6iczxAdH+VzfSfVj7dP2ognT1ZwuNEpc3bvtEBs4V0WYvg8wLinwRlH
	aong==
X-Gm-Message-State: ABUngvd13AnAXqA+pG31kXGa2h8Sf5RNmfgPtii+oRgCP/nWjVakDPi+7ZOfZMtXe/mk1Q==
X-Received: by 10.176.64.234 with SMTP id i97mr9620665uad.7.1478030093478;
	Tue, 01 Nov 2016 12:54:53 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id q7sm8055913vke.20.2016.11.01.12.54.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 01 Nov 2016 12:54:52 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:54:00 -0200
Message-Id: <1478030040-20670-8-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 8/8] guilt-native: Update to tag v0.36
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
X-List-Received-Date: Tue, 01 Nov 2016 19:54:52 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-devtools/guilt/guilt-native_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/guilt/guilt-native_git.bb b/meta/recipes-devtools/guilt/guilt-native_git.bb
index b63c68c..c448e72 100644
--- a/meta/recipes-devtools/guilt/guilt-native_git.bb
+++ b/meta/recipes-devtools/guilt/guilt-native_git.bb
@@ -8,8 +8,8 @@ inherit native
 SRC_URI = "git://repo.or.cz/guilt.git \
            file://guilt-bash.patch \
            "
-PV = "0.35+git${SRCPV}"
-SRCREV = "c2a5bae511c6d5354aa4e1cb59069c31df2b8eeb"
+PV = "0.36+git${SRCPV}"
+SRCREV = "22d785dd24329170f66e7696da38b3e90e033d61"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


