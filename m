Return-Path: <praveen@linumiz.com>
X-Greylist: delayed 1343 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Feb 2020 13:26:01 UTC
Received: from gproxy8-pub.mail.unifiedlayer.com
	(gproxy8-pub.mail.unifiedlayer.com [67.222.33.93])
	by mail.openembedded.org (Postfix) with ESMTP id 50E9D616BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 13:26:01 +0000 (UTC)
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
	by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id 492AC1AB662
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 06:03:38 -0700 (MST)
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTP
	id 57xtjzySbRBzy57xvjLjSr; Fri, 21 Feb 2020 06:03:35 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=JoDfUvwC c=1 sm=1 tr=0
	a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=LfuyaZh/8e9VOkaVZk0aRw==:17
	a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
	a=kj9zAlcOel0A:10:nop_charset_1 a=l697ptgUJYAA:10:nop_rcvd_month_year
	a=oz0wMknONp8A:10:endurance_base64_authed_username_1 a=vU9dKmh3AAAA:8
	a=foHCeV_ZAAAA:8 a=5Dyf8FiOe_nCk8WE_CMA:9
	a=CjuIK1q_8ugA:10:nop_charset_2
	a=rsP06fVo5MYu2ilr0aT5:22 a=h8a9FgHX5U4dIE3jaWyr:22
	a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default;
	h=Message-ID:References:In-Reply-To:Subject:To:From:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kO2DEId2ph28p0lKCRsj664kDmFun+bhnBoLH3tK4uI=;
	b=dfE2gCWDUHUUsDqLB6RoVxCD6M
	SvqTSyQBl51rfxw38yeAOoNtSKOty4efwj0fbHCnCMnUTPL19ikXoYBXtVZPbGICkkwCqfOJCZ4tQ
	BrInijXAKcPzzvsypX48agy6gwfkupWFB6X6F1lz6FLGNIvk9SXAkyWm7A5RETn1TW8/clCqDiOSY
	B6wBCk4jdSFUYiReq5GDpJWUJQUAKOuxvquSnlRngz+Pw7H8Zv9rRZujju0AS01qEAr/g1RmpuwMx
	Yo6fApRSWFuCaXjKfiNOzFFsjnacOKLxMK+BxR/pHOqgqJvWasU6Dop30sMrtIMS7a1vndIDCmEIc
	bcdE81BA==;
Received: from [127.0.0.1] (port=59682 helo=md-in-79.webhostbox.net)
	by md-in-79.webhostbox.net with esmtpa (Exim 4.92)
	(envelope-from <praveen@linumiz.com>) id 1j57xt-0010M1-4W
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Feb 2020 13:03:33 +0000
MIME-Version: 1.0
Date: Fri, 21 Feb 2020 13:03:32 +0000
From: praveen@linumiz.com
To: openembedded-core@lists.openembedded.org
In-Reply-To: <20200220193640.5482-1-praveen@linumiz.com>
References: <20200220193640.5482-1-praveen@linumiz.com>
Message-ID: <c58264815e1c8d1a750803dbb7c04b8b@linumiz.com>
X-Sender: praveen@linumiz.com
User-Agent: Roundcube Webmail/1.3.7
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 127.0.0.1
X-Source-L: Yes
X-Exim-ID: 1j57xt-0010M1-4W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (md-in-79.webhostbox.net) [127.0.0.1]:59682
X-Source-Auth: praveen@linumiz.com
X-Email-Count: 1
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
Subject: [PATCH] alsa-utils: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Fri, 21 Feb 2020 13:26:02 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Signed-off-by: Praveen Muthusamy <praveen@linumiz.com>
---
  ...lsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} | 0
  .../alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb}         | 4 ++--
  2 files changed, 2 insertions(+), 2 deletions(-)
  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.1.bb => 
alsa-utils-scripts_1.2.2.bb} (100%)
  rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.1.bb => 
alsa-utils_1.2.2.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb 
b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.2.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb 
b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
index 9144af628a..8bbc5d3ef3 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.2.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, 
--disable-xmlto, xmlto-native docbook

  # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
  SRC_URI = 
"https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c4628bae7632937eac2de4cf2a3de82e"
-SRC_URI[sha256sum] = 
"0b110ba71ef41d3009db1bc4dcae0cf79efb99cb5426fa19d0312470560a2c0d"
+SRC_URI[md5sum] = "00612234ff4722c8f7f8f7a83ff9bc63"
+SRC_URI[sha256sum] = 
"44807bd578c5f6df6e91a11b8d37e546424a5a1ea8d8e659ee359fe01730e4f3"

  # On build machines with python-docutils (not python3-docutils !!) 
installed
  # rst2man (not rst2man.py) is detected and compile fails with

