Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4480.1792752618136717087
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=RFEmOsCP;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=oeQlYh6F;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 6FA9BEC00B6
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 23 Oct 2026 06:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752617;
	 x=1792839017; bh=64EkrVWvkXlbqa+UfJNzXNp8jldQ7t/R1UERLwhH+DY=; b=
	RFEmOsCPpDtpsPrkXv5bmdzooPNnLWrWs13MItnhrZz5OxLVeMh5l396GwsbycQp
	XQiuiddU6P0i/XdIMrPKTGIq6mF/RRrHFOPaQYGpGyEBsbd+zZk2YJ4ZYGuv2uS3
	dQqHFBomnWXYruKpNtDiQ7V92P5bGLDLIH445wxNf/EyHWetOqnG8SlVYV5mAxlD
	bvaA2PVHyL3MrzZ0pdqV8DLw8fEhY/F2KUVWulMMdQOiztiADoyYkRI1BKHUQ4Cg
	cv6ZoHFcRDZ4AgrtnDBakcHpk6NZL7j5K+tC7bVBbHpnUWcTTOGKmTH8twCT5a7P
	5RGPcHwqf15WQn0jvuygGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752617; x=1792839017; bh=6
	4EkrVWvkXlbqa+UfJNzXNp8jldQ7t/R1UERLwhH+DY=; b=oeQlYh6FlbeM0QTqw
	M1nuCHmCd6Y5JG5kXGG5/j4X49t3416RAsy3cQyjyFwck0p7CCH07FIuJ40kfuAK
	fMYtYgxhKDKNLNA6aFMLLhTNkG9dj7SPXcdNqlAcPvTX4Efp3APo7vXvAiAsUjSx
	DaJ5u/drqclm2sq9dvvBX1ZmRCw0CRA8MJ0ek9XV2I5ddmgVFA8/sVvy23D2kLLw
	JtAdscZ91AJi8E4teqYHCf+ix836usD6lKWm0NuZUqN/j0L+J2VfyqfuMYAiFagA
	l6WrWUAekgOrPVz4UJibj0p+9k2A58NAFMiFQi1SaqifZtSU3cxlVEJpz9ZC8g/X
	KCFPA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752617; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:cIZzHHWoSwu7oihCGNB1rbiXC6vM4UwiFO1UdqvUF3elxSc
	46rUm1z5qvWaglU5n4w/7c15BqHtyX+wczm/Xd6zOTufJa18LsQ2xr1CgX5slWwN
	oGTCID4UzHGWXFY9h61YpWYG+J2ttJpaMHcMqPDZaeDBKqkf2sZnuCFXS+LbrnPn
	Q71T1Aw3D4ah5cs/LkuYeQb8gvJS/97ancRiR6MSOu0AbcncedAym1Nf6uGZtzkv
	XOMFO6+lquqiTYWzNKcKMyRoh9nS4ou6gu1Ixo8c/E8T4G90gYWzoymotnU+sXxk
	JxZ5RL0EvUBqzqmLs+PYkGuYldTEK8GbavQVacA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:T60rfTBFDtOLt0eWs5riKiczP1P+L2L9i0DJk3RSl88=:jkqJzZ0aIw6RYwElCVbNX0Uq6DtxkM6863FElpJzwps=;
X-ME-Sender: <xms:6TvbanG9I0Jpv88mbCq10Ynz-SEx3-0bW_qkVTHWzXNTVX3GWKbQXQ>
    <xme:6TvbarRDN45ElaMpBWg0vn2UInsgbt7dHPQDgSINYgAdlg6KxZ8gD8bIIQ-bmLonH
    OEq6TU53fh3VVFXs7ei1MrvqiY4ss78wTax_XHQne_6r_M9mEaha3Hp>
X-ME-Received: <xmr:6Tvbauz2bTJiKPBhpHkgF9cDWz6BInThTJ6C0OfoPehyCMa2tpIYO6QWPEwc1lCain8-gjkvwYkxs5WxBQLLgSEfnaaoP2k>
X-ME-Proxy-Cause: dmFkZTER2m1YIMQ8eg4MnNIsZi4FBhMIWqS+ZbVhuw44e/27Tf4AY+BIRzUquKEjhnhqTt
    0g6mNqv1U4MXkuCVTEXHNpw7k6cApW8LB3Imp3g3tgBd1M7lN1nyNBlZ6ljZ7+w7s0kABJ
    OV8tzTnnhZsHV87VOCEnnZFbKd0n7dJt7inA1oB89LeOnbhKaS7Zl7E4arQgdppveXVqY+
    /ejNy2IbeLlV0yWnZ/3utWpncsMkMtxPfg/jUWMsYZjsi+TmiqBcjObVWshyFBAv3oJQ9F
    JgGzmA7v5p9VzUuc3bYY1CVs5RvcX5e8N3Cet7kuxRSynSJadNIj13L+qM6pWAHS3btCK3
    3wHNX/XKF70VR+sCAo59FWdPaguZ/fDL49QKpGgq/TReQ+dTE1EQ1r06XJeTfRnprkIR7v
    cMcQwhFYmKWqgfmcNdZliicowyBynzDd8POE7iw7roZteKMPmH7A/szjEDuqTMowzQtJgn
    axoK/zBa9NTEdFNkCQDFz8DOYhwpxruaps/vOAFPHPE4L0Wjm6uw87sXUzWSvjon9VKfla
    DFVbX1D+/U5lHQtujtI2mGdUQva8WwWCDw8nmVJMCeZZ2UDgaZp2icuVaT4j3ryo38QQ70
    x/du6w6YrN3MjgfP00Ay8O6nee2HKZ5ZbJV0o/g+CBTRtYzz5wu9Czbg00tw
X-ME-Proxy: <xmx:6TvbaqOrr_aFFEklGU1pdU75N1pO7Xh9oGpdLDndHtiPNTmIUZuVrw>
    <xmx:6TvbatN7aRIG7_yB2qqDhtrUcn8AeL9ZVSH3X_XxxZ1yRGomUeiosQ>
    <xmx:6TvbasQ3WH4inDKc__48h7YSsvfpewwgs-vp3Mp8tb5x67PtGfWMBw>
    <xmx:6TvbavDfWH3rx8q0hKmnvVw3mqYDN_jd6CAT4lDPO05FpEuRxoKBIQ>
    <xmx:6TvbailXitMkl1iu-jZkVavlBSvPjHldJFd9ssq6W4WpoxTA6HSvfnNT>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:17 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:16 +0100
Subject: [PATCH scarthgap 15/19] python3-certifi: upgrade 2026.2.25 ->
 2026.4.22
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-15-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752609; l=1318;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=JllA+qKMOihVdn0k+P9ZGLu1VtZTdbVC4C+JgBmr4iQ=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAhAP7BMi7mUm/W4tkYFWR05WAMcG0iu2XimtyzPlZbY6kyAAAAIA+ZCHQ/Qj64jh
 7YqajsT9RfWh/9hiwlwRT+YGvnDj6X
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248532

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
index eff12fe3280b..03cd00d78f4b 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
+SRC_URI[sha256sum] = "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

