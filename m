Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A097760125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 21:02:13 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i138so19662502wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PGiiSBFmWe5ZIkARmxBeG+xSf0GguZubWyZUg0wtISU=;
	b=boKuizCAg0ExYCgIzz0MGt7wdYZHE2VInvPSaDdTTGsdMOozVHiASxkeU66nhYf8R2
	8UCeyvaMm5rnp6gUwN8fWQ6Kuv0gAJIPQ6TQ5q1lPVULNRdPW6UYTuuTGplupbXXR8IH
	vi8WZCbPgjy2aPNGGHqQ7gKQidtKVJe2ed8I7GhyCTOMRpA9rr30Jo/XE6NeQnA+8nlX
	l6SVdjCI/2DLRK19cdi/D1XPpEdJNwxl2d4Mi5ovVRSXU/Mw02SU9TUpVy55o5gRofR7
	uI0g7XWzLJlAZiZ70svZx8bokO1WquSr2xApN5hDauRtq6fwym6Rh2/iLE+lmJscL35d
	q5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PGiiSBFmWe5ZIkARmxBeG+xSf0GguZubWyZUg0wtISU=;
	b=T/c27te/sOwGQLe2dvZ6eCOvuowRUZ0Q+zfgmR19hW02c+6FQHdBlvIeEY4TqfDe4w
	rw0w1x4/ZWxqw2axCfFkC/UgjfEMUv77VawesvmzbspquwcigiuKMfc+mURzdeSb+2TV
	zyau6xQmJWoUZCdA3BfiV88Yr1dTROl8iw5McoxWNEwf6WWugJHaOl5iTwoeaN6fe/na
	3be9FfaqscamajoFNbz4smalobF4Znl6NFEHPVlmqXpDU9Hx6cekcdCm34i9Nx4j4rfZ
	LfiMenPOyt+HmfTAwvf2rlnuEl8BlRRVq3qMbX6i8c6bwghurmVtlsiSBHn8f/2qDXTp
	WeHw==
X-Gm-Message-State: AEkoousktuVAa5yPOkGUz1QCmy6FKIOCPTVC7g4b5xjr2JL1OxnIfsbgKV1BOFLBQphQvQ==
X-Received: by 10.28.35.193 with SMTP id j184mr22177122wmj.33.1471986134373;
	Tue, 23 Aug 2016 14:02:14 -0700 (PDT)
Received: from huvuddator.home (ip5f5bfeda.dynamic.kabel-deutschland.de.
	[95.91.254.218]) by smtp.gmail.com with ESMTPSA id
	v134sm29611957wmf.10.2016.08.23.14.02.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 14:02:13 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 23:02:07 +0200
Message-Id: <1471986128-8054-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v4 0/1] useradd.bbclass: Simplify target overrides
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
X-List-Received-Date: Tue, 23 Aug 2016 21:02:14 -0000

Changes since v3:

Add Signed-off-by line.

Changes since v2:

Like SYSROOTFUNC, USERADDSETSCENEDEPS needs to be set to "" for non-target
classes. Otherwise, "${USERADDSETSCENEDEPS}" will be kept unexpanded as is for
those.

Ulf Magnusson (1):
  useradd.bblass: Simplify target overrides

 meta/classes/useradd.bbclass | 32 +++++++++-----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

-- 
2.5.0


