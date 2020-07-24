Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web12.7567.1595601765962787650
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 07:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QwxSW0kb;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=621; q=dns/txt; s=axis-central1;
  t=1595601768; x=1627137768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XccxjfQnrMqLSB6SII4piA3HFAJ6todKYFo9md+qV0I=;
  b=QwxSW0kbRMdWm7Yq2HlznCoXsEc+DUP7Ziykc0AKFJb7F+lFglm7/KoD
   AUUhtM03YlLudQygIIOR7cktotVtX3kC8VLXM9cAoZDOp/EGX+BYxBFV1
   gkCDqM5fJRBheWab4hbQ6y+OfOpttUMBx/KUnQoxMcL0+C/46CLFCOlg2
   fkh8Q9NewWjDj9aZ8vN6joshr+yJIMrUB+5aBSQ0Lc0IqgTO86TCu92/+
   dnI5vsOg/XLMCYRkH1qNvNiVb06b3cNWO+DoP0m1g5e/O2Bb7/ERVw2Pz
   fWE5EvX0PYC8A5SeXcIkCvOBSSot1HsYZILWqv+Z2AnrF7NQo/U2y61Ed
   A==;
IronPort-SDR: ck+hweQqwXph26gZdqLW/Ii9/gebbG6TbEg/xYBhPJMBhObqa5BWT4I/eu5u3H2h72vIXSSJ5r
 gFneIgZRnT2m8nOXVRwL9fUHn3AAI/w4O34irYW6fZpJgls2qk4NFoPzXHoll2QR0DOZ21a6kI
 GWyjieKlZHR0sg6LxS6OwEpj4NSmuiVPo0mubp7ZyqqL/sHfJYnAkYjaccCTZ9CFZccyI4DrPF
 FgnnIgJTFJtC8mvpnFic+1e+VYOmwnwQrnMjNz+FgnIP5DEBrq2Z1DThfneQOet9MoEJLpsoIu
 W3g=
X-IronPort-AV: E=Sophos;i="5.75,391,1589234400"; 
   d="scan'208";a="11187078"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, Fredrik Gustafsson <fredrigu@axis.com>
Subject: [PATCH v6 01/13] package_manager: Move to package_manager/__init__.py
Date: Fri, 24 Jul 2020 16:42:29 +0200
Message-ID: <20200724144241.9977-2-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724144241.9977-1-fredrigu@axis.com>
References: <20200724144241.9977-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This is part of a refactor that will split the package manager
code so that it's possible to use other package managers in other
layers.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/lib/oe/{package_manager.py => package_manager/__init__.py} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oe/{package_manager.py => package_manager/__init__.py} (100%)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager/__init__.py
similarity index 100%
rename from meta/lib/oe/package_manager.py
rename to meta/lib/oe/package_manager/__init__.py
-- 
2.20.1

