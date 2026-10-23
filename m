Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4319.1792752108875754755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=X9iHQmCp;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JC4LjaU0;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 198BD1400130
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:41:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 23 Oct 2026 06:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792752108; x=1792838508; bh=zr
	orlqQ3TM26V9qjv2q9Kw7nFcHHgOkBpC7t9+tL0es=; b=X9iHQmCp6iGU9FMP6C
	daQ6QooCsOSrFY/QWC1CEaYWj5m0ZBriGAuAyUejQBKuOs1IAi0A3t4zhZCNNIax
	blvmxxE2mEWyr+7danGpOSNLx5zw/Xz+eGS3b7wPMDFbFvbVjFWnt0bRL4FHiJR+
	TONU08a+DCM5uXc24/5snWSp50t3GoWCkQE/BaJF9Y5kaefxlO4KSnyQo/AfEnNP
	lEiz6pn7H+5OlgRQAVL2O1ao8u8ARw462vQSZutwxNqIgnzB2NmF750sBrnnj/6m
	S2uXAu4Au//QCD9bnfj9uKZQC5MOFJ/g4rMkT/T8sNLIF5IGxnduxQrtdscPpiIg
	XCYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792752108; x=1792838508; bh=zrorlqQ3TM26V9qjv2q9Kw7nFcHH
	gOkBpC7t9+tL0es=; b=JC4LjaU00JmcOWzfOLmBY1+i3MoGBDy/rv4IZUe1oxt7
	plBQOaiPBuLo2wEluqoXnaIhgXRIkqNGtRd21ftNyHEbvS+embk9O3tV9wwYQBdw
	2BhBHcDGldhEg/gXOawMW2XdfSoxalXTDBT6LMZ23ct/lDZK851oe070/bw+DOXz
	CXXBO682/N/r/CiE1alAghqtupa3RrHJccd7bYkeYnXWheQs7eMVSdkpiHQPZkb1
	UFY+sbc+Bog8Bnxfbt5aJzjPHCwU3WVRAJDX40QVpT8Op82S5c5pW7tFxAQ3xzea
	x1JminD3FddXFA9owBaqCFh3MZaGXg8RxHqlBRuuYw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752108; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:o7Mn8GhNK/KHQUiSO9X7arWuWth+tsHBiMd/yMCi2iQeX/G
	jg5uYLOa3UugYnZFyb8DjoZ3+wi81X2eRqlVIr68wjhW8W9YOtsH+cHy1rqg3JHd
	jKDRtjaMWtsuEqLuAIiibfxYFHtQEKStlV7mMv/HNi3by5KThs5hZ0kVrLyLJF0p
	I7iVwFSLtxlCkHY/nHyT3Rto0lAKsGTeGSWZuQFHzV+GHExhlfEntW6R90whFeW+
	6EZ/D+Au1GmtmWdDQSBXM4Cv1VyZX5hV9pxZz10UktWAtx4XbyV1CaOsFaf1au6K
	cGubpt3CkHWz9nrTmH9qdojITwZycMsFW1HONcg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:vJmv/yT5HzAwSQAzseqDNdMIDPRRhp7p7ctu8WVWf0Q=:gwCsowAHA3Gq1CFcCV1M/Wow2adm/KzV8b76fxPy5hM=;
X-ME-Sender: <xms:6znbatMC8kBxIhtVE8JomlttzqFmZ-K99NxAKtjcT2OzxxfNDdDnwA>
    <xme:6znbal9lrIIcHHp1u3m7_XN-h1CxEG3km2kNjjyd00v-ry0T8METmnayZJSte8fJb
    KeDpQfKqYvRW46lYEABeSDaz_VVipZAVIwds_1eltlCrkXFRT4c>
