Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4474.1792752613578968603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=uO/4WxZZ;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JLG+xJ00;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id A08E3EC0067
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:12 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 23 Oct 2026 06:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752612;
	 x=1792839012; bh=DumRcNDNzfgJDsa6jSooq+aX8PUixsd56OxmamJgZdo=; b=
	uO/4WxZZgFIhjCQbP/S0Mx6jP9jNnu0Q8FSllNP6Pe4JrR8wNQSyw0Vzhoql6a9J
	Qsei2pES+LDkMhERWvFYbl41fsf0B3N+Bn9OFCfkU79HObPoDN5BcVc5FBngEi+3
	3dghZyzPJZ1+lNooaszoZ3vCoW/rFNnKj8SmPxV6kWZ/8ImQLWouARyk0kiXxkZR
	vXh3oopmx5go7PKVkONZveK3HBnwMvaq0eoCjDllQqJorwoJ/T/2obGhvSRoUYfM
	uuhUnS2TTjCMbIZwBkz6Ulh3Ds5HoflcyNaEJAPg3oQsL6Vr3hAIjyWnGUyVK7y8
	CNKyUsu6WZ5uHM5folDRgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752612; x=1792839012; bh=D
	umRcNDNzfgJDsa6jSooq+aX8PUixsd56OxmamJgZdo=; b=JLG+xJ00XnQlhVd9W
	gMlpFDTMpZYCQzWQ/cF/Z0qlpVDJzndWrsC9pkynuHFCClxRjjV3IYY2FjIPFIt7
	xs00luPq7FpZXw7GtfPcgImQPl6l63dKauphVMr7eb/JxZIMTCofdpVVFNfyxivS
	3/ESLwid64y7VxHT3X7C+q6v0rBD+vohBEKAD4UseUuZVfzcWyxdeSK/8kNnmria
	CAL7bxaQMojPfL7grUO7f8a1/jmyyMdSD19KGYl6lPbDNeoQITQKIHnJTi4q8S6m
	lkqW5l+zK95cr/0Uvxsst/VxAzdJG5GaskSpnZ2RxN7BmAQCdejrgp0QbLpvEpBT
	VwGHA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752612; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:YFYhyyQH/ub+iZSEV2tiaTF7s0AU1fo7lzKrqM2991K1o5I
	RbNmyDxCmdGPPsJksi94ii4MQLY+p1oBxraoJ3s5yrlU8cmMKwPCHYGB0JUh3EYU
	VVb9sBKH1J90VKVcwhWyI6jbxpVqAIpCKHKkXLEOw+HeiiRE99WZPUhxjOWK9P4V
	nFJVwFZyuoo3UbCfkX/N5k4qYVP70zvj8X8guXRf9u1Msj+c73c3yMeJR+tkvb8K
	CkuNUnpXsweKktYBqfYSpqQN2kWd1FD81dMLKDKPhq1ksTC03QZMEwSTaJWOjUEd
	2Tuj/Xs8qNuN14/9bZyZAPG668qt+62A0SmaOzA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XC4fnsuyESKAubK5FxZnJ4VumzZEbnkP7sCh6wBWX04=:eYdtm17NpNYpcit2Ih5M+zodWTZ4FhOTIqXCWpoKhHk=;
X-ME-Sender: <xms:5DvbauWw0kkal9TsCZVsT2-NHZUp9-2YNl_pB-9fiVSciD569xCArw>
    <xme:5DvbahgkXwmKKQhlPspVbbxHE2FJlzK-R7KDk4tZfTUWQYInveYtwvM19kblolcxR
    U3h1Z0HIQ-gBWLONu3PGmp-A0Xo5ipumYvHcF72vOyARsxNqmmG10o>
X-ME-Received: <xmr:5DvbaoBZMgrrVep3PEbMloGTWGP0yg3MrEYSEyoIbcLfl6iIlSs1EyEVEcYHfEvez3wx0byNoeW2hlpelKxv_okXlQ8dbUY>
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
X-ME-Proxy: <xmx:5DvbaqecTn7LPIzXSY0jUZqKo-Htnd0rj54a4ywPG9EX03eh-986VA>
    <xmx:5DvbaoeyT0Wd0mTZQ3ltCwIV9510QP-kc_gtrqZJ6Y5m4S2RWbFWeg>
    <xmx:5Dvbamg6c4UUk6G6yC2emaxVmh5vcEhFJIs1ZQS_ROaJOTQRQucF1g>
    <xmx:5DvbasRXaG8hao9WA_0TFj9IBaSgaA1hSowEKbawG0f-Z88EPosO1Q>
    <xmx:5Dvbam2toiTEsZksIS9M6KCkMeV0R6ven2izScOqG_OiE6CoN4254riq>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:12 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:06 +0100
Subject: [PATCH scarthgap 05/19] python3-certifi: upgrade 2024.7.4 ->
 2024.8.30
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-5-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1357;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=PbPyUT2+tR5fc6rmRHOvMO+UKjOw/rGidIlfyEVLLc4=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGUAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEoAAAAhAMbkvGyyrpqKMttng2S2ZxPcspZxifwFuv2RlOXiZux3AAAAIQCWU7KeGCp8Vq
 g/MF9BxgZw4xOEjpLc8qBqKn+ccO6FFQ==
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248522

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 864b7b4affae0bf6a57cbdd2f2e4a07c1468705b)

This only changes GitHub Actions workflows and cacert.pem. See
  https://github.com/certifi/python-certifi/compare/2024.07.04...2024.08.30

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2024.7.4.bb => python3-certifi_2024.8.30.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb b/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
index fa71e3c0aed9..eddd05282df9 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "5a1e7645bc0ec61a09e26c36f6106dd4cf40c6db3a1fb6352b0244e7fb057c7b"
+SRC_URI[sha256sum] = "bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

