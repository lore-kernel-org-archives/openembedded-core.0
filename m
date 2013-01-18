Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TwBXC-0003wu-C5
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 13:59:03 +0100
Received: by mail-wi0-f179.google.com with SMTP id o1so3015907wic.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 04:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=SkOZdmQ6WOvkG0qDXXPap3px6LHQe6+PeU34gq566kA=;
	b=snZEBgOHky6cEhvhfczW9VDBr08knChpVzLVNPZEgbjVa5f1gjOuitROC9w3fNWqb+
	GmIMcPTndE6yhaF1TuIv54IbZV8nDseo+4/3Gatx6TPq02U0myR7UtDQk27by9cNBhhb
	udRXl6LAB3wkIEGU1nlauHbY9Yb+Yy4dA/RBcBKnERT/g8d6hIoFPSvAbMGPpIzzYgBv
	R/sIXzspt/pmA3B5O5mvBkfkZo/ySVEpyDmdQqCqiBaeqrXnZD15kRbdr2AEN1cRSCtj
	Hw9+eR7RC4V6nFlK9uWsvHHg2UwQfxnhA8gHmkTKW84cwKAWUV4e7Jok7fnaEzRbrDqe
	s8/A==
X-Received: by 10.180.95.200 with SMTP id dm8mr3379693wib.16.1358513018216;
	Fri, 18 Jan 2013 04:43:38 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id p2sm3660659wic.7.2013.01.18.04.43.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 18 Jan 2013 04:43:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 13:41:49 +0100
Message-Id: <1358512909-14714-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1358512909-14714-1-git-send-email-schnitzeltony@googlemail.com>
References: <1358512909-14714-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC 2/2] package.bbclass: remove RRECOMMENDS on base packages for locale packages
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
X-List-Received-Date: Fri, 18 Jan 2013 12:59:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As long as we support only one locale package per recipe this leads to unwanted
packages in images. This patch was motivated by samba (meta-oe): only wanting
libsmbclient one gets full samba server into the image. For my standard image
the follwing package were removed by this patch:

-acl_2.2.51-r3_armv7a-vfp-neon.ipk
-alsa-states_0.2.0-r3_armv7a-vfp-neon.ipk
-alsa-utils_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-aconnect_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-alsaconf_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-alsactl_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-alsaloop_1.0.25-r3_armv7a-vfp-neon.ipk
 alsa-utils-alsamixer_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-alsaucm_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-amixer_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-aplay_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-aseqdump_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-aseqnet_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-iecset_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-midi_1.0.25-r3_armv7a-vfp-neon.ipk
-alsa-utils-speakertest_1.0.25-r3_armv7a-vfp-neon.ipk
-attr_2.4.46-r4_armv7a-vfp-neon.ipk
-avahi_0.6.31-r7.1_armv7a-vfp-neon.ipk
-gtk-engines_2.20.2-r3_armv7a-vfp-neon.ipk
-pulseaudio_2.1-r15_armv7a-vfp-neon.ipk
-samba_3.6.8-r6_armv7a-vfp-neon.ipk
-vte_0.28.2-r5_armv7a-vfp-neon.ipk
-xz_5.1.2alpha-r0_armv7a-vfp-neon.ipk

Strange effect: For samba buildhistory's depends.dot says:
-samba -> libc6;
-samba -> libgcc1;
-samba -> libreadline6;
-samba -> libtalloc2;
-samba -> libtdb1;
-samba -> libwbclient0;
-samba -> libz1;
-samba -> update_rc_d;
-samba_locale_de -> samba [style=dotted];
 samba_locale_de -> virtual_locale_de [style=dotted];
-samba_locale_fr -> samba [style=dotted];
-samba_locale_fr -> samba [style=dotted];

This is conflicts to buildhistory's result on samba package not mentioning
any changes for samba package.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/package.bbclass |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index b06cca5..73e8de8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -455,13 +455,12 @@ python package_do_split_locales() {
     description = d.getVar('DESCRIPTION', True) or ""
     locale_section = d.getVar('LOCALE_SECTION', True)
     mlprefix = d.getVar('MLPREFIX', True) or ""
-    pndep = base_contains('PACKAGES', pn, '%s ' % pn, '', d)
     for l in sorted(locales):
         ln = legitimize_package_name(l)
         pkg = pn + '-locale-' + ln
         packages.append(pkg)
         d.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l))
-        d.setVar('RRECOMMENDS_' + pkg, '%s%svirtual-locale-%s' % (pndep, mlprefix, ln))
+        d.setVar('RRECOMMENDS_' + pkg, '%svirtual-locale-%s' % (mlprefix, ln))
         d.setVar('RPROVIDES_' + pkg, '%s-locale %s%s-translation' % (pn, mlprefix, ln))
         d.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l))
         d.setVar('DESCRIPTION_' + pkg, '%s  This package contains language translation files for the %s locale.' % (description, l))
-- 
1.7.6.5



