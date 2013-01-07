Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsArQ-0003fN-Ub
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:27:37 +0100
Received: from mail-bk0-f71.google.com ([209.85.214.71])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 03:12:08 -0800
Received: by mail-bk0-f71.google.com with SMTP id jm19so16661607bkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=heDMCtthgNwtfgcBA4p3CsLwdPsV2gpDTBjV+UKZlzM=;
	b=m/rP/TTuqyZuCP+Qd8vJ8WRNUvpICr0A5RsynwPc7DY/JqqBrJCcdN9DjhtAtrQAXe
	sx9InsvUV/czq177NXFNwqfUw1XdEpUJsK6LAhVJWCWnAkXA703Tj4BYpu82JvP3HZds
	Nly9nGR7RBEoOZ82ExWUFJdbYMnowbhU6d4UbZ7aTa3BT2bpSIoGnrftPU/icjuq8CoV
	7dV+Ma3swlTQ4JaNp02SBoS5HR08zeFq9rKhPzTyDkmHu8bDeuextv50PZvuzGoNKId5
	O3tWV9n+0zlYGg8/SsqC6t/4SzDZU1mi4b6H80bzICHZYVBOWJklmpRSJrjusRdvoEHB
	J2pQ==
X-Received: by 10.194.89.167 with SMTP id bp7mr94456392wjb.0.1357557126333;
	Mon, 07 Jan 2013 03:12:06 -0800 (PST)
X-Received: by 10.194.89.167 with SMTP id bp7mr94456363wjb.0.1357557126050;
	Mon, 07 Jan 2013 03:12:06 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm12993779wia.10.2013.01.07.03.12.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 03:12:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 11:10:01 +0000
Message-Id: <1357557002-22183-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
References: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnHer+VIae+nPjb+JIhb2t1ocAbMVF6j8+wK//asmO6kOH96Y/+W9Yb4hyeTyuv2SmMix9aTswljk4mkkvveEgWJHupgp1IdhQZZNZS6w9jUgLlK/2ozpklcviY8J6AS0YcAOTLRfJxdW+NyUvILBUx91D1gLTEmnVVjAZYCILemYn0tDofuAwi2zMsE0kNbQSGVQyu
Subject: [PATCH 6/7] cups CVE-2011-3170
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
X-List-Received-Date: Mon, 07 Jan 2013 11:27:40 -0000

From: Li Wang <li.wang@windriver.com>

the patch come from:
http://cups.org/strfiles/3914/str3914.patch

The gif_read_lzw function in filter/image-gif.c in CUPS 1.4.8 and
earlier does not properly handle the first code word in an LZW stream,
which allows remote attackers to trigger a heap-based buffer overflow,
and possibly execute arbitrary code, via a crafted stream, a different
vulnerability than CVE-2011-2896.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3170

[YOCTO #3583]
[ CQID: WIND00299594 ]
Upstream-Status: Backport

(From OE-Core rev: c82517bb667484854eaa05b6e9efd9ee0f164fec)

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cups/cups-1.4.6/cups-CVE-2011-3170.patch       |   54 ++++++++++++++++++++
 meta/recipes-extended/cups/cups_1.4.6.bb           |    3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch

diff --git a/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch b/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch
new file mode 100644
index 0000000..fd1b958
--- /dev/null
+++ b/meta/recipes-extended/cups/cups-1.4.6/cups-CVE-2011-3170.patch
@@ -0,0 +1,54 @@
+cups CVE-2011-3170
+
+the patch come from:
+http://cups.org/strfiles/3914/str3914.patch
+
+The gif_read_lzw function in filter/image-gif.c in CUPS 1.4.8 and
+earlier does not properly handle the first code word in an LZW stream,
+which allows remote attackers to trigger a heap-based buffer overflow,
+and possibly execute arbitrary code, via a crafted stream, a different
+vulnerability than CVE-2011-2896.
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3170
+
+Integrated-by: Li Wang <li.wang@windriver.com>
+---
+ filter/image-gif.c |   14 +++++++++-----
+ 1 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/filter/image-gif.c b/filter/image-gif.c
+index 9542704..3857c21 100644
+--- a/filter/image-gif.c
++++ b/filter/image-gif.c
+@@ -654,11 +654,13 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+ 
+     if (code >= max_code)
+     {
+-      *sp++ = firstcode;
+-      code  = oldcode;
++      if (sp < (stack + 8192))
++	*sp++ = firstcode;
++
++      code = oldcode;
+     }
+ 
+-    while (code >= clear_code)
++    while (code >= clear_code && sp < (stack + 8192))
+     {
+       *sp++ = table[1][code];
+       if (code == table[0][code])
+@@ -667,8 +669,10 @@ gif_read_lzw(FILE *fp,			/* I - File to read from */
+       code = table[0][code];
+     }
+ 
+-    *sp++ = firstcode = table[1][code];
+-    code  = max_code;
++    if (sp < (stack + 8192))
++      *sp++ = firstcode = table[1][code];
++
++    code = max_code;
+ 
+     if (code < 4096)
+     {
+-- 
+1.7.0.5
+
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index 7cecd7f..75c23d3 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,6 +1,6 @@
 require cups14.inc
 
-PR = "r8"
+PR = "r9"
 DEPENDS += "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
@@ -10,6 +10,7 @@ SRC_URI += " \
             file://0001-don-t-try-to-run-generated-binaries.patch \
             file://cups_serverbin.patch \
             file://cups-CVE-2011-2896.patch \
+            file://cups-CVE-2011-3170.patch \
             file://cups-CVE-2012-5519.patch \
 	"
 
-- 
1.7.10.4



