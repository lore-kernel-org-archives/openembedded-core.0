Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tsd0M-0006Dy-KD
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 18:30:26 +0100
Received: from mail-we0-f200.google.com ([74.125.82.200])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 09:15:14 -0800
Received: by mail-we0-f200.google.com with SMTP id x43so640389wey.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 09:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=UGSxWEP8qCW6ocAZANxs9UX7dPt8NpxDw4O3BJg9/54=;
	b=pMhTeAPwJGQL7iFTHuLNS9kOpN3sLxuJNNDEh3rrIyOgAMUcgzcwUMIN2xfmZKG2sl
	qN85FClW79LwCUDFwTsi7rPzTWsXghm8gI6x29/pqRfnLR0lTFdUVowf/nO7UrSuegpd
	DjXhEgj3K/5wpqWDFoaUM+WTmwZKXSHXHlKs/DO36CVpqBH0/6tmZ5z5LjomGBmpa1EN
	2BFPk9lIEbalvaiT+Ee5sXg1duz4gHrL9GuAmGMuWRVl0A5wKY2qo3Ji2q0nz41kmra/
	KvW4FgjHLnJI21SBWoY5XKO56F67U9ufzvrCq2IRlVS8DHEbPPMRnWc47qAX+tCYylm6
	iDGw==
X-Received: by 10.180.95.135 with SMTP id dk7mr16139114wib.29.1357665312463;
	Tue, 08 Jan 2013 09:15:12 -0800 (PST)
X-Received: by 10.180.95.135 with SMTP id dk7mr16139091wib.29.1357665312287;
	Tue, 08 Jan 2013 09:15:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df2sm17294308wib.0.2013.01.08.09.15.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Jan 2013 09:15:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 17:13:18 +0000
Message-Id: <1357665198-8780-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmLtHKNDuIyExvi8ZRB3jTDrkC5jOMGqfdgsiyjzr9HxL0PXKIEMh/KfBVCvgLbTBKZCD0RE/EpAHnvR17UyOK54UUv1D7sznrFWXYCccL9UdvmfjjfdYD90Fw4ciOx3yGypFObBXHzEwV2WBn03/o+EQk2z0A73bHfk6hmMZvXS3745mhRKDNUs6ihKlATAEEWlGVh
Subject: [PATCH] musicbrainz: handle rebuilds
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
X-List-Received-Date: Tue, 08 Jan 2013 17:30:26 -0000

When rebuilding build-native already exists, so don't error when running mkdir.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 7343662..76c69c4 100644
--- a/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -20,7 +20,7 @@ LDFLAGS_prepend_libc-uclibc = " -lpthread "
 inherit cmake pkgconfig
 
 do_configure_prepend() {
-    mkdir build-native
+    mkdir --parents build-native
     cd build-native
     cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
             -DCMAKE_C_COMPILER=${BUILD_CC} \
-- 
1.7.10.4



