Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD037C8B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 00:08:54 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q1so20230755wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 16:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KPwC3En/2udJ64qCrtoMqzgxhDQOJbAqIuo3l/TcETA=;
	b=OfBc6cvKBh0vyTQMv45Ckzq0EZlTscH/29Xr4F4jzF0ch8AlTcdH4pN6F0zeITQzV5
	3tktybDYtW0mG0OTUeYPDH5I4jnI157S96YNFMydnMB/SrNsw3NPH8UhVn9/9FJdm5Pw
	DCOWjTrSIQsKhYJx+4LkgW42MbS512/Vdndnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KPwC3En/2udJ64qCrtoMqzgxhDQOJbAqIuo3l/TcETA=;
	b=cg7B1pw3GhlmyNSFndW0CrMCgAlA0aMZ7CTZV8SHqd3rpNHxB0gxMDAHEWhGt2cvKk
	F54QZMbdgCQ32yllAoyIg42eImu4b2eMtnLvrNNoNNmxfNMHQ49Xv7dwJEnEnkedD3Wp
	3hvI8jNXy6FaJK4LMK6a/WS+EAlTZMsIdKnY/mqG25N0tqLTLtUgQD5Qtp6A2v6r6Qcc
	C8rJd0G//+4M3AweJgP89Hz6RTyZLKPwXQgcwXZEUYpSpkaYF0c3YwQ5SgjIwG56no/6
	sPD12UZcHorIMeLwfovIhQTze9BZ2m7pqq4lgG9KDiuNv704RbssCA7pohvQP22X1wwr
	8SxA==
X-Gm-Message-State: AHQUAuZWDHI1eCoge/+qI4eng5tBlNK4fqNRuL/dLIP/r9L/Svbc6OHR
	K/HdbDMES57H36rKwyhW/VfveSsk7Xs=
X-Google-Smtp-Source: AHgI3IaFVTkbTn6+uV4Z8k+6f+QOen3lYcVi4keQWcvwMKTBi8Qqq0R9GTMkDKLQXLh7TYjUtxvUbw==
X-Received: by 2002:adf:ec8f:: with SMTP id z15mr17961674wrn.290.1550534935064;
	Mon, 18 Feb 2019 16:08:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t18sm1626860wmt.8.2019.02.18.16.08.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 16:08:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2019 00:08:49 +0000
Message-Id: <20190219000849.6177-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
References: <20190219000849.6177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] mc: upgrade 4.8.21 -> 4.8.22
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
X-List-Received-Date: Tue, 19 Feb 2019 00:08:55 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/mc/{mc_4.8.21.bb => mc_4.8.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.21.bb => mc_4.8.22.bb} (93%)

diff --git a/meta/recipes-extended/mc/mc_4.8.21.bb b/meta/recipes-extended/mc/mc_4.8.22.bb
similarity index 93%
rename from meta/recipes-extended/mc/mc_4.8.21.bb
rename to meta/recipes-extended/mc/mc_4.8.22.bb
index c6a4500b8e8..f64effbce48 100644
--- a/meta/recipes-extended/mc/mc_4.8.21.bb
+++ b/meta/recipes-extended/mc/mc_4.8.22.bb
@@ -9,8 +9,8 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            "
-SRC_URI[md5sum] = "63d2b90e2198ee79d08eb4a8989220e2"
-SRC_URI[sha256sum] = "251d9f0ef9309ef3eea0fdc4c12b8b61149e5056bef1b2de2ccc7f015d973444"
+SRC_URI[md5sum] = "29983a215c96030f06d5b112088ec5dc"
+SRC_URI[sha256sum] = "8d9f1c75369967adfd317a05fef9861444ed049b033e4debaeaafc6df218b431"
 
 inherit autotools gettext pkgconfig
 
-- 
2.20.1


