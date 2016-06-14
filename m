Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB3762135
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 21:50:23 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c74so170146pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7axQUCl+IA79kK8dHBS49hlv/AwGIhMNipBH+b7sWM4=;
	b=xPKbkV9zFRB1bGV1w4wbR/GnARXz7iGq/vXzzzTl7mpwWu+lMkB7y77CLE+wdOtm2+
	IbLE5+Rc23AABC0Q7YDUSP7VKUlZx7qN08eKgnxd4SEHjXWSYopQm55xECqY32+aLH/k
	03fiQ6I3lz9OntycITV2fDqBBezuDfNTRURt1U1/A2AXwCdCKxm5bVG1TngI5pFsiNe7
	mcrjuscDJrbfmdIJMdrhXacyulJ0MjdqYbpCZ7k9RSwZnyHnqfb/o/SKXcii+qsWjr6M
	7v72x38Omj8ggCzbsyDrCx2chl3YZwunm2WHrIXujn42vacuTe5zYZQSXeXndiys/Wjv
	+RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7axQUCl+IA79kK8dHBS49hlv/AwGIhMNipBH+b7sWM4=;
	b=F/YR694pQPfb9HvPOC6FG6E8ffTj+S/TXJn+xK21JZnrPstrp9d6XUAY3QVfOF89NT
	8kwwzCUXSNqvke6Y14AXJz7yuVPmD5SDZ3IOD4+/mmuLSWEnuZ2PAmcRu8Z80RA/LoU5
	sMe7cnKMTgbtmQWnGJnoFnwVZ7NMq25hDfXbVGeJVk7MpJMdDmwRPsjGQrFeBKwvL4pE
	n0r2ZGVcR6PZ3KLYpQ8mSO+NkvgMhrnkrBVu59K7VwvCzXQD1RB9oaCMGSSvEl0REcAd
	8DVJ0mzxvxEbyedIRUXAbv4eyQ9hkQK8XVVsdatAjYuSh+Lfp0zDu9xpEVNM1dX0ymHn
	7zCA==
X-Gm-Message-State: ALyK8tJgBgQvXaVlGH7PRhelJo+u6CINHQdjod9olumuJxT8N6FmFrk1bMqJnt7nEh29Vw==
X-Received: by 10.66.232.226 with SMTP id tr2mr30399554pac.44.1465941024559;
	Tue, 14 Jun 2016 14:50:24 -0700 (PDT)
Received: from Pahoa2.mvista.com ([50.233.148.158])
	by smtp.gmail.com with ESMTPSA id
	a188sm11940573pfa.70.2016.06.14.14.50.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jun 2016 14:50:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 14:50:21 -0700
Message-Id: <1465941022-1264-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][krogoth][jethro][fido][v2][PATCH 1/2] tzcode: update to 2016e
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
X-List-Received-Date: Tue, 14 Jun 2016 21:50:24 -0000

From: Armin Kuster <akuster@mvista.com>

V2: typo in title (jet lagged)
Changes to code

zic now outputs a dummy transition at time 2**31 - 1 in zones
whose POSIX-style TZ strings contain a '<'.  This mostly works
around Qt bug 53071 <https://bugreports.qt.io/browse/QTBUG-53071>.
(Thanks to Zhanibek Adilbekov for reporting the Qt bug.)

Changes affecting documentation and commentary

tz-link.htm says why governments should give plenty of notice for
time zone or DST changes, and refers to Matt Johnson's blog post.
tz-link.htm mentions Tzdata for Elixir.  (Thanks to Matt Johnson.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../tzcode/{tzcode-native_2016d.bb => tzcode-native_2016e.bb}    | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016d.bb => tzcode-native_2016e.bb} (69%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016d.bb b/meta/recipes-extended/tzcode/tzcode-native_2016e.bb
similarity index 69%
rename from meta/recipes-extended/tzcode/tzcode-native_2016d.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2016e.bb
index 4b5ab86..78af639 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2016d.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016e.bb
@@ -9,10 +9,11 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "06fc6fc111cd8dd681abdc5326529afd"
-SRC_URI[tzcode.sha256sum] = "a8f33d6f87aef7e109e4769fc7f6e63637d52d07ddf6440a1a50df3d9a34e0ca"
-SRC_URI[tzdata.md5sum] = "14bf84b6c2cdab0a9428991e0150ebe6"
-SRC_URI[tzdata.sha256sum] = "d9554dfba0efd76053582bd89e8c7036ef12eee14fdd506675b08a5b59f0a1b4"
+SRC_URI[tzcode.md5sum] = "6e6d3f0046a9383aafba8c2e0708a3a3"
+SRC_URI[tzcode.sha256sum] = "57d8c4fcd5e8a90657d0e298eac5effb1a642119c92308db68d13a4612fa459e"
+
+SRC_URI[tzdata.md5sum] = "43f9f929a8baf0dd2f17efaea02c2d2a"
+SRC_URI[tzdata.sha256sum] = "ba00f899f18dc4048d7fa21f5e1fdef434496084eedc06f6caa15e5ecdb6bd81"
 
 S = "${WORKDIR}"
 
-- 
2.3.5


