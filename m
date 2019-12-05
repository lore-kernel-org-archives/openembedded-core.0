Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA857F829
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id c20so2740562wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=HQkJqT7N//JFm1bYqvhc+ENycJ4anTVbH7HiqeCRwq6c6WI/lct/8yl0wVge7z3Pt1
	SxFp1EKjPFUEwt/n98wXqaxJ4jJ9NrXnidlE8JxZ2OppWp7YpRkuOgJNXl9Ou7ChfBLO
	XY4kxY+t4D/gUFnbKUALlrIoLx7DRYLy3h0YcXYLof3AGqXx/sJv/oyZOIJdHmRgnwJU
	x1ya0flkZEoaJOH31w2lpHaW5aA7iKzD9gWwV6SphXn/NEHib46SAaOEVn6GtIKAr30e
	zv2CvNbPoRUsjnvQB9CJAtnIsC9/EWTLHEFbfd95LM2T0uH9SRyrJa7PtTZi0GRqLNa3
	3YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=od4zIP4RzVnsyUnmcEysv6Gh2poiEjl7eQUCO6RzUQOIt3a91ngs+v5YbEI6t5105m
	JSG/Jf9WQXWCMowf/A0tyiaft/ESSU3TjElif+sppAPtvN2bXT3wOv4wlbkP3uRZgsi3
	FVBA/MxIyvdgkpKJ+M3kNJU31UKctLMFy7Wfqn0uYFktOvRcflZyzUY0dyHBhpUPUCKh
	4ndqIzZgEyKvwvzjd+MfqiHqtKWBX2GpAoY8cPhye8hXn1npGVqM+HAg9uXzl3j/pPxk
	fuSB9umQDdKxsBFQae/bGA2yjtyuYdiVKt1aNuRa8fq3FjUsDzDva9Yb1To0JvFLJ9AH
	/KEg==
X-Gm-Message-State: APjAAAWWefbxVQFNEZILd1yAg5qOEoSctCV5or9xzdv5jSWB0CIe7poE
	x4PrkTub2JFVbtDH9WZu+k0Hqm/n
X-Google-Smtp-Source: APXvYqz4dZtGDAwZy6iWnxbpmxblLI74YPHRHxB+MONabHESPwI2yt+auNVFq+KkPhPF+haqVSMwJw==
X-Received: by 2002:a1c:7d93:: with SMTP id y141mr6032431wmc.111.1575560647657;
	Thu, 05 Dec 2019 07:44:07 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:37 +0100
Message-Id: <20191205154357.121346-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/24] psmisc: revert to default autopoint exclusion
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:07 -0000

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


