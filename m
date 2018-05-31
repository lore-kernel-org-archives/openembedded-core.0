Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E1871601F1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 22:50:49 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p14-v6so11492093pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 15:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YUDEi24xveRfrjl4Y8gS0DLWS4WFs9e6mXzalILEOcU=;
	b=NGzwQVQDzadHKINwD5K5472vfFVQ9VOaEx8uasY65l+WJ9XqPpBR6W8s8gk5A2Q3nP
	337fXdNgSWL2C9BI5NHLtnntO+b4dtPr9ExBpbh8h4KtqsBSL4qlld3sUMH2JNEigpPG
	n1r+/f65jNN2tnF7uWO6D3XyRv+6BhJWTwRMdqdBiUxo07toL927nBEby2Lgzfq4WtpZ
	gNVkUqf2qMmv3B/6zkE6XMBRa39rhHMhdIpqbDjqBRNlFsg0VTP9ENbiw0nb3OksC0e5
	Uj6fv3Gn9Dje9Td9cX0lBbjQ3N91s60O/hpt0Y06+jmBQNhwjdWWLMk3JwCxrNxYJO39
	j8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YUDEi24xveRfrjl4Y8gS0DLWS4WFs9e6mXzalILEOcU=;
	b=UnuEYzeAfMZ+e08wZneYwpfb21vT2OEpWQzUkY/K6Hf365b9/Kmj313xNJvoaZZbSF
	IY8LCAHcOh1NDFLtHq3aALhq6b4RPWLHgb9LnwINmZzAy1X33vfgkzFwJuRk0I53AJ6T
	+ffSXJIitH2s84M9YqvleFtcKKPMG5DKfSDiUc1498lZyfF+8JtgdhAYP1kMNruCbzGP
	6x2WdtYgdUh+5Ckbx+sXmTBySxKlcU9QZEUJUupwX6l0vHqnu+B2zvi0fw1NLZcTKK63
	gxywpvGsck4qewb6ZjJo4E7sE5EYIxMF3PTIE3e3/p2TcU4WyuoDuoctwloiKHRt3Cn5
	UeMw==
X-Gm-Message-State: ALKqPweDMlF2D4GSSWweCPqKT9rVDoAFEVgLwCHHsY7s25/ET/1kQ64k
	/mpt+RMq5gEdyWPrLRQkz4gmHQ==
X-Google-Smtp-Source: ADUXVKLaXKF51DXs0dsCJ7wL8iCC0yVNO2Qd3209TTAxZRgguIIwjcVZFeFikGliErzWYDwxr1Hizg==
X-Received: by 2002:a62:c95c:: with SMTP id
	k89-v6mr8404116pfg.47.1527807050710; 
	Thu, 31 May 2018 15:50:50 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	s4-v6sm50964022pgp.35.2018.05.31.15.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 May 2018 15:50:50 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 15:50:44 -0700
Message-Id: <1527807044-19616-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bitbake.conf: drop redundant -nv from FETCHCMD_wget
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
X-List-Received-Date: Thu, 31 May 2018 22:50:50 -0000

Since the addition of progress reporting, the wget fetcher will
over-ride -nv by unconditionally appending "--progress=dot -v" to the
final wget command line.

  http://git.openembedded.org/bitbake/commit/?id=4027649f422ee64b1c4e1ad8d48ac295050afbff

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3f63a25..907a5cb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -663,7 +663,7 @@ SRC_URI[vardepsexclude] += "\
 
 FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-cert"
 FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 -nv --passive-ftp --no-check-certificate"
+FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
-- 
1.9.1


