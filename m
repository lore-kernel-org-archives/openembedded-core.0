Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4441.1792752619034958762
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=ByfsNV9w;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=FBFY8pUh;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 621DAEC0067
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 23 Oct 2026 06:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752618;
	 x=1792839018; bh=pC3KnKjd/ztaVAXYFUYmA6DsSLKV2AzumR8oUDsLY0c=; b=
	ByfsNV9wWg8YIqX6VuCDPAXHMTP+QaIWr57sFHXCDWDXzC/xMjVgXzuZF9x//s2j
	a7kLdAaDuFOcymJDgNGmN+Pa7BIhilWDDIZKZjlfEc2cvGGqtYUqDPMOrVItGbDv
	oyjyET4wewsUZq+JxiK+RBnpNgg+4HeJ6GN+5uw6JECpy2SkPQSoSy7hiLACaMB4
	PgpjWQj8BV3yB6XeXlzEAKFV80pqWVoJ5VJVAb74RMM9kzWaZNzC9+PUFoiK1rvo
	4B29Hg3zTTfaHpXGMufhsrr6wJLoq3BY3tH3CwuoSTUKvtQ116vC5NP0jKlB8nSM
	R/YPr2iBw2euBO1jWtAwLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752618; x=1792839018; bh=p
	C3KnKjd/ztaVAXYFUYmA6DsSLKV2AzumR8oUDsLY0c=; b=FBFY8pUhla2rYAuh3
	0B0WRdaSMp2+UoSQxU354nxYc//zKnfjBSTJKMT3EuftWksNP9pAfHv7S2RLhMYL
	m2gR+7wvly2tguBg0sZrtzO+0Bfg/CCCEI8rz3nv40IbszLAG+CvTfDCUktjROyP
	aFiVdXvpgu/HeWsEGwJULmbnuYmymHJtGcgcFIuVtLNW0eULVOzwTSHIeHHz9XFz
	8ECEUf2oufE+7BS5/YuKXmz5oITpwx2Ga/JwUXrCFKYgyhFhL5ZI/ZDToYc7B/5d
	56TpmaODaZ2tOqsGZMvB+eW5zyfNP26F/Vd8i6bnq1B4bPsNn1zxnuA5sQZD6V/r
	F9Adg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752618; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:K9xYaDXZ7fCvwLfERxFonmm31tEgoahyPyjhLJwxuNZFLqE
	rzlDgtcWuYDrJGAIYVLimAcCKrqJ8G/Hdc/3e4pVR4+NkODLIgPhb2GqfZqQzE4y
	+pmGqKD4sPikMXF0nc3/eRM6JAcCkRZ+iFanJfMMPUTF05sQEmkR9fX3F8fIH9vL
	8jtQ+4RNDVE0MHoL0WlXtDLH2Mqe1ktJbxtuSzZUM1Eao4Aqszb5efL/nIVRGFiE
	UFSpTfEJPsyZpBQfeAfdzxB3E7sf0ZtXNsbEjc3PuIOKabTbvqGpvEeLLEXpirQa
	ciiA2YYMei+gTuymB3u23u3IMaYuPwxoVwIgUqQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:AiDHmS3KKf5tqXPM0Xx5wgCckMNttgBDOgKCnfyb3Cg=:LskUwH54M5HQpr0Tx5WasGoYAzjjYc/PlAhEvBIgJ54=;
X-ME-Sender: <xms:6jvbavXjWW-8xAHN062ug6rCDULZt-XaqYWCmJfZUiV5vbgibJmcbg>
    <xme:6jvbauhBkG5B29wRA21sh5ZwzU0CDzH8yxK3wNKsdkRAiV36G_wMSau-tMGvdTZD9
    8UpkEFEJmRRu7hBybk6L3Cn7NC02atjU3hxRfwtk6r3o6wC73SQ2ab4>
