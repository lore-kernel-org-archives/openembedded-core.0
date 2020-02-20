Return-Path: <praveen@linumiz.com>
X-Greylist: delayed 1354 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Feb 2020 15:24:55 UTC
Received: from gproxy2-pub.mail.unifiedlayer.com (outbound-ss-879.bluehost.com
	[69.89.30.202])
	by mail.openembedded.org (Postfix) with ESMTP id C8E91615FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:24:55 +0000 (UTC)
Received: from cmgw12.unifiedlayer.com (unknown [10.9.0.12])
	by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 751131E12D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:02:22 -0700 (MST)
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTP
	id 4nLIjmacnDbTf4nLJjGi3n; Thu, 20 Feb 2020 08:02:22 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=IPIs9DnG c=1 sm=1 tr=0
	a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=LfuyaZh/8e9VOkaVZk0aRw==:17
	a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
	a=l697ptgUJYAA:10:nop_rcvd_month_year
	a=oz0wMknONp8A:10:endurance_base64_authed_username_1 a=vU9dKmh3AAAA:8
	a=foHCeV_ZAAAA:8 a=5Dyf8FiOe_nCk8WE_CMA:9
	a=CjuIK1q_8ugA:10:nop_charset_2
	a=rsP06fVo5MYu2ilr0aT5:22 a=h8a9FgHX5U4dIE3jaWyr:22
	a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default;
	h=Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=p7CTqSFs97zaOcyO9A4NuwDIisSQ0VLhqtyBQ/3sIV4=;
	b=N3YWfjZJm15R6KTlkVKrZDGGdk
	zDdXQlXUMy4sdQmQt0pLd9MHzWJcnHFY4GqrsphDjh5IRjwXDVMbW76QaWEE3ruXuUz+7SXJtXzGq
	+jH87Zp5wnshu5F/CgsclPqnoEg22n+gsycpNuccwlTrwAdZTbGo4FvM8GMF3/M+KsmROp3KwRwWp
	SE0ZfjbIq91Nz/RkWwASRxp0gXrBJeki1BhcYM7HbO8YTU3FIPf+S5jgMWQivkISEyIKmdO/llpOu
	DUkAMcd1FDAtksZeiR2YAm+I9AmRFylfGS3BXiSvxX4Z3Ky2vb/Eca48PephxZXQSUd3/FfWBdSyV
	t7Ew6UTA==;
Received: from [127.0.0.1] (port=57527 helo=md-in-79.webhostbox.net)
	by md-in-79.webhostbox.net with esmtpa (Exim 4.92)
	(envelope-from <praveen@linumiz.com>)
	id 1j4nLH-002S31-Hu; Thu, 20 Feb 2020 15:02:19 +0000
MIME-Version: 1.0
Date: Thu, 20 Feb 2020 16:02:19 +0100
From: praveen@linumiz.com
To: openembedded-core@lists.openembedded.org
Message-ID: <dcd4c2c866d3c5bf5d5c8c76ae6fd455@linumiz.com>
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
X-Exim-ID: 1j4nLH-002S31-Hu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (md-in-79.webhostbox.net) [127.0.0.1]:57527
X-Source-Auth: praveen@linumiz.com
X-Email-Count: 2
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
X-List-Received-Date: Thu, 20 Feb 2020 15:24:56 -0000
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
-- 
2.17.1

