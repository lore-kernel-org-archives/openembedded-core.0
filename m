Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.716.1589315874922161349
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 13:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=OzpF2Lvi;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M8kl5JBbzJm
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 22:37:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589315871;
	bh=/fiWOnL0k/myJnwFlye/oJJ7SN+mZKpBvgFEfJKNIUE=;
	h=From:To:Subject:Date:From;
	b=OzpF2LviW9MKaf4xC/j+PMR6DzJaHAAJJ9KFGCQ5nxFdB/GTlk7nPDn86UxnHyYLg
	 /rEKXRXh+8ZBA8tbHq7S2JybEZxNwXMQ2QZTq4iVBC7wb2pWm0QkQd2oxsZsCKM2/L
	 rRLdLIykVusvir6hDFk0TvJdfVfklAgscLq6QleAttvBDKZNNegmPYvAVWRDiEKwBb
	 yn1Cg8Q9l6x31W4/W6UkAopihhX4yGOyQ46fKvXGHmI8EmPeeqrn9k3NTf/Y27MamW
	 9eUuijwTAiqlOIwk20V4GTgWXB6N7HBqekshE+4BF6iIMKuJGPdThmhg/8K9nRb3vH
	 lR2gpY9IhvJys81XN0ls51zvcQNzOxzCi+ih86oC4w1Z3GtrgM2/PyrAR0tWprbyhk
	 ci3+833Lw1sZ1pjS0N6R8ncjX+cbbVcsZWM5BNeVIXjqgQwSF9RyHkcC+ZIUJESsro
	 5WLFxCssjLpxxSnzfJ5rQKTLTAs59fh6mnWl+18M9EBCf0u7w1yGf9E/ugvxXeffqY
	 lqT0nUW3E2k9tLQPjovaNlFsyAicUAvaKjZIrzvUGna4+Mge2ajIedDdk+ICky9stn
	 HqzSnajk2qENECNVEyfrsIfPcDuy43EeRUyi69765viMh0N9NkBBKuwEkVqozCdifr
	 jCreedYKjai7mO1lN2AFTtew=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] nettle: Remove workaround for gcc < 5
Date: Tue, 12 May 2020 23:37:48 +0300
Message-Id: <20200512203748.8779-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/nettle/nettle_3.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle_3.6.bb b/meta/recipes-support/nettle/nettle_3.6.bb
index b71f56d83d..90f8625ae5 100644
--- a/meta/recipes-support/nettle/nettle_3.6.bb
+++ b/meta/recipes-support/nettle/nettle_3.6.bb
@@ -30,7 +30,6 @@ inherit autotools ptest multilib_header
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 EXTRA_OECONF = "--disable-openssl"
-CFLAGS_append = " -std=gnu99"
 
 do_compile_ptest() {
         oe_runmake buildtest
-- 
2.17.1

