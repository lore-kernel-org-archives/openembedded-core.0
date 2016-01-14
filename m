Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 50955731E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:58:36 +0000 (UTC)
Received: by mail-ig0-f196.google.com with SMTP id o2so20907887iga.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OkKbUD94qOB//fu4um5Q2W4oz8OC4iVnopZg0UeUR5g=;
	b=N0D7u3zLiCVS4hHuxOLYbjiF2lhIxW4++FrpuRw9qnwK3q+ucxrrvik0QX0dBZCe3V
	NKHbdjvmcqgz94uxKlNaqhGR5qGE+YK3eQXaj53sytd3nr2YphrYUO7Vctg1JO/8ekFp
	odZC7YvMQQ8CLNfIXqK/4R0DXSyzjSp/QXjSdv3zYu0xUq9i+KzrdpUZZ4WAhMp7mPiH
	GASV6lPVuHZW2CH+HQ4tgwtOHcOmtoL4/a+81atrUXTOZLbAGycvQ3K4rjEwC6ECQEw2
	Wf4/a/zSlDik2EvhPw1PcBEHyDN/TLf7z1Re+txBqmL0WrlsV7ZthgmVYrV+5zNaOvZy
	Ny6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OkKbUD94qOB//fu4um5Q2W4oz8OC4iVnopZg0UeUR5g=;
	b=MtJcGrFPywtV7ZPof25QjlZhrWtAOdkZowFRDAxQVflte/qRYwXYeHG1fB1o7nbV04
	8preJe5YH7ak1pHfXOPeoWJd4EdroTRO6gNTwfwQH61Ukb3N2jIY3Yb4GSPdcuUrTeB+
	fTW92xAwWGRbLWbfe1yT7c+z8s4zllGGPtkqE+NrrW/JZlnhuNHh9i6hjpcpvxc8gOfK
	/CkbI2nOz6qfy4U5wNDHB2/2fa82NLz00UCU3UNJD93Qpsgkl5vqsyvEwo2bu7XC3ghI
	ima3awwJETV1Y49dP1mhYHvASsErLm1mex7mWOinYpA9go65cTg2UX19otJ1cWXHt6GY
	AzjA==
X-Gm-Message-State: ALoCoQnx27Dlvyj1LXC0rO3nD0d3lbdL++RwxLfz63jOhczWb27+0UhzPraswY97PTFjv4fsz0Az6vK+6FjX9fKb3OaDOesa5g==
X-Received: by 10.50.141.226 with SMTP id rr2mr28662749igb.75.1452805117767;
	Thu, 14 Jan 2016 12:58:37 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	204sm3203278iob.44.2016.01.14.12.58.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 12:58:37 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:56:33 -0600
Message-Id: <1452804997-20926-6-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
References: <1452804997-20926-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 5/9] glib: use bash-completion.bbclass
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
X-List-Received-Date: Thu, 14 Jan 2016 20:58:37 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 86f7e0e..079b214 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -22,12 +22,12 @@ DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' glib-2.0-native
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
 DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib"
 
-PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
+PACKAGES =+ "${PN}-utils ${PN}-codegen"
 
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
-inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even
+inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion
 
 S = "${WORKDIR}/glib-${PV}"
 
@@ -51,8 +51,6 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/*.la"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py"
-FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d \
-                               ${datadir}/bash-completion"
 
 ARM_INSTRUCTION_SET = "arm"
 USE_NLS = "yes"
-- 
2.4.5


