Return-Path: <kergoth@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5FED971DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 16:15:12 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p52so20728602wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ou7e+5EQPcKYsgF4MiqzBgQWlrTHfVzlOyS86y0YzFM=;
	b=rb+Xs1U59IalXwGACac3BlDOuhKDuSB2UfWTUDIn60nXnNMFaNQINkv4xHsY0OHk6i
	X3JpVwArjaBnPyP4tgSi6h5O6PaPWs9oppJj1DqTKkiueFRLCGGDFGEu6tw5l5OgaGA/
	ISg+hHNyaDH0v3AjHaIHjw5GsJpc46zAmiNtUR0WSRskk8mVLlHDlijLsLyWRomYD/h7
	uqalvrO3NVgGedjtdPX3FHK9g63yKoL8Ys6+Cy4J3/55d1RHGKFxuWbMApi3eXBA/imx
	Nfz1R8YEWzpU/NtH8TbKIgW10DG4nEB9y0EKNuRJncEWphE+e+g2een3NAxgN8QhZfRc
	+Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ou7e+5EQPcKYsgF4MiqzBgQWlrTHfVzlOyS86y0YzFM=;
	b=Z4tgKEWW5p5k9gCWQsFpQn4dcXu+ahMwiqQZ6hq0BRUPhKf5n5VP9dt79dDRKB1D9i
	WpKz8g8/LvuGlh3Ke270YPmgC0BGdAFZeZvnL+8O8r8DpzM9s4Xq3akpK/GrGDJlnCzn
	ordrIxkATikAjkA+UL4z34bdL3Ug/iXqaf04DgIF6vIeK2wz06EOlax6WqtPlGr5MpN1
	ohHmc4H5ckVpEBSAA19s3phdsx4yAUbxoDs4p3XIqDrvD3s4Z6mKIvaS/SzuyoMizgOv
	/ouNsMIYOIQLcgM/xB7upXZMKnIgj4N6oNsRQX9JnbwkEuBGvGH082tve2Wpmq3YrXF3
	KHqg==
X-Gm-Message-State: AFeK/H29nCH6eTCdwYcmMlwW4cx/M2/JVtd15DMF2tDWhQn2ETYg6ptwXiDLQjonqDwAFA==
X-Received: by 10.223.136.125 with SMTP id e58mr25027338wre.14.1490717713694; 
	Tue, 28 Mar 2017 09:15:13 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	a18sm5462946wrc.58.2017.03.28.09.15.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Mar 2017 09:15:11 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 21:14:53 +0500
Message-Id: <cover.1490717618.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] A few misc fixes Mentor is carrying
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
X-List-Received-Date: Tue, 28 Mar 2017 16:15:13 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit d68a86d87aa017dd0fecb0f626d22711efefcd3f:

  dnf: remove systemd units in nativesdk builds (2017-03-28 10:34:26 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core.git misc-fixes

for you to fetch changes up to 571fe26dcf1d704cc97e834b19adb51b782b4cca:

  systemd-boot: write startup.nsh (2017-03-28 21:12:18 +0500)

----------------------------------------------------------------
Abdur Rehman (1):
  update_gio_module_cache: fix host user contamination

Christopher Larson (2):
  sysroot-relativelinks: also consider links to dirs on the host
  systemd-boot: write startup.nsh

 meta/classes/systemd-boot.bbclass                   | 2 ++
 scripts/postinst-intercepts/update_gio_module_cache | 2 ++
 scripts/sysroot-relativelinks.py                    | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.11.1


