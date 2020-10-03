Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.943.1601749898200582038
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2020 11:31:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=raD8deT4;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1148-234.w90-120.abo.wanadoo.fr [90.120.95.234])
	by koncepto.io (Postfix) with ESMTPSA id CB8BB602F4;
	Sat,  3 Oct 2020 20:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1601749895;
	bh=nFnlfDAWtgyOUkRe2l4AdY33XvQg7wz/t0D9IIMZWgQ=;
	h=From:To:Cc:Subject:Date:From;
	b=raD8deT44FIdeq//n06yw8Jtrqe9KzLCuz1Z5797OJNCU2mQx2JEHLaQk6PWs6WTt
	 4E9ZlUsbgP3+YFXmoRzitQanwDjvClUoasG9G21mEwwXZwvAxo+CsEYR/JwLPGO92Y
	 HzLN0OjRL6rJ/YYDlFZ1Mu11/P0u5FsbDPPDUZY/C0ADpGXjFJs0ideU8cJY2UaRAS
	 SIqYJcz/A/i5Xi8IjBR0rzszQjXkogfHZ7fE1iCXCqLEghF5zNFjz/+4UmK0n21W5X
	 E5pULSByDsyk38OLiNgVPRnFdXBhqMPBc5bI0KFGHL6Jp8EvsBlbKJhKGyAKImNhoz
	 YNOm5clYvtsfw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [PATCH] i2c-tools: upgrade 4.1 -> 4.2
Date: Sat,  3 Oct 2020 20:30:27 +0200
Message-Id: <1601749827-13087-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

4.2 (2020-09-22)
  manpages: Add BUGS section to let people know how to contact us
  Makefile: Allow to preset all CFLAGS and LDFLAGS variables
  tools: Consistently use snprintf instead of sprintf
         Restrict addresses 0x03-0x07, too (defined by I2C standard)
  decode-dimms: Print SPD revision for DDR3 too
                Print primary bus width for DDR3 and DDR4
                List ee1004 as a candidate driver
                Display MAC for DDR3
                Add MAC abbreviation for DDR4
                Round DDR4 speed properly
                Detect and report truncated input files
                Print kernel driver used
                Print DDR memory speed in MT/s
                Add DDR5 memory types
                Decode manufacturing data for LPDDR3
                Fix the version string
                Point the user to the right drivers
                Update the list of vendors to Jedec JEP106BB
  decode-vaio: Add support for the at24 driver
               Scan more i2c buses
  i2cset: Fix short writes with mask
  i2ctransfer: Mention '-a' everywhere in the manpage
               Support messages using I2C_M_RECV_LEN
               Add check for returned length from driver
  i2c-stub-from-dump: Read dumps from hexdump -C
  library: Add a manual page to document the API

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta/recipes-devtools/i2c-tools/{i2c-tools_4.1.bb => i2c-tools_4.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/i2c-tools/{i2c-tools_4.1.bb => i2c-tools_4.2.bb} (91%)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
similarity index 91%
rename from meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
rename to meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
index c576117..7a53151 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.2.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "
 
-SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
-SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
+SRC_URI[sha256sum] = "7de18ed890e111fa54ab7ea896804d5faa4d1f0462a258aad9fbb7a8cc6b60cc"
 
 inherit update-alternatives
 
-- 
2.7.4

