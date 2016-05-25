Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 083C760118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 20:31:48 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id ww4so78458205igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5HeSNV+zgcIQQdguH9b1Ww5Nj6bDanOwDg2ZvvonXYM=;
	b=ho8gYBoGQNNpjo0PvAZXbfnYtaVpW5FgAnabzbUKy3tII8jK92MXKs/va4VUpQ/iS6
	6pIqQhdSOKGkEvVe4ln9NizNgh5XsvPHLcQghm8eHjug/WS3aIy6ttoo7RT98PHYXxT8
	pYHL/q8vJ1R9J2veB7hjdvLMlL9dzWdcARckbCzqbOpxwACtK0NdOObHnTbCB8fga3JR
	CHgG3k0oO0EQbAokKMjLBd5SF+TeNpmGrx7JfY+pRa2JlS6GTsrffLlhfzF2VFQIfW05
	E9+AGlN+eHA0ZEgnAXQC5tXBnQwSK/OhaZwg6clzUSttp+LXwbWHCqHn5zdtWuWLHG5L
	V25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5HeSNV+zgcIQQdguH9b1Ww5Nj6bDanOwDg2ZvvonXYM=;
	b=VVK6hnobzM2XpScm1Otbb9fs9sNG970zOfr1ApGwpQBYrmOBUW5iPRCfjEjKhbGNVP
	fLorYE83TElosDesF3SLfrKdJG/O1vTPVMZxz6yt3Jk7xeJyggDBdoSbEhC0324rhqVt
	594PbffhLLzkk+m04asnJV8UN3MUDNdGODLy6pi2JK3KtIF7VsOFw1Q+zjcn8OOPAshN
	gjlrzKQ6u9T1LDtGQDo0BWL5i2I/rWMHQqlPmDmKXn0y6VIQO72uHTpkAAK2q9PH2PLR
	3/GZr/EOVp+6QC81+zjkrEUnMayQI5aJECwrXwRF/C4O1SDAAJzxM3a9q01mxA7U5pao
	t3hw==
X-Gm-Message-State: ALyK8tJrXH0/T6zs4iXZQlfcKRGtxNk/kD8FtNtqLZDcS+6NwVWhpJG+6ttVUPLNHK2HYA==
X-Received: by 10.50.104.165 with SMTP id gf5mr5518439igb.79.1464208309532;
	Wed, 25 May 2016 13:31:49 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id c65sm3406311iof.9.2016.05.25.13.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 May 2016 13:31:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 13:31:40 -0700
Message-Id: <cover.1464208170.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] Deploy startup.nsh for wic's bootimg-efi plugin
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
X-List-Received-Date: Wed, 25 May 2016 20:31:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

Currently, wic EFI images don't end up with startup.nsh, so the user has to
type in the correct bits into the EFI command-line, which isn't very
user-friendly. mkefidisk.sh in oe-core writes it for us, but we don't get it
for wic images.

Alter grub-efi.bbclass and gummiboot.bbclass to write it for the non-iso case,
not only iso, so wic can grab and use it, and alter wic's bootimg-efi plugin to
do so.

The following changes since commit bb4ead9b7b1400c37a72d148d9775bdf4210ec37:

  linux-yocto/4.4: integrate v4.4.11 (2016-05-25 07:49:55 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core yocto-9556
  https://github.com/kergoth/openembedded-core/tree/yocto-9556

Christopher Larson (3):
  grub-efi.bbclass: also write startup.nsh for non-iso
  gummiboot.bbclass: also write startup.nsh for non-iso
  wic: bootimg-efi: include startup.nsh if it's available

 meta/classes/grub-efi.bbclass                 | 2 ++
 meta/classes/gummiboot.bbclass                | 2 ++
 scripts/lib/wic/plugins/source/bootimg-efi.py | 5 +++++
 3 files changed, 9 insertions(+)

-- 
2.8.0


