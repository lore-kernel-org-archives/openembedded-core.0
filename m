Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4266.1792751827017929649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=vlHXD97R;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=CAiKhoq+;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2F71C1400116
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:37:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 23 Oct 2026 06:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792751826;
	 x=1792838226; bh=viqSMmoo5f2a/8L2lsRym3/Y2rqXmnnXS6SQ1Ac5+3Q=; b=
	vlHXD97R4mqbQikIOOD/NFzdGSkENOn5ccpuwLc88zZwR/F1ktq1eslXCxuecShc
	SlpH1Dh2IJX/fTya7m2hL+qBwjh/FLJzmvhq1S7lJ5aIlUiILrwLf3b9JdFs2a8i
	6h7+LaZgjDQD7wNoYeftvSxsiXPf9Gs2MtXGILh2YI77T6Um9CkvGZ2Qdjt1DhfK
	45MpwriD9e9OTz79ZuxaQ8eUr2M279XSswc78/+O8rhwqKagOTiz/Gnw/Ov1SbKL
	SJR9Tf4Hzz0vRBw2g2bkVuJA7+u6xcpJdaAX/FmK0R+LKXofLhBAr2dHfUOmd/tw
	TV92HCHGkiKHTgkURoZiAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792751826; x=1792838226; bh=v
	iqSMmoo5f2a/8L2lsRym3/Y2rqXmnnXS6SQ1Ac5+3Q=; b=CAiKhoq+SUtLUR4JG
	9gVezv6mG/xaR7lTajNqAZfz3hgH/fmJZETR3UtvVmmh6vfoQs/d2Ii/1GxyESs6
	6o5o9s3NW6roH+8QH5Vq5bM1kI1ZesGZtPyod6Tq5Mh7+bSR75pzVO0EX1woARGZ
	8ZSdgzFeSzeICra4HynvvR8oh2+3G4hR1AzvsZgMexzedkRR8kfDYigYtlwbkfJJ
	voGUEoPy/CbxlXE+qz/4WYpianaxUr6nQX3riqVN0Bmqsr1dU6uSaBEI53Fu4Va6
	tKJ9rLrS2KGX2ZOWKfLDaVRCWRC94+F7bZklreigchtMQx+9uQwTx0z1BqC2Zw5e
	Qtcww==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751826; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:vNy1E6KAmUGM+hEn89Fd/VXU400heR24Uh82SyGZesnMfHm
	c4wAQ1fBLrt1+OB5r6GGdMWCZJ2npScIOfJjIwOUVblH9bo/WN/p/LFTpBQsLiMB
	ZX7g34QgnTwRsG0M67Wa+5+cXlyQ6x0gpQHNxiK4kqSabCniRgDVBVMBm6UVhuDT
	8YfccH1yDMXCUox/UdT1dFWE75T/e1j3UdT9HMLV6WFnQTPq5cwgXMUFlhutNbrG
	6c5PBYnA3OjKLM2Zym8/6TU+od+6s8b1zBX6vu+1RvZaIcmcnwUBOb79TTixjvRK
	gAod9M1s4SareebRHNmCAG2S6BNb2eo7vPzpEmg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:De9L1PS/npSPK8de9/bQ7/bwPKr0rPs8czqDe/q/5Ks=:kGAvpMI3Fd354MT7ZuNwLtrTzHDb8j05ryA2mUQo3nc=;
X-ME-Sender: <xms:0jjbaj6asG5lig3rHYtStGO3VjaPyddoIpyALowWFOItx2LLD--r0Q>
    <xme:0jjbav10jWcbpK2J5rroaAHuWXqJUQfHl0JZn3qfSABFDnGmibBc1l46zK1M7_Pol
    TP8hxudbSJAEDu-tqFAxYlEbnsl7pon_sfmwNavfGLloGxWUhMx6L0>
