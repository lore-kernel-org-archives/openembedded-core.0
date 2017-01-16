Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B03F171AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:40 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 19so3497690pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=7XP/HAzI+nM4UFJrglaQf7E5/zF7QKbQB6QWdvKa4rY=;
	b=aIUS4Qisp0Lx8Y+CS8OvUT2pjL5R2FuPcot9L6xhYMTIEoHo5BHl7P8dY6u2r0GewZ
	uYv2pLAihbvu8HT7+trPyKntpRtLkoakxz0jzyQyjKKCN7D17k8jquHxSGTdiO2EFatj
	yshDI9NZzXVEGUqIR0km70Yqbkn30o2ow8X9nSTi7e9lN5c05unUm5jplbKRPbiz5RN+
	EkkRRvF5p2yrT/Z4sut9l68yRjcWRKWlYozIIa8AysvSXZakDNX0tUHInA+pV1fet/TL
	CLcPxxTFK1erneWJQ2A2wDgpMKEbfT9s6nmohV+i93CJgFiZORhPu9ZMj+0fRiL8UQYy
	mD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=7XP/HAzI+nM4UFJrglaQf7E5/zF7QKbQB6QWdvKa4rY=;
	b=uJrOpIrsl2ToWSSm0JGTe0m9lJhorMBxN1QxJ+DzqgkZBYZJ6uzShO3qpvRrxBDUhj
	sHEO5uaV0oXLxoIc+5DZWI+RfzjIzQcTzREydJNsJyjgRpR3ohPm9cXmSqi7nnKwNSFj
	Lly2NVnzZiALKkvF7MGhYNbeGaLiPXfqP0lu/b5RQtk2NjN1eRj2/tIKg0ZihmXT7vOo
	tYICOEh4ZRF5HNRlPoCd0WGGl0qviCvYySAxLOXBMedKtdKiWN04F8M1BqyslUmeV4PQ
	kfcA3dBJ35wLo4tXXgSxY/vj13/XmH8x+l5hZRsOCDvbssJqvDKBXqDNd4ZKJRyzEkWc
	IL6w==
X-Gm-Message-State: AIkVDXIOvaEokv3eGmYGIdL/MaeUqD/O15Y3mawQ/6U8g/gkPxujntvhXPpixYWScuQuzQ==
X-Received: by 10.98.17.4 with SMTP id z4mr38017520pfi.43.1484576201316;
	Mon, 16 Jan 2017 06:16:41 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	r1sm48621628pgn.48.2017.01.16.06.16.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:40 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-13-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 13/30] glib-2.0/glib.inc: Disable libmount support for mingw32 targets
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:40 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

MinGW/Windows does not have support for libmount, so disable it when
targeting mingw32.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index cb6aca702f..0f8535b1b3 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -31,6 +31,8 @@ inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even
 S = "${WORKDIR}/glib-${PV}"
 
 PACKAGECONFIG ??= "system-pcre libmount"
+PACKAGECONFIG_remove_mingw32 = "libmount"
+
 # To use the system pcre it must be configured with --enable-unicode-properties
 PACKAGECONFIG[system-pcre] = "--with-pcre=system,--with-pcre=internal,libpcre"
 PACKAGECONFIG[libmount] = "--enable-libmount,--disable-libmount,util-linux"
-- 
2.11.0


