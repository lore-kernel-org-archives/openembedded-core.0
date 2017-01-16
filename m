Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE02E700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:15:52 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 19so3496787pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=CSbsnG3X9TOW6Im3agGiDZ7UHJamuGq2tsd4azHQi2E=;
	b=BQzJ3WLiylSPE2rKueyf+WyNGySirpc1DYYyesMmmBezYhfXIxTat2vONwLu/Q89xq
	jczL2CRLFiNm9KrBRxMiM7KvRY9BoDr7mZV7soQ7/dtLbcZCOL9fD1vzSOd5ngmbajrb
	oYanEGvpfAIgh/T973fl7qV8UrYrie63li6E5VNeA6pEfp57jTNJEC3RPcE3FLsM7+JX
	cHqM8xdXXn+X8EcoXpJr9pTE4toKrWMrHPw8eXinHgtfJceoU8jUHsgzxJe+0fetF0bY
	b8GNSNthKVIkOlVXSeZq2l7opIfXdks0CIHOgUe8eq4IQR0srbEKFEZ7VBvgTpN+1Emy
	L9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=CSbsnG3X9TOW6Im3agGiDZ7UHJamuGq2tsd4azHQi2E=;
	b=tCiJngdQsGi6YWlwZF3Fdconx0YJgC1VaI0gSRj3DbMhVvjz9dAQCdQG5RIz9oY3Um
	2dMzUe1n8FrNy0vSbQPV9KR1JYPdgXk8fikcadejg9LHWTc6TMQWNiL4uebjBTclTawU
	0rcdU25cSS7ln8sgpMwtjDCtTPtUHlX/J7nFWvexrYnAHmZveLDZQvejY3MuA7qbBbIO
	J/GH7Wsz2iiT1KbqpUhsiA7ly+7bS75WXV70QUoUX0B0K5e9vm7hF/pDli9yLKNf0zjm
	X48Qs3mzPZkHcVz7mE7ltyRXlPCVPCg+k0vGGcwYlQe6dF8DWBNP0P5gA4cTj6vxo33o
	rIkw==
X-Gm-Message-State: AIkVDXJAVh8nrA4hvVSJRzEunSkA+9Y8hIC1A/wA/8AWzfRdf7WrhD3m0qyi2TkIpqJKpA==
X-Received: by 10.99.164.18 with SMTP id c18mr16746076pgf.40.1484576153448;
	Mon, 16 Jan 2017 06:15:53 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185])
	by smtp.gmail.com with ESMTPSA id f5sm48493443pgg.5.2017.01.16.06.15.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:15:53 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-4-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 4/30] bitbake.conf: Add '${libdir}/*.def' to FILES_${PN}-dev defaults
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
X-List-Received-Date: Mon, 16 Jan 2017 14:15:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The *.def files that are populated in ${libdir} define the list of
exported functions for Windows DLLs. Whilst *.def files exist for other
formats they are not shipped in the ${libdir}.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 40efb959e6..5dbcf5c441 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -301,7 +301,8 @@ FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
                 ${datadir}/aclocal ${base_libdir}/*.o \
-                ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
+                ${libdir}/${BPN}/*.la ${base_libdir}/*.la \
+                ${libdir}/*.def"
 SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"
 RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
-- 
2.11.0


