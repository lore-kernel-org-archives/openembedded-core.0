Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4478.1792752617155581833
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=WuaHtJa9;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=tui8O0A0;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7F445EC00C1
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 23 Oct 2026 06:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752616;
	 x=1792839016; bh=iSynnzWbHKA0pEwC956uzcncZ71OkxDXJZERpY6+tJg=; b=
	WuaHtJa9or9Np+MQaoBZAk1EbLvL61HxwWrYvw8L1ToKEMEiHuD6KiFHgF0g9BPE
	Pxw6vKJa+ya/YbmkmWrHzR0VcSbuu5aatcsc2vrbg07GsEQNoI5E2Fj6NVBhoBDL
	sJTokkYjpOOZTRjT7C707EVDSqYXie1+Ht1FLrMP6iP5vWWpg0A+ampgoSQf341y
	ujeZXQfuMjtrntDhOTTfT4dv3mlvzHGtkDNSr9SdICcNWCG59d6n3WwsFDND0H3L
	7+xNd+RItpZt1IOZVF6RqKr6yndFx4SyuJhAxaDlKoGXKfGHmraz3keW5J9E3Bpb
	/AOkO1+vNC1DNwgZn2NmpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752616; x=1792839016; bh=i
	SynnzWbHKA0pEwC956uzcncZ71OkxDXJZERpY6+tJg=; b=tui8O0A0Oo/T8Hhtt
	pG9zKml2nExzfEGdkDkXuQ1WlyOgL+YvMqLtcdHZVMKuDf4kc/CSKHPq1dauUSFD
	cQGeQqEC5XOoIzMqsnFFx3jMn2PsPOc/CtPZ1IelCjVIBPqqSaE0VwDspomM+f0S
	XxkV4ovky1TwVNNKzHOgSBr+fRXcvTsDBMrARQmDFvTVZOWeO6Xjtcke6zPstdP1
	ayZww/9N7LtGYD8/2kUzCu6t4AIKW36s2dCQOY1NLmrq4nBi3CJAmQsBG0pGulYw
	kt/ikgryOTbBwPcNEuAHZq9kN5C4yDdQSyD1IMDpQjbdMrP2R72vYAsINIj47p/A
	0oAaw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752616; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:uuExVL4/fhP2/PiryUPqtq9VaJy9fgAwA6qdhH7nIvc9sCc
	ApE5yiCCnIKYRuQU8ClTi0asmzWYhWYwo2V3nr5v4KDuVtY7MEN0gQ5zIx7CvHoW
	ujSRKenznNH/5FdnBvxhkShhuAoJW0s7NghaWgXqtx3kTaD3v4DA030FJK9SynnP
	r5da1lQlG9nJB77+Rd62QQ4xVfUMsTZaq01b+ewDDzdJvG392E0ueINGYsmzoJkR
	tyyLD4yw3dsjRgLhwuaZtqHmVVLsqVus0SaE+A1XSqpYpIbTbmsFjRocWuuiKhm8
	QVWO7wM2W2CovT9Jhjjwj4rd51jksbpauTP8bOw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:TweEZ+2dr+cQgoV3/5EaekV6pDv0EsB4gc7dL+vGo7A=:REZ5bJ7yCKVaxunb/8hE77Av7RNz90iifTzeicGap+E=;
X-ME-Sender: <xms:6Dvbag7eargt3aYJJ4tMd5IL4WH4NXDjpCkUn-FsoZu_4I_6IUoplA>
    <xme:6Dvbao00iQhbMQSIafdqnLucPnPz82zTSuIwT5om4RssSYv8ziGJxndvQGaQ0d6ac
    etKWw0pndaU2buiSeITL5KQlo4sjOGms1nzisokK9OeiuneU0qcvoyaAw>
X-ME-Received: <xmr:6DvbalF5wBsDynJEBS_hzDUGs4-uksJVv5MHp-u4gZHJyJpu1uq-QXc2pBuE4GqF93sD4bKhiV42KdIZfb8CHka7dfOQK4g>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWOD
    byTSWn65qyzMW5bdZBQXi8XM5+4IgeKRa8e6pvWZoPuFbL4s0VsXs3lkycdR5ZXMIP/1Ip
    bNvT6iERig0mnEf7Nfvy7+legdZsm6LrH1xdHj0jMTiK/kBgFpwvquII/jkuo+7sU5J9ea
    iilqIq367gG16Z01kG/RA84W3he2LGqmbdp7jz/UH7bLk9eCk/ifiyF4/RrC0hL0JUqYwz
    bka4ULCohKcK2WRTKL0i895YpVfSux/h+A/z/Ck1zkZDdIEj7erCGDqSSVE3YutZENi3OV
    JmsLK32bdmpX55s0HOLut1LJemKcbBMuYuk0cPNmE0KD5xaOcnGePiq1sL5Q
X-ME-Proxy: <xmx:6DvbaqTuEztRIptGpCNJcEa7xJVZytEba3n86g5dCi6_IirW4mcDyg>
    <xmx:6DvbakDpOOgkDVTfKX06FOka5Cj2ltYj2xht5LSP8nHM_iXZ-T9ZBA>
    <xmx:6Dvbai29dUoAa2UQMyT40sqJaj2naPGkNBsfiIR0eB5pEqhBMa6cTQ>
    <xmx:6DvbaqUDk_bbIq44QKeNOnFsJCcNMW9VXxPWN6HX4UQW4tYyUc2JlA>
    <xmx:6DvbanrPCC5NC_e2wEGrmo8Jy28rrLCIK002IAMVPl4ZDhtrtc8C4M8v>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:16 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:14 +0100
Subject: [PATCH scarthgap 13/19] python3-certifi: upgrade 2025.11.12 ->
 2026.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-13-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1434;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=Z5cteYQDMY5Bqb4ZYc+VgLtcNu5KerWG3yZ6bnWwMdg=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgeEaTDL6IknSaHSbPZPTDYjlCJVVleW+ZRh3ARNWvnGkAAAAgfFLjUIV0C2ctzJ
 5Gfj7s2AugE0geR3KguKEhEe7T9/o=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248530

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f8b52902a37186d90779565c7e865fa735078be)

This only changes GitHub Actions workflows and cacert.pem. See
  https://github.com/certifi/python-certifi/compare/2025.11.12...2026.01.04

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2025.11.12.bb => python3-certifi_2026.1.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb b/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
index cbda3ee9e0a0..ef2d93cbc5cb 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316"
+SRC_URI[sha256sum] = "ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

