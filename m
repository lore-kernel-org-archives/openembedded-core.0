Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WyME410r56IdG2gtlaQkShj44zmUEEBhfgzG7kGYHwG97QMTexkqLiSZSJ7BtII2JBOT0QoeFN
 znC+T9EHCBUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428915"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428915"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:57 -0800
IronPort-SDR: 3P8Q5ZH/1s34aYzsSSqnSYD+qco/64NKNXmayjN3FBAEpY4e+7RaZJUFujPJYhdj9uuM6MMYNK
 6XviBz5bNGvQ==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490126"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:56 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/22] common-licenses: add bzip2-1.0.4
Date: Fri,  6 Nov 2020 14:28:17 +0800
Message-Id: <b77c042f18816f5c9680a9f146e85fac3539841e.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The bzip2 license changes with each version; the changes are subtle, but
that makes it a different license everytime:
  - copyright year
  - authorship identification and address
  - version of the release
  - date of the release

Although we currently only have bzip2 and pbzip2 packages, we're going
to need this license for busybox, which uses code from bzip2-1.0.4.

Add it, as copied from the upstream bzip2 git tree at tag 'bzip2-1.0.4'
(commit f10a33538e9bab6deb61779b3d8aae168824ef48).

(From OE-Core rev: f303c31b813f371737c9a9d7a93e9f920f84e75a)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3f62ed09d09c606cf28480c1258d900f449e621)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/files/common-licenses/bzip2-1.0.4 | 43 ++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/files/common-licenses/bzip2-1.0.4

diff --git a/meta/files/common-licenses/bzip2-1.0.4 b/meta/files/common-licenses/bzip2-1.0.4
new file mode 100644
index 0000000000..4458e35bb5
--- /dev/null
+++ b/meta/files/common-licenses/bzip2-1.0.4
@@ -0,0 +1,43 @@
+
+--------------------------------------------------------------------------
+
+This program, "bzip2", the associated library "libbzip2", and all
+documentation, are copyright (C) 1996-2006 Julian R Seward.  All
+rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+
+2. The origin of this software must not be misrepresented; you must 
+   not claim that you wrote the original software.  If you use this 
+   software in a product, an acknowledgment in the product 
+   documentation would be appreciated but is not required.
+
+3. Altered source versions must be plainly marked as such, and must
+   not be misrepresented as being the original software.
+
+4. The name of the author may not be used to endorse or promote 
+   products derived from this software without specific prior written 
+   permission.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
+OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
+DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
+GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
+WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+Julian Seward, Cambridge, UK.
+jseward@bzip.org
+bzip2/libbzip2 version 1.0.4 of 20 December 2006
+
+--------------------------------------------------------------------------
-- 
2.28.0

