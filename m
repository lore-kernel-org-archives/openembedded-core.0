Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id C67C076EBF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 01:30:57 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id gc3so92710519obb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WXhmPExe8zYDtBfCzLd4Oo6AP7xG30y+8qsjO+vdwXo=;
	b=uRGKEM4eLpQqbWBeNISg61FNqQxit4kLTaqFm0RMp/fLTHuP1QfCZ8P99IlcxN7uaS
	KIgqzlULTg7S2pMbuBcOMtYB/yo4gTKnPXPXOYz6cwiZN8FXgTS5c8ByAOSAq4/vQfx/
	htJROpfXw0UVwqSAHh1/a0zgFSipNXE0u78RAgTO0+cHhDEQSeUL6lMNM/HQCr/JPpC8
	oDRgw6xRQDbAKAA1HADOgIkqiGOvZQJu8kjOMYebYGcs4S5gzHA1aFXjLPredzTyoCfm
	DCVWqJ/Rn7SSHlNGMsY5Jloh5KbP6bzfgK8DxMYRfjgjZy1dNlEIzd8zRBcoMu4UYI+B
	Q4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WXhmPExe8zYDtBfCzLd4Oo6AP7xG30y+8qsjO+vdwXo=;
	b=f8SXTzrIu23i5ETiwjTdYbHjvRdwKvhiKZA0TgoKnlzG6oSCk/U8pvC87mkYcwWKnl
	Yp/MpY4RFFICra2DyBDNL/tDsNJNGkxpYg4ZO5fUJUvtObEEW4TRPgJvUnqJsN64YaOL
	qAym3gBRi1WD57gbiyAjbhtXo35Ul/cywgHnvKt2VI2fTqLWfzBIZXn2x7fxG+HTv9/f
	ngjuX2is/PJuVYHZsVB9cdCFP0hm9kZq0LEqHwWwpR+GnWE1wNoMOO0tRYN2OmfjZROS
	dGsuAIloRWEPhF8d53Q6Aj4X5r000M1aAr8mR/bVziieD+DCuloClEvwLHauQv73HMFI
	Z5Eg==
X-Gm-Message-State: AG10YOSa6ynFLm6raOHdHbSVLJS4SHg9MTxwyR9kjjIjoj0MrO2rHdehXO5aIL73oyisvA==
X-Received: by 10.182.108.229 with SMTP id hn5mr9372301obb.75.1455845458048;
	Thu, 18 Feb 2016 17:30:58 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id wa8sm5566371obc.7.2016.02.18.17.30.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 17:30:56 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 17:30:48 -0800
Message-Id: <1455845451-25185-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/3] libsoup-2.4: cleanup + disable libsoup-gnome by default
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
X-List-Received-Date: Fri, 19 Feb 2016 01:30:58 -0000

v2: Prevent PACKAGECONFIG dependant package renaming

Andre McCurdy (3):
  libsoup-2.4: minor formatting improvements
  libsoup-2.4: prevent PACKAGECONFIG dependant package renaming
  libsoup-2.4: disable libsoup-gnome by default

 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 26 +++++++++++++---------
 1 file changed, 15 insertions(+), 11 deletions(-)

-- 
1.9.1


