Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 209AA78387
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:55:04 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id x7so2948519pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SRIilaw5DrRNVGoyUbrY6TQiimtyeoiW9biM4h68b20=;
	b=gJi8x2MK6lvet51ri0tA0xSM9veSrQSiuRfUDF95zH+sUlyZaAP3e1g58PaxXMyCsM
	j0is8OQroDYiY7vHlwka+XwP9+bIXpEGjLh8OH79UPL9FGDQGiXfC905Y9Jd57JqRHMk
	M4PBD5dZnGR7OdA1+9814i6z1DOlVsj0TyNNhyNOjHl1xaZfbdGEAsY1lNCwG6f1XzfA
	GmQ6ENzyObPxPVz54AOBQQOXwI3aJlPHuGPDDD+o1z5jhfiunMUT18R1j3qffasUuiI/
	1TN8cgOUF8aDNF+vWsSrkElKTks9bJ/d38H/w0J1uFkpk/vmI3uePBHQ28wQ51+U0fDb
	W1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SRIilaw5DrRNVGoyUbrY6TQiimtyeoiW9biM4h68b20=;
	b=PNjTYo8G01+WKWZ/QY3hMVXTyieg8+b4w6RzHZaIxlF0DhZHDnQKX613d8NU/tXIUq
	NkYuMIF3zrgT1W59CMktV1b59QfuwrqbACuNzO8F4lg4mqTASifqx9B65c5QyUVFm25x
	1Zq7L4esvPj1womwpFskSwV5KDqLhIq6J4wrwEDyaHTuSXmuBKDmt/oxuQYdlYtElxqU
	3f5XKtETL0ZcMBn1qit4JEykmyiEAyvA/LyK61vizjBzU3QozrhCfTbV1pKHeKrXGMZn
	q6LIN506yT0XTqIw3V5BQ9s2MMZVqt26a++Pcmhb9Wg/3qA3fqWkqXS7Kc4UhSS6HnUD
	bMkg==
X-Gm-Message-State: AMCzsaXYDpG/F1dGbott4COcllYT7MkIldqvpGw5rrxZ5Lqi3in95MHR
	xHXYaI1AWmYDrNz30iYi0o2BBA==
X-Google-Smtp-Source: ABhQp+SYc50APmVU928lWSqXHK3RCzhbHRdMEUKdA8KMVCZbcYppFdTY1LM1DOP9MZMUpcAKBNXFsg==
X-Received: by 10.99.37.69 with SMTP id l66mr8478486pgl.14.1509738905773;
	Fri, 03 Nov 2017 12:55:05 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.55.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:55:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:48 -0700
Message-Id: <494ba18dd002241ddee1c238ee7c3500ae2b0510.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 14/15] bind: update to 9.10.6
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
X-List-Received-Date: Fri, 03 Nov 2017 19:55:04 -0000

Security Fixes

     * An error in TSIG handling could permit unauthorized zone transfers
       or zone updates. These flaws are disclosed in CVE-2017-3142 and
       CVE-2017-3143. [RT #45383]
     * The BIND installer on Windows used an unquoted service path, which
       can enable privilege escalation. This flaw is disclosed in
       CVE-2017-3141. [RT #45229]
     * With certain RPZ configurations, a response with TTL 0 could cause
       named to go into an infinite query loop. This flaw is disclosed in
       CVE-2017-3140. [RT #45181]

End of Life

   The end of life for BIND 9.10 is yet to be determined but will not be
   before BIND 9.12.0 has been released for 6 months.
   https://www.isc.org/downloads/software-support-policy/

more info see https://lists.isc.org/pipermail/bind-announce/2017-July/001063.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-connectivity/bind/{bind_9.10.5-P3.bb => bind_9.10.6.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.5-P3.bb => bind_9.10.6.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
rename to meta/recipes-connectivity/bind/bind_9.10.6.bb
index b20a4aa..7a35390 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.5-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
@@ -23,11 +23,12 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://use-python3-and-fix-install-lib-path.patch \
            "
 
+SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"
+SRC_URI[sha256sum] = "17bbcd2bd7b1d32f5ba4b30d5dbe8a39bce200079048073d1e0d050fdf47e69d"
+
 UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/bind9/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>9(\.\d+)+(-P\d+)*)/"
 
-SRC_URI[md5sum] = "d79cafbd9ac76239ee532dd89d05cc83"
-SRC_URI[sha256sum] = "8d7e96b5b0bbac7b900d4c4bbb82e0956b4e509433c5fa392bb72a929b96606a"
 
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
 EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
-- 
2.7.4


