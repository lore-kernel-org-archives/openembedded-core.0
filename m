Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGYm-0005pL-N8
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:33:36 +0100
Received: from mail-ea0-f200.google.com ([209.85.215.200])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:17:38 -0800
Received: by mail-ea0-f200.google.com with SMTP id d14so6472971eaa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:17:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=eOmfxVW+ts9pGX+n57ngUuajaGBUi9pEbzB0qK4Fdc4=;
	b=RHsmWH4MjITwWskLPyMxaQ3TRS1+F99xtx87LjL+JlvUVKgsvQSWCxX4kbK73RI+El
	/NiKjU3QBWiU4DvuKGEb1SdUeykDMspBZDbMdEp6KT+nnyzqrbBJ1hTiVC27c3XsJWHn
	twR0LK8pK02NHcRjfzEk/tRj7EyHXuWb/1cWSLPej6Rkx5+L4bOOtRclgBQ9f7IacpL3
	43Zm5i/4D4J/0/h7/LBj6+nwVwrqTwEwQ4aTqB52Q86ATux6y54DP73B3upr3BPU3YGe
	xCI96BoSwQVv8vlSjWau9DpJuwcMIC8MoRICcvfObgscEIrhMbewLt51t6pHtBcgyjBh
	C5OQ==
X-Received: by 10.180.33.44 with SMTP id o12mr15105754wii.28.1358770656411;
	Mon, 21 Jan 2013 04:17:36 -0800 (PST)
X-Received: by 10.180.33.44 with SMTP id o12mr15105735wii.28.1358770656249;
	Mon, 21 Jan 2013 04:17:36 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s10sm18415972wiw.4.2013.01.21.04.17.34
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 04:17:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 12:15:32 +0000
Message-Id: <b7adcc43c6e35227a9553991d68c4eae8f99da43.1358770449.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
References: <53d6b4110f4e12cfde4dcfbef992cc44d8c58c1e.1358770449.git.ross.burton@intel.com>
In-Reply-To: <cover.1358770449.git.ross.burton@intel.com>
References: <cover.1358770449.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnv8Tu4qkZae1lgxevVQ0Ut9JjdyLmh28Z57Itcd1TCn7HzdYqcrtVe9oJXdq5kOu/IxtWojk9ZgN7jUMvOBOslJtiBAU0FKVkMKQ+tPi3WTiZgTksg38goSeWrevxyU0Xf5zJUvPMcHtE+4Dn38XJHtlAp/DPEj1YpsbXgx/6b5cE0kV8ShlsspR7+uwKjBF+2u7iJ
Subject: [PATCH 3/5] systemd: fix typo in FILES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 12:33:39 -0000
X-List-Received-Date: Mon, 21 Jan 2013 12:33:39 -0000

Accidently managed to corrupt FILES_udev.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_196.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
index 85bb4f9..ba42a40 100644
--- a/meta/recipes-core/systemd/systemd_196.bb
+++ b/meta/recipes-core/systemd/systemd_196.bb
@@ -197,7 +197,7 @@ RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
 
 FILES_udev += "${base_sbindir}/udevd \
-               /libstemd-udevd \
+               ${base_libdir}/systemd/systemd-udevd \
                /lib/udev/accelerometer \
                /lib/udev/ata_id \
                /lib/udev/cdrom_id \
-- 
1.7.10.4



