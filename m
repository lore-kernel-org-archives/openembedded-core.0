Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8DF7F4FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:50 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id 3so1855502pfb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oxeNINvdXdoXPk9HZ2lF7hGf8vlVmA28NJJLVhCCnD4=;
	b=vBaQfSqETu5jOnh546rwYqtcOnE8dbBsDmGK+iiWTfEZ2cxmNgzPaVb5lk8x4G7Kmw
	wOi/d57bD41OHjAxb+6OpKI3qtxfIgmnZqvEsJltdZvpRvFCwJ7QaOIIpfmmXM1Y/ATs
	LOE7Tllscq/i9/F07OHyy3nOcd80aGppGYhxJOGIqa0TCHS6S4/lrIdkTu69WnxKfZI/
	18yTmOLX97HTfUnYaEvzukHSNCC5KmTfy47B92uamYhWnIvOhW0y0rZP0aqdQRoHdNqZ
	lZ36cDw26FhhU5XS5A4285pQy5dVrI/zW38tCLC0TGoDK7C8uh1I+Tf19H4cFJofupII
	j1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oxeNINvdXdoXPk9HZ2lF7hGf8vlVmA28NJJLVhCCnD4=;
	b=TEdL3LZvR2PIkNs3ziwKISMv3IPj67roYWjNzILuGksMir73qMgCeP3AhqwEymuE4X
	m4aA2dbGXzfJVPmk0ruaVkmHT/htAan/B1kVgW+OL7dQ8/Tq6JEkgnO4+nJ4+5F650hR
	LjyxifAf+wR/NA1TxDrWpC9Vcgh6/QIU2gtL0Pd8VcHr7D/nlDKGPf3wuoQTPqpE4JMa
	Ub6XXgVVTT8+CZMovgPpWrdsv/bmx2XXKYOAtJDkWX0newwUsItaXxyi2g+M8515kd8W
	dSfjHFDNr+8aZXnquIbFw6ywE/irffTtH+S0rMqLwg/V0g6E/jKGKjYDrbVBSbq0BoSS
	dQTQ==
X-Gm-Message-State: APjAAAVZGCRfgUwbIQmKzUks+ix3vn47K6dYuocQWHYX6KbRNYmRoLoP
	IPoA5JrBx3mX9sEhTTQMvySQ4fFa
X-Google-Smtp-Source: APXvYqz3dkOqucXaMKGYGkb9m/DHPAj5kWvgQbfw5Du/3EyzcrNEz4/qDms5YTW78pBNOwpBhJHMbg==
X-Received: by 2002:a62:7a85:: with SMTP id v127mr5147908pfc.141.1573658391890;
	Wed, 13 Nov 2019 07:19:51 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:09 -0800
Message-Id: <50e64732585e0d3abe0a8e589d2122a7dc06c826.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 06/25] tzdata: Correct the packaging of /etc/localtime and /etc/timezone
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:51 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

During restructuring of the packaging in 2af4d6eb (tzdata: Install
everything by default), these two files remained in the tzdata
package, which is supposed to be empty. Move them to tzdata-core where
they belong.

Also simplify the definition of CONFFILES_tzdata-core. As its value
only takes effect for files that actually exist, there is no need to
complicate its definition by checking if a file is created before
adding it to the list of configuration files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 82fe369..1e2d9bd 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -147,6 +147,8 @@ FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
 RPROVIDES_tzdata-misc = "tzdata-misc"
 
 FILES_tzdata-core += " \
+                ${sysconfdir}/localtime                  \
+                ${sysconfdir}/timezone                   \
                 ${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/America/Anchorage    \
                 ${datadir}/zoneinfo/America/Los_Angeles  \
@@ -202,8 +204,7 @@ FILES_tzdata-core += " \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
 
-CONFFILES_tzdata-core += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
-CONFFILES_tzdata-core += "${sysconfdir}/localtime"
+CONFFILES_tzdata-core = "${sysconfdir}/localtime ${sysconfdir}/timezone"
 
 ALLOW_EMPTY_${PN} = "1"
 RDEPENDS_${PN} = "${TZ_PACKAGES}"
-- 
2.7.4


