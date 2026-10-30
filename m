Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1332.1793318539502927286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 17:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EEuyB5xA;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so221651eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793318539; x=1793923339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=loNkY637PvT26JMXunvt94Ml7UDwcrOviV9R90oxiv0=;
        b=EEuyB5xAYrjr1tAUwyX0DlsASTcy4nJlLY66DR2ptcNksi69h/4MxS/o2sU677iSwL
         PYqGnu5vG7z+SCunm1ThYsf5AU96fQrMJqlhmdtdUKAsiuY5S30Gdxc/C17ev4ACtOZq
         ooiDVWO9F6wIhSZeCTUam8/JvBCzZvnee02aEmz2IlPakO3cQS5cqC46hse2MczF9yYm
         ucPQ9flHavwDuQygI0xFM4gIOoGym8pceFV1COShqAO1JqPu1FrGH1khH4ldLYayKoQP
         fC5skcy1Tj5dfZB96DwIAoVEfZTDcT6DEINF/49eIn+42bl50Rp6E/NYyqBNTzsdTt6+
         1fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793318539; x=1793923339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=loNkY637PvT26JMXunvt94Ml7UDwcrOviV9R90oxiv0=;
        b=XFO0GmFIEHvqPPyUnNbMVF8YnZls9vLJULPnvrFfKZl8pZhtiV8sfwuS6Xl/DPxhs5
         GM1dSkuZblzvJ+jE46kAPbH24yEVfnZdqjMYV2mZAi2Nenc3XGD2Tm89wnv0HPFjurAp
         jdDQ3FRKH6XM08j5pRMDRhhtAo4JK35lPu4XCqixW5DyhizOqj2avOkd7qp6VTASxnzk
         e2PsFra+Wg+aePqxBuiXz0OqaiPuq0daQ7faClc7VzgF54A2SkBXNOXdkjBfLEIa+SIJ
         I0iOWyK9ZMNj3Pj+GzdNxXXo2srznLrywkpVd/jWIcipkSKvUzEc3voobpjy+7dbfjMV
         3Udg==
X-Gm-Message-State: AFq9FYIOv9rF0F5DHLPtiEcgNcPmWwC9cMGrIr62RIAElK02IDlRRiza
	6qhSpVVsXXw6HMRt3K3M4vK5RcQ2GKIKS3xzg6V4p1NUo4p4ZjHbeB6ibu1bRHQv
X-Gm-Gg: AYBFou2Mn4C5kBwJ+wVRuB/B2C7WFulyEQC5M0/hqa4cskT3lU9E9yoKmF/7ZE5VE9b
	JZDBzsu4WRPxEAq/WI/InKUoUoNMu5oc/hUoXBS2H8DX5Avq7kHL3ipqidfmCs2QXv934jWGyAt
	6S1wbyUODCGERVTXkCBTTwfRkcSB26LSjzT0VcpQ2yvLpQV5/NlqZmRirdseDcKI9K0cPawhEbS
	EdTygZpywT74d0qvZIDfwnnrWjNA/TIc8fLWCtPDwZu3z44ESwQN3szMHpoCbYj2lJ3BUzLJ7aJ
	407ADn971due2O1JUycFQ3P8VqNxZi7fwv4gsDTjT/ikjsmdrJz2aVPFRhWX9MfKTuGz/OXcr9S
	/z3LcMuCed6Ku1ipLTuLkc/siSN47woT0MB3iXasNNcAlIzeC3qunq0OII/CjGLKT4nL6Bi2fPm
	OoTvUoYUwBMZWlJdNcQSjKYcW7hMmqEJ2RLgKfLoaVbq8QUGttc3ntTt4YW4w/14t4yxjzshkMo
	oBHRQWCu1zlImYkLB2FsRd4fTH1T7zIRER1HGdtsybd476i2fJwc4ck8jY0UA8ADQqYbGQKkNpN
	f/lfOEnYak0hS8Jtpjg+ang5pBqfVDr5NjXfl7kVdKxbnnGHdAtruX9KWf+QDpNR
X-Received: by 2002:a05:7300:d20f:b0:353:5d7a:cabe with SMTP id 5a478bee46e88-36a3002ea6amr5214450eec.13.1793318538643;
        Thu, 29 Oct 2026 17:02:18 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm2081904eec.29.2026.10.29.17.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:02:17 -0700 (PDT)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH] spdx_license: fix NameError in parse_match()
Date: Fri, 30 Oct 2026 09:01:57 +0900
Message-Id: <20261030000157.3211187-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 00:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248979
Content-Type: text/plain; charset="utf-8"

parse_match() calls tokenizer(), which does not exist, so every call
fails with:
  NameError: name 'tokenizer' is not defined. Did you mean: 'tokenize'?

Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---
 meta/lib/oe/spdx_license.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx_license.py b/meta/lib/oe/spdx_license.py
index 7369eca9ef..278710c60b 100644
--- a/meta/lib/oe/spdx_license.py
+++ b/meta/lib/oe/spdx_license.py
@@ -765,7 +765,7 @@ def parse(s, *, allow_unknown=False):
 
 def parse_match(s):
     try:
-        tokens = tokenizer(s)
+        tokens = tokenize(s)
         return create_ast(tokens)
     except ParseError as e:
         e.expression = s
-- 
2.34.1

