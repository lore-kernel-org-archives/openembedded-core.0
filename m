Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4434.1792752612826627648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=RCw/Nq6Z;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JVsJgPql;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2FFB41400168
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 23 Oct 2026 06:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752612;
	 x=1792839012; bh=lADe+ksXZChnzvMCyS4wvi6E0B9iIjfOJpikxJ1GbmE=; b=
	RCw/Nq6ZmEcUMfrP3I24M4OHaS4sV3mlJfbZki1k+uX3678D7dgvXuB5iWZIQDq2
	XOnkZ+XKbEFw7gE5eVcQT1JSE4pWHBu5QdMKyLGsicBoAQs0NOYby1pnmRitdaDH
	4iuaqP4uRymtV+FZhZFLriiwWHeF8IvU3xwvs+fKUHnZOxInRIMO3ryTOYcS4QkU
	vdBPvt0AXGwKiRWxJGpxfd56bvAcgs19Wy58BzqEQImA1jXgmgl8nkWWEuYXTAiC
	LbdiJI9DqME4aluSG+a1Dy0DuZQVV677RIzliD6cetqFo7Q1ngEEFzVg2h6TRltX
	U3bHkwko/3eOT8sAWMPh7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752612; x=1792839012; bh=l
	ADe+ksXZChnzvMCyS4wvi6E0B9iIjfOJpikxJ1GbmE=; b=JVsJgPql3OjpyQw6k
	lJ4kImcq0k8Ax4GHE7XuIO0KNwXjhUP7jQZ/iy1K3dAC6z2sXIA/Cv8eTmxdi7s2
	oQ8NbXEpCOqJffUVyEcfRGkemxf3JIyQ8Ws/9uyycsrSsd5hMaWUVwwgKstsmxH8
	LmebBUMNZioOFq+ji7AwKYfO17cpsR3KzTki+mEufVlOtEZodBaC3XGLEz7HIb6x
	VgFfSZ7udmdG6zw2MXgkjR1IXN86NGmvsy0DCNbwQ/NNwa5q6eTG4v1I4rV+em52
	zNf9QZdxBluA8sx9WF3lfy0LxMylDU1K37wO+762kr5bQ76C2IIKbg7sHpObOYoz
	tes0A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752612; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:eqPssK1l+zRzUeraFMe0I2D+xsZjRtIrBqZGuyfbSyhXZsk
	QqrpDJJrrPDO/Nfgm1+9yUqxnNi5f9t7Hggnmvn8TD2Pagc8q9pWlnS0Q/i1WS9B
	Q8m/CviKc7Msebmyui7YlHvmrGxDWyZwJx4TLMUvLq0wfOfElAFG8XO2HV4J+kKN
	WL+FP4dWk+vsFn3LBXR7SKfm8IYu+BrwxKR5Wb8eKdDLSWyuwIfFA3BvKkZzUj70
	mBKQiE/cbKOMC9RP69ml/XZ5e2U2uG4tuBseIUTe/iFs+JGLL0oF1bMHtc7H3P5F
	5Z+C+jDTUd9pAoxdJWYq1qe/1erZ7u8VQqSipuw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xu6cYwazugfwz6ikZ3v7M18zLXiog37TcTIHUMl/Djc=:RWLPRyhByool9KwpBvIg6aeCN50++z2E1lUXNrQy5M4=;
X-ME-Sender: <xms:5DvbashU0RFN2Yg5D2nR4i53jKbZoMXCMxMoOny800ndCS1ELcESxQ>
    <xme:5Dvbar_dTOfO0qyZmG01ohQa-AW7PX4fBeuhCdPsDuffdByLhZzsGisL1Pf3UJAZT
    wT3OEth__tk4yCIEZZpqfQQSln_q7pPmKPo-RpZpJZBS8mnSIx266k>
