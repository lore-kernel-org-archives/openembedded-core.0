Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PyQOo-0001zq-C9
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Mar 2011 16:06:34 +0100
Received: by pzk35 with SMTP id 35so382175pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2011 07:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=2N9Zso/Z49T01lDrt+3g/lER6iBBjUYpOX05iDicHe0=;
	b=MR2HM9ftXt+IcbZKQQcyV2ni4GPd85VRK76xHqWg4OTtqqKYtJbBPsgdwHBGkOmBNE
	S4l1X9Uml0yky/aID5ZUTmjgna66O3/ZUJmIPW6R8fskms6aKK84hEBwnVAeFM/OwFaW
	+XSp0Y37drMwrSScAg77FzvU2df21ClAWKOsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=CJ69opMrX7UtKvkhHBpvJUAVyz9pyq9RaC7sGpoG36XRjvTfS09ROiJ+yxtba28qEp
	RBDa+38LqGnUGxwPqn6zQp36XKCXQktElkQq8fn8ls6S5T3ql+fFVsBP5Ux89ddy80+A
	yYiYm020p4j2nFVcOJZsQHcl6k2E7BWb4765U=
Received: by 10.143.86.8 with SMTP id o8mr31392wfl.360.1299942289838;
	Sat, 12 Mar 2011 07:04:49 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m10sm7059575wfl.11.2011.03.12.07.04.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 07:04:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat, 12 Mar 2011 07:04:46 -0800
Message-Id: <3e9d964302ac13ec786d8db41e114531e4f2f1e3.1299940883.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1299940883.git.raj.khem@gmail.com>
References: <cover.1299940883.git.raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/1] own-mirrors.bbclass: Bring own-mirrors.bbclass from oe commit 0ef914b250df46a41348479446214575668943fb
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
X-List-Received-Date: Sat, 12 Mar 2011 15:06:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

below is the history on this class. Documentation for newly introduced SOURCE_MIRROR_URL
is already present in oe-core

commit 0ef914b250df46a41348479446214575668943fb
Author: Eric BENARD <eric@eukrea.com>
Date:   Wed Nov 3 13:28:54 2010 +0000

    own-mirrors.bbclass: allow mirroring of scm fetched packages

    this way, it's possible to setup a local webserver (for example
    using busybox httpd -p "8081" -h backuped_download_dir) serving
    a presiously fetched download directory and to build wihout the
    need for an internet access

    this can also be used when connected to know to know which packages
    are missing from the local mirror's directory (and thus are fetched
    from internet as a fallback), it's possible to run the server this way :
    busybox httpd -p "8081" -h backuped_download_dir -vv -f | grep -B 1  response:404
    to get the name of the missing packages.

    Signed-off-by: Eric Bénard <eric@eukrea.com>
    Acked-by: Denys Dmytriyenko <denis@denix.org>
    Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
    Signed-off-by: Tom Rini <tom_rini@mentor.com>

commit 1b661974e3f8f844f6ec4cdb7bb42cef9595b626
Author: Marcin Juszkiewicz <hrw@openembedded.org>
Date:   Sat Mar 10 14:10:06 2007 +0000

    own-mirrors.bbclass: added class which can be used to set PREMIRRORS from config
    - SOURCE_MIRROR_URL is new variable which point to source mirror which will be
      used before fetching from original SRC_URI location.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/own-mirrors.bbclass |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/own-mirrors.bbclass

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
new file mode 100644
index 0000000..8a6feaf
--- /dev/null
+++ b/meta/classes/own-mirrors.bbclass
@@ -0,0 +1,12 @@
+PREMIRRORS() {
+cvs://.*/.*     ${SOURCE_MIRROR_URL}
+svn://.*/.*     ${SOURCE_MIRROR_URL}
+git://.*/.*     ${SOURCE_MIRROR_URL}
+hg://.*/.*      ${SOURCE_MIRROR_URL}
+bzr://.*/.*     ${SOURCE_MIRROR_URL}
+svk://.*/.*     ${SOURCE_MIRROR_URL}
+p4://.*/.*      ${SOURCE_MIRROR_URL}
+osc://.*/.*     ${SOURCE_MIRROR_URL}
+https?$://.*/.* ${SOURCE_MIRROR_URL}
+ftp://.*/.*     ${SOURCE_MIRROR_URL}
+}
-- 
1.7.4.1



