Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4482.1792752620045528996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=psNP8O2N;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=kBdlZN9P;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 677E2EC0067
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 23 Oct 2026 06:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752619;
	 x=1792839019; bh=EDSra1Z+xKWdzvIwuYnlJ6alfRMxUUVlxFSeZ1pKbmI=; b=
	psNP8O2NFiuvNmMc8WWvWBNF1luErhpXty1LFriE0/HFIEaBE6pRol/wdnpuzzIF
	uZ0OR3/+HgOQ1fv9HSvbEae0buOxvpfaSmAJ3tNJYzNiYdkx33cH3N8CSQhpQk6M
	8zR3Z2Uzov0qcU2UcC9GWu18e8Rk4e/SjiQ9sUk0MCBEAuuoKXw2sq1t+VLB4wP1
	eXomvRvLApGKIKnKM8g0biZBpQ0If7dBk2yKMljm4eQzPoOYHQWouitEn7ZijFyK
	f1BRCcfSrA/04x2FyGp8Oo+vRxkoF0Ad87D4UcJGS4ugKF8KONXnULLn4/xv8ua6
	2ql0bE2nij9F0R1SS6w4lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752619; x=1792839019; bh=E
	DSra1Z+xKWdzvIwuYnlJ6alfRMxUUVlxFSeZ1pKbmI=; b=kBdlZN9PcKZBitpQv
	jU6eV4CNz75MlepdcrW4mlUsPNERYGAgLbmv34XYU7pOf6VHVSEaQjh+QXjonLzm
	PVbCRDr2TD0DtLFRLWtRoKN2p42YrbWhmIeC8aqAbvrRmxxyaM5TSf8/OmnC7wZI
	bVmMm7z/saBdzh1Pbr2+lzT4qjTIzxZSRcADmducWAv5/31HbY5a+Ix+LmJinNQI
	txiY6vPafYKZT7CgLqCtyE8SJc4iY+Zw5bY/sDMVfefLrhymswgDZeyLtEHy0IXE
	XhIDG5TJtkqBDWFGJpJM3cxABJbVQz1jEhd4O2G/1/QGFptYM0l2qGYTeIyUu2gk
	osWiA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752619; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:aRLCPtqF3RAXby3rrDouibn0YvTboUrrf0YRmLtjWvfQyzV
	xXIWWK9M2sEPR+iGZ96zG1bVuQFd4fokrssIovBdCb8IHTQlSoKLQ89sxwAusQRw
	4GueoyEF8bDy41DWP2DwRBR/yuOms+obJ+xAk7XxugSV55We2EkXaTbGA1xJWzTR
	SvdIffYAjgHwy7r28vxN/xpFu3k7OTLlVaKkGFgi1Y5HDpkWtqRpMPNmBrF7Ox2p
	dmuHxQNC2dsA803Fn3WV7jIAt8OdA2ZwoR0UX0WH5vi0hI51po5pteMBPfPTnp4S
	JgsD59dtw+hm1zaRljbA1tCNffnK6hggH8n+7Qw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ixbUGJCOOW9lGJjGWczhD7zJCQO871eWOTNHqkDixEk=:YmwkaQAx66vjsqKZuk7IJeZfLqKDjoNKRMMGP0AnVB4=;
X-ME-Sender: <xms:6zvbarMmbcXIw043hdyB66xdNPs0NtQn27GEH1nH6SfgUO0TdrcTEw>
    <xme:6zvbas5g4q1Nj5Y9WCO8qYqtgJF4-jGDEL645kaOXqCPiJzTMUeGc-U40v06qy_b_
    oah6PQSdK8EcfcE8SqsL-d8ww9V9n23wn7AT26KM6MTAg_rev6_rCOt>
X-ME-Received: <xmr:6zvbav62Zsq2sv38xkKbNjfK8t4je9uY5JTY-RHRSKn-C-GLlpAjrmI1WsCwCzVp57tyg3RPt5lF23wtKEnLi0t66Un4uPE>
X-ME-Proxy-Cause: dmFkZTEBELf2CrgbDyOApEgf5rLEo4MhQnIS2lhf36n50viSXIdo92ws2ODPOgHjVFBhP8
    rgpLUvCHjW5yIB2bzCGQah/YuatmWBu3TQxqfM+7+zH9ivS0cJQMzksPVZAnEH5RV3Zv9d
    vOHLa+UQwchSiYYjcVl5sRJCRE6z5x4G4o/K/TL9DIdY4GTtqJoglfj1UJOAeyNBsj3b1W
    OU713m6DIQDJQ0Mcf0F0zN5bG1Sn7ACha84gflNR5GK+A1tPXYhqQRJ7SX21v3l4/LUQqq
    IQ7MsQWTwV+M+iOAkyHlVwfnLj6SW/LsYZrKIs1PDWey/VAfG4dElam8+NOJ7qaH3uNDM9
    7oEZyZ8Dmbb/Fv5cODcdnTD46F/fqsVQDgdtL1UASGSXvL5isrAdpNBIF1QkkKIgyaJf8w
    qOWU4xGpL0GZZYOckEBllMIdhuaFVEVS7M66kIkYTc23ROyIC5zmSpxgkAAg5UnopcEli6
    mLX+5tiIHJfJK8n7x9kt0TPrC/mOvF7+uwkXw03N8c5VfnLjoXFOxbJFdEHbiBnKJb1VUD
    b0dpsuZvFxZS2kdQ3uor8Ppld/dbYSS0LAOHNPowVwSRTc620O0KxLv0eOiXV6SDudgsmB
    AW5ebSY7y7V8SaO4wdI+802iDq1Lqwm1NTj/eaKH5LJhvO65Ek77gXSvjNlQ
X-ME-Proxy: <xmx:6zvbak2fwdQ9glso8L0213Kk0UGAr1Rt_kmgqOkBmbKbRzee1Oic5w>
    <xmx:6zvbajX3sM3B5616j-1uawzh8TFiZTMjyr-Hl3HfiifTT5S1EIOjwg>
    <xmx:6zvban7M-S5tmBFgS0bfcG0odLqcRsMHfsx1GXt8Q5zANaEXNTwa5w>
    <xmx:6zvbaiJPPEURppm3K_mAd7g8WWawIkxND_229n4aFW4i46M4oVAB6A>
    <xmx:6zvbavNBwXRD0-urZCEueS0mYRDXjN3UYup3W_ZVbb5frSua540iuA-T>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:18 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:20 +0100
Subject: [PATCH scarthgap 19/19] python3-certifi: upgrade 2026.7.22 ->
 2026.10.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-19-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752609; l=1367;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=gtBBZ2AEKR8p0UH8sSKmOF7bPvhdA19YjAevrvkPO5s=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgUAFBuLWM6ZtnwnkqOpoPOad5kjec2ZAYnJG4ktL4jtIAAAAgQiVoihPgQaR7Sc
 aKUKXm9qs71D81TScLrA5zcyJ61Sw=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248536

From: Ross Burton <ross.burton@arm.com>

This release has just one change: it removes the compromised eMudhra
intermediate certificates[1].

[1] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99c96202a2c9aea84f5ceb267a8c63c0cff58b1e)
Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.7.22.bb => python3-certifi_2026.10.19.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
index 539d8e9003b2..749894f56ac9 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
+SRC_URI[sha256sum] = "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

