Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2403E7D92C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j9so2895154wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=z1PS1DLsTyAmHiseO/+C18AzrnqssfES43OP/clgvpo=;
	b=qXq56nvrGUcfJShjCkuIsfa6+buN5SnCie5p+dtakGTWKyox/BAnOXif07w1OSLOzT
	uKsXQEYqfbR1SB0mn7r6g5APb1R4iOsVA6PjeWD99do0H9Xb+UqXBze1/ByDJtelRI5a
	K/dyjHLF4gkPJmU2WcSgagdp3sYK3rNzEFPEM2Wa/D2wsLQ7P+yhO8gLXuCes9/MU8KD
	kFvOhRsdr1yoWnh2njqYUznGXYwadWe4QSxSqf5caAKc9VlM8G43yXFlLpfpEd90SXUY
	EuAQQNR1TGa0L8p3OvaMp2Qn04mAP1DBmD3sX2QQWeSKGbgT54bzViIitsonDdvvYF9R
	hIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=z1PS1DLsTyAmHiseO/+C18AzrnqssfES43OP/clgvpo=;
	b=fuG3g2e4lt+R35IelLV+WgryvzvOj5jd4QuPx7pfi2L4oDOKzfro5qAHFBY6/EK82K
	lrx0j+I0pF0VLEgAY2uhJhw/3/a3vVZxzyHmfiXfCQyZzh0ZU87spcRWK8kkzyT/UZhk
	NNqBffGrmGwv/0OmIMhiUs1XFy3D/K1ryVtSeJuKtGba3rs+o0uDfrJRMMS6TLAOsZ+M
	iEYjPQHSaa5b5X48uvYIrjUdIzSv9msAAl9W7mE2lptjw90twPk8h6fdb2pJAG8LrZDG
	W9jeqUT2yS5qNpoez682yB4MEBbZsHxkDmfr6HzgLuBaYpboBJzh9WRdidftERGFJViy
	SYBw==
X-Gm-Message-State: APjAAAWeNAEounk3NpL3qAbrUaXm53RRKsLxyheINg53/DG0nepc60Px
	a/cGRgYAnIRozCWATbiz6B1R9Sy+6sY=
X-Google-Smtp-Source: APXvYqx9Le2YZbLnnxxFCEC1q3Ikeb5T7GtJlDRjYtktfHG9cu66XbFXEBjfSzexiui3mRXyJ1dh8w==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr27971485wru.186.1554901944825; 
	Wed, 10 Apr 2019 06:12:24 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:37 +0530
Message-Id: <1e5fba51f022a9320e72b6df753a02bfc1732af8.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 18/33] resulttool/manualexecution: Fixed step sorted by integer
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:24 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Currently the manual execution display step by sorting
the step as string, where steps were not being sorted
correctly when there are more than 9 steps.

Fixed the step sorting by sorting step as integer.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/manualexecution.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/manualexecution.py b/scripts/lib/resulttool/manualexecution.py
index 0783540..9a29b0b 100755
--- a/scripts/lib/resulttool/manualexecution.py
+++ b/scripts/lib/resulttool/manualexecution.py
@@ -85,7 +85,7 @@ class ManualTestRunner(object):
         print('------------------------------------------------------------------------')
         print('You have total ' + str(total_steps) + ' test steps to be executed.')
         print('------------------------------------------------------------------------\n')
-        for step in sorted((self.jdata[test_id]['test']['execution']).keys()):
+        for step, _ in sorted(self.jdata[test_id]['test']['execution'].items(), key=lambda x: int(x[0])):
             print('Step %s: ' % step + self.jdata[test_id]['test']['execution']['%s' % step]['action'])
             expected_output = self.jdata[test_id]['test']['execution']['%s' % step]['expected_results']
             if expected_output:
-- 
2.7.4


