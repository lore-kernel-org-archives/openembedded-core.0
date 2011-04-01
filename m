Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W0n-0004v2-Sy
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:06 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3385901iye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=EXnHyWXilLsN8V7hZZuL8xHCIjzCfAaKU0EVljeEN5g=;
	b=NRJOMkqvSanf1YtRac9HUI0Fq1e+abvLN/8+QVGwr8D+Ybg/FKq3ySSDRe8K/rrDVH
	dtiw/d+udJu74yLIqO/XT8F6gDT3+6YWknMmNV6C5vwT0WCJtMMlNR0/fjrYi8m3cfIm
	JJB4bF1BqvXqtj1n79maACvrf+vFjo1BMaIH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ThcD63VInDjEcZAjg3NhLzaTj3VejWdxhselF0LpLk8dwIxRjCrs6jjfKyuen/bGQr
	wH07392A3hixcxSPVX/HyNEoc7x9bZj+TpXTy6x4KRLGEiRgfzPcBloFja1GHdRHrjbs
	+t7Tbd3iZ8uP11lmKJnvh8lYar1SrCORMR/yY=
Received: by 10.42.146.133 with SMTP id j5mr4467146icv.327.1301632147209;
	Thu, 31 Mar 2011 21:29:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id vr5sm1045748icb.0.2011.03.31.21.29.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:58 -0700
Message-Id: <f1162a4fbd503049aeff0def7f9fc168e99ad5e7.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 16/46] binutils: Use arm*-*-linux-uclibceabi instead of arm*-*-linux-uclibcgnueabi
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 04:31:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.21/110-arm-eabi-conf.patch |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch b/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
index 2623301..eace3e9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
+++ b/meta/recipes-devtools/binutils/binutils-2.21/110-arm-eabi-conf.patch
@@ -5,7 +5,7 @@
      libgloss_dir=arm
      ;;
 -  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
++  arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
      noconfigdirs="$noconfigdirs target-qthreads"
      noconfigdirs="$noconfigdirs target-libobjc"
      case ${with_newlib} in
@@ -16,7 +16,7 @@
      libgloss_dir=arm
      ;;
 -  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibcgnueabi)
++  arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
      noconfigdirs="$noconfigdirs target-qthreads"
      noconfigdirs="$noconfigdirs target-libobjc"
      case ${with_newlib} in
-- 
1.7.4.1



