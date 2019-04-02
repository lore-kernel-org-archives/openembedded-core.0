Return-Path: <paul@betafive.co.uk>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 37B767D12D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 14:15:48 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 73232222AF;
	Tue,  2 Apr 2019 10:15:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Tue, 02 Apr 2019 10:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
	fm1; bh=S175K5SuVv8Liisp0f08QS0BM3+7Abw0ZuTqM8cTpXo=; b=Sv5Qd3vd
	nuLZ5vyq5HFFS1lNWJgGAnprzer1JxJE6YTzMT8Dr3NbUHg9GXqaQXkclzV7bEok
	mA+L8ZIK7ALihp2tZpdwrobOryuVRC33K/Ne+v6LzMClPU8cQPVUYk0tCBY0QMy9
	shx5fZeJSuf/GrFT6xmKmwDz6AUmaSeDMVwh48g2ZE30KTM84r4NRi1sGPYuffSf
	olvQi2pRg7VyxxKXXM/Qq/imOSWhAiFQc7L5h0jYn/paucKhN6+GxNvUGec+EdX0
	UO5C665/dtdBBcmVRKrmR/F5P47f2kCJdnIJK1EryjuBF2ty8hsjE+k7oCkUMb3v
	6upBFHEckNBaJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=S175K5SuVv8Liisp0f08QS0BM3+7A
	bw0ZuTqM8cTpXo=; b=KCEmwcTY5j0ajHk82Bssmxiv9Npk/1m6TEFEIeXMlWzsH
	Oh2ae+5yasUzhi+snwNjaSjkX/0u4u6SCL+4RXU84/OLxD7xcY1MljvOXEk6axwt
	TTjdJ+c31V2uTNmtdPEm+u6mqGAVrgSKRliA33r5GJ16SX25jLKsoy5J3/YtABoS
	dVTLoBmf3iZMlYiWH7XmYYEjKh84VFT7DBQYlt0XyaiVjePCnzWQIPCnAJCtIu0L
	QMiX6eFaRZ0W/+hCSx6sDWbruaVRoyqi3qSnlYGQAAq1KBnpywowhHlIkvpOfrC0
	+OQX7osFEnmiU2pAGWvlsFvHR9IcfickR8ZeQfXRg==
X-ME-Sender: <xms:lW6jXCKRZGdYtXflMiJOvZBptc5cexPoV6C5t8S4xhxfy7Sb1uVZug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrtddtgdehgeculddtuddrgedutddrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdp
	uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
	hnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhestddtredtredttdenucfh
	rhhomheprfgruhhluceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruh
	hkqeenucffohhmrghinhepuhhtihhlshdrthhonecukfhppeekuddrudekjedrfedvrddu
	feeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtoh
	druhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:lW6jXK1j1ow2sHsbwxPvfDS9kUGXm19v2XL9uIrx-IU9syTuBfPxUg>
	<xmx:lW6jXNxFSa3NGkewk0bxsA107QULZQolQ2MmwO-Uxj5JeVgc2Jfyvw>
	<xmx:lW6jXHY4ly5fQtT1eIBAGjhXkkJhB-kG7i9zN_a79CJEZ0MeW5CrLA>
	<xmx:lW6jXOC9P-xefVx3xrD3d4i9sHbJPjGppG48gJgDP_lDQP2O3VUdbw>
Received: from alpha.home.b5net.uk (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 96C6AE408B;
	Tue,  2 Apr 2019 10:15:48 -0400 (EDT)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 15:15:38 +0100
Message-Id: <20190402141538.25146-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190402141538.25146-1-paul@betafive.co.uk>
References: <20190402141538.25146-1-paul@betafive.co.uk>
Subject: [PATCH 1/1] tzdata: Install everything by default
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
X-List-Received-Date: Tue, 02 Apr 2019 14:15:48 -0000

tzdata is converted to an empty meta package which pulls in all
subpackages. The subpackages are defined in a TZ_PACKAGES variable so
that we don't have to repeat ourselves.

The timezones and conffiles which were in the tzdata package are moved
to a new 'tzdata-core' package.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/recipes-extended/timezone/tzdata.bb | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 7542ce52d2..82fe369baa 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -80,9 +80,11 @@ pkg_postinst_${PN} () {
 # Packages primarily organized by directory with a major city
 # in most time zones in the base package
 
-PACKAGES = "tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
+TZ_PACKAGES = " \
+    tzdata-core tzdata-misc tzdata-posix tzdata-right tzdata-africa \
     tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
     tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
+PACKAGES = "${TZ_PACKAGES} ${PN}"
 
 FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
 RPROVIDES_tzdata-africa = "tzdata-africa"
@@ -124,7 +126,6 @@ RPROVIDES_tzdata-posix = "tzdata-posix"
 FILES_tzdata-right += "${datadir}/zoneinfo/right/*"
 RPROVIDES_tzdata-right = "tzdata-right"
 
-
 FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
                 ${datadir}/zoneinfo/Egypt                \
                 ${datadir}/zoneinfo/Eire                 \
@@ -145,8 +146,8 @@ FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
                 ${datadir}/zoneinfo/Turkey"
 RPROVIDES_tzdata-misc = "tzdata-misc"
 
-
-FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
+FILES_tzdata-core += " \
+                ${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/America/Anchorage    \
                 ${datadir}/zoneinfo/America/Los_Angeles  \
                 ${datadir}/zoneinfo/America/Denver       \
@@ -201,5 +202,8 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
 
-CONFFILES_${PN} += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
-CONFFILES_${PN} += "${sysconfdir}/localtime"
+CONFFILES_tzdata-core += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
+CONFFILES_tzdata-core += "${sysconfdir}/localtime"
+
+ALLOW_EMPTY_${PN} = "1"
+RDEPENDS_${PN} = "${TZ_PACKAGES}"
-- 
2.17.1


