Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8A67852F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 18:48:50 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id a22-v6so5334990pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 11:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h35biA5/+39GSlbBe6xDBI2BQZKTkBSfCmmKuZL0Q0Y=;
	b=GQ3AUxCLktm179i47Dq0PY336zkJhZERLFyVG8vAm/iAFaaEfMMhrlB3ptswmbuDb5
	Mh/K2K/L2wt0jq6Cx3u+fTyDtQNHyIDtFIeG24vbSeTycakjySIfXT0VpDNxkgpYXjhR
	bloHXemxnUfK2ePLF+v9fW/DnsyOHg9z4+R6ACygjhsvACdtSo2FS+ERMR8ksuY8vwMy
	SrWuHQL76ii1CL52q+2sqoy4ph7UQVIMLT9zpnf7lJku4Debe2ZONw+cjRD6U50xWKfE
	L5c78Y6yD/0xYFbxy0e31kZFX+mjRiFaN4a/hgSwlzgEIa7BPa5NFh8j/PbTb4mMe7rz
	GvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h35biA5/+39GSlbBe6xDBI2BQZKTkBSfCmmKuZL0Q0Y=;
	b=O1rIgS/LY+N/PZhWcdtgUXq/MEd3KQWgrSGajb2O0X1d6yWyvsjvv8MkANgimoDGOZ
	3IQf2F2gRzxgsax9R6PjmRJK+Xi8wgF2EZHnsfz1A+l9c7cBDTlCrfdhembm3VmjHcen
	vvJLlgP3OmjDcJ6ghlEKxPSXzp8knzHD5bHssTF5VcSAMTmohOKVU9bEpur50Qb8ix46
	dmbDCq03SuLl0E7MJvrzkfDurpeXnkcQyb+gXHbm/hrzN4hGAPywguSpMMhLsedDurJl
	6u0RpywWadNNIgysVYufUcQoUmLxrE57o2SH86E/U3TY16ltBGEr0cvZTyflorfdcjnu
	eSXw==
X-Gm-Message-State: APt69E1cABMVrfOlS1emglhlhXS2L/BFw+WdqPYUzvtg9S53VDyvG4I7
	aRtmNqFGXJN5XoFMQKNDKxH2Cg==
X-Google-Smtp-Source: ADUXVKK5SxhR1Ly7hPdizDdbhKvnqNFK+4BZcie7eRpu6YSgrNf2A+CLzWsddCkJEUexzKLbisbU8A==
X-Received: by 2002:a63:6e8f:: with SMTP id
	j137-v6mr2537889pgc.453.1528397331574; 
	Thu, 07 Jun 2018 11:48:51 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f30-v6sm27103558pgn.76.2018.06.07.11.48.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 11:48:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 11:48:36 -0700
Message-Id: <1528397320-32269-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/7] openssh: drop RCONFLICTS for openssh-keygen
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
X-List-Received-Date: Thu, 07 Jun 2018 18:48:50 -0000

The "ssh-keygen" package no longer seems to be provided by any recipe
in oe-core or meta-oe, so there's no clear reason for the
openssh-keygen package to conflict with it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index 0459782..e4feeca 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -145,7 +145,6 @@ RPROVIDES_${PN}-sshd = "sshd"
 
 RCONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
-RCONFLICTS_${PN}-keygen = "ssh-keygen"
 
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
-- 
1.9.1


