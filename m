Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhSv-0007e2-DB
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:46 +0100
Received: from mail-bk0-f71.google.com ([209.85.214.71])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:16 -0800
Received: by mail-bk0-f71.google.com with SMTP id jm19so5348668bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=6CbMrLOGVcUB0oeeuYXrehUEY9bS7cEmSRiitpukj+M=;
	b=kvje/OzEPYLmuYBGtLyJ969XRaRanMJuYW3OcIYa0/ZZR1xBK3Qa78KO3yWRMSTrqf
	9mreuOOzp07jkyaJ0Rv/oEFMtiDJQA/eMuU3c53YeDSrOaWJyvPM5WLpbDpIvfNvZuOt
	004585uOeBAe7BgBwEnuOzo+9dOqfxCAmKMr4AaEsGHGDu/g2F47lwPyI9RFNYQWSGju
	aeOlBPiBr35lebs58JpNqJ3FZ856XSz470Fk2RpvTBnSBDHsuwhiDugzinHY/WDK065k
	sli58E6ZdB6L0hTKGNhhOdG6A8vKQIjWRdn5GjWYLo2UGVjbXvYTElLaBrrKLw1PSdgR
	02mg==
X-Received: by 10.180.78.226 with SMTP id e2mr9312656wix.1.1358635755134;
	Sat, 19 Jan 2013 14:49:15 -0800 (PST)
X-Received: by 10.180.78.226 with SMTP id e2mr9312653wix.1.1358635755077;
	Sat, 19 Jan 2013 14:49:15 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:05 +0000
Message-Id: <7c26b8f7417dfbe245926137acfa61d0f659488c.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnPukHr1tu6NNK+w1PXaO/3FONwAFNUyOzCa4u1j3ANwWPOOJryrNVPtfg10yAopa5/4euAz2+A+0Cv/GdY8JrVVZ0nHh8RZef522ywO/Up3y9nzWC0KQ8gHf2Cbr3Bj1gyfpaSwyAxUOLFy3jS7mqCM/omJfLZQpIpXQ8WUblfRujVdenGqgZ2UKmfF+VxKYSwpevS
Subject: [PATCH 02/10] default-providers: Automatically set PREFERRED_PROVIDER_udev
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
X-List-Received-Date: Sat, 19 Jan 2013 23:04:46 -0000

From: Radu Moisan <radu.moisan@intel.com>

This is a more generic way to set preferred provider for udev.
We expect to have multiple choices once we integrate other init
managers, and this way we can automatically set it considering
distro settings.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 8ed703c..89b6465 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -37,3 +37,4 @@ PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
 PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_make ?= "make"
+PREFERRED_PROVIDER_udev ?= "${@base_contains('DISTRO_FEATURES','sysvinit','udev','',d)}"
-- 
1.7.10.4



