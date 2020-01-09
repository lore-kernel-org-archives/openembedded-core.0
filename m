Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id EDCD77FD96
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:32 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w15so8856511wru.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RuOefZCOSTdJtMezyaZCklibRll4ECvPheWqhGOljks=;
	b=jI+lP1n7v4dd54OrJ1nvOu6hODq1gWTWm2XzVh+YENVHns/Xr+MjCZB2LhqqI6iYd5
	BhZ8gAysTso5Yg2E+vAEGrztMLAXZXtv1oeSBI3nHQteI7YvFXdBq1DwGvkwehXydPpE
	FOfXGBdhRmJTo0w2GUS7m4bFKlFnfvceRfRC/RR+bKDwslLS0nHx55nSxUW+KoEBRwe/
	fSSW/oYAZd1+sOF2FsbOpklNE+IZeFAmP7ZRaTYv3JQUUI0spRgkNJw+nfdvAWvQjoXI
	u9yr4ra8mcyhn2JWaOUVVZTZN16DpaGhw2o6s2IPQjabLPHY7GRgKd1noiqUfKZ1U4yU
	WZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RuOefZCOSTdJtMezyaZCklibRll4ECvPheWqhGOljks=;
	b=QogumW4bwQ4S84AVvSiPBsbKwFQESygbbig2WqbLLjfUpCwhK14vqrtd9IU1gqEhQq
	wO1KmSZVaJkEFR3hxXY5+2YDaFUhSRRLWB+Z8cRLJc7Sao5MoWUP0Jfh3Be9+y4LM0JB
	l9ZjcWmTl9KmcB17AUPlSlH4Iog9dqQKsTv2/sgJ4GlpqcdIVOE02vY6ptpUddYoUTyj
	hQZ5yHEzzQ1K0OE4tBwaCqqmuOLQf1Rz+ZKfWFodMpdS8fhOPaLz78gNh5kyLK5phTAY
	A9mp7dirOwvyN76qWzRdXvlWw5VPQDmkx6s3eYYsUoOJb/8fxQaCHDVFUMnUrZj3+YM9
	CRZw==
X-Gm-Message-State: APjAAAU7H38Ecgq5QjPL49892mmr1T2KMr4jsik0vGIpTD+AF3jrW3CM
	Y2r+NX4Jw5obvyKrwjb5Cn/TD7/KB/s=
X-Google-Smtp-Source: APXvYqxGY6IyDgHCUMOi6ryAw7HHetP+BHW3UOP/Yo9k4g2P7FpxwoM0bBwTOH0fEZzYJVNxt9YYXA==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr12676071wru.154.1578601592521; 
	Thu, 09 Jan 2020 12:26:32 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:12 +0100
Message-Id: <20200109202623.28936-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 00/11] Make MIME work on desktops
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On fresh images file-browsers do not know how to open files and usually open a
dialog with ALL applications available on the machine. This is not what users
are used to when working with linux: For just one application installed per
Mime-Type, the application is opened automatically.

To get a working MIME on desktop it needs two 'databases' on target:

1. Mime-Types: This is handled by mime.bbclass and creates database in
   /usr/share/mime/mime.cache.
2. Mime associations: A simple text-list of pairs Mime-Type <-> application
   in /usr/share/applications/mimeinfo.cache
   
This patch series updates/implements/enhances both parts to get images work as
expected.

@Khem: This series creates many QA warnings for layers in meta-openembedded and
a patch series fixing many was prepared [1]. Once this series get's applied (or
you ask for it) I can send them out.

[1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2020-01

Andreas Müller (11):
  itstool: add from meta-oe
  itstool: extend to nativesdk
  shared-mime-info: upgrade 1.10 -> 1.15
  bitbake.conf: add variables 'mimedir' and 'desktopdir'
  mime.bbclass: rework
  insane.bbclass: introduce a warning for mime missing in inherit
  shared-mime-info: add mime to inherit
  gcr: add mime to inherit
  mime-xdg.bbclass: initial add
  insane.bbclass: Spawn warning for missing mime-xdg in inherit
  gcr: add mime-xdg to inherit

 meta/classes/insane.bbclass                   | 30 +++++++++
 meta/classes/mime-xdg.bbclass                 | 62 +++++++++++++++++++
 meta/classes/mime.bbclass                     | 60 +++++++++---------
 meta/conf/bitbake.conf                        |  4 +-
 meta/recipes-gnome/gcr/gcr_3.34.0.bb          |  2 +-
 ...-build-time-hardcoded-python-binary-.patch | 35 +++++++++++
 ...ld-time-hardcoded-python-binary-path.patch | 29 +++++++++
 meta/recipes-support/itstool/itstool_2.0.6.bb | 21 +++++++
 .../shared-mime-info/install-data-hook.patch  | 25 --------
 .../shared-mime-info/parallelmake.patch       | 33 ----------
 .../shared-mime-info/shared-mime-info_1.10.bb |  7 ---
 ...mime-info.inc => shared-mime-info_1.15.bb} |  8 ++-
 .../update_desktop_database                   |  8 +++
 .../postinst-intercepts/update_mime_database  |  9 +++
 14 files changed, 234 insertions(+), 99 deletions(-)
 create mode 100644 meta/classes/mime-xdg.bbclass
 create mode 100644 meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
 create mode 100644 meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-python-binary-path.patch
 create mode 100644 meta/recipes-support/itstool/itstool_2.0.6.bb
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/parallelmake.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_1.10.bb
 rename meta/recipes-support/shared-mime-info/{shared-mime-info.inc => shared-mime-info_1.15.bb} (69%)
 create mode 100644 scripts/postinst-intercepts/update_desktop_database
 create mode 100644 scripts/postinst-intercepts/update_mime_database

-- 
2.21.0


