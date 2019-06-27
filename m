Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B29C7E957
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:16:14 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id i21so2778251ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 08:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=m+ZVYKT8exByIag/reJXqGp+olTLvfK9sRhkn+SITnU=;
	b=1YWd2ympBxiqwPcbZOBXq5EmrpqsZjNZcXJfiZGjwQee5Y71IUlLj2D/RvkyTZAjTs
	Z2knSTNkJo7fU8OlgpQiuKm35136GiHOwLTTwC9/+uzyBInneXosy1MzwD9hUrRuGU94
	LlvtXu/B8qs+c+p+zLkmZ1e2c8lwYN+bcVB71pIVYdOosIasr2s/ga4G+ev7xzSdPtD/
	DByZ40krQpZWflLGfNfBtn4J9t5d2YL7Vvvs3EGTIURgJB70AsUhzw2Vil2y/mZyBiqd
	kpBtF8SMGZ9e1sOMPzEj2/leci8hg2hybkKlRVXqbbTvO5CNwdxbtuxrLHVq7lrz6ZHr
	8iIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m+ZVYKT8exByIag/reJXqGp+olTLvfK9sRhkn+SITnU=;
	b=KzqstLqpaZYbOEmU8K7Ffhpdjw9nsitidb++IiFbAvsPAQfBw5jp0ucFLhsF2EQmiH
	reOr7bb/J92WFrMmgKsA7ARaTHqHBzVz+YOsGe8sHgD+VHdkgEz3EWxvWzzS0GGkVenu
	qNzdFsmzc5pimWkT0fxh6+WSKOl6HxfhjP+jXjt2ybIiuVyySiWj9um8kyrOBzjXEGF6
	ewohYzx6kaXsFsn/iTPULCkl8tY6HRauQaQjGDBp5oLHoWMEKQu8TRQF7I1OquRCXUic
	mGODaTQfmIkTsr8wZ8z8VDnDwQV8fogSNRRFEhVXvVOhUBIt1Km7imaNS47BTNF3UDvi
	isUg==
X-Gm-Message-State: APjAAAX1Qb8x9hJtzHs5mM+FGOWLzYrO35GGsEvZU3k/F5Ed1nqQheNy
	aKOofikc5ZjqLGWepQCVC35XkBkZVVE=
X-Google-Smtp-Source: APXvYqw6H5dUVWIEL9IFtkDN+4td9S8lg5ro2t+0182ieQFIEqiN6lR70wjycitUNqMsA9ntm0ZTOg==
X-Received: by 2002:a2e:8999:: with SMTP id c25mr2945181lji.169.1561648574287; 
	Thu, 27 Jun 2019 08:16:14 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id v86sm496978lje.74.2019.06.27.08.16.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 08:16:13 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 17:16:06 +0200
Message-Id: <20190627151606.1961-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] gawk: update to 5.0.1
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
X-List-Received-Date: Thu, 27 Jun 2019 15:16:14 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-extended/gawk/{gawk_5.0.0.bb => gawk_5.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk_5.0.0.bb => gawk_5.0.1.bb} (91%)

diff --git a/meta/recipes-extended/gawk/gawk_5.0.0.bb b/meta/recipes-extended/gawk/gawk_5.0.1.bb
similarity index 91%
rename from meta/recipes-extended/gawk/gawk_5.0.0.bb
rename to meta/recipes-extended/gawk/gawk_5.0.1.bb
index 578901355c..b3eb39e4ed 100644
--- a/meta/recipes-extended/gawk/gawk_5.0.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.0.1.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "45366249c13aae2bfb00e8e97c3f39b7"
-SRC_URI[sha256sum] = "2d686c9a5b7ba292bc3fa56bc84a1959d721a9d57970a76413156d4b8f1fc67d"
+SRC_URI[md5sum] = "c5441c73cc451764055ee65e9a4292bb"
+SRC_URI[sha256sum] = "625bf3718e25a84dc4486135d5cb5388174682362c70107fd13f21572f5603bb"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.17.1


