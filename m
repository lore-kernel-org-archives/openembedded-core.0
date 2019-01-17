Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id D51587C264
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:52 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id c19-v6so9141809lja.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ChajbooX7JrXx9dmx+XRc4tO7I62DdvuyeTlscRogYg=;
	b=LlzWruUucvQCt49BMxDvMkYRGBhl+JG5OQUnhZGQVaV9686xRS+1wAoUBJYiMIqRMA
	70yeXJHTrktxlTnpqjCeKgDkzn5kq3H/WnZnQHo9O7YbX2rX0ple929J9XnH5gh7cPZU
	e/M3Y5gGrW9oWP1y1F/HnTTCDD7U5VGXQt5aeYb3uT+d1ZMztl7QSGcS8AvvdO4ieBsm
	YrJC1cRD5Rs2186dWW5XxO6ge5ziJcRQ1dugaqEyVjoWkoIKe00iFo7WifkIAvv5ndIx
	eaR+dm4zrlI0b4f4grh+OAUL0xBZdBsWFkv45dlEjU/xbvJdaHWS8HuZuRRS0xscrzWH
	6INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ChajbooX7JrXx9dmx+XRc4tO7I62DdvuyeTlscRogYg=;
	b=st/BJOO+3+Uqs01xG6cw8WYFrdSRSXqvjo3kYkeH3q3P8WMRPWHjtwJewppdi135a6
	MrYcsHqtlrXo9lFXMeXMFlEX0NyRnsTbYa5EZqh8JCGziAVk9uREMmtEpzgFo438dv8j
	k2aEM/4G65VvMgUa8HUsU5LBpBBj8p4qpfm+/YV9SUcK4jHd3KJnPSTAb8TsqJAdqzHX
	b1bbDa2wV2yZ9wob7sIrGmerEKD3oJyQPmYgHv9oRpKJhhf443vwKH63/UDMq4HPEYBQ
	S0ET3hTvCOTk+iXF+aswgNCFul6TVcKUhuZUd0eUg3wpD8wbZNUiStAc/xV4dz+bt22m
	HGHg==
X-Gm-Message-State: AJcUukcBbwQVcnUxp0DXuExxTLvB9KmpJVJY+go7RE03UPci8wSQ9pYj
	h9XwCJpAtmOQiJH00UnvXIx4Ge+X
X-Google-Smtp-Source: ALg8bN5FEusviUCipwoKo8FcN2BJYzPwc84DGgkUbllRD2vmLnrfGRzjAH0xPjfSWBR12DoxqSedKA==
X-Received: by 2002:a2e:145a:: with SMTP id
	26-v6mr10165117lju.116.1547743253015; 
	Thu, 17 Jan 2019 08:40:53 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:10 +0100
Message-Id: <eddf5822c27d03d1656652d240ee741a0d980e5a.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 25/27] kmscobe: update to latest commit, switch over to meson
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:53 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 46aeeb01795..c6cb1842158 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,13 +6,13 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "9dcce71e603616ee7a54707e932f962cdf8fb20a"
+SRCREV = "d8da3dcfdfe33ee525cf562e928a5266ac69843c"
 SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git \
     file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig distro_features_check
+inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.17.1


