Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 73C3965D11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 09:08:24 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id t61so168004wes.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 02:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KbSZGb5tEFg9Z+wbVUZSCAbAj+GmYVM07QwbtD5mw/I=;
	b=DXt4M5kJI/LSdvYSVOHkbYUi6x6ECQRQKI0Ayo3snZAG4KB4b7nBPiyDZanWhRZFam
	obcOz531KhSnyLl4pEaosLcRHFQXKNQIgCiPz8Nhn4nXA+7cpYweGjT/Vf4eq7hwuVyy
	fUp0bLzbnWIAZ/S4269EYjnMAbroa9TLYUgB60uIJs7iEFBwJzs+9z1H//QYoDAE1FJf
	eEvE5UU2iw0qCfkyx19kOYo1aMBAVF6cszYH+2NXzKzmwvTc7ljv5OPLsnox3K1cYdNQ
	qFmLrNT4276IXg49ALSDUjPoDXEnMuQKYhfiX5eYClNOvtmJGKJoIjP1Ci7fMxJYHX2C
	I4sQ==
X-Gm-Message-State: ALoCoQmL+E+Q9Bmb7L7EuVcNfmnqZ8j2XRLnfmIqwjKmxV3KecaOLu/rjlAGsFDNlzyr1YNDcJ5y
X-Received: by 10.180.14.199 with SMTP id r7mr11448988wic.0.1397725705171;
	Thu, 17 Apr 2014 02:08:25 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	g13sm38138420wjn.15.2014.04.17.02.08.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Apr 2014 02:08:24 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Apr 2014 11:07:38 +0200
Message-Id: <1397725659-9004-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1397725659-9004-1-git-send-email-koen.kooi@linaro.org>
References: <1397725659-9004-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 2/3] liberror-perl: add 0.17022
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
X-List-Received-Date: Thu, 17 Apr 2014 09:08:28 -0000

This is needed for git-perltools to work:

koen@beast:/build/v2014.06/sources/meta-openembedded$ git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe][PATCH
Can't locate Error.pm in @INC (@INC contains: /usr/lib/perl/5.14.3 /etc/perl /usr/lib/perl/site_perl/5.14.3/ /usr/lib/perl/site_perl/5.14.3 /usr/lib/perl/vendor_perl/5.14.3/ /usr/lib/perl/vendor_perl/5.14.3 /usr/lib/perl/5.14.3/ /usr/local/lib/site_perl .) at /usr/lib/git/git-core/git-send-email line 30.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../recipes-devtools/perl/liberror-perl_0.17022.bb | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/liberror-perl_0.17022.bb

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17022.bb b/meta/recipes-devtools/perl/liberror-perl_0.17022.bb
new file mode 100644
index 0000000..071f4b7
--- /dev/null
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17022.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Error - Error/exception handling in an OO-ish way"
+DESCRIPTION = "The Error package provides two interfaces. Firstly \
+Error provides a procedural interface to exception handling. \
+Secondly Error is a base class for errors/exceptions that can \
+either be thrown, for subsequent catch, or can simply be recorded."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
+
+DEPENDS += "perl"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
+SRC_URI[md5sum] = "f4d825f4be915ae90bf2e0d66734956b"
+SRC_URI[sha256sum] = "cab74f04fb3af7088cefc2f6f96800ee52d34b82928bbb35ca51a0e5b5f9f7ef"
+
+S = "${WORKDIR}/Error-${PV}"
+
+inherit cpan
+
+do_compile() {
+	export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
+	cpan_do_compile
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.0


