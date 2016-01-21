Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8601B73243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:27 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id j3so1562776oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b+xgPHDUkK/f9qBjFTwcLjle6MZg1et1rd3FVY/6oCE=;
	b=mSAPResskQciY+TdAjxSiTOYPW2MJCKOaZd9S/odsnjGKX5U1qxVROv00CTsADtww0
	SXbYZi+WXrC8RXg71EeUQJqIEWRXD3B/YngeVjUx0Zl/6zsBIkkvY/5IKY+eCHvhQqml
	UYj16MdsNZrPPKxs+Gd2rz6FJwYDYAqzv8KKOfoQtcH8iigFE63+jlbze28tLdPXZhLM
	8n/Q6nGQ5w/blnkPQQYyc0FXcEHnN3LoZCfYMTsjT5VhKBZ/z/HecLDncCy16EsehDHM
	D7CvjQLbpfJXo/11bvIk0lZzX1hkNHzBswfGDQIhuKK7GzDCkzMEkR/elikRtAM3VNqJ
	WrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b+xgPHDUkK/f9qBjFTwcLjle6MZg1et1rd3FVY/6oCE=;
	b=NohH1GdjbD1Id6DZFlxKUq+DPdGszA9aihmJ7APmmNm76VVGDKrDyi+1kCKeXiOfiL
	SSC5XtGZFJzyqnX2NDo2trUht9wEfZuBh47LIEkW0HsPKNs7ZfibQD/Ohy66OD5H/X1f
	KzAlOVdEkUwh2pZ507VbRklst0spUtJ/iXKns0LoYZUbrMeh5a08k/0UfrEWH/BgRxwm
	dp2BrLk89uEj/EpzF+YF7rjN6gCn66m+TnmFtYx8/N4pVL/+yM4BQx4Ja3Xo65Wnyti7
	RSefkBMZJopwDve0UulrdFx2TCG8SjyKwUgeZCwPpqdu1oj+NKk33jrdaBAajtjn1bum
	sVtQ==
X-Gm-Message-State: ALoCoQmtMNxugSVA2F5oA7j49DcLP+iYGz+Hn+ArAOSP4dsnTKvDhHfIU7kGq3cwtjjg/dhp65hDcFqQe6oDq8Wmla6jdGdLfQ==
X-Received: by 10.202.212.68 with SMTP id l65mr29538580oig.66.1453354648052;
	Wed, 20 Jan 2016 21:37:28 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:27 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:30 -0800
Message-Id: <1453354610-19218-13-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 12/32] gstreamer1.0.inc: add missing glib-2.0-native dependency
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:28 -0000

Building gstreamer1.0 requires glib-mkenums.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index a08e226..218b4b3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
 LICENSE = "LGPLv2+"
 
-DEPENDS = "glib-2.0 libcap libxml2 bison-native flex-native"
+DEPENDS = "glib-2.0 glib-2.0-native libcap libxml2 bison-native flex-native"
 
 inherit autotools pkgconfig gettext upstream-version-is-even
 
-- 
1.9.1