X-ME-Received: <xmr:5DvbaptvKhWrOthan_xTVgXppWhRAaYskYnIJN6eBRAKR_9bTx2QtJKtMjq4ynWggSCnH5WsXTNCxi3N39uZ0I2m2jTCxsA>
X-ME-Proxy-Cause: dmFkZTER2m1YIMQ8eg4MnNIsZi4FBhMIWqS+ZbVhuw44e/27Tf4AY+BIRzUquKEjhnhqTt
    0g6mNqv1U4MXkuCVTEXHNpw7k6cApW8LB3Imp3g3tgBd1M7lN1nyNBlZ6ljZ7+w7s0kABJ
    OV8tzTnnhZsHV87VOCEnnZFbKd0n7dJt7inA1oB89LeOnbhKaS7Zl7E4arQgdppveXVqY+
    /ejNy2IbeLlV0yWnZ/3utWpncsMkMtxPfg/jUWMsYZjsi+TmiqBcjObVWshyFBAv3oJQ9F
    JgGzmA7v5p9VzUuc3bYY1CVs5RvcX5e8N3Cet7kuxRSynSJadNIj13L+qM6pWAHS3btCm4
    4/8WeU9Y8Rq7/iyWKw9zTTm2VWd1rbe9CPgC22LOMy0r2uaWAtvvvy4bcDbv8d7KVCVYiI
    1/tBBDAurlGbMMgoIXxtYALGw4zSK/40/1kuynaxjzwH6iMy4v+41R1PTnA8BkqbU+zqza
    XlqDe6xLCuF+nG0J515IyrqVRuZvFqnZ4EKNMy9uQuitk1imV+1Fgkw6CWEhPmyuCTGtuV
    Gcu/6O4v+/vEJN18BnP1hnoZkv7XH5PCDfcqvxLPFBV2eoUjtcfUrophUq7FfAOP/P56hG
    zdSvzzdnsa0HBYnpSm5mQyfWQWC0OJPRW9Ei0BNdINTERWGY25BfClFk+svw
X-ME-Proxy: <xmx:5DvbaiZIsNi04VedJxBxfzTR0XUX1AEgcuBsYZzJn4R1oyTwIUfVFQ>
    <xmx:5DvbaprRDbyu66iCOI4gRg_IX0FqjfH2gHtGSP1KhfvkRj-iUIRRVg>
    <xmx:5Dvban-H1QME8_EYKr3QD7m4jboulW6hfMm_FnihEL4Pc9Iy9_ntgg>
    <xmx:5Dvbao_UuZOpIQbe4I2iyPDMVpXe3uDbb-hMUssg2kOMUgRwpMCQ7Q>
    <xmx:5DvbapwrDe9q836_4p3pLDdKvWc_ffzVjrbzKjChL8_etAqwblI4MSme>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:11 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:05 +0100
Subject: [PATCH scarthgap 04/19] python3-certifi: upgrade 2024.6.2 ->
 2024.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-4-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752607; l=1608;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=92DtPMKf2sl21NK12zgmVLpwUewkl9q+mGnixepN1O4=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgUB5/ap8JvAuxReM0a5LJU8KUT4hrP26ShD/Tan1FjIQAAAAgXREY6aDXkREwd0
 68WCGXEH8o2GI+levSy86h1+UqOAo=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248521

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Bump peter-evans/create-pull-request from 6.0.5 to 6.1.0
- Bump actions/checkout from 4.1.6 to 4.1.7
- Bump pypa/gh-action-pypi-publish from 1.8.14 to 1.9.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c572b0afd889ea22b5d229a2d7efca9cef9b0926)

This only changes GitHub Actions workflows and cacert.pem. See
  https://github.com/certifi/python-certifi/compare/2024.06.02...2024.07.04

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../python/{python3-certifi_2024.6.2.bb => python3-certifi_2024.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
index e0b2a4a8d08a..fa71e3c0aed9 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "3cd43f1c6fa7dedc5899d69d3ad0398fd018ad1a17fba83ddaf78aa46c747516"
+SRC_URI[sha256sum] = "5a1e7645bc0ec61a09e26c36f6106dd4cf40c6db3a1fb6352b0244e7fb057c7b"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

