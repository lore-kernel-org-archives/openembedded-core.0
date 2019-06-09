Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0636A7D40F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:23 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id k187so3165725pga.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=t6wfBihgLNVIHBtDFpCrNCbebnpiLSWymr9mBbyzQLU=;
	b=fw4zwXkoBph7nVtpSU3SgtRKWC4bu9IesX2G+Iw+cvHQEyZCJaBlovIkDEeSGkCIrI
	eaTf8AspxgcLNEoS3nQcBw9EAwNagxsj02JjjPzjF4wNZDInxBvso3IaPsW/fI+DN9eg
	9RCqgDK9NYEzghwg1W1QzvTZvqxPCMJ3IFbyCFylr/uxpGDxMGtlJRM4PEtFqDLutfQe
	n8OjXHhrDG2Xt4wNouN8bnDjx0gplqbI50BNwuWRDVyPFsjDwgMap2bidNgESwpy2ABg
	pZ7Qu18PWLo6oisUzBwTTbWPT8fqkhgQbAeKXrzl1xKhzIfXGglrqzBGvoDEU3EpJMej
	4FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=t6wfBihgLNVIHBtDFpCrNCbebnpiLSWymr9mBbyzQLU=;
	b=RWPcBAShus1iCMpJkRwyYlP03qSq49/1DvCQw1M1FZHOlZEdSKKHUkDmVbQaa+xpZ/
	ABUG48TiWygrcvQMK2cEgKFQOC/C6ugY7yCwdZTItKd/tZCiNsTnFwVOje0bq8HZbJxI
	kNz/vv94H51TAjdFL8InW1GXuibiaVGTd4Dh7kTCVPnKOuVbhizzU5Q9KoFgRpwHngzp
	6xv51D0DOzoKGUwQzFExTHHGF5be+kuheei3EZyz3OkuuiX7Lie+51iTGf95cAZ6jbsl
	HnNOnjIGUkGnZX91LfbKBRP2vA3/Cy4U182Inx3bOhOtVv1WhaS2cTJp/73agtQEN0G0
	cMmw==
X-Gm-Message-State: APjAAAVB5M3tmQVsCDW54UDS/hQWnSP/2TdX5AEFv+mHwsK+nEkZcAQO
	zpOJCxm0jJJtoNWh3x72+dM57l9k
X-Google-Smtp-Source: APXvYqwtjk2Spn4u0GJ+7WbmPs632r5JCGcaBLSforVDCCjhW0iB5gCJu1NCne2vYHkgIqHEhsUZaw==
X-Received: by 2002:a17:90a:a10f:: with SMTP id
	s15mr16810510pjp.30.1560092064994; 
	Sun, 09 Jun 2019 07:54:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:56 -0700
Message-Id: <e714bc14210de2242b07682b55a300e48ba87de1.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 21/27] resulttool: Remove prints if no tests occur
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:24 -0000

From: Jon Mason <jdmason@kudzu.us>

Printing the lack of a test is not necessary (per feedback).  Remove
this from the template to quieten it.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/template/test_report_full_text.txt | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/resulttool/template/test_report_full_text.txt b/scripts/lib/resulttool/template/test_report_full_text.txt
index 6a5a081..17c99cb 100644
--- a/scripts/lib/resulttool/template/test_report_full_text.txt
+++ b/scripts/lib/resulttool/template/test_report_full_text.txt
@@ -22,13 +22,10 @@ Test Result Status Summary (Counts/Percentages sorted by testseries, ID)
 {{ ptest.ljust(maxlen['ptest']) }} | {{ (ptests[machine][ptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ptests[machine][ptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ptests[machine][ptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ptests[machine][ptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-{% else %}
-There was no ptest data for {{ machine }}
-{% endif %}
 
+{% endif %}
 {% endfor %}
 
-
 {% for machine in machines %}
 {% if ltptests[machine] %}
 ==============================================================================================================
@@ -41,13 +38,10 @@ There was no ptest data for {{ machine }}
 {{ ltptest.ljust(maxlen['ltptest']) }} | {{ (ltptests[machine][ltptest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltptests[machine][ltptest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltptests[machine][ltptest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltptests[machine][ltptest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-{% else %}
-There was no LTP Test data for {{ machine }}
-{% endif %}
 
+{% endif %}
 {% endfor %}
 
-
 {% for machine in machines %}
 {% if ltpposixtests[machine] %}
 ==============================================================================================================
@@ -60,10 +54,8 @@ There was no LTP Test data for {{ machine }}
 {{ ltpposixtest.ljust(maxlen['ltpposixtest']) }} | {{ (ltpposixtests[machine][ltpposixtest]['passed']|string).ljust(maxlen['passed']) }} | {{ (ltpposixtests[machine][ltpposixtest]['failed']|string).ljust(maxlen['failed']) }} | {{ (ltpposixtests[machine][ltpposixtest]['skipped']|string).ljust(maxlen['skipped']) }} | {{ (ltpposixtests[machine][ltpposixtest]['duration']|string) }}
 {% endfor %}
 --------------------------------------------------------------------------------------------------------------
-{% else %}
-There was no LTP Posix Test data for {{ machine }}
-{% endif %}
 
+{% endif %}
 {% endfor %}
 
 
-- 
2.7.4


