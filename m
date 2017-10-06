Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 19B2B780BD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:50:55 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id a7so15600991pfj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IFZHJ7WZuMqkwY2bCiABU/ZAvVXhshqQksJXo0KQea8=;
	b=SZwtpa72Flr1W50mcU3bfZPO04C+g7idWtT2JG2LBGapRCfAMR7qJzkDqXAMmCqvqA
	Km2a9LC7KjRsTNGWbrpK7jWl7vi2YkE+OiUCE6xecuu5w0HjDsRAs3S2N20PTmZKttGB
	xfjKPejKXYMOy1d+H6zudFP9S+rLTou+HtLJBbMw6o633IeAmiw+PwOoUhYISjHllA9q
	APmoQhFumcMh5p5aL+ru3KJf5tl2KK6lkTqYD/nFmt8KcGalJonkBs/NoGrs5oIl4Bqp
	w/bZHHePhTbuiq5qYMEd54dpfPler8KXg6k9g+j6wS2Pp6DMrBECOrDx2FFFr79jvJ85
	HNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IFZHJ7WZuMqkwY2bCiABU/ZAvVXhshqQksJXo0KQea8=;
	b=G81Y/9HZI7pbKMehw4cKq0yAYH3RlVcKe+DuOCK4WWSfMuDvqme4SEgB9fu0P3fYOO
	Xh8fkEyt6SlQ+876zk3oK8J9ZhgMlKqXRYysio7j3b4IRk/Ji9YqTuOK4/m0aV6bf4Vo
	UyYnDnk+zka0gATiTQrn89EWLEMKCAQTSPC3dRoKrrzfUltrR4jho+2dhSCqhSo7B7/2
	CuFnTLQHNLW+AukvEUpGZ5Sb9CXzJ2511UD+47dVhvr/gxrXr8eo3nrbqjnSrlsQbljP
	Ed85BNIsw7aaRJ6oLgeawjrXT19Jx9PkCy/UnZkV+79Qd3trfKSVQ0+WY3GoreblTM/d
	AASw==
X-Gm-Message-State: AMCzsaUAvlmxNSLgCzeMxxqeRaJX0bWowiqFjRwXkHovY8oyAjm4x5Kd
	KV0uA5vqanl2WPHiYwKhtp3exw==
X-Google-Smtp-Source: AOwi7QAUrGAy9St2pBxihL7MSVIhM1HOxg4I6BS0HZDdt7Kv9ZprE1G3grpst9fuSQY3JldIiof8Bw==
X-Received: by 10.99.166.18 with SMTP id t18mr387325pge.403.1507251056942;
	Thu, 05 Oct 2017 17:50:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id o128sm259308pga.5.2017.10.05.17.50.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:50:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:40 -0700
Message-Id: <79796969192ddd9bebbb7bc4647208443278154f.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <cover.1507250774.git.raj.khem@gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
Subject: [PATCH 01/10] site: Add riscv32 and riscv64
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
X-List-Received-Date: Fri, 06 Oct 2017 00:50:56 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/riscv32-linux | 4 ++++
 meta/site/riscv64-linux | 4 ++++
 2 files changed, 8 insertions(+)
 create mode 100644 meta/site/riscv32-linux
 create mode 100644 meta/site/riscv64-linux

diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
new file mode 100644
index 0000000000..a496bd1aca
--- /dev/null
+++ b/meta/site/riscv32-linux
@@ -0,0 +1,4 @@
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
new file mode 100644
index 0000000000..a496bd1aca
--- /dev/null
+++ b/meta/site/riscv64-linux
@@ -0,0 +1,4 @@
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
-- 
2.14.2


