Return-Path: <jan.kiszka@web.de>
Received: from mout.web.de (mout.web.de [217.72.192.78])
	by mail.openembedded.org (Postfix) with ESMTP id C339977D2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:42:40 +0000 (UTC)
Received: from md1f2u6c.home ([95.157.57.47]) by smtp.web.de (mrweb103
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0MYvxn-1d7m4X0quJ-00VjSY
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:37:38 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jul 2017 21:37:28 +0200
Message-Id: <c15f6f6fb20e5cbb2677bd122b854fe896dcdf4f.1499715449.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1499715449.git.jan.kiszka@web.de>
References: <cover.1499715449.git.jan.kiszka@web.de>
In-Reply-To: <cover.1499715449.git.jan.kiszka@web.de>
References: <cover.1499715449.git.jan.kiszka@web.de>
X-Provags-ID: V03:K0:51cvKSmJRGLIIS0ZT6NuXN0E9qDoyRaeDoX8jlL/1lppR2LPAkZ
	OjgLfn3gaIzIMVb/+VZ/CXfrtfMeHv//vEtCI1WXJvHaUKeBlO0oxmLSDSg6TvLvFD9PXKS
	hg8TLjYQxrC9gh2QWHuWe4u63xunAeFhfwx0MS/tzPgX7A0BTza19xVdSOsfHBzx0GTHkh3
	IseWH5/AdicYqtB+c0lhA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:mJ3VhvlZi24=:XwFaMUvvP4aqDDt/HOMYwu
	9tANduHJ+BxmA5sWSt7i2JqTG18YQOnXtIOginNfp80Ee1IqyWCaD4NF0uZfzRNbGkbhfeIuJ
	GlmVdTjDRtMAgKNkuFsvSzYW9azHzRqwB0K0IQu31KEdjfE4hci8ctPm6Nli9fowPC/2KF48R
	rU6DQYjcM7TJ/TVeArM26Mmp0sTwvnsNaeJ/TbMGjrzekHWu3+jzVWxRFXtok8T31x2AQw/Bn
	W7bAqbg5gWGWhJ9/atZqp3lfSBR1RE9M5G6gKFClz5iDHmyZLXKAU7GM83frt6QcJjyo52fgi
	RNQAl595qMMGIbDvvdA+juaPfZppTnjvz3fJ0v61CHh2Sv0F7X5tUySFbKiu0DnZ451U/GDUW
	BDMpRfinuDKxnrPWgfSBNTg+AZwf0YQUi6BARUBfs2oJ+ooN8BlNwLXlbtp/BhEv41GqR1Xjk
	Cpv8krFRWKOKu8juB1gHCLY1RSBkmSrLFBUVOXL0g37UgcrKBGrpj8DDmUdXlb96NXNmsQM6w
	SG4FO+p7D6xM+F92CQnXJ2hEmmYMevb14Sw7+LwrltkHucJ3WYi8GbL0S8388FgbWM+KeZIJr
	ypU4TAqXJ8piVUg71yr8RRq63yzIvuRuSLIYzuPM9IaPIEZ5D5y0etl1EgSV7hLns74VfftG7
	ndRCJLr+BmaauybL18NoZrzhZrXe/UdC1e92RkgzzRkLTUJWdUvpN6Dz2yrGBEkyFo8lCweYt
	wZcwjUjLNH20J5Aed6hrfNsxbXigrdDdD2S08Ifg3GOaCzARuby+EWivfkc=
Subject: [PATCH 2/3] rng-tools: Don't use /dev/urandom as rngd default source
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
X-List-Received-Date: Mon, 10 Jul 2017 19:42:42 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

Big no-no when you want to have more than a toy device, so let's not
make this a default. See also https://lwn.net/Articles/525459.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 meta/recipes-support/rng-tools/rng-tools/default | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
index 7aede9be03..b968f2b789 100644
--- a/meta/recipes-support/rng-tools/rng-tools/default
+++ b/meta/recipes-support/rng-tools/rng-tools/default
@@ -1,3 +1,6 @@
 # Specify rng device
-#RNG_DEVICE=/dev/hwrng
-RNG_DEVICE=/dev/urandom
+RNG_DEVICE=/dev/hwrng
+
+# Don't use urandom as source unless you fully understood what that does to
+# your system security!
+#RNG_DEVICE=/dev/urandom
-- 
2.12.3


