Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9218A7F9AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:12:13 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id w15so4184402wru.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=SRfcNotKjeAHPCrCMdT+uLl6VVDF80Yxztu+1LS0WZCNgsLTqYvDjURJlaVYUelg1H
	3DfwqUUx7CR02LonoPnOKkhvPzRzobHlQgxVrktc2H6lj6PGJclowo9UxpgLveyzI6hn
	jmsehikcfVJvQejaUBGulHlzBjcPpjpOs4VxFQjz7CUqxxl+j8Y7i0ou4xfcFsC65Noc
	Js5AD4v0E9sVaPGoFR1ICxbm8fPrn3bG/uGfs4cDkYJfM8GZ+2+7VEAz2jzTTFXWYcQ7
	vFmEQzq8B/Pdf5RAIo0jya0wO3jAtn8FFwtFTmCmL/wDzxssI9qLcOwaojeeTBkH92hF
	6BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=otna+PwMnW3pBXqVdii3KcG2lJ2arvgFb0D9GDS1fl/zDS4TwKaGdGXOH/AK2I0uj8
	AVKgeRu5IlFeJCy4q9ja5QTGgwQ5B+5VUA1Lnliy38vDzUmKyZU6i6HaJTTZHGRVFRQz
	hvbSZtMJ8+pjIPay5gBe/wmDWnAw32RN0o4AXcJeyEAAq8iGD//xxFx8kKhXUj1JwWwO
	WdikXLSeFNbNl3/u/5TI6SXSJcHVBr4o0GT01uavu38qNzeH3HPgXFyQ9e+ZJnVevaXc
	U00NBXCT5RZrGNFyXENtw9rncbvC8VRY0Tdb6gfaXFwGM9cE7cXKWHlT2Ch57Ivoc/DY
	iSwQ==
X-Gm-Message-State: APjAAAUyA/PNI1ZeNWzlKC253OltwgtnfqCr4w11pHGNDKF6oxsr8cnp
	wF8zAdQfHo6O0sgJmZq9OP6VJzRq
X-Google-Smtp-Source: APXvYqyIcwyTPmg2RMNuoc6VsIYk9rx9GByEtsoWITCwjzUm5+Zj8xmJWnW84HmHBeLEO9dgEJpOvA==
X-Received: by 2002:adf:ec89:: with SMTP id z9mr54287299wrn.153.1575033133670; 
	Fri, 29 Nov 2019 05:12:13 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v17sm637224wrt.91.2019.11.29.05.12.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 05:12:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 14:11:45 +0100
Message-Id: <20191129131152.128311-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129131152.128311-1-alex.kanavin@gmail.com>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/15] psmisc: revert to default autopoint exclusion
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
X-List-Received-Date: Fri, 29 Nov 2019 13:12:14 -0000

Otherwise, builds break with latest gettext.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/psmisc/psmisc.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 594a10cf222..a75b04702c3 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -19,7 +19,6 @@ inherit autotools gettext
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they 
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext 
 # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
-EXTRA_AUTORECONF_remove = "--exclude=autopoint"
 do_configure_prepend() {
     ( cd ${S} && po/update-potfiles )
 }
-- 
2.17.1


