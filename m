Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 178CB7867D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 17:04:25 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d28so7088336pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 09:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=pv6WJqi/vXZoFoUv+381yK8W7dk9xLKVkYt1j76OwiI=;
	b=Y+SHaba9z7mQkW8PSJ4xFAysGFL6mYwwu3Tgbkh3/m2NFaJMe5YOnQNq/5LY1dFjhm
	evA0RpZNkIDXCGp/QelyCe2SY3QDCQh0Yo9m6XOWEaDJ/F7T2q5ZQ8ZlZyiwF0L1Tyux
	TOXIggZcOFmlngCtEZzY8dGhQ6w3smGVNuGRYffx+atHxfCfr42GYHXEYdKSqicUXHkG
	CyoZd+dgoZbMirc3v6nML7pXk9svtKwVetVimRPH98tCKrZjNStJLzzwTNLuLsw2YVFK
	HbZkvnSHDwpLlbpt59QHHRn7V2s8SiB5rz2o8Ybiij2bQE0cO17mJJREePayxqpx+hMt
	FSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=pv6WJqi/vXZoFoUv+381yK8W7dk9xLKVkYt1j76OwiI=;
	b=Xn780p9Sni1SFxJeXhAz/Wfhf4T6Xg496piDBZmq4gO/CRgIulL0WFmYttmoDbfZQI
	AQmG5UIWeztBRadVoBItIRiAZRJmnAAbF/AZNJjxctkpHc8lrWo65gK0ejIvhcvpEZKF
	wU23tUGS1T66yjyq/ANhhSEeETio/9qxvNGuVgLmUtSg3UW+GflPDYdd1EMHbKSsJUZF
	4LBlonalun+qwJcSUBiZBNsGUkDHHrVsFGi3hCUpQt4MTfW0VM4EQla9Wp1w5wykVsrK
	VGMffudS0NFLOK92EdmbTdxhjXiSykYEhteEOFZj99bq+RDPd3z34x4xMhChLOjJzTrQ
	s96w==
X-Gm-Message-State: AJaThX6mul8NxAMgRQqRIN5LWXBBoAdZVsqJNd3+0vAmCl2EBU/VHdlG
	O9mc5r5Ebkxub+zJSCuVqYWbuB/UGzY=
X-Google-Smtp-Source: AGs4zMZN4BjiUZNok6rL99MOOVfTSuMuK2BAGvqGBH0XpWttmIao7skLk0q1c04mwl8fUW1FrLbUxw==
X-Received: by 10.101.76.195 with SMTP id n3mr1008966pgt.120.1510333467121;
	Fri, 10 Nov 2017 09:04:27 -0800 (PST)
Received: from [127.0.1.1] (CPE-121-222-32-11.lnse1.cha.bigpond.net.au.
	[121.222.32.11]) by smtp.gmail.com with ESMTPSA id
	h185sm15769306pgc.55.2017.11.10.09.04.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 09:04:26 -0800 (PST)
Date: Sat, 11 Nov 2017 03:04:17 +1000
Message-Id: <20171110170417.26537-2-nathan@nathanrossi.com>
In-Reply-To: <20171110170417.26537-1-nathan@nathanrossi.com>
References: <20171110170417.26537-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/2] site/microblaze-linux: Add MicroBlaze linux site info
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
X-List-Received-Date: Fri, 10 Nov 2017 17:04:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add linux site info for the MicroBlaze architecture. This is based on
the site info from meta-xilinx and additional options based on config
options that other *-linux architecture site info files define.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/site/microblaze-linux | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 meta/site/microblaze-linux

diff --git a/meta/site/microblaze-linux b/meta/site/microblaze-linux
new file mode 100644
index 0000000000..c6a40c6bec
--- /dev/null
+++ b/meta/site/microblaze-linux
@@ -0,0 +1,54 @@
+# general
+ac_cv_va_val_copy=${ac_cv_va_val_copy=yes}
+ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
+ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
+ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
+ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
+ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
+ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
+ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
+ac_cv_sizeof_ssize_t=${ac_cv_sizeof_size_t=4}
+ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
+ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
+ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
+ac_cv_sizeof_unsigned=${ac_cv_sizeof_unsigned=4}
+ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
+ac_cv_sizeof_unsigned_short=${ac_cv_sizeof_unsigned_short=2}
+ac_cv_sizeof_unsigned_int=${ac_cv_sizeof_unsigned_int=4}
+ac_cv_sizeof_unsigned_long=${ac_cv_sizeof_unsigned_long=4}
+ac_cv_sizeof_unsigned_long_long=${ac_cv_sizeof_unsigned_long_long=8}
+ac_cv_sizeof_signed_char=${ac_cv_sizeof_signed_char=1}
+ac_cv_uchar=${ac_cv_uchar=no}
+ac_cv_uint=${ac_cv_uint=yes}
+ac_cv_ulong=${ac_cv_ulong=yes}
+ac_cv_ushort=${ac_cv_ushort=yes}
+
+# glib
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+
+# glib-2.0
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=8
+ac_cv_alignof_unsigned_long=4
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_intmax_t=${glib_cv_sizeof_intmax_t=8}
+glib_cv_sizeof_ptrdiff_t=${glib_cv_sizeof_ptrdiff_t=4}
+glib_cv_sizeof_size_t=${glib_cv_sizeof_size_t=4}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_sys_use_pid_niceness_surrogate=${glib_cv_sys_use_pid_niceness_surrogate=yes}
+
+# startup-notification
+lf_cv_sane_realloc=yes
+
-- 
2.15.0



