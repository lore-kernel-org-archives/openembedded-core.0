Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1841E6EFA6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 21:41:17 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 131so29204234ykp.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2014 13:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=CFQcgYER3mDE0UrYz6RxFXM/4kXVDrlRXm06iajjtXg=;
	b=tt21XDrIVFqdaUyGdm05Ifj5IyTMyMeU5WopTLmbvEQ4dAxB5YCXy9qO4QtoG/9fih
	oVXB/iRd5TiUNLGxqnFUTXkqmT5l1d0/fBaI/uhkv/qgfIGw6UAUe2/eLVVUlSk1ANIy
	ZsrDmraVv+ecGYF4Ge2LDkIEUJ0WE/KGdLNNKJ2k0a3bdr5+bUG9VG4BKV2TIR80+vFM
	qSksBYQM9MOXToJoILBjWnorTh4A1bUurnmY9txXWdOsx6WegCQr+b4rntqvMCtqyVUo
	kPToG5PhA3hxQlspuJg4LTY9y5lA4zF2b33zVt/akW9JZbQFrU54tEHk9nTHwYf0vFLe
	Njmw==
X-Received: by 10.236.37.105 with SMTP id x69mr22052356yha.15.1392586877627;
	Sun, 16 Feb 2014 13:41:17 -0800 (PST)
Received: from localhost.localdomain ([201.53.197.242])
	by mx.google.com with ESMTPSA id n6sm41989930yha.20.2014.02.16.13.41.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Feb 2014 13:41:17 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2014 18:40:56 -0300
Message-Id: <1392586858-12205-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH v2 0/2] Add task to create kernel config fragments
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
X-List-Received-Date: Sun, 16 Feb 2014 21:41:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v2:
   - address Darren
      - task name, using diffconfig
      - except on failure
      - space after ','
      - printing the path to fragment

   - address RP's comments (import os)

Hi,

These patches add a new task called fragmentconfig which should be used
when the user need to extract a diff between two kernel config files.

For instance:

  bitbake -c menuconfig linux-yoco

  [do some changes and save]

  bitbake -c fragmentconfig linux-yocto

See the fragment.cfg in $WORKDIR/fragment.cfg

This closes [YOCTO #3862]

Thanks.

João Henrique Ferreira de Freitas (2):
  kernel-yocto: Add do_diffconfig task
  cml1.bbclass: Add diffconfig task to cml1

 meta/classes/cml1.bbclass         | 33 +++++++++++++++++++++++++++++++++
 meta/classes/kernel-yocto.bbclass |  2 ++
 2 files changed, 35 insertions(+)

-- 
1.8.3.2


