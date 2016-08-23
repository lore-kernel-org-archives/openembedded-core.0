Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CAA9160125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 20:57:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so19697894wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l5POTWy+8nJhh7CDREUrstmt4aLV4rlxN5d13GlfZAk=;
	b=yPqFbxoCUtgH52gT7EmWOo/JKXsJVjVHxzTMpzRldAAsVjZGuMiNYny7poFO1cO2q8
	ZMjAmFlu+iDCUHKigUbXdGUBZcq88xhBtnafKNPnpTR0zdQPaMP0A+2SyBk4Yge21cL9
	Gc9YaVeAGCvHrJQjt1pxtUZFqJIg5HG9fKLipI02iII7UX/osSDRp84tEKv8DhS8t7bL
	bKSj6MrxNcAZ3XmjjdVTS0LtVC+NHZLxyxbmHVBxxCaA4hfuUoaj4mTMbRdFepw/h5JT
	FSUZ9d6nSNVk+9YaokJa7/ekCWQLzuf+PdisTgPrkYskJwBWTNzVymjvyZLqSq5bOgLn
	OvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=l5POTWy+8nJhh7CDREUrstmt4aLV4rlxN5d13GlfZAk=;
	b=a7fHp2enqVjBTxcb2BIVRZwe9AdD1wFnZ7+i6DMHla5DdT872XCWsthW/5SHFup3hx
	GIsWErm0Kroo3FBI3qKqDqvXQk5EXq8db1KFblHq1jSZ3S1uZ3cPA/tK66u5EVjYd33g
	DoLKWbyDxVt5pYBjc5+3oPaZvA7euqQ/V9ujQeSmWiVkvpJXNRDqHAL0R992SEGQX37v
	IdBRo6036MMsnpepGL1RJyjY+7zdJc+71zoiYiI+S1f2l0yxOrf616tVImquZsdk+Any
	AWNiOcFyKSk5LHye7DytmuAFEN5XpecsB0XbWwcsY7Zs5vSuPMjdnL6lJrSzqx1D4FQc
	tQ9w==
X-Gm-Message-State: AEkoouv+cwDTiK6MjXNMWqtZHr9wt6xpT5yqsWeCmpN+T/pKvztYdkFnqp+fo4cXRFycJg==
X-Received: by 10.28.60.136 with SMTP id j130mr23086698wma.93.1471985831108;
	Tue, 23 Aug 2016 13:57:11 -0700 (PDT)
Received: from huvuddator.home (ip5f5bfeda.dynamic.kabel-deutschland.de.
	[95.91.254.218]) by smtp.gmail.com with ESMTPSA id
	vv2sm5845325wjc.29.2016.08.23.13.57.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 13:57:10 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 22:57:04 +0200
Message-Id: <1471985825-7723-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v3 0/1] useradd.bbclass: Simplify target overrides
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
X-List-Received-Date: Tue, 23 Aug 2016 20:57:12 -0000

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


