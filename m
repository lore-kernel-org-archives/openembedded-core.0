Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rdi6p-000233-7I
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 13:50:55 +0100
Received: by yenm12 with SMTP id m12so4959318yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 04:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ef2kSAyNPUtnqVnLPuoPwFQnL6FjvbGKvFxgeb0AsVU=;
	b=o0KD+uPG920h31P/tILKmUyJ0a7jT0P9HtkNKa7K0ZJNJdCUWqh4aYh2BBlkKdddTz
	f+4T+uay4USxEANgto4y28j64MbtnOngU2kc+2Cx/3CYINxmQVC7c3idcCcWr4lMCnMB
	BzdrymUXP5+UP8/w9WAx4Q07VZ4V93zMwLRjo=
Received: by 10.236.91.84 with SMTP id g60mr14861041yhf.90.1324557828388;
	Thu, 22 Dec 2011 04:43:48 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i32sm23456497anm.6.2011.12.22.04.43.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 04:43:47 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 12:43:22 +0000
Message-Id: <82c24fcf5703104de589d97607f63efa10634e40.1324557763.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324557763.git.otavio@ossystems.com.br>
References: <cover.1324557763.git.otavio@ossystems.com.br>
Subject: [PATCH v2 2/9] udev-extraconf: move mount.blacklist to udev-extraconf dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Dec 2011 12:50:55 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../udev/{files => udev-extraconf}/mount.blacklist |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/udev/{files => udev-extraconf}/mount.blacklist (100%)

diff --git a/meta/recipes-core/udev/files/mount.blacklist b/meta/recipes-core/udev/udev-extraconf/mount.blacklist
similarity index 100%
rename from meta/recipes-core/udev/files/mount.blacklist
rename to meta/recipes-core/udev/udev-extraconf/mount.blacklist
-- 
1.7.2.5



