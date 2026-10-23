Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4432.1792752612322997922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=T5ZER32e;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=R/xelrsC;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A8B42EC009C
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 23 Oct 2026 06:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752611;
	 x=1792839011; bh=LSwdW4Pdoo1pS7cGWZCd1wElaJxydII9SgENyI8pug0=; b=
	T5ZER32eCRDJR1hxXzxmce/6C+hdfal+icaGw7DspYI483XD0RZHAPG0QaQPQ08T
	k9DcccJZFsuHcfwGtPigqzaQ5xbBI8pMfn9uEZ7U0v+yzVCyRdObC7H0omidFZyh
	eNtGSCv9SLlTrMhCOaDhj7EE+7tr4+yuD446uq3fQC4ykjo2Aq+3MFmRJ/p5gSHd
	F9Meisq4z0iz4V6xIbmlgXiigbDRr5dAuNfaRoyYDhIVDwfEv5VHsKcIlcFC6Uo2
	fzTNCb3edDWsX1KcM5QBHHfm7Oqlx/mSsYOWfIGfoPzaHdnGA/zQBY+Zqihargqg
	J6JhRO63w8fFJ8/SCcxtvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752611; x=1792839011; bh=L
	SwdW4Pdoo1pS7cGWZCd1wElaJxydII9SgENyI8pug0=; b=R/xelrsCitnCsBrX1
	clG4GHljH5foPlwYPcdfs/5OJlz0dkmSXapbcxceNXz57yAC0TrV6JHTvH3tazZs
	9tQ5u1NExjFJdsATdK2/iBQP1haBGEfXFpe6Hu4r0PFoW5eX6vtbi0wX/EbSqWNM
	E8Dh4m+AIl2xWy2GDqukd2blzW9ekBJylCQurOXeJmES96KMmYfpV7owL9IeG4ND
	xYXaFda8iz2CU/x6LkTGa27PZSakKbsycqgtBddpbLT75IGbyYVSLcEpmBO/eJ9A
	b2mKbS/42vQ2ySpd63QVw+CgbsKJT702LghIjhKadZUrJiggG6663XI5N7GRwwJt
	Uw5Qg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752611; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:DpaE2vz4Mgy7NkuyHn2fSj5E+8LnUc+oLMYjjlc+tjrKEOP
	/xOAiPeFNAMOKj7T5y3HkF5XZ5Vc2E5IOfFoQYCjTrKFBhFopUHHgtie9quPtEAV
	WUM3vFsD60WwHV8nycbwwzC0riDvY/XNF+FsWteJBSpeLX3/hcbVmy6S3rbhQZoA
	ICwxiw8pw+OaSiN923fdoUG6aweMA88+kV5Fd7cDQjBq9xNVW6jyUe2L5yi5DT+/
	Sv0jFhNRqduoDT+lXp3HhcuteFSZFztSi72G9SuzD1jhlDrmIFdDJzUBtV0x6zkT
	K6Kre+2Qh4OEcKYrSO7AarfsR9K2g/02Tlhd0mw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:n7WMUug3zWwRYROwmw9tS1VlYFFrhnXjGTzRgo56WIY=:cFef6DK8zqYXADmlnJXkZkqj81SwKIAAjp+LGFARx/k=;
X-ME-Sender: <xms:4zvbaq5dHECgDNK3nqHBcgVt0fOPyVnmZSGevtHtEk-EDCZ-Q7WFMg>
    <xme:4zvbaq1LRq_kVVEe0v82mC7hI2Ino1Le5y9OzPB7PmG0Hx34dsE8dAWwITpUB3S1n
    psM36d6WmxX13S9sTlsqhfZQ46A7QDt0GHr6BCzU_kJ7Yy2X_DunWfcjg>
X-ME-Received: <xmr:4zvbavERig5tmEa7H__SqQ_6ubx1hhhq3XvYl-1idFmYR1aHqxX2dUdTTg4uD9aCtNSuXFKasqcd4_g6BGVVTDPu2pwbDfU>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWTa
    9x0QnovirxjAVUn41IDWbQA9qq+lnf8Y85kOxEepn8WxW5TNS56I5lJVpaUZmGQNEcuXxk
    uxTP8ZV4NDpkaFN1NyNaLXTLmP/csoGaxiZvaKNzW0ETSCulbPsnGhdl3x5GUGRJssVzeF
    xQR6udILvh/HK3JJT9PkeayAFbCMUJMopSmha/9tqnEFawc5tLBmwClY2ihjl9KmI6nnTu
    BJtYzbcBhtkXh+E1Mzh4BtICPOuUuOBaYwqbAx5RnrkIPd+z9s/0eFK8XXX9PPYHe0npMz
    i3wXmTrUcNjEvSzJJQDUXLKebDPtj4XCU78Nrk12kypXXy3/dl8FzEOC61DA
X-ME-Proxy: <xmx:4zvbasSqiS2t8T4agFPPQ8fNNKGjG5S8vjOK0bP_YSKV2_cDVZMfCw>
    <xmx:4zvbauDC3hh2N4oU-s4ki5x2Wy_EZ6D2A8qQaljmMmLBsx4TguW4fw>
    <xmx:4zvbak0mGWIMmeQpSsZohzk9M3aNJFUBCX5t7iaL68-RHqoltO3Llw>
    <xmx:4zvbakWGGYHyqHwRpcyDK8W-ULLUy2rcU49KD3RRgkuo5jSfvPlmUQ>
    <xmx:4zvbapr1vR8QQc4-ChmAe-Z8qo6_nu_cVwta8pTmsmPT0Wcc2Q2nK4ku>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:11 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:04 +0100
Subject: [PATCH scarthgap 03/19] python3-certifi: upgrade 2024.2.2 ->
 2024.6.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-3-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752607; l=1531;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=3U55rfcO21zBd60LFsIN/T89Cs3dyEebq86597w7f1M=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGUAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEoAAAAhAOLV8/5SWTbIu0qb+wB4gRih5brtkgfrPdK1tuUU0FXGAAAAIQCKrB+CHkOyn/
 L6vSQ9rsiV5bPlloM3x9qsHuNuOE9a1A==
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248520

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/certifi/python-certifi/compare/2024.02.02...2024.06.02

* Various dependabot updates to dependencies
* Test against Python 3.12 stable and 3.13-dev
* Added 3.12 classifier

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb2d7da0aa8df7788db1ee15b0f8af8a88c09fa2)

This changes GitHub Actions workflows, cacert.pem and adds a classifier
which is safe to do on the stable branch.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../python/{python3-certifi_2024.2.2.bb => python3-certifi_2024.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
index e5325b1f12b9..e0b2a4a8d08a 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
+SRC_URI[sha256sum] = "3cd43f1c6fa7dedc5899d69d3ad0398fd018ad1a17fba83ddaf78aa46c747516"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

