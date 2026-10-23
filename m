Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4258.1792751827913939649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=pgC4POyv;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Kz/Afgrm;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 44B181400088
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:37:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 23 Oct 2026 06:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792751827;
	 x=1792838227; bh=Hs6FEtQ9R8dh3T4U8yTYgFIWqbY4mToWZ5Zryu6F98E=; b=
	pgC4POyvx0zjceR4lRKCy5fvi6Oafxwy8LNeHDFgMEgBoEUncDSDkbMM39EebFuy
	lp7h63oT3xE7GGpLROpQ8spaaLje/VtPxo2zh206lBCLD5QflaTGlnfoksgk5a2L
	qzxiNzJcY9TDt7RSB7FFK2pmgS+9ladn9gWdDz9GDO3zYZNZTFt4PTWIjkQbLJBW
	eV6htXbmSoJiDJfGXXh10yLZH8m2rCbiMgUVj2pntBOpw4Rr8m+csagPdLl6M3TV
	8uSElfUvJqSMBXl4X+59N/B6Ilc+0ut6ZO/6R2noxMxVY4l2pI1quWbpioBFBnXp
	cNi/GjarHuldDZTtlGV4nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792751827; x=1792838227; bh=H
	s6FEtQ9R8dh3T4U8yTYgFIWqbY4mToWZ5Zryu6F98E=; b=Kz/Afgrma6DBZTZNn
	LCBRDK1f3fCD525klVxHhNQGav2nXHH1BpOMME+QfCjVeLnJW16P6otwAaf7CRe4
	pcWIBp4Momj5y3ZBH0xW6pdYV6vSTS7aLfSJPHHrZLU3oHrO/isxRIdvnNTtQxiX
	TNJNpYbCa4ZKCCy/oG3gi3a5x3gKNmsCHDkl1V0os9Ix4MGFg+UmrXhMGySabIak
	aV1KGQIjjoa9nEZcHTYoohQ/7Rj8O7jlxxWwL8U4MMAcqF3KbWvU45tP0HGvQmsv
	+ux3y2r4qM9gtp9JA+6pMGwJmtj2QjAmhMoeKePQm6vztgUWHBhBIbmmWswGa2Co
	OrlwQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751827; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:D0dHl8SdNU9K0tipdQOE1M/7g3P+KRSfmRNS21suWZkck0g
	BK2qCqwQJ5PSnZS70dJ++62wH9xugYdmTu7KDHG63/JqAYlKhcMIrDciz3XnzYHX
	mF+zEubesaO4ofBraGfjb3fLqcKJNb+/YLreoB4d31rIqdOUQLHfWb5VzgtlC8ZP
	dYCiO21jnLkyXsYcBSFeizdm9Jl/sICu9iHXUORnNN1DYYFyid5mJSHm3gofAk6B
	+Zx114VV65Upxj50XeEPn5nCGx6my/qcX5la5jQZG3PMyLwfTdCQ/BcdiL7frvFf
	+JhIBAWMfi5bShJUldeImnY5+t7vzKTuM3OzF1A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:uXTOPG/Kekjr7NwgtnIDdxTdRxh3yUdrNJaGamuPWIg=:pe7NimwbF5F2JV/lS4HGsvGclMGXU/SNK8lDQDBjoxg=;
X-ME-Sender: <xms:0zjbau5OQCRhb067kwXhg1vn-9zGQSSD80zdzO8o25Zwm333Wsx2GA>
    <xme:0zjbau2DUwTTgRCH3O9lMZ4WZMcLwxUZvnmAonByBrC7jXbvKQ1SnQybyVfJruWUj
    NqJMEOMi5C1eRl7FxPJPtLfhIm5dhlYaMn263FMxgH7iDBxoCmBHQQ>
