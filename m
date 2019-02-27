Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 94BD57CB2A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:47:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w6so15717883wrs.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Qr1qyBl+wEjKA6/SF0EcJoVlAmP8iglqcObPPGsgpis=;
	b=L6zRO0UnNBfuOiOrvc8T3ctiPR12QFKMPCeW7d6gxLYINLyiW6ZYN8LiRxcIBdFFRY
	o4qbcZY9SyCfHzaErEEKAmDgg3JT6MeRL/03uBiAB49tA/wsCq83V295nckHrPhYSCNX
	AjxWVDNHLpGsH5LFY/v7U+izIQ3h6P1N60meo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Qr1qyBl+wEjKA6/SF0EcJoVlAmP8iglqcObPPGsgpis=;
	b=D20Gu+9I+Jubn2tab2SThn2k8uJM5133xyfxgBLNImlCxsbfxS373yzfBMmOKg1KjR
	M/v02Cq8I7JVWFzOebavirvps4fstMxCfdw/LebWGxlvCJHwstJB68Ea03oM8ewxrx0/
	NuM3KYQk3rgzjnkwtusIAag93cTtEqVqPHM23x425Z11D929fhxBBblN+OB1/PWLZC3e
	WqgZ+Tbhxt2KY0xrdRpS4VwRV2BcjzXjcoS+zc9/rDBIE5sNkDuiSKif4VAu0TyCCPMu
	N6j9hql2wcpIkSniVo/kEJ2oCIwUihmnrPT8T6IzchQk2YAAZZzbg8+5j2iGKvAmZsiH
	6k7A==
X-Gm-Message-State: APjAAAXHTv+oaaTSD1D1bUfE9wMsOZAkkco6jlcCxa9PFzRxxLkDvYZs
	waawmby0Ulv+y6TvjWHmvAIeTqQxsKY=
X-Google-Smtp-Source: APXvYqwkV5JBSKsKNlAdvnyjfdWKClKhffeU7br4Q+8AKIGr1MI5tg5ryywnl3en+R46DymGSJJLjQ==
X-Received: by 2002:adf:e647:: with SMTP id b7mr3293192wrn.260.1551289675042; 
	Wed, 27 Feb 2019 09:47:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l10sm28754659wrx.45.2019.02.27.09.47.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 09:47:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 17:47:46 +0000
Message-Id: <20190227174746.21127-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
References: <20190227174746.21127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] resulttool/report: Ensure ptest results are sorted
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
X-List-Received-Date: Wed, 27 Feb 2019 17:47:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/resulttool/template/test_report_full_text.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index 5081594cf27..590f35c7dd8 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -16,7 +16,7 @@ PTest Result Summary
 --------------------------------------------------------------------------------------------------------------
 {{ 'Recipe'.ljust(maxlen['ptest']) }} | {{ 'Passed'.ljust(maxlen['passed']) }} | {{ 'Failed'.ljust(maxlen['failed']) }} | {{ 'Skipped'.ljust(maxlen['skipped']) }} | {{ 'Time(s)'.ljust(10) }}
 --------------------------------------------------------------------------------------------------------------
-{% for ptest in ptests %}
+{% for ptest in ptests |sort %}
 {{ ptest.ljust(maxlen['ptest']) }} | {{ (ptests[ptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ptests[ptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ptests[ptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ptests[ptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-- 
2.20.1


