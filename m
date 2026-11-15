Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4383.1794732567458296412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CbuNLnEb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso857610f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732566; x=1795337366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1fY9ot6KSxVNPoeXaV4C/9xVHe0Ou/9GKlo61/g2LsQ=;
        b=CbuNLnEb0TfvTgGL/bpTl+UnYDFyK++2VgJis3v1J9DSoJd0w1deu4rBq20RH5tvKU
         7aeFaMuvO331qyzKwzSYvsRvFlcRlSL99dNaUBlI95g0p1ASOXLVD/sby6ak72T2wPsy
         MO9MO4haJZCZyTN7DqB2GsQzx+p5tzCcp1G3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732566; x=1795337366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1fY9ot6KSxVNPoeXaV4C/9xVHe0Ou/9GKlo61/g2LsQ=;
        b=f2v57VwThJ0cq/pAQdr61oRth5+xXk0RGasCrs5xslW85gU0AdAc2+EL7tYDs0oEox
         GVBeY96mWACoeIERLHSrS3mq1X5EU1cOuQ91BWFfzEN0iulmUNyCtpLOxSCp4RG7omhJ
         i3kYCo9UUKbifUP7Yi8lciKkr1Kr+ELHInIcHZuejEksR9HnSQGdMu+PjxhtdMQ1ygBI
         /pK4eiAPGpbad1JgsNMhO7wDo4Db8wXYoCs6cCbTpytosaLvGFBXEIRa7w8fAYZtGTGH
         bKxMJjvANtlerEAVQQDpIYFYUglvpasrR7fC2+V2dMsH2kea/HtR7+rIOuHSJQol4xgd
         9Peg==
X-Gm-Message-State: APuU4Z9zVIcpj/TA4KjIjAqmv2bLSQy9y4cyVG+T/vcpvQh1yjDFzQlq
	gLO0+Ydx9tIq/EdWMZOAqqInIi3tjPR32ebOIQC+otWPdZWAuzXJwNgTyhUAoXihyWGAAOibs2d
	4mIGpFrk=
X-Gm-Gg: AYBFou0HRi2xUldX5Xv20PFylYY2tljrKGs0176xLsGO81PGRTzB2HG8n4lP+sXJWcz
	vBQWbSlzPCXAyjDP7eAUAv70+LAJF+pb4ApXrSbgumZiWYBt50aLEWYy7a4StNqdMw8QU9utvVL
	OgEZueXnf8iEGwD1fDzFjs41OlvqVVzYyPPYOWqS1PjhcUzGz0oXS7RdmoEifGL8lRPh6xgFTze
	SP4dg6niNvLaiDf/Fkhf3dQlraMj3qqciH+mMCKBDSXHQGOi46JR95wBaeicV2LYHwK8+Quk8F6
	kSgXlLCM/oFwrqeeAnruZHDfnqhOgHLqoAOl2ihEGaasiCpSNRP5QRu2wfDauORBbC0P0elfDru
	NvDARH8CKIEiu1HU3f5NwzUu2N3liKYDiFR3ZkSSudrYyxBsffl+vQ1aRqJTwAt4MeagVMcoXeA
	rH4Xw0ZxYxsEk0Z518zTCB2TAnzox1SX8cG6/IX6gloUaPxxZH50CsIaSjjCGhRPLodusMQ6pcf
	p84wARvRxrO8gCiZ94KCnAOiWatzEHz7iPec8cazakjd9oFBU/xtQBVWzYgkY01PgDX7xhbTVSR
	DE5naCdbFCn0cBvNlpobPvyUW9lgpxvDPKP6W8R5OsMSgDnOFhpEH0RB4g==
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr17443711f8f.30.1794732565786;
        Sun, 15 Nov 2026 00:49:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/41] oeqa/selftest/oelib/buildhistory: Fix variable removal in commit_vars()
Date: Sun, 15 Nov 2026 08:48:26 +0000
Message-ID: <20261115084845.701136-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250254
Content-Type: text/plain; charset="utf-8"

The loop over to_remove popped the undefined name 'x' rather than the
loop variable so passing to_remove would raise a NameError. No current
caller passes it but fix it so the helper works as intended.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 042ccdd2b48..dbc8f9346fa 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -45,7 +45,7 @@ class TestBlobParsing(OESelftestTestCase):
             return
 
         for k in to_remove:
-            self.var_map.pop(x,None)
+            self.var_map.pop(k, None)
         for k in to_add:
             self.var_map[k] = to_add[k]
 
