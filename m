Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rd56G-0005DW-W6
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 20:11:45 +0100
Received: by ghrr17 with SMTP id r17so2568670ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2011 11:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ef2kSAyNPUtnqVnLPuoPwFQnL6FjvbGKvFxgeb0AsVU=;
	b=qfosLTmRy5N9Ya0NBOV+rEOKQCdNF8WQy+AuPaY4fvThJEoDdXyvmVz9qhsVF/o0b7
	RPm4mtaLygZAVS93nYo5TMFly+iwPEbUmRn/K8BwELKJcgj9ZgHw35/cMGTBDXdm0yS6
	mTP8bClcD3AhD88HWPhMNPWuJ7LGhEbbB7jgw=
Received: by 10.101.11.28 with SMTP id o28mr1795836ani.68.1324407880405;
	Tue, 20 Dec 2011 11:04:40 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o50sm4771379yhl.9.2011.12.20.11.04.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 11:04:39 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2011 19:04:08 +0000
Message-Id: <d11360fc41bef6bb30d8cfd54a554577f7e1c54e.1324407759.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1324407759.git.otavio@ossystems.com.br>
References: <cover.1324407759.git.otavio@ossystems.com.br>
Subject: [PATCH 2/9] udev-extraconf: move mount.blacklist to udev-extraconf dir
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
X-List-Received-Date: Tue, 20 Dec 2011 19:11:45 -0000

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



