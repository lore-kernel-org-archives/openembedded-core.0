Received: from mail-we0-f181.google.com ([74.125.82.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOH-000795-Li
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:35 +0100
Received: by mail-we0-f181.google.com with SMTP id d7so1218647wer.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=BPhTDuj2b0pLsBkzje6rzeUIIH3OMKrQz5kJKrVtvLY=;
	b=f57y0svu0R0Nj3L1hY7kwfkUvWCwu+7KYTSFnwKQCxh11omt1vYbZnXk0WWX0hi5uL
	91fwNGf3tcA0lZqyfiowk0Czj+LqCIwOZeOPtb+LXbhBrOLwM5T7TmNWajWirzKh1pdm
	cVCuU/ALCJwupEVaUOFKVUEBntQtRA61AxzBV0U9vsSVEH5/dP1JyRIokwbIDDomZlcA
	JOhYBYk2ni4KEst82Mfi6Z7KcWMW4t6LncfYyCqo5rL8V4XbPSD1S8sMuasjM+/m/+O3
	cn6x/OQZJU8nhyLLmVqQKt6r5SDffgyAGg8RBnaGn/quo31c5Br8mXMoHh2C5iytRYmj
	cplA==
X-Received: by 10.180.73.212 with SMTP id n20mr4541637wiv.11.1364316809807;
	Tue, 26 Mar 2013 09:53:29 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.28
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:18 +0000
Message-Id: <66c4b198d829df2f35a47cf1e8c4cbbd7a3697df.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkhcSJWwdpTE+AVNJK98MsrQx/3WXd2uAG2QKxLGOezznrB+dejQu3dxJET9r+97W3Ei2JG
Subject: [PATCH 20/24] systemd-compat-units: disable dbus-1
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:43 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 19a1ea1..9b4a8a4 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -34,6 +34,7 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
   hwclock \
   networking \
   syslog.busybox \
+  dbus-1 \
 "
 
 pkg_postinst_${PN} () {
-- 
1.7.10.4



