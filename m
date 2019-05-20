Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 97E367E024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:02 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id i3so13491266wml.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9qJ+JGxpyt8JIuNbhd2/eCpNqAty65P95pTt9Y/Qqc8=;
	b=EgW6SaozIbfkIQpCGuicF21EJ5GI7CplJ/5W3RGqf4GVpcmaWedtnQE1IT70JXFvBE
	GVZO8EYqB9AunwJplxgzEpHAkPrHRehbYVBWruFo1RIX6/iDdm5hrzJDy5jX3/Y9W18G
	DBZD2YlSLr8ZfTd+bX/96grsRdX6jjWvlmT9H/lfYuzJUlcGSJkH8l7dRKlFfAMshsNs
	VqF/y8QgsRjzHbfF8wL/0w/U1zD9yY/FmldfFEimngydfh2WsOHt5fmT54pIg37OSnqU
	p8RiglCik+QxNsGtey4UtXFWlyM/TChl5vQdzrgJc5OYHg77QOYMpUj/5CM9jMjgEa06
	gIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9qJ+JGxpyt8JIuNbhd2/eCpNqAty65P95pTt9Y/Qqc8=;
	b=uBiO7YfZp3c/Ds5i4mJHU8tFIahv6MgqvSQpGcSjQneblvwhV5kY8Ygz/J7+PYZ+BL
	W+rZeFC4vIffk63D4lbN8DRRAtyLIID0pAl49J0gEYxvQ+D4k9Odib6hCDC/FntBR+Rl
	Rqsqen6DuxLpl7c65INI4qdmIPrSs4b3j5X0uZPi4n0EHbwRpzIDnEn49aO6cuPSXDJ9
	GZLePTXaF2rjaQ2s5UrmxF3OEl1FeV1iPRNqgwJWa5MmjcwRspXcPsA37gCyrTzHgXbV
	d0EEoe9ehAGvIaKahFeCnWt6pjgJX+1MnIvCdOfYyP000wjXkOQFjhi8mOyaIsb4Qqqw
	fWhA==
X-Gm-Message-State: APjAAAWW5GraluNZw0pF5497nDvb6GffM+VzxgLfUP6xJLe8lOHaPU4y
	bclqA9F8tci6oEL6/5tNF3d5MHAA
X-Google-Smtp-Source: APXvYqwpiI5pPFQDWT/a13FT8plqpRK50Pw0tX/0PeVsKEL6/ndPyXUR0mD225EJWQaOkkJ2+weGlw==
X-Received: by 2002:a1c:a615:: with SMTP id p21mr36639707wme.40.1558361522854; 
	Mon, 20 May 2019 07:12:02 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:14 +0200
Message-Id: <20190520141125.10805-31-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 31/42] bash-completion: upgrade 2.8 -> 2.9
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
X-List-Received-Date: Mon, 20 May 2019 14:12:03 -0000

Delete the deletion of files, as they are no longer included in bash-completion
(util-linux provides them).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{bash-completion_2.8.bb => bash-completion_2.9.bb}   | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.8.bb => bash-completion_2.9.bb} (78%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.8.bb b/meta/recipes-support/bash-completion/bash-completion_2.9.bb
similarity index 78%
rename from meta/recipes-support/bash-completion/bash-completion_2.8.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.9.bb
index 85064343e30..cd2c4cbba80 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.8.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.9.bb
@@ -9,8 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://github.com/scop/bash-completion/releases/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "201b6ae62f7d5fb5b1b25e34427db919"
-SRC_URI[sha256sum] = "c01f5570f5698a0dda8dc9cfb2a83744daa1ec54758373a6e349bd903375f54d"
+SRC_URI[md5sum] = "60139333b25c4d54ad40323b701be130"
+SRC_URI[sha256sum] = "d48fe378e731062f479c5f8802ffa9d3c40a275a19e6e0f6f6cc4b90fa12b2f5"
 UPSTREAM_CHECK_REGEX = "bash-completion-(?P<pver>(?!2008).+)\.tar"
 UPSTREAM_CHECK_URI = "https://github.com/scop/bash-completion/releases"
 
@@ -23,11 +23,6 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/bash_completion.d/
 	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
 
-	# Delete files already provided by util-linux
-	local i
-	for i in mount umount; do
-		rm ${D}${datadir}/${BPN}/completions/$i
-	done
 }
 
 RDEPENDS_${PN} = "bash"
-- 
2.17.1


