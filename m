Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id B43426BE2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 06:37:56 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z11so5499605wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 23:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NQo4PZ8o3ne15+WHG2EmFr3+TPM8L54Aug9PLichEgE=;
	b=NEffHjhR1gw73FxCIjP0qWrCwowvcheuMH3+e2JF8Yc46mFFF7DJ6sEw58qaQ2Yjn0
	d4exAPFbZjrU9+HxvPsZV5BzXRKHFyR+K/qRDGBzZZ1TaGjLZwYrp/6UtsS0osBpgJE9
	NbKpTkhbqYsg8z1v4JdAS9ZiK1c6hdT43yOKk6BBbrm/ea8zt0JBKLIXZQmfwgsQw/3x
	X+zeADJnewq8czFWv8UiYJ17O5UN3F2l5TmYcnyylSXcYf/AguQt3TlOGSeqOC2Mgalc
	HcVqw6TkWwMBa433bhSuA6e/dEAjKNkFES8eT8WEHfTwCrZsQnQzDhQukMRi6tQ9T7pO
	CEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NQo4PZ8o3ne15+WHG2EmFr3+TPM8L54Aug9PLichEgE=;
	b=k3tmYCTv8u4/M7xb3ecjvZnfrtwIFkLyjd1+3fJeUjRAxn0YTGvAigktq6mKHxh6vY
	vGCBR1TIn4pvNaYtYDaHCXkoHDyxScbdKRMuGiPiYQIF2I97JmrjiD4LJeQeeDCAvhnn
	FY/H2QiA9EEvzGvvIfYzaxDNNM9hrhISdJXs632rjzpr56Xftf5u7o80kPfjvyyKcuN5
	YskFZ/ved0fji8fTMg4iG4V1fqZT3sgRNms26aTWMQBXPmGbWcaRRh+1ficFIRC/TlSB
	Ykcd5XdfzqW+KEqgYQJncsn9pyw05LxqQYgFNbF14PjZ08L3GefeZMnSL/GgzY8v6tOO
	kwJw==
X-Gm-Message-State: APjAAAXHBHnPZEajGR+YvwKpEOKpo720G7rogICvAGymqldlrzR+snmc
	MX9a0icAKuwcP7YIcFDlKh/qgwtA
X-Google-Smtp-Source: APXvYqw9btW8QMJG81iERQG4CqzHRdisvOhqZt3WxkK2e9q/UhRFtSnltmToFJ19og45JUTFWNAzVQ==
X-Received: by 2002:a1c:be0e:: with SMTP id o14mr6585032wmf.118.1554446277322; 
	Thu, 04 Apr 2019 23:37:57 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	g132sm1185443wme.3.2019.04.04.23.37.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Apr 2019 23:37:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 08:37:33 +0200
Message-Id: <20190405063736.29750-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190405063736.29750-1-schnitzeltony@gmail.com>
References: <20190405063736.29750-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/13] atk: use gobject-introspection.bbclass on/off mechanism
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
X-List-Received-Date: Fri, 05 Apr 2019 06:37:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-support/atk/atk_2.30.0.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-support/atk/atk_2.30.0.bb b/meta/recipes-support/atk/atk_2.30.0.bb
index 4e2dacbc4d..84fdb1510a 100644
--- a/meta/recipes-support/atk/atk_2.30.0.bb
+++ b/meta/recipes-support/atk/atk_2.30.0.bb
@@ -17,14 +17,6 @@ inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 GTKDOC_ENABLE_FLAG = "-Ddocs=true"
 GTKDOC_DISABLE_FLAG = "-Ddocs=false"
 
-GI_ENABLE_FLAG = "-Dintrospection=true"
-GI_DISABLE_FLAG = "-Dintrospection=false"
-
-EXTRA_OEMESON_append_class-nativesdk = " ${GI_DISABLE_FLAG}"
-
-EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
-                                                                                       '${GI_DISABLE_FLAG}', d)} "
-
 EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
                                                                                      '${GTKDOC_DISABLE_FLAG}', d)} "
 
-- 
2.20.1


