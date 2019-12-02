Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC137EC64
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:09 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q10so180700wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=RzIk/pAA70x5TLgtE/qy84B+uTBkEYXnSH5kriOJ5S299hRvviRnW4yOCZIAMbjSN4
	+yn3wjV8skBIEKU5HNbSsw7I5bQ5zyPvVOlNdYFHHBfuCYvP8+G4R3GWsfBGgRUee58N
	R75EBoLlF5zYV3W3vAp4wyuLkOvUjbOegLh5xyWRlBFuQQKvXiYIPMBM3sEnOQv0EP3c
	2Pq11jwfg1yznX+9CR6zy3ukmyKEPKSIaPeWWD0mEpbcgA2Tt35MTDAgtD8BIrfaFwwx
	VYECA1xKuUuEOmDUj++JUzBgV3dqe69qZQT0QhTkhf9AF663gr114qvYHsDTfmerchYY
	TXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fW08CZ6H42yYyPzH6elpLs1ChcahlbRV1hb8XGE3trc=;
	b=Z+qQxKoCZhR93zvwpLZ6dZuct+ABWxKuBOo7uy1VTChHLsMe7rTIw0TJxJjiXMpaUG
	oVW4DQcKC0P6rUUj1VyV+pGY9SaNM2QGTL3B2QmVhxT/Txrn2QvKwGsCSqpyM4RI+aSg
	4kCq2rnUHPFO14x95voE2gjhu/r5ssz4FdeLs78IoqR/M0aJhBLJ5fk3IewROqI1/sdV
	VLQYZ/RRPrw7Ye3a+y9g11aRZerMf+3/JXvTLAdpGb/IqqWNsmY1f+jl9QOfMeQnfHlq
	NB70TnDo0bFMNtehwUILy/rV0FJNGTqIsDLKcDGtYKBIcTo8En27QUKR6GzhyxzPA05u
	MhLQ==
X-Gm-Message-State: APjAAAWgm5RMm06rJnBYF29quKZEeTrEofn1F2dgnu1PAaZ+naSf2k99
	oji/TgR/47h5BCck+tVVXMha27tM
X-Google-Smtp-Source: APXvYqzy/klGNwC+uF4XsHoGCRfqPMfXf/pwO3D2ngAtPWtmHxjqDsMUL90/6O4nyobBia3zmTwsVg==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr78887wrv.259.1575309310036;
	Mon, 02 Dec 2019 09:55:10 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:47 +0100
Message-Id: <20191202175459.112655-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/18] psmisc: revert to default autopoint exclusion
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:09 -0000

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


