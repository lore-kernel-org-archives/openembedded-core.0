Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNDDh-0002v5-1d
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 02:05:33 +0200
Received: by pvc30 with SMTP id 30so1479835pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ckDsRHUeNz02/b/iNXwvSW6BZtLnfvHQuaqvlpjdDjA=;
	b=UC/vM8ymJZQ83nZOrGHhHlrnEzcxjJjBGUO55anBsBd5U0JZzb3YswU+ODXG7p8vVe
	FQUx61zY4FKTzoUA30XchG4tgCoP812LLrrA7Z+S2QqWtYBUXp66sGfwrIq6Mhr3Tv56
	F+OKhdnkUE1f94kjw0yprp5MYTd9q0dPNMTvY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BGS9H1viFRJf51PaPiOTU+HGqHngH5uI8fjn8zJPNh/ZAUw5t63f43ifwWzlYY1CRe
	ap9TwkH9BUFPW6l+ZZuDy5+BtM18JgvR2pdOfVzqomaGgmePTogwekIc5NFL2EaCCJXq
	ZLNClDqNlDq2chc5HYTQJ9oJg/tvx+M1bW16Y=
Received: by 10.68.7.167 with SMTP id k7mr5347064pba.238.1305849755910;
	Thu, 19 May 2011 17:02:35 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w1sm2072427pbf.1.2011.05.19.17.02.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 May 2011 17:02:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 May 2011 17:02:19 -0700
Message-Id: <2cc9510de67bbf735856adb033c2eb352ffedc04.1305849572.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305849572.git.raj.khem@gmail.com>
References: <cover.1305849572.git.raj.khem@gmail.com>
Subject: [PATCHv2 1/3] uclibc/site_config/funcs: getloadavg is unimplemented
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
X-List-Received-Date: Fri, 20 May 2011 00:05:33 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/site_config/funcs |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/site_config/funcs b/meta/recipes-core/uclibc/site_config/funcs
index ccc8539..79a3c19 100644
--- a/meta/recipes-core/uclibc/site_config/funcs
+++ b/meta/recipes-core/uclibc/site_config/funcs
@@ -121,7 +121,6 @@ gethostid
 gethostname
 getifaddrs
 getline
-getloadavg
 getmntent
 getmsg
 getnameinfo
-- 
1.7.4.1



