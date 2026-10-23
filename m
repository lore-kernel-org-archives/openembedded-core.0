Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4436.1792752615266435777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=WgstOe/5;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=BOAwW2dO;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9D9701400185
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 23 Oct 2026 06:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752614;
	 x=1792839014; bh=WqeLfn1pw2iEeh7+5LYRUkejlYSPFkV5mjzhrV/ceEw=; b=
	WgstOe/5tHBq1BkH6qkEG+tZDzSzVgx4HIYaKeAUemYABmXJpK3v5bPt7KfKY0KA
	nRjNAJ5wQ6XBpc9SwcqD/ksX/AbFuo3rbC3v3GdPJZvoL9uZg1P0PB662ZvoODGc
	Zd2JHEFgSFepyHfclZEJWH1Qp8n2yrPVIYWq+/TzRfBP04Y5MAGUnXjNlC1iMzdT
	yTQf/XndLGcCaW8TCR6DpFunK7SyVvTcQ3s9tNxvqH85uErIUPLSb56mcj8ZvSmk
	EC37sbcVsUBBu1pcN8dBDlE9kivhFjLUTWLh2G7CoSpv9LFoqQIaDcW3vRZ0YGf9
	G05pxIFqdHOd81DaJNVOmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752614; x=1792839014; bh=W
	qeLfn1pw2iEeh7+5LYRUkejlYSPFkV5mjzhrV/ceEw=; b=BOAwW2dOy6qBlk0+6
	m2PkVyr0zAbr13di496f8dpflxsPQn6SDCJdSYR9v6l39LqCGKX9dawdQxL2wp6d
	OovqasHsFTvK1jzkoG99pQ5YcyUx3U5FuRt3vgZ+/IGrXMmH6iX2TrgJiiMX7YcK
	62xznn6UjQ4SICoSSVHH4yFgZLtA2aEeOP5fYzoJrzOT4zEoNK4opCibCTAu2NnU
	Ptgkn4YqhLEM+xiv+CpEhF6VwteMjjqmUyYgxBQthI57trrrYMpW8LlEtf4p5j0t
	pYDTDjazT2RqaWSY7D3LN7DmjDCaNvM9PX8/zARIsa6fOe89F7UxJvz2/waXk74f
	4d/1Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752614; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:aQTseOsmJaPKSDKBj3ZYRFWGIjmaQKmMnVOwVDsLpR5tWyy
	hCEWHuiUVsqDl8iuba5aqypsLlQj6p4LftwBUraz82eNIB/B2aoI4AUt94mrdMFa
	rXPCFX0WRWuLEtHjaIglc2hgpJJVfnbo+rkSa5C7usEM+z5mX4PEoGmX/BJ7UuvZ
	sK6FSWQ2rNpdSFFX0HEpdR2xnb9gMCZJJAPZGjDA3HK8gaQqIhYBQmoVJLOAV/2r
	nK4yLdHkaCS2UrDFqg4mvuchL/13mL3e456roolyO9h6bAl4ubfa9OX69POBqyz+
	itvGCP/MnobYE4KR314f1lGDK+GHmdEwe16T81g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:GBgejr96mcgi6VCVq/n2YGFwle+8dwPP7reY8Ind79A=:B9jLivHGOu79Yx9b8uzrz6l35oiAV8wzuOTS4yQgBC8=;
X-ME-Sender: <xms:5jvbauLDqNAFiODhSIjW8gIaUWTsmEZmgv-qF8sq2-mglYygBbFTWw>
    <xme:5jvbatGH0K7pgaU3nmi9o0ilm0bLSsIr-WKDvJTKOp2UtlXZC9_wWzE3qxchtfkMC
    wmoCoTIoqXRxVKNmDR2DT1P9KcNU-xYkKO1mWjvth4EuEh961ByF9Tv>
X-ME-Received: <xmr:5jvbakUFnreb4MmBwtfIq4iP5j1CswpcaKWYdvuiFBUg3MnFGYOO1DSJcqyuVhEDJQaxHXZfcsThP4BY5a7MZWCgPbDQ-0g>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWI6
    iDTaSybuYB2Rf4i3g+rU3sPHYpqqhkjx6qO6iiXIP9T/njNGykzCviVctPlc5ue0CwvU80
    4llqTPBtkoBYSp9jFXn5ZE+xuP2E3S5J7E2283D/jxpVmXF537UlNZVJcVopPix94KFsWC
    1aTIwF8LHbFecSNj5b6KlOXk3HuN4XYMV+jGye3awzxir1rgLQX0o2FWToPAkSsw6YhAYn
    twqXpywsge5jlm+ipl3jICEsZfHfUvWMpm8V1KvEVgV+7Zs2d8L6DMaPzVlsphD0TF5JaJ
    J3NAQAHMwjzVQSPyNDuy+94XggJMX/5zNWsy9pqu+wAGk3A9RRN5DMcP9WBA
X-ME-Proxy: <xmx:5jvbaoi9FUFTvljEmZnKmk4yWjZxgcSGNgfIwadgDI4GdhdLFbisYw>
    <xmx:5jvbalTYDonvKZe4Z5brfUsIxk4BQ95oN-ISEFQlDKeaG2WXV2nahg>
    <xmx:5jvbarGAyLjz7BSc8LxSVqhhJyhnXprzwqgz-AMsrgftRpMcqamGIw>
    <xmx:5jvbatnaKAHG96Ux2Q2iYXIV_jwijaLWuDKdapY1IupcpKuhrQTQTg>
    <xmx:5jvbasQP5LmkLGQbZ39CGe3Iu2Sm1E7q_gofUpYOb8kqa-sZAvEcI_bz>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:14 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:10 +0100
Subject: [PATCH scarthgap 09/19] python3-certifi: upgrade 2025.4.26 ->
 2025.6.15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-9-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=2142;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=6zlLbhjuAjrOWzeTlBr6bYWmJTAgIGH+YuQw46+jLCs=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgE1cT5/zGFgPZwqy3SEXkyRCiHU7d8ZYQcG9Ee3l4p8UAAAAgQjBUel6I5lmuBl
 LxkqhDBr4eiTVzIXs7IHJZmV7ticA=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248526

From: Tim Orling <tim.orling@konsulko.com>

* Switch to PEP-517 backend with inherit python_setuptools_build_meta

Commit log highlights:
* Declare setuptools as the build backend in pyproject.toml (#350)
* remove code that's no longer required that 3.7 is our minimum (#351)

Comparing changes from 2025.4.26 -> 2025.6.15:
https://github.com/certifi/python-certifi/compare/2025.04.26...2025.06.15

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa38fa24ad26f8bf68fd139b5e8496144987326b)

This is a slightly larger change for the stable branch, but I consider
it safe. Python 3.6 has been EOL since 2021-12-23, long before the
initial Scarthgap release, so making the minimum Python version 3.7 is
ok. The other significant change here is the build system, but that
should not affect users of certifi. Then we have the usual GitHub
Actions workflow changes (irrelevant) and cacert.pem changes (which we
actually want).

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2025.4.26.bb => python3-certifi_2025.6.15.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb b/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
index bedc3d253c3a..c8484425dcfb 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.6.15.bb
@@ -7,11 +7,11 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6"
+SRC_URI[sha256sum] = "d747aa5a8b9bbbb1bb8c22bb13e22bd1f18e9796defa16bab421f7f7a317323b"
 
 CVE_PRODUCT = "certifi:certifi"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 

-- 
2.43.0

