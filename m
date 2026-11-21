Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12096.1795239543578833521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 21:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NP/+5s35;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-380b40312e2so2833060eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 21:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795239543; x=1795844343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTzVj6QUtdwAEETUTSOYNuTVTqVQJ5q32E1V00jM3P8=;
        b=NP/+5s35U9zHUYrJQVnAxjXeSBoY0hLZWtKzl9CV07VSxztF4NHeFGTS1Ls7HwnNZ7
         YXWydk90VUiy85EEq1ABMgIoLAGmoXxRyd+j4nAWBSv2bRPFXu6UwoseTgEeWTio7rpE
         b9Ln+0ik0ZWn7Dkg/dXh0Ye+/Xm8CDvzMlCE4zGYzWZSi6UvXeqyVSr0mUvFMBVV72cN
         SdbgVvDFzARrAbQErtkBzrHqDZkEVQmnZVSaYQJPVBfuHRSoXcIybSyRc8SDYDnjL7tU
         W61PLVWQbRbeX6kHt0VO1L72GpNnHJfboaJa7bVZ5fA6/jptRQhMuRS7epApu0Gurn0s
         WP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795239543; x=1795844343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTzVj6QUtdwAEETUTSOYNuTVTqVQJ5q32E1V00jM3P8=;
        b=z/OIiDyN25lKvJNx7iGj7ca3B/szuJ66SUyuidxyiHShXiFbKO/NGCz/9tR+85Ss+h
         fuaJhmnsyJPyVF8tQ25Tjb4/d360R4TxsprmCYkbKfqUDPqB84yG5sKwehajkM7JwQpP
         s7IIGgHLV02nQ+YwOhLPvICQd9s35Wn9eQCe5eh611jO4hR4ZszIvuwS8vWdNI1yDZKh
         oqQvTKILK4qAFDPWN2yJ3251n2o2ZwC0JJKsTc+OxrnDGd/vOM5C2zNuXrmu5yFyX6ER
         6HMoNY6XPuOhu6EVxWEwtZaINrc+6MrNqDuVfqbJDNQ5uv+MIYlIEWp8pDn1y+4i+df7
         6T7A==
X-Gm-Message-State: APuU4Z+12mjsWd9QUbmnk4Q+xGsmmFal9w9apT87IEeb3YeoZ2Moir56
	VkyOSQYI9ZM0VLX0C47rf9PStvi1IU8YzzbdUTr9zvmwOmm/TMHep8FS2fDQ+g==
X-Gm-Gg: AZFdTZfbxVvwKRWbngIHh3vwcHct1aN3og4ThZRdCbxT86gGXBsavGeDaGjLmf4oWGE
	nbAqILJzVPXT9bTs5iuOaeIdHMzH4mvH+WGR6TuNmn8TGtaHhoX0UDh4mpCusoU+nSJLvFeqIov
	mUwLhpNp0Pq+FW/3c+hl/MAcqyvZKXUFFX7DPv2MmfF8ji7LpVcZBI8UUYjHaxsmXU5sFlmS5Wt
	mo1XHVXXHXkjRcuY1nf2d6GfS4kAmUcCdYxQPHS7bb5LdjzZWO0EFCAAJn93NFSScHEvXzq85hS
	Kz9Gf/zoCCg8J4qzywI7Ebiyv4tpK+gB8OyN7bgjibPKT9JDZrCdzahelujLH7HhOijIgMvfEts
	1kVoutargVgWDRk3OZMtMkl+VFiXlM/yvmqJFruIxlnvnuEHNZ3ogH0hJO4S0LaUI4CAlG+gH+s
	8tJ+UkrgikBApAlMKagkbT2CWYs6QTz+oPfsqImb6gQP51fMvPLbrzfWlkv6vaH/ah5f8EPCmHe
	1dUQrw5h8Bd4hCvlpzBLeZSSShpvTLZRyF4i2dx158C/Q1RpwmPzXEbK+S7xIhOQfCFnuM6Qnci
	omBPcvnjhbePxzAQCT5tfUnTbNB3B1DSc4nBPPIM0YzU1187nPj67QVX+e/69NMG
X-Received: by 2002:a05:693c:41d9:20b0:382:cef9:e354 with SMTP id 5a478bee46e88-385715183f6mr5374643eec.36.1795239542806;
        Fri, 20 Nov 2026 21:39:02 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm13340308eec.9.2026.11.20.21.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:39:02 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH 1/3] recipeutils: fix NameError for recipes with unreliable upstream checks
Date: Sat, 21 Nov 2026 14:38:44 +0900
Message-Id: <20261121053846.3614417-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 05:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250839
Content-Type: text/plain; charset="utf-8"

Since b1d01911fa ("lib/oe/reciputils.py: parallelize upstream version
checks") pn is no longer set in get_recipe_upgrade_status(), so a recipe
with UPSTREAM_CHECK_UNRELIABLE = "1" makes devtool check-upgrade-status
fail with:

  NameError: name 'pn' is not defined

Take the name from the recipe data instead.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 522537e0d9..9b3a2d0638 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1186,7 +1186,7 @@ def get_recipe_upgrade_status(recipes=None, stable_upgrade=False):
 
             unreliable = data.getVar('UPSTREAM_CHECK_UNRELIABLE')
             if unreliable == "1":
-                bb.note(" Skip package %s as upstream check unreliable" % pn)
+                bb.note(" Skip package %s as upstream check unreliable" % data.getVar('PN'))
                 continue
 
             data_copy = bb.data.init()
-- 
2.43.0

