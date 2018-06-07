Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4923C749DE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 11:49:00 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v131-v6so18377194wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 04:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=30yavgXjvsf8JU7trdcrYFc4u+JA0Lp5xK7Om5VZRTs=;
	b=tMdlNtAvXmOo5nH2nf2K24mR+WAawJWiNjDO4s9tgMVse+BhpU8xOfcDyBNU0/ab5L
	kYiCcj18srPhYOK4DLkzY9pVZX9eN5TopIc0CDXt+aB5RSo0VcBEnAjKPROSxC9j2ZLd
	CXhbi3g8p4p5kevxw4Ds02gOEh72hR4rljepCip0jWLr9P6QvHv0DG9zSXgVTbh5iwBa
	crahcP6ins5ksV4cWAX6MEkE7OjX1wxrI6/2eIuUpu525geQ+BzEqJwx4xynoT6brav6
	f1fbee4+qSyMd38hlQCmp4SOXmuffl/AS7lruYLIMJlL5vjh3hLr+zY40D50odTFhvwJ
	judQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=30yavgXjvsf8JU7trdcrYFc4u+JA0Lp5xK7Om5VZRTs=;
	b=EaplboysXTfspJo7kJrsEhzucnem6/OgADBfVnoh4zF4aAiTEUfAxoJsaPWcKyE461
	8yt6qQ8z1GSDM+BjefUfT5EYjXQ5brF8h8MXnzqnM0X/A3dDdI3AboOsCX8JuOfn/cjY
	ZilJG6V/eZQfNOCqd9Z9dgEvz5t+UkstlZYcwehT+jwgZR2tvx8NsRy7P2ifO0EbyPZL
	ZDK7NT1f8fT7tjVvRIm+liDgUYsyPpr/IKs+ayMD/oSIb6I/W44aXEF5j6ZxrCZ9nVOY
	9Ylugfo2IUYUo+lvNPiREVxlHxBowgwcchyJXPCWMXo5sI8HFGrzsgE9kk3aV6Exm9U/
	/zQw==
X-Gm-Message-State: APt69E3fWsT05MVtdsvcZfL5mmBYFhhLXlvyyKkJi/kdMSlS42mGsqkE
	gA/mLarGbZhS8gmIwMrOboI9w06P
X-Google-Smtp-Source: ADUXVKI1LvpYfJLNSeLganpf8yi2fimHRI3Gd8QiFDFB2jrHHtUzmJCuz2a1ynuGUYpPaf3cm6Zy7w==
X-Received: by 2002:a1c:c208:: with SMTP id s8-v6mr1441488wmf.29.1528372140693;
	Thu, 07 Jun 2018 04:49:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m185-v6sm1941506wma.36.2018.06.07.04.48.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 04:48:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 12:48:58 +0100
Message-Id: <20180607114858.22157-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] glib: add PACKAGECONFIG for libelf
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
X-List-Received-Date: Thu, 07 Jun 2018 11:49:00 -0000

gresource-tool has optional support for using libelf to extract resources from
ELF files, so add a PACKAGECONFIG in case someone wants this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index f645ed6f0cf..31b74362e36 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -39,8 +39,9 @@ PACKAGECONFIG ??= "system-pcre libmount"
 PACKAGECONFIG[system-pcre] = "--with-pcre=system,--with-pcre=internal,libpcre"
 PACKAGECONFIG[libmount] = "--enable-libmount,--disable-libmount,util-linux"
 PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog.xml, --disable-man, libxslt-native xmlto-native"
+PACKAGECONFIG[libelf] = "--enable-libelf,--disable-libelf,elfutils"
 
-CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
+CORECONF = "--disable-dtrace --disable-fam --disable-systemtap"
 
 PRINTF = "--enable-included-printf=no"
 PRINTF_darwin = "--enable-included-printf=yes"
-- 
2.11.0


