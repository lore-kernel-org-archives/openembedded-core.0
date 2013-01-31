Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0uLY-0000qb-LF
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 14:38:40 +0100
Received: from mail-ea0-f198.google.com ([209.85.215.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 31 Jan 2013 05:22:47 -0800
Received: by mail-ea0-f198.google.com with SMTP id e10so3126301eaa.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:22:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=7V2FCSuz4gbWNPzy9zstKrQ5BEzXwU14t4KOz2SFM9c=;
	b=luBDPbtpdz3OGdVcidc+jNYx30A1cFGqxSuzqAvJOK24XrB6PeT0LDXlzM1vIHy+UH
	jHAD1lFA3IrYXyUAgcc+OapLNNR4Jg5afR1MpOWsFLbDBWbiG2s/63M0PQ00IZf5iA65
	864LpxEJj5RbxGZOZeBias+hVOcs7xeZhRrZbh8no/zEOrOiWwiJ6vcvb/m+eM+lRnkK
	A1Ff+79e8aiovN17RQY+jxiBp7K/88Fj/IYS5vSfPp8e+Qeoa8hgSoWe/XF54blGOGMa
	jZF9kSiOa7dwU676vWbwBgtz//xGZfSsKKrhPrk0fS8ThB8gqisOdJJzlJijtCoXzilC
	oTQg==
X-Received: by 10.180.109.10 with SMTP id ho10mr15320212wib.9.1359638564725;
	Thu, 31 Jan 2013 05:22:44 -0800 (PST)
X-Received: by 10.180.109.10 with SMTP id ho10mr15319369wib.9.1359638555274;
	Thu, 31 Jan 2013 05:22:35 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bw9sm15045589wib.5.2013.01.31.05.22.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 05:22:34 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2013 13:20:31 +0000
Message-Id: <1359638431-5932-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlBoJ2tz/Gth/q8KWmINOmsJQd8BImXXG3ygz4NDWzgWDnRcd73mPFM67R5AgJbQfE+CTbiCRD/32za6J/ul7iG2Kuo8/W8h0MEpa3HrWczaCg25m7OmDYrLDlqDdoRUaLu7alc/nDyfXMRrCznWNsgkDLI9FhIoamhc2KOA7kv7FACaPS8lUCsutTO+QHPXyGh5goo
Subject: [PATCH] gst-plugins-bad: remove musicbrainz build-dependency
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
X-List-Received-Date: Thu, 31 Jan 2013 13:38:42 -0000

This plugin only works with an old version of the musicbrainz API, so it hasn't
been built for some time now.

So, remove the libmusicbrainz dependency as it isn't used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index 7a398d0..9039f97 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=71a904d99ce7ae0c1cf129891b98145c"
 
-DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg curl"
+DEPENDS += "gst-plugins-base tremor librsvg curl"
 
 PR = "r3"
 
 inherit gettext
 
 EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disable-cdaudio --disable-directfb \
-                 --with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse --disable-vdpau --disable-apexsink \
+                 --with-plugins=wavpack,ivorbis,mpegvideoparse --disable-vdpau --disable-apexsink \
                  --disable-orc"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.10.4



