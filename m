Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2DC776FFDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 18:33:33 +0000 (UTC)
Received: by pfnn128 with SMTP id n128so51960279pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 10:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CR45v7RPa75EHLelJpKHvCoGTbbA73G4qGm/iF5ZfXc=;
	b=ZNbfBmE+fyX+tWTziFPdZTTLNuuAG0mYAGLOh59mwTllFQb1v0n6aNaD7ROpCYqp4j
	Ya3xj5bRCaF1mNumVW8juuXBjJ0xMNzHYAG5GJ+0lBNGAiyYvFHZQ2U1AEz/8le+gFH8
	m2AJhjp3QMJhZGwTWLDISIHS0uMYbbOMHnZ/X41P+52dGVrwylTAgnaga/vis5i4MJlA
	WnMy4ooWhCOLBQFOh4hDt2FQYUa7rC7x/GJJQrQ7zQhfKDec96ON5CSJZY43Cbe+f9Ul
	8fZuxQytiVXl9/qEEYy99cytFac6hH0VzPd99GUbe7ZsWEWOiePtWJh9qXLOR1D54RtV
	80iQ==
X-Received: by 10.98.68.83 with SMTP id r80mr8903570pfa.120.1449772414237;
	Thu, 10 Dec 2015 10:33:34 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	e14sm17907973pap.24.2015.12.10.10.33.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Dec 2015 10:33:32 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 10:33:27 -0800
Message-Id: <1449772407-30369-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] documentation.conf: document PREFERRED_VERSION wildcard limitations
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
X-List-Received-Date: Thu, 10 Dec 2015 18:33:38 -0000

PREFERRED_VERSION values containing the '%' wildcard should only be
used when the wildcard pattern is known to only match one available
recipe. See longer explanation in:

  http://comments.gmane.org/gmane.comp.sysutils.bitbake.devel/1038

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 845559a..c31c217 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -332,7 +332,7 @@ PN[doc] = "PN refers to a recipe name in the context of a file used by the OpenE
 PNBLACKLIST[doc] = "Lists recipes you do not want the OpenEmbedded build system to build."
 PR[doc] = "The revision of the recipe. The default value for this variable is 'r0'."
 PREFERRED_PROVIDER[doc] = "If multiple recipes provide an item, this variable determines which recipe should be given preference."
-PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines which recipe should be given preference."
+PREFERRED_VERSION[doc] = "If there are multiple versions of recipes available, this variable determines which recipe should be given preference. The '%' wildcard is supported but should be used with care, results are unpredictable if it matches more than one available version."
 PREMIRRORS[doc] = "Specifies additional paths from which the OpenEmbedded build system gets source code."
 PRINC[doc] = "Causes the PR variable of .bbappend files to dynamically increment. This increment minimizes the impact of layer ordering. This variable defaults to '0'."
 PRIORITY[doc] = "Indicates the importance of a package.  The default value is 'optional'.  Other standard values are 'required', 'standard' and 'extra'."
-- 
1.9.1


