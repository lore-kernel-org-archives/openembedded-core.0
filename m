Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 19153786D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 09:40:30 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id l24so2029936pfj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 01:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=BxdgaE5CQ/ybjRfjRVNV2qcB8qYPMFZeZamGQ0v/GGY=;
	b=FOC4c3aFkCnUIUuGe4NAWE3QM9gDOGYTZNJR7P1kGIyWWsIbdFCpY96GsUCZ+iaoSL
	07ICVEH7skolJqzx6eSffSRuFPsaSJ8XyLq4MElee6C7eezKyr4gHriVdsSyHX00Ewrh
	SCGacTJ+euEGUMr8dck4ym1SzU0gQSzZc+oQ1k6/zzTYgiqwTtM0r26Wy7a7FkgyPlro
	KkKv18aZRi92ryr237lVAO9e6BhfEyGIlkB9bZSARQuSemGBKOioMYo/02IRr2cvxBuU
	gu4NOF3n12I6iSzRCsFW7G+J69fgn30P4hieKndlcjlwwLaUvzsPiwoepzyJfKxgBwTs
	h8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=BxdgaE5CQ/ybjRfjRVNV2qcB8qYPMFZeZamGQ0v/GGY=;
	b=SeiiWypdkXb0a3zjMG4XRv7Y1T8e2mmr/Ajxot5tgGwNCaiaMP0X8mM4p2cjE5fL19
	K82/6F90GX2EO6uaRk/y/SYdCDf0woIm+P54uf9m+uhoQN0xIhrM0xFtm2S/p8NXkBUp
	t4DEYvQGJsADavzMbDlaySSuWBbOn2CwDqLSPCFv/yKUe93E+gLWauRTWiTD+M4VE21j
	68E6WX1uNqaXdgUbfwjcUApXBBEPAwokwbJoatzdTQAnEkbzJ2/Nj7lpIqKF+uhwMjZ8
	euh409JoxuHnI7vUqsjR0q0W7Zg2mlwvHrhx6lyHQVQ4uSWoehpDHn+PadiGRmb6JlA7
	lZ/A==
X-Gm-Message-State: AJaThX7bSFrSXW0uindm+kZ1+CT9MTFwx61QaxaZXSzsF1rZT/ZK3+0E
	RknIObblTSBLegswyMbxLvA7ab4P+7I=
X-Google-Smtp-Source: AGs4zMZixJh5DYMVvX/ibArMOQazbCRGQ60BfZe4285SxMJYaF6yjOo+V8U2IB88EGmYVm59CIn7JQ==
X-Received: by 10.99.158.18 with SMTP id s18mr20166169pgd.176.1512553231903;
	Wed, 06 Dec 2017 01:40:31 -0800 (PST)
Received: from [127.0.1.1] ([58.165.131.151]) by smtp.gmail.com with ESMTPSA id
	g2sm3666361pfc.130.2017.12.06.01.40.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 01:40:31 -0800 (PST)
Date: Wed, 06 Dec 2017 19:40:22 +1000
Message-Id: <20171206094022.22145-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] prelink_git.bb: Update recipe to newest commit
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
X-List-Received-Date: Wed, 06 Dec 2017 09:40:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Update prelink to the newest commit on the cross_prelink ref. This
includes the following changes:

  05aeafd053 Disable automatic generation of prelink.pdf
  aa2985eefa src/rtld: Add MicroBlaze support based on glibc-2.24
  62f80843f8 README: update information on reloc8/reloc9 failures

The primary purpose of this update is to enable the added MicroBlaze
rtld support so as to enable gobject-introspection for MicroBlaze.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index cc93bcc384..0f6d16e005 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -9,7 +9,7 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "ef20628dd78b92e1a3123afc67b64cf010bdd9e4"
+SRCREV = "05aeafd053e56356ec8c62f4bb8f7b95bae192f3"
 PV = "1.0+git${SRCPV}"
 
 #
-- 
2.15.0



