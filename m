Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29809.1793868228426116418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=o32plq0O;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e3b22e971so802057f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868227; x=1794473027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9XzYjjHruDYXyJBM8oRizKnOumkOcERkhbmnioyGxCA=;
        b=o32plq0OYAuBclpKpPO7FBmMxW4zWFo/I4rMde4g90/n6UZO9YHAioI0nhM2DqIZhI
         WqElbwrikgELIc7wyv9Yf860jgq+j2KiMWHATvPLH2ulupBI2PPiXVGQa4r0Ts5zpGst
         dXcc5/q9ARhshftDSRgbzBRKmdNfsl9WeTyrz8O6TurCTJy5egfW2mcdOenCRhS3jPhe
         gWRvTcacwKUKdYJj7kapmZLr1D998fsnOBNPoS+PtZqLMNIsffmC74jsQt7z8rHXyOrD
         5EvFpJ20o+xL28eGvt8zekeLdelrIKFvlgk07LufzmoyvdIsy6fL6dEznHN8eF5XNtF6
         iz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868227; x=1794473027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9XzYjjHruDYXyJBM8oRizKnOumkOcERkhbmnioyGxCA=;
        b=ahHTeub6ku3Z8oke10I5R1nY0hdOP0BcrEGQCSEl0W4WN4BHEUp+RlUqwDFdRlmrQF
         GRkbV4wSJ9GmR0aaVqXWVHl3JUyirRgUiSM8qRMmUejJc1GpAftqsB61qle/Ec6FeCJq
         bS05fG6en9zfiPtTSgFlbZz5xVkSFmpgKP/aGETIDGEmKjPVmHjzMvcfCBuCPl3j7PV6
         VqrFCJQicu8jhRuZL+iCqu7z071+KBYzuoaXyfwUB7vJ9TfK50dQ6yLh8DFqpKeDkYPp
         in+0+OtLMPDt5iXjmqZ8iJBTweTxDLFEhaIvWGUKIQCHllXxIJmGSiMPd1uz015/dRJc
         DYFA==
X-Gm-Message-State: APuU4Z8Qo7cClbdKXm0WZ/As2MbJKlPs/DACt3pLKTSq43c9J5yqmQ06
	I4vYDMwrlwg9B+PLdJ/8adBJDxayGzgbSlwx8I/A/SBSC23VXzg8XZr+HV/gV24AgKOClHs9oH3
	wJ9nv4Pg=
X-Gm-Gg: AYBFou1TiZBlMZDZ373mQcMQ1rJMHvF/jwQmXc3C7YE3kWY9gRxTu2Sv4DagHebbNRH
	aYNmv0wluhgT9/WEqlTdlar+vLW2RESN/cd0w0taxRyRFrApnrrO4UXUpkqoLLf9BCrH4Xo7DU9
	hZ7UkHwf8P6QqgWP3UGxhO7lB68YcWtQNrMXKGq4oz56A/gO/+Vf0TCP86h51WO9VUj+uoxVUsL
	tB4uhsKQha7O/CEZrlWza7zykkAq0TGJOiaErLDaowpBOTrS75Rclomlr9HY+zCqbPyvGFhEi2d
	8mB6AORLIUOWft0bXalxaeW9mBOjmV3YkshXYJoeF1udobr1QrVI9QoFrx+HBGzORfR4RSKALSF
	fykusyD6ubc2LlThyJdK2U29pYaZIdD/vZE1WLH5RA6ac4H7v0xSkJf7pUd17aUU2XiDbzuBs2c
	qi/J8KG3z3Z2Ue2P14ISIY3YFLAhY5PVgGtAsRAv7N6ewyKrqbJ8H9yDQ0zGR8c6S785Myw2jJ7
	UX7THODSYXSCum164IwMsIZk0/rK8MAkrFMp1jG+uFiZ1JykkIHEqNReF5NNaPR4FnqNuTUIy8J
	L3UBHoxbJ2k5n9KHC6fB/BO8LFsK5KsHuxpS+/vvfL4UHAOCnoJv972OUH0vQDvG1u/vomfNzRh
	i2VV0B8h3f4iivS0NVAxXCB+u89QJT3TjE0TlwFNcSJ8hQVXZaA==
X-Received: by 2002:a5d:5e93:0:b0:48f:c415:df5 with SMTP id ffacd0b85a97d-48fc4150e9fmr8338848f8f.48.1793868226655;
        Thu, 05 Nov 2026 00:43:46 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 17/60] curl: fix CVE-2026-92389
Date: Thu,  5 Nov 2026 09:42:36 +0100
Message-ID: <c66a7149dd42992ec2b5f1f003443aebc63ae929.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249476
Content-Type: text/plain; charset="utf-8"

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-92389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92389

Upstream fix:
  https://github.com/curl/curl/commit/63dd390fab905a239a97e270

Tested with ptest:
Before: PASSED: 980, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 980, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-92389.patch            | 53 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92389.patch b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
new file mode 100644
index 00000000000..9bd685f3209
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
@@ -0,0 +1,53 @@
+From 83182969a364dac093c621990e4a140a7407e478 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 16 Sep 2026 23:46:44 +0200
+Subject: [PATCH] tftp: verify direction in a few places
+
+Closes #22974
+
+CVE: CVE-2026-92389
+Upstream-Status: Backport [https://github.com/curl/curl/commit/63dd390fab905a239a97e270]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/tftp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lib/tftp.c b/lib/tftp.c
+index d95da69dc3..b6d1cee601 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -366,6 +366,9 @@ static CURLcode tftp_tx(struct tftp_conn *state, tftp_event_t event)
+   char *bufptr;
+   bool eos;
+ 
++  if(!data->state.upload)
++    return CURLE_TFTP_ILLEGAL;
++
+   switch(event) {
+ 
+   case TFTP_EVENT_ACK:
+@@ -773,10 +776,14 @@ static CURLcode tftp_send_first(struct tftp_conn *state,
+     break;
+ 
+   case TFTP_EVENT_ACK: /* Connected for transmit */
++    if(!data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result = tftp_connect_for_tx(state, event);
+     break;
+ 
+   case TFTP_EVENT_DATA: /* Connected for receive */
++    if(data->state.upload)
++      return CURLE_TFTP_ILLEGAL;
+     result = tftp_connect_for_rx(state, event);
+     break;
+ 
+@@ -1077,6 +1084,8 @@ static CURLcode tftp_receive_packet(struct Curl_easy *data,
+ 
+     switch(state->event) {
+     case TFTP_EVENT_DATA:
++      if(data->state.upload)
++        return CURLE_TFTP_ILLEGAL;
+       /* Do not pass to the client empty or retransmitted packets */
+       if(state->rbytes > 4 &&
+          (NEXT_BLOCKNUM(state->block) == getrpacketblock(&state->rpacket))) {
diff --git a/meta/recipes-support/curl/curl_8.22.0.bb b/meta/recipes-support/curl/curl_8.22.0.bb
index 0d9596b1f37..95d5801ad55 100644
--- a/meta/recipes-support/curl/curl_8.22.0.bb
+++ b/meta/recipes-support/curl/curl_8.22.0.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://no-test-timeout.patch \
     file://CVE-2026-92388-1.patch \
     file://CVE-2026-92388-2.patch \
+    file://CVE-2026-92389.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
