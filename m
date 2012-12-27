Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eren@hambedded.org>) id 1ToMfL-0002dU-6u
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Dec 2012 00:15:07 +0100
Received: by mail-ee0-f50.google.com with SMTP id b45so5032440eek.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2012 15:00:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=aBCgmHsIlH+p+VG4s+Bf4/OJaJibk29AfGJmRBDLJGg=;
	b=GlWPuHGDJFEUeprfO3cr6tzavqKXOWhnhl0tqyyq/olQiij/XmRdA41I1FIOw2G65R
	AWx59nuX0JMZhEX6cwNdHLJ/jmF1veVqnaIGuZH2f3knVcjaFcTvjgfL6ejNtAqRv+st
	YTQdeqzrftexYqHZWIAkNsAOJu9gGsLrXt7PEUV2DFZVlUSqF1L916rIEVTIKN/q1IVj
	ktwfT5EIfYNQB8H4J1uXc52qLFAzGUmN2P7dlfWX2s2ubH+LUoa3YKWpPqsCGnM30JVw
	CF9BJ5CtXBlQvc+sTCcd6lXn8FYjDn+AwnD/8Ur28nnNDtsAbwWWfoFC4fu01xflBjo7
	s/lg==
X-Received: by 10.14.225.194 with SMTP id z42mr81225283eep.22.1356649212535;
	Thu, 27 Dec 2012 15:00:12 -0800 (PST)
Received: from localhost.localdomain ([46.196.117.99])
	by mx.google.com with ESMTPS id b49sm62333792eem.16.2012.12.27.15.00.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Dec 2012 15:00:11 -0800 (PST)
From: =?UTF-8?q?Eren=20T=C3=BCrkay?= <eren@hambedded.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 01:00:00 +0200
Message-Id: <1356649200-5192-2-git-send-email-eren@hambedded.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1356649200-5192-1-git-send-email-eren@hambedded.org>
References: <1356649200-5192-1-git-send-email-eren@hambedded.org>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlXYJaRuaYV0C62/Cf17Z4AwPmU9h8xYABeu3MxHDfQjRN0WbByLzleSo4u8x0WJmAMrP5K
Subject: [PATCH V2] freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5669, 5670}
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
X-List-Received-Date: Thu, 27 Dec 2012 23:15:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Multiple security issues were reported by Mateusz Jurczyk of Google
security team. These have been fixed in freetype 2.4.11. Details are as
follows.

* CVE-2012-5668: NULL Pointer Dereference in bdf_free_font
Bug: https://savannah.nongnu.org/bugs/?37905
Patch:
http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=9b6b5754b57c12b820e01305eb69b8863a161e5a

* CVE-2012-5669: Out-of-bounds read in _bdf_parse_glyphs
Bug: https://savannah.nongnu.org/bugs/?37906
Patch:
http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=07bdb6e289c7954e2a533039dc93c1c136099d2d

* CVE-2012-5670: Out-of-bounds write in _bdf_parse_glyphs
Bug: https://savannah.nongnu.org/bugs/?37907
Patch:
http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=7f2e4f4f553f6836be7683f66226afac3fa979b8

For original e-mail and CVE assignment, see the following URLs:

http://www.openwall.com/lists/oss-security/2012/12/25/1
http://www.openwall.com/lists/oss-security/2012/12/25/2

Signed-off-by: Eren Türkay <eren@hambedded.org>
---
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.10.bb => freetype_2.4.11.bb}     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/freetype/{freetype-2.4.10 => freetype-2.4.11}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.10.bb => freetype_2.4.11.bb} (91%)

diff --git a/meta/recipes-graphics/freetype/freetype-2.4.10/no-hardcode.patch b/meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
similarity index 100%
rename from meta/recipes-graphics/freetype/freetype-2.4.10/no-hardcode.patch
rename to meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
diff --git a/meta/recipes-graphics/freetype/freetype_2.4.10.bb b/meta/recipes-graphics/freetype/freetype_2.4.11.bb
similarity index 91%
rename from meta/recipes-graphics/freetype/freetype_2.4.10.bb
rename to meta/recipes-graphics/freetype/freetype_2.4.11.bb
index 35d6d22..53fde1d 100644
--- a/meta/recipes-graphics/freetype/freetype_2.4.10.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.4.11.bb
@@ -18,8 +18,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://no-hardcode.patch"
 
-SRC_URI[md5sum] = "13286702e9390a91661f980608adaff1"
-SRC_URI[sha256sum] = "0c8e242c33c45928de560d7d595db06feb41d1b22167e37260ceabe72f9e992f"
+SRC_URI[md5sum] = "b93435488942486c8d0ca22e8f768034"
+SRC_URI[sha256sum] = "ef9d0bcb64647d9e5125dc7534d7ca371c98310fec87677c410f397f71ffbe3f"
 
 S = "${WORKDIR}/freetype-${PV}"
 
-- 
1.7.9.5



