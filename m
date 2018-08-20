Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBED79074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 19:00:01 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id y5-v6so7234610pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1Xla9ji3hoQru14iiJACQqwyjaBZAsnDWEUXdW9eGOc=;
	b=KkfyYDd0PN0rbvimW9Joz1hjtqA+GNynlyB69hedZNe5PvtYiI3gYSs2JYnFSi6QoQ
	UfXV6gjF/PkG8A7MHVufncizuAYhVhdg7Q+QF+Q8jrg9oSIQ1KxZO4NRPMcvmmcs4S6/
	h4HX6CFoT2jqryTLi2FS3xN4qc/NJmLZJ2iq9OwMfFbQm5JC/gdvm3H/4f7Z4NYFdOp6
	aoZB1gd/Qetmq0Ja8BHQTkyLI5zNzfdFZe/fL+C9PFjkFm+UQAo3kWSwQ+aTkqJnyzFc
	pS6aZsKv2D8Ib+4EOVURLg19+W+AGMy7dL4xW/Od5bGnBcJr87wIlu1yQzjVlbBJY9Hn
	c1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1Xla9ji3hoQru14iiJACQqwyjaBZAsnDWEUXdW9eGOc=;
	b=kI2AHGtiTFFOLRLp+gZUWQVK72CgtB+EdsFJ/rBkyYjVxYsAebwgdyhyiDVQKxZw8Q
	elXcVpfA7FQX7sDdRkcHJ3+2IJh57g4gyvolOJFkD3JfyeSoZcrTBZcncE0HTE//IxqJ
	FTfKLiLwOOx20Uuxc4LyGXa1UJm89nmqha8ukG96q0BQ+i47zpkHT0GpUOJbDt55fkrG
	3H0R8u5YCo6QMPmvozX1BIz7pPWrTcLa+TMkL33+jAkDWeLS9FoXHsKVwPz2r92UxtzU
	ubsKAQXM0M+sWc5AxN1k5nXhaZuIcHh046UjTBk5HWKJyC6qjfbr2Ai3OJm2u4oVsXFm
	0dIQ==
X-Gm-Message-State: AOUpUlFwuZhxnShNd2hQ1vjty0pb2kXHhVVrQVD6u12F6l6jlNMhDXyt
	T0vTkKfZD08UlQp5o/73N/JPmZYq
X-Google-Smtp-Source: AA+uWPwPJk+52GSXEh2piGrLmvEcZ3bcU7bd3LPVY8xCO2oc7nGu+7KXs3bxyW0KWvUyHeiIPZaXzg==
X-Received: by 2002:a62:f50b:: with SMTP id
	n11-v6mr49279983pfh.120.1534791602206; 
	Mon, 20 Aug 2018 12:00:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	j27-v6sm18773223pfj.91.2018.08.20.12.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 12:00:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 11:59:50 -0700
Message-Id: <f44546342cb30b179e063cfe06577ac6675b7775.1534791421.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534791421.git.raj.khem@gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] dos2unix.bbclass: Move to oe-core
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
X-List-Received-Date: Mon, 20 Aug 2018 19:00:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Import from meta-oe layer

- This is useful for many packages where CR-LF
  needs to be adjusted, many recipes depend on it
  e.g. meta-multimedia libebml and so on.

- Add myself as maintainer for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../dos2unix/dos2unix_7.4.0.bb                | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/dos2unix/dos2unix_7.4.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0d1c72a85f..19bd148700 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -134,6 +134,7 @@ RECIPE_MAINTAINER_pn-dmidecode = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-dnf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER_pn-dos2unit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dpkg = "Aníbal Limón <limon.anibal@gmail.com>"
 RECIPE_MAINTAINER_pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
new file mode 100644
index 0000000000..9964315ee7
--- /dev/null
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.0.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Convert text file line endings between CRLF and LF"
+DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
+unix2dos to convert plain text files in DOS or Mac format to Unix \
+format and vice versa."
+HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
+SECTION = "support"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f3f"
+
+SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
+
+# Release 7.4.0
+SRCREV = "1182533bde3c1fe65be2ead465e87671faa2c027"
+
+S = "${WORKDIR}/git/dos2unix"
+
+inherit gettext perlnative
+
+# The dos2unix NLS relies on po4a-native, while po4a recipe is
+# provided by meta-perl layer, so make it optional here, you
+# need have meta-perl in bblayers.conf before enabling nls in
+# PACKAGECONFIG.
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[nls] = "ENABLE_NLS=1,ENABLE_NLS=,po4a-native"
+
+EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS} LDFLAGS_USER='${LDFLAGS}'"
+EXTRA_OEMAKE_class-native = "ENABLE_NLS="
+
+do_install () {
+	oe_runmake DESTDIR="${D}${base_prefix}" install
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.0