X-ME-Received: <xmr:0jjbagGJtOm5BSl6m0d7V1NCTE39TKSrVracB67OnZ6k3ZQ0rBDYNzoOexFKWgkR5p9ugiKQ4UVlwqkEI6PExidhpgarhL4>
X-ME-Proxy-Cause: dmFkZTGdXeWEdgZnrxsR0LfdKteSMLbi16IvVblMar6iaBUXKRIad9b/S1RFbYAPHM8w8i
    fH0EqDVuO+IAqrEfs25nXUvA98hpdiGCUYS+QIeihzz6K/vqil48ncRKsz1V8CDB9cDPoS
    rh4Dy76yV3MwTbJpWnKbCgRHE2rUZ3jLi4Q+Tmb9orUNsVUuWWJQgMpKiK+vij8nCQGmIK
    w9DEWSSOeRqTSsgrKYtDMv0d7E63TMM7B7H7cX4Ff0VskLU1f0REdI85KRRhfWfFubUM6G
    hYTYiCyHLl4iZwZYhXPNsBPuLPQ4hiMoT1sf5XoAWhtYx9BZYb0fupOe1GMh8OYkTjuyiv
    /gqcXi8FG9qyAvH35ok4g2iwu4RmriDvrsWXdbxP3ZIb047XjuKNTdYlYIfhes4IUiD6YE
    EaUbmiQwsKAWOt0e2LnyaOiBMWkWaxmMei5GFb0QMDAT36IuosD5PzqDgwOMRqVQc3WQnA
    KB0f8Sr1zaVatElpqBtjjOSppT3t5rhv91r19swTz6n9n8j85EvMC2wWSLfEm3j0D0rG1n
    gUAqmq3L+hBNGejkQr0fp+bElKdya6JwufafTPaondv0QHHrvYIovy06rsT3jzUs04rBGw
    BO3AyDrasc5XYFZLMDcxfg1IHUqqspSnq+ZERiBDsXZKEad775uqX5SDj4KQ
X-ME-Proxy: <xmx:0jjbapS8Vkgzd35Szo7QTckonyoN88DoASvZ5Yfey3E-a5HE55lNKw>
    <xmx:0jjbanA48IuHW_FgIQvJRgTKxoi0Tu8_PzCF-9NOuhKYhNdSDHtXng>
    <xmx:0jjbap2U51DB00ZH0WQC0-aIvD-ySEEMYHFSF0_tKnh17745zxaGHw>
    <xmx:0jjbalVe2rehimv6vW-srZGyq6VY_WzARb4cVCtNzvssd6TdkqucJw>
    <xmx:0jjbamqoTerMh5ulMhXJ5MyLxS9EunSy2S1FS6CrIWvSwss_LDfT8Hi4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:37:05 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:36:57 +0100
Subject: [PATCH wrynose 3/6] python3-certifi: upgrade 2026.4.22 ->
 2026.5.20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-wrynose-v1-3-83dd2facdbd3@pbarker.dev>
References: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
In-Reply-To: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751822; l=1882;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=HbknVWVwGB8sN8s4phQLagb/X4kpF6qI3s9an2KMvtw=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgdLU603jdZFjbJWyKyAzpZc2OPQKEfjl24gyQ9TPV8jAAAAAhAIRqENJQWQdK/X
 CyIuXqDbfzf+UscuguqHV3hK27jnYV
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248512

From: Tim Orling <tim.orling@konsulko.com>

* Removes [1]:
  Issuer: O=Chunghwa Telecom Co., Ltd. OU=ePKI Root Certification Authority
  Subject: O=Chunghwa Telecom Co., Ltd. OU=ePKI Root Certification Authority
  Label: "ePKI Root Certification Authority"
  Serial: 28956088682735189655030529057352760477
  MD5 Fingerprint: 1b:2e:00:ca:26:06:90:3d:ad:fe:6f:15:68:d3:6b:b3
  SHA1 Fingerprint: 67:65:0d:f1:7e:8e:7e:5b:82:40:a4:f4:56:4b:cf:e2:3d:69:c6:f0
  SHA256 Fingerprint: c0:a6:f4:dc:63:a2:4b:fd:cf:54:ef:2a:6a:08:2a:0a:72:de:35:80:3e:2f:f5:ff:52:7a:e5:d8:72:06:df:d5

[1] https://github.com/certifi/python-certifi/compare/2026.04.22...2026.05.20

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd0530a6fdef3331a60fc669aee05b2c26aa0b14)

This only changes cacert.pem.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.4.22.bb => python3-certifi_2026.5.20.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb b/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
index b8296a26feef..fcb395be7b69 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
+SRC_URI[sha256sum] = "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
 
 inherit pypi python_setuptools_build_meta
 

-- 
2.43.0

