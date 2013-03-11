Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fW-000086-FV
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:41:56 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so4031181pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=Emu2Yh3jhkSQ7KpnAQzqzTaYAQeh6Y8tvuxxwXd10oc=;
	b=EBIIIV2+hRyDRjnEMNUgJKuCkwEBZPye4+DC5VJx9j7MJ7uMQ8SkTNsSYN4OHeTNTG
	ZXusD9CtUMFsmsa1vlykvMrBkF3KAT8BBvUoYGHhGATgX/RkQp/0RQNW3JW7PYgDe1yt
	r9b5Yvp54q014t5RWC+nelby0kn8+YWAR+Bv6F9MilVGWbIX32x8P3LdWF8VESEF3wZ4
	l2Pu5+P4FyxPnU+eqPYnhK1Fykn0Wou6il2YRVeGRmJsE/AT5OclLn1II/ldt/gKZ9Kq
	jWd+p0bq8lZBq0/8kbgtUTzPvQaJcd5IBqsbFQNt2pMyodd9PEQHa+hgA1Ct1+4QecKL
	Lhtw==
X-Received: by 10.68.226.201 with SMTP id ru9mr2724347pbc.102.1363026314588;
	Mon, 11 Mar 2013 11:25:14 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:47 -0700
Message-Id: <b1293ed3d04d5d701ec2a21200d855da0ba1ce75.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlR6cfwNUu9w6JnOUYmZNCb5MQb6UAQYQAtIEqh4CWJMjbiTkliUoxw1lL46UNKRWH5WDs8
Subject: [PATCH 04/12] avahi: explicitly disable systemd if we don't want it enabled
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
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 28e37b9..d8d9a9d 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -56,7 +56,7 @@ EXTRA_OECONF = "--disable-introspection \
 
 # The distro choice determines what init scripts are installed
 EXTRA_OECONF_SYSVINIT = "${@base_contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
-EXTRA_OECONF_SYSTEMD = "${@base_contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','',d)}"
+EXTRA_OECONF_SYSTEMD = "${@base_contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
 
 AVAHI_GTK ?= "--disable-gtk --disable-gtk3"
 
-- 
1.7.10.4



