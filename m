Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2093.1794939640552323724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=i/BxDBo3;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1375685e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939639; x=1795544439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Axv5gXxRn+GhnzIJ8Sa7DgnZ6sFO0aUZT18Y0NKRjo=;
        b=i/BxDBo3Nuf5CTu+G5u8Icv8XWLOnO5cqz2KhgSkymqrBVdqqJRMPAWZF9e4RzLZ/R
         r1nqwTL4PG71+aKVSyt5ZP74t1HxwbW6RSTzQFYrEXgpcL33sjKBqX71Co9FPOXEhF6W
         50MMU1D0IunjjtDx/O97xGOhbnhVm5TWHvlpJQIV8v3R0g0S7Dzz1A/ZsCkYvsT2eFJZ
         88mqSdsrhdqeh2QTwcGOMlG4/azOgEJPvPezXaGNprfrRVCveI3Bd3rmzkK0Oex5fAYe
         XGRJ7sGsGn5xqVM6q/frBikJ07l1eCFllhGLQdZDDob6DvscAtZlLwKjBQbo5UujL8jX
         BaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939639; x=1795544439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Axv5gXxRn+GhnzIJ8Sa7DgnZ6sFO0aUZT18Y0NKRjo=;
        b=r1nPG1AEh8qlknK3uJg84TtXyNjlHm9IBQpXgJFQ/dbqBB17ld5/kZGbmzlgVP+IbO
         sDlTGhlWV1Wz0t8uam3HoZP29AWTE4+wHWfOn+WlC0zasrOEvuSzJl3tdJ06zt2UpSok
         9JwqCGb3UDoaII1o7F2L54C3BlWH68WVO6gLXIAox8nLXQkz1OwWpyqe87s2JsX5NGo6
         qCccsO+qmTd8dIVBUeIB5n8YdDK1kUg6c3l7kJ6LigbyriBP0rMdY5p+GqgtgzJTtHhX
         XQ0yYr4NiRFPRDUOIoP2cpKm1LtrZeM9n+twAFh+Mn+dyySGdl+q5ZZ27oCBXvUlK9SR
         xXjQ==
X-Gm-Message-State: APuU4Z+B/+l3d8/QpL19IY+SJF56BpJ92Ns0+1SWoXegkGhnPj3PFHpa
	pQC/ZhlxDZ00LXCy0N9EGh1rAIz2K6d5IdQfmGulkPSO97xraZWYJfGRQlw5xBkbzYpZpszZuGu
	hsqGWoxs=
X-Gm-Gg: AYBFou3n+F4KeDpPCTW944v1hw9zGtWySZe9uZmeB+AAtIbZx8b2Xxn0p1rilTPJ3Wv
	Z6YXmI5ypKRYHPhU+e5pXWatZOJjgrqPVroLK4zBodKusHWGgDAnvum6azngtSCrofdIzOAdvfo
	ykDJMbm5VUdHUH3ZdWF6AFUPX612gbwBfn+Ih9c/A8dErcTiwyf7AISmfkwOuUmoc21T8Cv41kB
	zmpGOAbR3HhZJe1ct0ClYIGb4rl3cH3HEKroY+U8Vr/zK0qb4WIEZKoBXgjB9rZa15E9QiOv4J/
	x/LTpe2H3tUfydYNoRrP3FGJDGqamDMwTir5n+RcpWtjF3k3yHmIskFYRBxkWZAnLYFiw3tWc34
	ti950qrzyRglEZFGsm+wInaZnXsjwRtsuaAy2D0OfxZ/ptz8zMq36N0aDVuuRGgOyEhTysbjEXY
	P/d39jg92w+PGX894m1KUZwadkDQiHqHNgcZxF/lSNHcsCft0ZqTSMMAUMv7vIOU7sfMRNIzbI1
	HNbvt/XDkehl9RlLNyUwyiyCWvwy+fY3zNM2ku98C00TglibXBqs9gG/6aHn6fL6HQSjg3wBWKI
	3zt0MDqXeiTARq2zh7Cc1DOMy+bflMjUFqbicsDv27FCTwRH7vc2Q6lEu7ME7xXtEgWcpPsO+ln
	041fItc3IEAfm5sbAfSjaZKiAyUJT
X-Received: by 2002:a05:600c:5395:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4bb55a95d09mr301752865e9.15.1794939638723;
        Tue, 17 Nov 2026 10:20:38 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:38 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/17] curl: fix CVE-2026-92389
Date: Tue, 17 Nov 2026 19:20:09 +0100
Message-ID: <d9d7a4890fe547684238b3ea99ac29286df4c999.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794939400.git.yoann.congal@smile.fr>
References: <cover.1794939400.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250476
Content-Type: text/plain; charset="utf-8"

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-92389.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-92389

Upstream fix:
  https://github.com/curl/curl/commit/63dd390fab905a239a97e270

Tested with ptest:
Before: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0
After: PASSED: 1006, FAILED: 0, SKIPPED: 0, ABORTED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-92389.patch            | 53 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-92389.patch b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
new file mode 100644
index 00000000000..012b746e0cb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-92389.patch
@@ -0,0 +1,53 @@
+From f39da43ecdf06680a851ab00f3cace9ce8b90afb Mon Sep 17 00:00:00 2001
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
+index cc0769bbb3..fca77b71cc 100644
+--- a/lib/tftp.c
++++ b/lib/tftp.c
+@@ -361,6 +361,9 @@ static CURLcode tftp_tx(struct tftp_conn *state, tftp_event_t event)
+   char *bufptr;
+   bool eos;
+ 
++  if(!data->state.upload)
++    return CURLE_TFTP_ILLEGAL;
++
+   switch(event) {
+ 
+   case TFTP_EVENT_ACK:
+@@ -768,10 +771,14 @@ static CURLcode tftp_send_first(struct tftp_conn *state,
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
+@@ -1074,6 +1081,8 @@ static CURLcode tftp_receive_packet(struct Curl_easy *data,
+ 
+     switch(state->event) {
+     case TFTP_EVENT_DATA:
++      if(data->state.upload)
++        return CURLE_TFTP_ILLEGAL;
+       /* Do not pass to the client empty or retransmitted packets */
+       if(state->rbytes > 4 &&
+          (NEXT_BLOCKNUM(state->block) == getrpacketblock(&state->rpacket))) {
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 744c5ed0ab1..8f1caebb973 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-87864.patch \
            file://CVE-2026-92388-1.patch \
            file://CVE-2026-92388-2.patch \
+           file://CVE-2026-92389.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
