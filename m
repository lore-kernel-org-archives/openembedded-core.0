Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id C59D670684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:51:37 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so770542wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:51:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eQ1ZGN2zDhwL4eCz6V77BYrFDbDvByUfBV17BMCIkTY=;
	b=WiYjAqezrWo04ixuRoqZDMIbby/qTQxexF5OwO8zFYwdJQQSlHWKX+WILDOhRRU6yE
	CpDzE68YIbg0nKysCihb/uobFcr/g9+bckFBu1h5vBivPR5FfXClrzdBmGsRZbkJvREk
	z3YY+Zn8I5kkXzD7sie98QGfSY37HY0xTH1prBLB5bQwK/VyA1r8pDegqB5QsbIDJ+Vg
	oofyg1lMk6Tj6wWsjdqJPZWKd2jH0K6DoFOAKyneEnI2mYnjHzN0UfE7mU7+J/58TlBh
	7rXcsYkH+C7pIZqrDXghFGpNAHt74mu+OmkW7H0dIMcjNdcfmeLAiNMIb1aPhq4BAzGf
	HUDQ==
X-Gm-Message-State: ALoCoQlKQzMrk8wmS1q1xnhbApFSfFPvOMla9TZ7/4zoMJf+IYn1ONI0fUas59Lw8RTOCdCwVEFe
X-Received: by 10.194.238.6 with SMTP id vg6mr20308999wjc.24.1406285499071;
	Fri, 25 Jul 2014 03:51:39 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id p3sm24251565wjw.13.2014.07.25.03.51.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jul 2014 03:51:38 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Jul 2014 12:51:33 +0200
Message-Id: <1406285493-10266-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] wget: fix build error with gnutls
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
X-List-Received-Date: Fri, 25 Jul 2014 10:51:40 -0000

This fixes '/usr/lib/libgnutls.so: error adding symbols: File in wrong format' in do_configured.

Reported-by: Jack Mitchell <ml@communistcode.co.uk>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/wget/wget.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 386e3e8..dc46841 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -10,7 +10,7 @@ INC_PR = "r16"
 inherit autotools gettext texinfo update-alternatives
 
 EXTRA_OECONF = "--enable-ipv6 --with-ssl=gnutls --disable-rpath --disable-iri \
-                ac_cv_header_uuid_uuid_h=no"
+                --without-libgnutls-prefix ac_cv_header_uuid_uuid_h=no"
 
 ALTERNATIVE_${PN} = "wget"
 ALTERNATIVE_${PN}_class-nativesdk = ""
-- 
1.9.0


