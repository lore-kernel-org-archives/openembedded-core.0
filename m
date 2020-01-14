Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 23D627FA29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 14:00:24 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id q9so13893829wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 06:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5ivToSYi8Sckmjm5p6klSbcI2ivYt9yiR/usU+nmSjA=;
	b=np8uWrP0rBzUQyVRDTdVvIbNx/M5Yziro1MXatYzgkCwalrcGV6ap0SBXVNx4uwj0N
	XNVg9eov9oycBdEKVby3KUFhGs1Jhv3HUAZ1l/GvpKQ+1BQvBluCxYRqiXwzgHrKEcNu
	hjeOQ1dRR2RDhFeTP2+JG3awSaXSjw8LF/dmcldfEPl1fMtzZKkD079VN3jreimdEpd/
	Ewz4vcKPIkcJdYb1ZrR8+W+eLDmFEeE8a0wREferJhRWVeJ19KQNT3cLmAN7c9GulHEJ
	m6J38ulzxLX3afdpclN19iwGFb/RsF038g5MLEpOkENScsnpdmxvKfr8FPyHWYQQbJBN
	6F9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5ivToSYi8Sckmjm5p6klSbcI2ivYt9yiR/usU+nmSjA=;
	b=AnZOM7lJ04nByI8BT1dvyxi9AOnjHwRcfxq0WQWsWa8VoZ3p13zCpnf1UELtM5SXeF
	4QuAMdBATUUUsEvlYvwxkBeSGKbsR4EWh4ZL6pkzh23WNveIDh/10W2JxoT/HH4LUA+y
	A5Wq236Nwrrl/rHFBdJSd6cMLN7h7JpP16c7CQlDdGR/muWEYOQsLF9WszxHQZNYZGWm
	5roAVUEAsch8G6PnFvn7XNwVuI4y6uf+cO4HErNaYLxioO7cDN8vOEsvWjvDnHnvrM/s
	nCPOsxGw8hMn0eNZNrAQFOSDJDGQGLNBP14mf41+dv7Y2qNGkZfn+oG/HGDR1E3+6DP8
	pvgA==
X-Gm-Message-State: APjAAAVFU/OdVVGM8a2XUK3Iiz9AkB/B0ZTKpBk0ZojvwOwqGMEl3M5s
	jALLtC5xlTmUsyuuhTsu0iySG2mZ
X-Google-Smtp-Source: APXvYqzuZMaRqTCeMuJ871aNm4EyFwxXZlt6PEE+ipk+J4IghKjRJDlyS7STdSp3sa8JrftxDcGbKA==
X-Received: by 2002:a1c:4c5:: with SMTP id 188mr27057120wme.82.1579010424680; 
	Tue, 14 Jan 2020 06:00:24 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	r62sm20147333wma.32.2020.01.14.06.00.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 06:00:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 15:00:00 +0100
Message-Id: <20200114140007.36622-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114140007.36622-1-alex.kanavin@gmail.com>
References: <20200114140007.36622-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/20] dbus: fix failing ptest (by disabling as it needs X)
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
X-List-Received-Date: Tue, 14 Jan 2020 14:00:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/dbus/dbus/run-ptest | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
index 48535e13dad..d3eec08235d 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -19,10 +19,12 @@ files=`ls test/test-*`
 for i in $files
 do
      #these programs are used by testcase test-bus, don't run here
+     #additionally, test-names needs to be run under X
      if [ $i = "test/test-service" ] \
         || [ $i = "test/test-shell-service" ] \
         || [ $i = "test/test-segfault" ] \
-        || [ $i = "test/test-bus" ]
+        || [ $i = "test/test-bus" ] \
+        || [ $i = "test/test-names" ]
      then
          continue
      fi
-- 
2.17.1


