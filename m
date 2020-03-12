Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 59B0661C31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 07:50:02 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w3so2335362plz.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 00:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1TQgHyD9ezMsHTWRWBywUKGX4oWuE3kHBWV78tn68Yo=;
	b=UbAvwzZJj5GodGK+cRxda6SyXzXZGCgx0F1xo3wK54c99aK09+MBnSL/5g5m0urOoC
	oX5OCrJy18Pr3xhyjhO8mes3GTT8DWonyNdeXoO4UdJD+auEXzDgs8uLHs/tFHdWOIfM
	MUjw+kZuiNRZO57p9XJVHt3v0MvvjJfvlp14HJdVyz/8K/zPk2lGZK8WXIB3EBq9jswo
	qgFKkbhvWGZISDTSeN54SCBs0NR2Y1SLp736ITvgLPMPEiwnVASWnqu0SUMZE6eaHqGG
	DwREZNrkq4y4r/Gu0SYBb18aWDWnwoMdDZQ/8obpwqmVjEfAb0I94HEymODjLGxljd77
	gdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1TQgHyD9ezMsHTWRWBywUKGX4oWuE3kHBWV78tn68Yo=;
	b=Rh2sytu9NLS50kz+jEux7yNbh+t1rLXc9rvnFD4QDeWjG7RtvOlVwnNaOiboiQLFeX
	x62iatuaSgG861pqk2Dq7cOmatEeVJ6MrdPuOoM1pxQaTErgv+fyRCkZ7qHHg0lNSQus
	3Jpjzo1VhHVfCnYiJy3KOF/mOfFoJkvsW8Wk0nrYuHNPTxFnQdCMJRiR2FdEhMhOrBtT
	axno9JlGiP6vMZibOY5R3fKPfzukbFwWDlVB2zFSHg99AE1+PgnLP7aW0fn0hBXiMZSA
	IJAcl08GOcLHAIvYnUS6CjXqvXNgQXDQnA6cXzhTRCH3EYBVGxyDs3nNrkIXMxlvqFOh
	G1UQ==
X-Gm-Message-State: ANhLgQ2PxdtYhtcXUX2fM5ISZea4mxoTb/odfKHpa2FMuB3IaIoOxNjw
	BMx+qlMiv+txppmleOpt1VtyPB5Kq3E=
X-Google-Smtp-Source: ADFU+vtXQgwjc6Os1B3i41PHV/I+IOkXaZteUfpf1sKxCIOP+pg+lRBjShGOVQiIPJsgFXRHLasofw==
X-Received: by 2002:a17:902:8307:: with SMTP id
	bd7mr6670409plb.74.1583999402628; 
	Thu, 12 Mar 2020 00:50:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::94a8])
	by smtp.gmail.com with ESMTPSA id
	135sm3148832pfu.207.2020.03.12.00.50.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 00:50:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2020 00:50:14 -0700
Message-Id: <20200312075014.3313451-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/qemuarm64: Ignore logind: failed to get session seat
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
X-List-Received-Date: Thu, 12 Mar 2020 07:50:02 -0000
Content-Transfer-Encoding: 8bit

When booting weston images this error is seen commonly, but Qemu boots
the image fine, session seat error is thrown by libweston perhaps using
--seat option or setting XDG_SEAT variable in weston.ini could fix it

[YOCTO #13828]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 6444fe814c..cc4f5f8c78 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -131,6 +131,7 @@ ignore_errors = {
         '(EE) Server terminated with error (1). Closing log file.',
         'dmi: Firmware registration failed.',
         'irq: type mismatch, failed to map hwirq-27 for /intc',
+        'logind: failed to get session seat',
         ] + common_errors,
     'intel-core2-32' : [
         'ACPI: No _BQC method, cannot determine initial brightness',
-- 
2.25.1


