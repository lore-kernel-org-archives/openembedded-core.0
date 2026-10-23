Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4267.1792751828358393777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=gYd6y/kT;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=xSidCU9r;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B39BB1400047
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:37:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 23 Oct 2026 06:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792751827;
	 x=1792838227; bh=mYF9hfNGiFUtaVotMbdpmu5LHnNkGDsJJtC9/1yDysc=; b=
	gYd6y/kTMF90dVeZiX0OEHMX+sz9fPEaptKoZXErTZkFpEkJYEngqI5a6Ey/a1n6
	9k07pLkmGy3SgjWyP774o93tfCHS8JuhTz0ty99/OPB+ONdGZFmpLuQMdD6kjZvw
	C4vVLLBLAzzu/e+nW6YR30xL+6ED6h+9uJvMLtqMyyWls6wtCo9t4+8f13va2FZP
	OVa5GeVpTXLUgiag77tgVovM4xxGFLr/IOR07+YVjwMujK6eP52mNkJ76oxx+Mre
	2NwFOiOuc1skcFu9PJIp1b7h0IcxBq5KWrngKQTD0xYdpwMOemCS0IwWI37ftxu4
	rBCD6EADDECUS4B66jBFhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792751827; x=1792838227; bh=m
	YF9hfNGiFUtaVotMbdpmu5LHnNkGDsJJtC9/1yDysc=; b=xSidCU9rvpPHudg1R
	kFrJq9KjZWIXF124z8pb4KF1lCtrVXIfE7Wads03E+1oXFjfVtQRz7mEmrkvta8L
	vZz6NmraXShDnqEJf9gd5dt40AOCxdpbvcDMgVyZt7Fn1XX1S1Ix35dDxQ6YdjCK
	D6MJtOk5LTRgiXuS7YEQxxU+BYnKk+heC60W8MjFgUV31seSQhlhjYhSfOgHkA1H
	Xo/Ybj1zsb8ljsoyfdqbFS1V0JLeeeyE7Nb94eHl0hLYAzpGIUvO+9ror7m5TA6i
	ifMywwMrsxzxGtBl7aqFkRirfslA4DrTRJiwag0XGRpljUg4ztn8QCDjj01Go1cf
	4eiWg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751827; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:ERbNBhEZ7kX4rnDopjZp9eyEYfRfDw4mqYzEjI+a7TDCF1R
	yyf2i4nIBwzWvq+iDA6LYZTNvS0/w76W6Rgft/n1hoRUmEZMPbb/IV+Oet6jNZ9n
	eOKtFG5cl0AlYzs6EDZOxdcR9vAHD+TTqSCjkUjv3RNHHWvipgQGeo19HfNrRH+q
	6SYWFyKfJCGv/98rI9oJoOU3TRwRR6o6VoLHGq8iS4auh0XyxALFUb3MRxGyQxPb
	ycjjZSwSnrqZt+xOD3cwE/GjL73i4LiQEBFra0oOdQ71UX7JqtyAywObhbJqhbdD
	ejxJvcR004AnTVnHtsnsQKw+1glHMlw/Xtuk/Pw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:fa7HpeR2uLbYB8ivsnu2QUZUuz369Bb3J4L7kQUBeUU=:MeAKnlj3oxSNNCLHP/YnqSkJ/59Gt+0vD9hnoe0HJQc=;
X-ME-Sender: <xms:0zjbapIvxJWVELHEdZut-cp-RVOQSb2iRaQGcLbRiZ93oePeJT2w0w>
    <xme:0zjbasGBfSSqffpmWoloQkC_3AfN4zL92VpyhkSXmPR0zVJ1w1Gk_QmhlGpU69p5f
    FNkiu3SJFeyCHLqxHDXuSPru9nKMgrM3RoT36i-vQIgDjhJM400UUo>
X-ME-Received: <xmr:0zjbanUQEsRSIz3j32uSEU2z2fulBISg6jUCyNSGWDWqCH4uf8NbyLPLJ1uOLO-gaxUrucCPcgnsVYNeeaummGU6VlN7c9g>
X-ME-Proxy-Cause: dmFkZTGpWqMsOU08sYMOnBkKfhzGoXWsyPRy2S4z2EU2hHLy0HuG2Ri16O/D7s4wGCMZ+j
    znU+v4Z7hSqpgPKlfmFtx/87p1EODqkm0m9BlE53HWs6yK+8tcq+829HbGUDUVhsTFm5bJ
    M08WjXUjj2Ma8O8j7Qhh5gpxBVo+CDtSCoSrtQg5sMTNUNIefmTtXABGgQYjh27d2m0GWD
    bK8woLZt8ccRBjhffs3QBJkBKPNcczRqvbTl4xSN+FwEj+CfiR3IfEkB59LNIzQIpHJCcV
    ZO10UUttqjzwW9HVBc5WFEVQFTt519EMQUVBaPPDMU7czUFtZth2hOh9v/rgECxmjshhbH
    k6rWQ5Hlx/UoK5Iq+AakdM7KQkUpf4KwSyI8yxUTDGwdiyjyAI7i+kM5kCAt1RYW4q3NvB
    XymxpepR7gQ8Y976YPgwCWAVpggWZKs6VnhjyFINc5eZJYrPh/2yA+PAURrQ1kXW0qVoWc
    RD5Iz/+kolrwqWxYLFRmQ976Xo5y//y8/5ctl2RbvMQJARPQD4VbuN0Y5Kk6QsDzNvqjQj
    xCVkOmzF0n1zSX5eLD78dZKbiHn+fa5GtR2RhACAGMMrl0PBfl7pRHi6D3Z048S86N5IWn
    PMZ+yH43EtK3pT8pDhb061HX7A/4sdD6JFFrshQ6vIGe5MPlIx9hi9UAceTA
X-ME-Proxy: <xmx:0zjbavigy8BHkJzOLD8Oc3g54DpP-MPFu-MZUZgo1fo4lRolnAj1zQ>
    <xmx:0zjbagRPFx_TZLmOEgZLIATmY_2thkvo5l9IA8hUj7U4sWdIAaUqVg>
    <xmx:0zjbaqEpRT-GfxIaFbn7luJhs72_WxNoTC0ILwE0OMDep4kYndHZGQ>
    <xmx:0zjbaglpRCGDi8LbdIuCN3YBJ3bRBkU7siG8wEYdgJ0nLeYUfEl3Yg>
    <xmx:0zjbag7g8F9Arq41767mPlPfF26EgpOkMFF7Tblu5ppO8Kptcv0ISShN>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:37:07 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:37:00 +0100
Subject: [PATCH wrynose 6/6] python3-certifi: upgrade 2026.7.22 ->
 2026.10.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-wrynose-v1-6-83dd2facdbd3@pbarker.dev>
References: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
In-Reply-To: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751822; l=1377;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=geKg/xq/ZUroHo+ZOVMwvPwOyTsVTZS8AAcXe9vUDgg=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgYCNE6Xy4264OqDZm9XNPnGbUKvNijD4CW3n/B/EJ3jAAAAAhAMaYa7kwX+A/TD
 EKdvr57i0z3kvsk1HzrInH28sYYoX+
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248515

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
index a87bfe86afac..0a3ad7dac51c 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.7.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.10.19.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55"
+SRC_URI[sha256sum] = "035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae"
 
 inherit pypi python_setuptools_build_meta
 

-- 
2.43.0

