Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rfzih-0007l1-SU
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 21:03:28 +0100
Received: by ghrr17 with SMTP id r17so5465014ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 11:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ef2kSAyNPUtnqVnLPuoPwFQnL6FjvbGKvFxgeb0AsVU=;
	b=eIzIXlAdfohaaFcdL7jp3TkiU/KNfBPEWbLPNORqDdI8pBqWiuCeUG3naZ3jCnF0XX
	R+/D7R4F6jscisQtkiVp6dXPvgveeAbNrGanmdTq4PgNuaEqwEAJZYbZMXIiV49A+EiB
	oiU1rDZHX2xYCLhLyDRpeumK1POqpQjQf6z+Q=
Received: by 10.236.116.129 with SMTP id g1mr44289506yhh.107.1325102169362;
	Wed, 28 Dec 2011 11:56:09 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m14sm9949232anh.11.2011.12.28.11.56.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Dec 2011 11:56:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Dec 2011 19:55:28 +0000
Message-Id: <43322937dedeba5cf76be04fece0318b39333cd3.1325101674.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325101673.git.otavio@ossystems.com.br>
References: <cover.1325101673.git.otavio@ossystems.com.br>
Subject: [PATCH 07/16] udev-extraconf: move mount.blacklist to udev-extraconf dir
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
X-List-Received-Date: Wed, 28 Dec 2011 20:03:29 -0000

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