X-ME-Received: <xmr:6znbap55V5BTYsE5HErXnyon6HePglZ0w1OElChNJA3Hmlsfn7NikgsWGhaDN6NNaggvMN3a-au44iJsVVYu2Pi0-rO2aO0>
X-ME-Proxy-Cause: dmFkZTFbInH34FpdZGd7ZYhpDGchiqJA/sUC+lFeOZgyhflFrQCDv7UPEjeP11BWRRx6ve
    PvR48kCJTGVPQs0kDYZHZLwXBkQrRgQi8075+1moWzO3eGNwlI9x6VvE3GP8mn0V1Sk0aL
    srk+p6t1KCCwcROVowd3E8wyKxgTWVF55vHN71xgTyEDNQY4/8f5K7JpeIk+n/CyrgsVaT
    liy1uqBWtW5SJvf9Dojyv5eSDL+c3T7Q1L8yClaxyXYoLLqcSpGxgVOHO79bWRV60T3xx8
    hNtSRoDST93HbMZm34ziM/SlZQ/3YoKn6PU+526Apc+tgwLzQE7qhXS9m4wzv9Ojwwo+Jr
    6RKRZmjFFsehjPUEOQVgmuWzhjCM5n53m7uC9h1vp9F9keKLQtcJXUXe9Hr1ec7xDBK9QY
    C66IdCxpaThrLrP+fC9he+nsQYxFTwTELdwdOzriFYu1zOleQQm77KGmZgwbwWfBwin6G4
    PkP8F2b2HxoPaar6WKFquNWH1sMBJQO2FWB8FLJIIHRMddkPOZfp/HqDXggqo41RI6V9RZ
    04TkpJDSO88Wq8eMMvt9QYSRDXt72NgjOww484OxpVJ7r1+jJaSssi3xTCElMU708BAvkj
    QS3Zm92KhMIPCHNCPzkBZ22mt+osxnRx55u8byhFaF62OCfGi49NzKJvFnzg
X-ME-Proxy: <xmx:6znbak0FBVa9QCNmi1Z-wpyzaygk7kFvwGunpiH8ttVrN3CH2pOWmQ>
    <xmx:7DnbaoDtqLWxFIAVheVHXf49-GXNZt9uFO9GnvARV5Ytlw2cXZjvXQ>
    <xmx:7Dnbau0K5q1ytQJEVsGgd0pFQXJQiGXr6FNBjLltaMtuQxbhDm535A>
    <xmx:7DnbaqtH1Cw7dZ8_rHFf0c4HmMgFfNkogsqysJnbDhLmz2jOqmYRHg>
    <xmx:7Dnbasz1Q73TZY_u5FCuU1EQjNMVeOkTJ9jrgteKHL8Jg6pcfFmQkrr5>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 06:41:47 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:41:45 +0100
Subject: [PATCH scarthgap] b4-config: Add configuration for scarthgap
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-b4-scarthgap-v1-1-6a85c3fec09e@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAOk522oC/z2MQQqEMBAEvyJ9NmASWdCviIeYjDoeVDIqgvj3z
 SrsseiuuiAUmQR1diHSwcLLnEDnGfzo5oEUh8QwhfnowljVlUq8i9s4uFVZ7YO1rjdlqJCUNVL
 P55Nr8L+hfSfZu4n89svhvr9fy8LJewAAAA==
X-Change-ID: 20261023-b4-scarthgap-31cd33af24d9
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752106; l=642;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=gwCsowAHA3Gq1CFcCV1M/Wow2adm/KzV8b76fxPy5hM=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgb0Vqctax2Je4prVzpw40cxKw46VpF7yPbs6mIN64sc4AAAAhAKSr+VA92UlBnv
 80YOYdxDWWJJ5b5R0Xx56tXFNnF1bH
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248516

This should simplify sending patches for scarthgap using `b4`.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .b4-config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 000000000000..5876a9f2691d
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,4 @@
+[b4]
+  send-series-to = openembedded-core@lists.openembedded.org
+  prep-pre-flight-checks = disable-needs-auto-to-cc, disable-needs-checking
+  send-prefixes = scarthgap

---
base-commit: c9b000059a37241c5b97426f0aadc012b13bd20f
change-id: 20261023-b4-scarthgap-31cd33af24d9

Best regards,
--  
Paul Barker

