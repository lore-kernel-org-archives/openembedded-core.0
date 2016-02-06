Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id E08D4772D4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:44 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yy13so4044554pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=xAIFdCBXB4XBAYss7yq9Z6ceE7XPywEJdDspl2d+KM0=;
	b=0o14G8jFVnMS3XNjqRKPNu2Lqvf+eb/albHghvzQeowQhb2ehX7Ei/K5g+Z079nrdh
	xV1wdacIP/mgJoQ9/U2cwpRP2CqUAlZcIPL2vDXYYrAzDPMz/A/W0skXSouo+2uiwit0
	rd3OvwoFM9gl6H9eaLsah1t9htZjb+cPx3iE3y2xYVtx/6HBbyYK89wIDjLUIgcDj/eX
	vm8Ymailf7M4l9SeA2jQBlaa10bMRvBaV86Uci2S02aOKU0HcwMf7qNu+l8xzMPpRqy8
	sMw1SIgAOabo2IFQWntoIbNAMkPN7sdzK+WztSno2w9h5rQJHz4FK8VYAHsvqB5j5Zeb
	4KLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xAIFdCBXB4XBAYss7yq9Z6ceE7XPywEJdDspl2d+KM0=;
	b=Ek1hnq9P+GdgEfBHshPIBs3zH3vyHfBYiS/yBFbODQRBGi1eWzGgpbY1rgzqjKX81C
	lNzZaKQyy5wmwDt6CjRrlRfTbMHIvqK09ku6dIhIQpEHYDZyzrtsmqI5MmeF2WqNryS+
	147lQ+7BQCgzTEWT/LNj/pZI3yDdwih331beA6XKfJ6jkJO2b/v6PdEA8xblBLf/ZSYZ
	7hxMlq1DMJRczXr4NnkTIdxyMgNFEJ5fJ0LG+dYquTiO3HBezoyl2fONrfm8cM+ZiZmC
	jXHlfoaCAAiBVRYcAbzn8lkKtrjdNbSVzAsznWFqQlua89fNsUkA0KKAw+jQ96KSg9OP
	8fPg==
X-Gm-Message-State: AG10YOTx528eYuXBUNWHSdenj+39qnAvRAHbEgL9jz40vXTqui9Z5d5WbpaeeZAK63Vxug==
X-Received: by 10.66.220.170 with SMTP id px10mr31115881pac.145.1454800545991; 
	Sat, 06 Feb 2016 15:15:45 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:58 -0800
Message-Id: <56dc4be78b4c07d6682bf372f224b5cc75f22bbb.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 17/21] tzdata: reinstate changes reverted in 2014c upgrade
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:45 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

OE-Core commit 57af3fb9662106f0a65a1b4edf83e2398be0a8f1 upgraded tzdata
but also reverted a couple of changes to SUMMARY and LIC_FILES_CHKSUM.
Reinstate these (with an update to the README md5 value since that has
changed slightly, without any change to the licensing statements
within).

(From OE-Core rev: cea4f6b86129f84a99700207777929bf7e811ed6)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata.inc b/meta/recipes-extended/tzdata/tzdata.inc
index 25743f6..f9050dd 100644
--- a/meta/recipes-extended/tzdata/tzdata.inc
+++ b/meta/recipes-extended/tzdata/tzdata.inc
@@ -1,8 +1,9 @@
-DESCRIPTION = "Timezone data"
+SUMMARY = "Timezone data"
 HOMEPAGE = "http://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1"
+LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=996a9811747aa48db91ed239e5b355a1 \
+                    file://README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
 DEPENDS = "tzcode-native"
 
 inherit allarch
-- 
2.3.5