X-ME-Received: <xmr:6jvbahDrpBybPVIXqJrpvZHzeM48KgO_17BA3B6ytgBHRJ8llWHoV0ctxVSxSZ-4hSL6uzWnMjp3v-JnHYeJYFibCD16vmM>
X-ME-Proxy-Cause: dmFkZTER2m1YIMQ8eg4MnNIsZi4FBhMIWqS+ZbVhuw44e/27Tf4AY+BIRzUquKEjhnhqTt
    0g6mNqv1U4MXkuCVTEXHNpw7k6cApW8LB3Imp3g3tgBd1M7lN1nyNBlZ6ljZ7+w7s0kABJ
    OV8tzTnnhZsHV87VOCEnnZFbKd0n7dJt7inA1oB89LeOnbhKaS7Zl7E4arQgdppveXVqY+
    /ejNy2IbeLlV0yWnZ/3utWpncsMkMtxPfg/jUWMsYZjsi+TmiqBcjObVWshyFBAv3oJQ9F
    JgGzmA7v5p9VzUuc3bYY1CVs5RvcX5e8N3Cet7kuxRSynSJadNIj13L+qM6pWAHS3btCmP
    bz4w38Ne6lfsA58qnAh0csJ9ODNUsBMUxQo0DumBlADWAcNext1nrgp7lOdOpdNnp4jvB9
    MLU+ZIQ4s1viMlz/gEqFvKtLi6UW+GQjXmBz+hkLNA1m8a8e5Fkxxo1fJC4DjeIU9e6ePl
    Qx8WSakwQZMwvakqbuYqR9/RbKCdKEDnYpGMCIn9SThKYpDbGNYgWFij86hY4bCHqC7IJr
    cFrdGh3JB13F+32tAJT55KLoBzcYPZI0i4Lwqh8VJ+9kJgjfpurQd2gFiXilOMZ5pspYGS
    Zwd7hS0iu5VkL2XkO5CQbp19lanmAXP3dIyNKn2OSHdGOqy4Wk2RgOqPpTIw
X-ME-Proxy: <xmx:6jvbavf2nVgkPFChogeBmP1envy7Qbcri1htyS2RQ0o19IQofIfikQ>
    <xmx:6jvbapcG_SVJvpWvm9qH69dKsRGYdgw-6g7QaOjB2x00__d7MwWjMQ>
    <xmx:6jvbajhlhke-itElipRph0_TfIZJDFF4JWvCY_y33ffHFoHBWOqJ-g>
    <xmx:6jvbalRyyCEY4HVio3ER1z8ETqNMp-qo-3Z9fEJWnbQctq_qOVXc5A>
    <xmx:6jvbar3Q9S-TihFmnQpzd7KveTFmWoZlompG_GhyTEo2ZSR8fAKQAUlX>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:18 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:18 +0100
Subject: [PATCH scarthgap 17/19] python3-certifi: upgrade 2026.5.20 ->
 2026.6.17
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-17-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752609; l=1673;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=9zIUhsiJao0nezmTeTA4Q+Ys8vQ+fk54Q8a6uEK8DzI=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAhAMN9ysFBjiI8NMNcdXdMz93VEfjgoZWbs0iNDiwD3IS4AAAAIBAD/M/E8gx84p
 hhq6X9TjJ2IGqHuanIOPA17ePllLh5
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248534

From: Tim Orling <tim.orling@konsulko.com>

d46de62 Bump actions/checkout from 6.0.2 to 6.0.3 (#417)
6c183ec fix: update Requests docs link to canonical URL (#415)
36e3568 Bump dessant/lock-threads from 6.0.0 to 6.0.2

For full comparison of changes, see [2].

[2] https://github.com/certifi/python-certifi/compare/2026.05.20...2026.06.17

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3eb9f2ae9e887dcb70cf3bb6e284c0f861546c0)

This only changes GitHub Actions workflows, README.rst and cacert.pem.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.5.20.bb => python3-certifi_2026.6.17.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
index 6794924b1a7f..8fc48ae75916 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
+SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

