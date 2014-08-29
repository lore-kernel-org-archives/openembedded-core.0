Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 648E86FCE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 21:15:21 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id z60so2834190qgd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ePMh4jy9JQ6wJKY9cuQZlEVuqpZROgj3/DNWv1DThS4=;
	b=XE1C/WkTpeQH3sxDDDSacAadUlCbUmS1w9BaNGAUkF3uQOOhuKfZT2saVXGYhdd0u0
	1vOuFeljcc2PFT8VoWIUpdrIs+4DyD2FAcGg4jwxq59MeVskLPn3neCGQ//TUJ4PXPZU
	+62D/Zly+r5WKsvG5E0DVo+z3SXPuwDE9Kzh+2XVrpUhhvoZYmvyqwb99nTUSYAzzf92
	ZTPJFgamiZkakWuCZHwQ7LzZtMlT+O7MOvSY+8uSpJbIoncwk97MxCexdchOKm4Rw70L
	swMxc+JHAsyKTpAW7NqppON7Y80h9qz4zJzJJv4LT6zfIij3PiiZO++2clhSI8NQW1ed
	Agrg==
MIME-Version: 1.0
X-Received: by 10.224.156.194 with SMTP id y2mr17852604qaw.15.1409346922368;
	Fri, 29 Aug 2014 14:15:22 -0700 (PDT)
Received: by 10.96.205.134 with HTTP; Fri, 29 Aug 2014 14:15:22 -0700 (PDT)
Date: Fri, 29 Aug 2014 15:15:22 -0600
Message-ID: <CACS+7ZRGiZ71ARtkN5zxmfcbADjX=P5oF+dF10hyOjDDBHAOEQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/5] sudo: make sudoers a config file
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
X-List-Received-Date: Fri, 29 Aug 2014 21:15:24 -0000
Content-Type: text/plain; charset=UTF-8

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-extended/sudo/sudo.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo.inc
b/meta/recipes-extended/sudo/sudo.inc
index 6de984a..1d7e541 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -18,6 +18,8 @@ inherit autotools
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"

+CONFFILES_${PN} = "${sysconfdir}/sudoers"
+
 EXTRA_OECONF = "--with-editor=/bin/vi --with-env-editor"

 do_configure_prepend () {
-- 
1.9.3

