Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4265.1792751826341264228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=BABi+iWV;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=pkp1dHsK;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A155F140010F
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:37:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 23 Oct 2026 06:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792751825;
	 x=1792838225; bh=VTDlIt1/Cn7iLR1yHQ78eWzYblnFm5S5jw5jGOULROE=; b=
	BABi+iWVZDV857CFi2YZwS1d3uNp8HYtwjVrETyei3fFksCdXnLuYR34CY3KTYGB
	z0gSc2eB4etWRGwlTDCUaEb02aCxlNzJHIBKoKequWlJ2/Hf7mapb7onymgIzaYD
	FteXMMoRqXh9wqGPYlwSkdGE30w46+2MOHZ2OKhh8ip20raZ5FTYt0xiR9L7fKdi
	IziayG3QRVi8U8Ue8eCOG3Y6JdsDX7W+0RbBloImF2m84Hg4QeT5QacjZZxpu6ye
	Cx964JKnMle7DMHey+2xkkA7Gvgb+whPAOh1rTrnY1GqMJRUV95GgmkoRkT5MTeY
	1bJH/JZA4DoSujMYTLagtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792751825; x=1792838225; bh=V
	TDlIt1/Cn7iLR1yHQ78eWzYblnFm5S5jw5jGOULROE=; b=pkp1dHsKxTHpgq4Af
	G/rcHXMfA8lRff6IHgta8cYoi34Gsqe4QjaCbxgF+SxfVNcvKUC7QeC3V0/viJpR
	G6ulptQh31DeTjd9QO2R34JLMkq763RcwcxFKcYXsUjvTnq+Hntp2sYelixxt4iY
	a+NkAK44I+z2GhbkvQKZ+/a9yv8wqWXGpe4TlwMCGNIhbiRyh4/XXsnyqKllHeIP
	hyPk8YjE98JhottC4aYmqORp+Lti492to0DV3kZIQJ4OxpV0FO/HCxg4EkO08IcJ
	OXP1J3FbgipqqE0ZwjUWVuh8HLamQSl+SATNlESJ4w+unYOeTImJTga/ptUzOCNh
	5exWg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751825; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:OiaPDduatA+fi9I6dUnwBcj8IeNRKrE7tK84MlatL01BRel
	i/qkG4gqrA4qXTdvd+0iuzAvI4Mkp/CUkDUSYEkZSHfxqmhNsMgL2X2SIkD3HX4z
	nQcd9SNStBgNoFBSEMNRM+YLS/sdvFTLDtVu9LiDsuxqR0LYkfV7al/Uo+d8mnCB
	nvKOwke0s8O7IZYja8Stg2Mfo1V6g58wt0vqWxdLiX9cC/rGlYRi0O7v0UCU3+be
	x2onTOYfgYqrVAHiOTEmniBZs4mZsO6TZyh1j1AxPgh/mLmcag+9Be0mWfeSWCNT
	Q0eHRpEGsw/N8bHDgZhfwoY4jjDohehZ+JS8f9Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:4yCy97XUO5dtW/b2RjSeoWBeg18zLtUcXjVZheHcjQs=:2QA+pClgtCOg2+H2BDzGryF7ThnBy72rQSBBNM6Gl1k=;
X-ME-Sender: <xms:0TjbauHo2cBsEx0f2ty4s1FgKR2NOqbvuPavTyQp3C-MvYhSRyWLjw>
    <xme:0TjbamRiDlgL9RPZQ8qQat5RSR8drJpw7J8WCZB0Y-RFBHJ_O8DBR5rcEqUfsMsHu
    rt9zaRVhRncnQGoa_h3OiHPZKaQG4tvQshGfxUxurc-HqVn2sIjKAju>
X-ME-Received: <xmr:0Tjbatwn2FKyC-di18BOV4BlDjsQBEWipVRycibaEkBX-XqUnsQ_hrZjFGCr0_LXZ00jToSiyMZDB-8Y4Th6hzBbE0Y2GxQ>
X-ME-Proxy-Cause: dmFkZTGdXeWEdgZnrxsR0LfdKteSMLbi16IvVblMar6iaBUXKRIad9b/S1RFbYAPHM8w8i
    fH0EqDVuO+IAqrEfs25nXUvA98hpdiGCUYS+QIeihzz6K/vqil48ncRKsz1V8CDB9cDPoS
    rh4Dy76yV3MwTbJpWnKbCgRHE2rUZ3jLi4Q+Tmb9orUNsVUuWWJQgMpKiK+vij8nCQGmIK
    w9DEWSSOeRqTSsgrKYtDMv0d7E63TMM7B7H7cX4Ff0VskLU1f0REdI85KRRhfWfFubUM6G
    hYTYiCyHLl4iZwZYhXPNsBPuLPQ4hiMoT1sf5XoAWhtYx9BZYb0fupOe1GMh8OYkTjuyZH
    dUXiW8NsmG/CmarvK7oCgTmSpyY9NHUx1mTYsCaKJb7V4nfqW/4nyJzQz439/4GiTijB/B
    aji5Twe0SUwAxXD77moBjdYMjQO3QVnX9t3HLkNAP0AHzUl5fOxzMi8sDWEcOvVPMnZeJ7
    ob8GzlH+MY2d72MhNxEJ5YpnhWkcxhIHs4p/cl7QeFBY59OCoeTJITbs1SePDloR82CKfm
    HksFQ5kl6QxDsg7+PApKrsawMNtQ+a3Z5BjhQJ/tr9YUgYeSLnj/9mQbeH2QKctvCf+rp5
    WVf6N7Pu4kPMQfQtSAC25miQmtvqLToLYPpGT1JxWR73afJ82CvPHydVOl0w
X-ME-Proxy: <xmx:0TjbatMhHmmWh9eiFkXBu_kaFD4-dY_qvRwYH5lR-ciXbI4QpAAaIA>
    <xmx:0TjbakPu4J37XnZksfPF9CfJNBAtW1HRsZ63RuFQWj71P9vKm7oVOw>
    <xmx:0TjbanSRRNDfWKcfOdzYDBrMtLXvIWbZod-ChpY5_J-1wck3uneUhg>
    <xmx:0TjbauAvzwWJZpy1KvH-OfkzaBCJLGn7U8ieptm-0MEkjDFUXeuTXw>
    <xmx:0TjbalmseHRC_eRY0VpzdX4FioQul0pcYdO4hhQdBGlqLVDDQyjT3KDZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:37:05 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:36:56 +0100
Subject: [PATCH wrynose 2/6] python3-certifi: upgrade 2026.2.25 ->
 2026.4.22
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-wrynose-v1-2-83dd2facdbd3@pbarker.dev>
References: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
In-Reply-To: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751822; l=1328;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=m7ZxiVsKOFOVuJRi3nBEsscTTZShPRc1rJ5FA2RWuBE=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGUAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEoAAAAhAKsI1rRjaSJ1947IZlBRnpvbaWcBLtlMgQTT6+uYD7NeAAAAIQD+pHKGIJshmi
 XbsaO1TYh6XI5y1ECY7i8DvTftihmj/Q==
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248511

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cde7975e3e00cdc2803a03dd68aea594b81d43ba)

This is just changes to GitHub Actions workflows and cacert.pem. See:
  https://github.com/certifi/python-certifi/compare/2026.02.25...2026.04.22

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.2.25.bb => python3-certifi_2026.4.22.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb b/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
index fb08bff815f7..b8296a26feef 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
+SRC_URI[sha256sum] = "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
 
 inherit pypi python_setuptools_build_meta
 

-- 
2.43.0

