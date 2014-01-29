Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id BA9F26021C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 21:03:38 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e49so1182778eek.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 13:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=lnphmGUkh7TR6SgmnP2Vv+3K409sdeOZX0MGZ+r8y+M=;
	b=KFXmVpsH/6ftjLjh+jlg/GwxCpc1pvxhxClTYzYzQoshOXJPuMlkU5SZx0J5vJcoep
	P/0pzh1Fe57Hq3eQraBKy+8m4xImfxBh2FBOXOCLBgekoDtHn7kuwYYVGmMegPvpIBcf
	so3kMMmTAKM6vBm5NoRggshFrG0cTK9YztmnFBKASAcLfr7JR0coonSnD87aWxRActHx
	YYx5YKA7GorqdK2+AbxSVa2EidicFN5or5XqrdQP8s/5Yi0tC0uFFzZFKN5B8FYsabzi
	VdJG2lVVlDYBkC2+2X6Ajc//KbzOQqXFZzic0dzEQ34uHS/w9bH6kR41/6b3beITHRNf
	FaSw==
X-Received: by 10.14.98.66 with SMTP id u42mr4089843eef.18.1391029418673;
	Wed, 29 Jan 2014 13:03:38 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o43sm13605273eef.12.2014.01.29.13.03.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 13:03:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 22:03:38 +0100
Message-Id: <cover.1391027849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/5] sstate-cache-management fixes
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
X-List-Received-Date: Wed, 29 Jan 2014 21:03:39 -0000

The following changes since commit c3f3fed1b397b6ee6d44e7d39e63d084e4a88e30:

  toaster.bbclass: save original package name (2014-01-29 17:40:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/sstate-management
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/sstate-management

Martin Jansa (5):
  sstate-cache-management.sh: Fix remove_duplicated() to work after
    SSTATE_SWSPEC change
  sstate-cache-management.sh: Fix rm_by_stamps() to work after
    SSTATE_SWSPEC change
  sstate-cache-management.sh: Show total number of files when showing
    how many will be deleted
  sstate-cache-management.sh: Fix available architectures
  sstate-cache-management.sh: don't remove all packagedata sstate
    archives

 scripts/sstate-cache-management.sh | 99 +++++++++++++++++++++++++-------------
 1 file changed, 66 insertions(+), 33 deletions(-)

-- 
1.8.5.3


