Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ4LP-0002Op-8Y
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:34:47 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so2538752yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 09:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5skXgj7dIOK6nhlpxmWpO/oOcFkAfXw22J+7wXaykUs=;
	b=r9u+Yy9i63weqAvaeYfqg5MzQLlm/OVeaqrtuCJQdY/hmSa4Ucd95bCS44S2BftADU
	c+ho8lJAvnvF0jvQCKGpg9UU/FcJoTNNQoBvSBHBYajAz+sbzkDar5qMcaGDi8LZ1jXl
	M6/6hJXLN26EO079mbfxXw/jTchgsKqpx6NCs=
Received: by 10.236.46.72 with SMTP id q48mr13664177yhb.80.1323451678379;
	Fri, 09 Dec 2011 09:27:58 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l11sm25562627anm.22.2011.12.09.09.27.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 09:27:57 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 17:27:34 +0000
Message-Id: <d3c1ab02085b878f512a900552d226b7831bb91a.1323451575.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
Subject: [PATCH 4/5] connman: move files from connman-0.75 to connman dir
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
X-List-Received-Date: Fri, 09 Dec 2011 17:34:47 -0000

This is being done in preparation to get newer version of connman into
OE-Core.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../add_xuser_dbus_permission.patch                |    0
 .../connman/{connman-0.75 => connman}/connman      |    0
 .../xtables_version.patch                          |    0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-connectivity/connman/{connman-0.75 => connman}/add_xuser_dbus_permission.patch (100%)
 rename meta/recipes-connectivity/connman/{connman-0.75 => connman}/connman (100%)
 rename meta/recipes-connectivity/connman/{connman-0.75 => connman}/xtables_version.patch (100%)

diff --git a/meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch
rename to meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
diff --git a/meta/recipes-connectivity/connman/connman-0.75/connman b/meta/recipes-connectivity/connman/connman/connman
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-0.75/connman
rename to meta/recipes-connectivity/connman/connman/connman
diff --git a/meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch b/meta/recipes-connectivity/connman/connman/xtables_version.patch
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-0.75/xtables_version.patch
rename to meta/recipes-connectivity/connman/connman/xtables_version.patch
-- 
1.7.2.5



