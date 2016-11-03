Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0B00F719E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 18:05:11 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id d2so35582505pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 11:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9rqFwB/J71x+Os8pF3VhX81oURsAJlCvG1XwZNkTCjA=;
	b=C7ZCpaiBNl1T+mLf3RPavqSw2HeTWDqTvHXTyt6QyrNmmv+dMAAaQqleGdn3c5p/0g
	Lnd1Nl8/tfH8Hi9ubcOG/Gc7fs+Xl1SktXsNWkbEVsghuYCOPSmoyVeZL2/FzAlub6zQ
	VpUGVGo8HO4fppsjYF7jQj0ryZaVzr3HqXFcmsy1vRF88t3NaN1ixzpwb1KE8ZhraODv
	5NpCqTbyc1cwdg47ycIQUmOU23hrkeXP+JcYD9JsRTl0xBpppDyAvEMcIxYUyFYL9y2L
	LzAuh4StY9O1CpcYUM3SC3TzvR5C6m8VYXe0kEmcsYLiZODRf+BnAKNDSJXxJmZ/dL1s
	7dLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9rqFwB/J71x+Os8pF3VhX81oURsAJlCvG1XwZNkTCjA=;
	b=Kcw5e8IYX8OuIqiA353DbHax9AbQg/v2EjiJUE2AQbYoaCq0GD2w9hksUEn7IhqK1D
	ioJE1F4ZrE3Eyyz7XRKv2cVNlOlzHl0ERIBBuXkb4+ynPKkbwfwI7/YMyXZY385y2okt
	R8B1Hy2UgRhHl/ek4uBy/pUC0JGsb3buC+zMw7uC0cy0eHnkuvv2UCSmFxE54fjUUKu4
	6DdJ+1yuE5bePtssEfQwL1XfZecKppatKgw68lVDO4W+I1ulBPHy6B/aKBQXMC5pxGeM
	ldhtUo+KEZYbAV/oloi/On7zLtPCi+yP8LpMqG0lF3FLJPTizOhW8MiAtZq4sEZ7PhVG
	c64g==
X-Gm-Message-State: ABUngvey9YwqE8rr9MdBxlviCI9jSd9ZreJSZ/hxZpDgRp+3CMkKqz5sFAtUmEmcxOuvIm/h
X-Received: by 10.98.149.140 with SMTP id c12mr19186223pfk.100.1478196313193; 
	Thu, 03 Nov 2016 11:05:13 -0700 (PDT)
Received: from localhost.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	d197sm14307390pfd.38.2016.11.03.11.05.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 11:05:12 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 23:34:54 +0530
Message-Id: <1478196294-7594-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1478196294-7594-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1478196294-7594-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [master][morty][PATCH 2/2] hdparm: Fix QA warning
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
X-List-Received-Date: Thu, 03 Nov 2016 18:05:12 -0000

It solves below QA issue WARNING while building hdparm, when
LICENSE_CREATE_PACKAGE is set to "1"

-- snip --
WARNING: hdparm-9.48-r0 do_package_qa: QA Issue: /usr/share/licenses/hdparm/wiper.sh contained in package hdparm-lic requires /bin/bash, but no providers found in RDEPENDS_hdparm-lic? [file-rdeps]
-- snip --

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-extended/hdparm/hdparm_9.48.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.48.bb b/meta/recipes-extended/hdparm/hdparm_9.48.bb
index cd85776..2c1e77d 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.48.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.48.bb
@@ -38,3 +38,5 @@ do_install () {
 	oe_runmake 'DESTDIR=${D}' 'sbindir=${base_sbindir}' install
 	cp ${S}/wiper/wiper.sh ${D}/${bindir}
 }
+
+RDEPENDS_${PN}-lic = "bash"
-- 
2.7.4