X-ME-Received: <xmr:0zjbajGFtIANIIKO4kt5SKxTtGFANzsf6MNXFjh1BgWzVQtpqK2tkQcZU_UD_ZMhNfOwcmS9LfhAm5Txi6NHCLqExqpKNLo>
X-ME-Proxy-Cause: dmFkZTGdXeWEdgZnrxsR0LfdKteSMLbi16IvVblMar6iaBUXKRIad9b/S1RFbYAPHM8w8i
    fH0EqDVuO+IAqrEfs25nXUvA98hpdiGCUYS+QIeihzz6K/vqil48ncRKsz1V8CDB9cDPoS
    rh4Dy76yV3MwTbJpWnKbCgRHE2rUZ3jLi4Q+Tmb9orUNsVUuWWJQgMpKiK+vij8nCQGmIK
    w9DEWSSOeRqTSsgrKYtDMv0d7E63TMM7B7H7cX4Ff0VskLU1f0REdI85KRRhfWfFubUM6G
    hYTYiCyHLl4iZwZYhXPNsBPuLPQ4hiMoT1sf5XoAWhtYx9BZYb0fupOe1GMh8OYkTjuylp
    l10X9PvYD/mR+QDNJ6oDjNRX68UaQbo2VbFFXJW/jetBK8GbD6DF7zCu/si4s/34BeE1Sk
    q3E5Udut6hyriMX7wpJvJhBQVaAwq/loKjY98ahUHA2tspIfoB+YNp7rc7RJ3XoS6nIINq
    8J6LTlgi/qsnJ0S1iKNOocqGtaZRTKhEx0XzHaC+fnsuopZ1qh8wE8dtYU9OztwaHNdFpy
    3CpJrzRs7ZjxZUGqkiEggX5J1Gt+r/ILkH5VmdSjimZLoWfUcYKZ5CuyS8+qJ/hdZ1LjFO
    sR29/k0V9hVF8LTLMnXAIb7VvvgVXnQzmIYA24ACfCvuaTcwy8e0EkqU33qw
X-ME-Proxy: <xmx:0zjbagQ9KKwo8PrB7s8Cht40yYnjREEIkCmp8bk9L8U607cs6RcKeA>
    <xmx:0zjbaiCIyMx5p4XO9Bg-eH-4iPXlAnDT_WdtW2VbMUAP5VuDVuoBrw>
    <xmx:0zjbao2i2Vr1HGe28yGC3Hl03vTnCt4UO5J33XQc4fCPJ7eDB-Bp5A>
    <xmx:0zjbaoXtr2V4rBlIaT6n6TzydT69ofFBXvogTcsqDC_Qjcaoc-lUJg>
    <xmx:0zjbatp71WZDergaN3BELLdOCaFiMcnYVbX0qUQW-YxYpEAif_kM_-Fg>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:37:06 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:36:59 +0100
Subject: [PATCH wrynose 5/6] python3-certifi: upgrade 2026.6.17 ->
 2026.7.22
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-wrynose-v1-5-83dd2facdbd3@pbarker.dev>
References: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
In-Reply-To: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751822; l=1855;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=R7CPZYvoc9LTx+aLrVZTL7Wl7yHEK1ezwOeQhjxkVB4=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgLBfV/pnfd9mMe6HOcnilGkC+rHv5uFvE7tP0BLGkJxAAAAAgcn7RGmPhwsNjpe
 50rWayTP1lzztgHiKma3gsdobfSXE=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248514

From: Tim Orling <tim.orling@konsulko.com>

f4bc676 2026.07.22 (#428)
4c91f9c Bump actions/setup-python from 6.3.0 to 7.0.0 (#427)
01a66c5 Bump actions/checkout from 7.0.0 to 7.0.1 (#426)
eb355f4 Bump pypa/gh-action-pypi-publish from 1.14.0 to 1.14.1 (#425)
474e6fc Include tests in the source distribution (#424)
a31ef39 Bump actions/setup-python from 6.2.0 to 6.3.0 (#420)
98eb2c7 Bump actions/checkout from 6.0.3 to 7.0.0 (#419)

For full comparison of changes, see:
https://github.com/certifi/python-certifi/compare/2026.06.17...2026.07.22

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d7fa3a3c6a5e62ceade6d02d09b909b88b1c6ee)

This changes GitHub Actions workflows, MANIFEST.in and cacert.pem. The
manifest changes should be harmless.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.6.17.bb => python3-certifi_2026.7.22.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
index e32fd1607aee..a87bfe86afac 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.6.17.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "024c88eeec92ca068db80f02b8b07c9cef7b9fe261d1d535abfd5abd6f6af432"
+SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
 
 inherit pypi python_setuptools_build_meta
 

-- 
2.43.0

