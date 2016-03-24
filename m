Return-Path: <akuster808@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7FA6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 14:06:35 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id o63so1713444ywe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 07:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I6xDjYjf/9JXJ7Gk0KxHBpcz3xErER6g7m4zzJhDnMs=;
	b=EchPJe6XkXDh3opfKjq9xulKb6kCvxBR3kErqVodUKC78Misa4+TvoT0nTR6pjzLUR
	0HEzRIvjxLB6UM+Kq39T8XnEN5+No04aDsS1/yISXhUacmUZjAl/ADWB/tJsXrS/NUfH
	3bCJT9TJslkC46jBzFTmzlbnB1PbmuzZcDrJJ0YU2slEhrZTHUPTfzEIIjJLPhQTM4BY
	sbdnRVIgrGaAjzgdnCaA5EVvWsVHISrStbmxLQFVvUfkpjpEmhl51sBWrQ6SItLL/L/6
	aBZbbKFHVQnOMARn17LDCW51nAtJAJOdSyaeH2dkR/ZEDrzlS1x3FeFeIRCWPGhnZsS0
	LqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I6xDjYjf/9JXJ7Gk0KxHBpcz3xErER6g7m4zzJhDnMs=;
	b=T+YIAy5Sac2fKjsHbm/GuN0oT2FzkEyJnSvyEkwKITCk1L+l0KmFB8jNy8NKFkaDW5
	AGdLNsbv06VnkpkIjf5DVUEf//IS6FEz5XXxExzinD88nH6CGNqodKx39VDSIIWOW1bR
	2CpUIhY7AH9GAJ6D8kx8TgIwy6QyQTV+IQ9+VnHgmYVqZVaRuDCGZbGtDB4kmyf8HiBm
	cka0y+zb20aWfg7Pi9BtPsjmRB5Tuka6SmQUSFDepc1z8S1w0RkndrtTLp6mPBaz3fZg
	YAeWlrk84rSOYfPr/XGsbEubU57Q0HwCi61S8XffhW/mo4dHy28hMYC5a6M/jpWm4P35
	7EvQ==
X-Gm-Message-State: AD7BkJKcBCcvkG/jJUMAbofNMbNb34jB3+uzl4f0oTsXhNxXTGWp/C5hd+BGokr5Oez2OA==
X-Received: by 10.37.8.5 with SMTP id 5mr3160733ybi.179.1458782516462;
	Wed, 23 Mar 2016 18:21:56 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	h68sm3123910ywd.42.2016.03.23.18.21.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 18:21:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 18:21:51 -0700
Message-Id: <1458782511-24274-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1458782511-24274-1-git-send-email-akuster808@gmail.com>
References: <1458782511-24274-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/2] tzdata: update to 2016c
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
X-List-Received-Date: Thu, 24 Mar 2016 14:06:37 -0000

From: Armin Kuster <akuster@mvista.com>

The 2016c release of the tz code and data is available. Its most urgent change is for Asia/Baku, where the update takes effect this weekend.

This release reflects the following changes, which were either circulated on the tz mailing list or are relatively minor technical or administrative changes:

Changes affecting future time stamps

Azerbaijan no longer observes DST.  (Thanks to Steffen Thorsen.)

Chile reverts from permanent to seasonal DST.  (Thanks to Juan
Correa for the heads-up, and to Tim Parenti for corrections.)
Guess that future transitions are August's and May's second
Saturdays at 24:00 mainland time.  Also, call the period from
2014-09-07 through 2016-05-14 daylight saving time instead of
standard time, as that seems more appropriate now.

Changes affecting past time stamps

Europe/Kaliningrad and Europe/Vilnius changed from +03/+04 to
+02/+03 on 1989-03-26, not 1991-03-31.  Europe/Volgograd changed
from +04/+05 to +03/+04 on 1988-03-27, not 1989-03-26.
(Thanks to Stepan Golosunov.)

Changes to commentary
Several updates and URLs for historical and proposed Russian changes.
(Thanks to Stepan Golosunov, Matt Johnson, and Alexander Krivenyshev.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/{tzdata_2016b.bb => tzdata_2016c.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/tzdata/{tzdata_2016b.bb => tzdata_2016c.bb} (98%)

diff --git a/meta/recipes-extended/tzdata/tzdata_2016b.bb b/meta/recipes-extended/tzdata/tzdata_2016c.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2016b.bb
rename to meta/recipes-extended/tzdata/tzdata_2016c.bb
index b9e386a..5eb85b7 100644
--- a/meta/recipes-extended/tzdata/tzdata_2016b.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2016c.bb
@@ -8,8 +8,8 @@ DEPENDS = "tzcode-native"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "f638ec0d4d7a17f001ce475860255c85"
-SRC_URI[tzdata.sha256sum] = "6392091d92556a32de488ea06a055c51bc46b7d8046c8a677f0ccfe286b3dbdc"
+SRC_URI[tzdata.md5sum] = "0330ccd16140d3b6438a18dae9b34b93"
+SRC_URI[tzdata.sha256sum] = "8700d981e6f2007ac037dabb5d2b12f390e8629bbc30e564bc21cf0c069a2d48"
 
 inherit allarch
 
-- 
2.3.5


