Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4481.1792752618594081051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=tVeNStmx;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=SyQUjJ9Q;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DF1F71400163
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 23 Oct 2026 06:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752617;
	 x=1792839017; bh=MuAubjStDp4itAWLptDI8RICbumLwqmmCBxk3xHKf+4=; b=
	tVeNStmxtNuHymiKxEIbELomJm+6XwIXWkXQBcHvS92sx9rhyQvSDjeR/mLEnel1
	M40dpyNBB9UzzR1hSFVjlYo6WRhUU8DSUoWoCIQR7pyREWCQDKs1XSuYwSIEUpea
	GeSxSysibRO7Ic1Aovg+VAwmJMR6AvJNfaajw85D6VBR/4fuDd2GOWTnOnk4YwNu
	ISH9dcTjLbNcfZ8W/NzSZhBIHsuJcAfaOY4m6waFxWLLnbl5LbV14u/x5Hf7/NSz
	MawiDD/wKVme0u2j0XD3yPrL69pSVCGAPvEZ7FX/BKquo+WcHB/Tm6mkofa9LknY
	AjwSfvb8emcC34pU2hR4vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752617; x=1792839017; bh=M
	uAubjStDp4itAWLptDI8RICbumLwqmmCBxk3xHKf+4=; b=SyQUjJ9QGqaXYIQEN
	vuQPv9CtyWQ7swzBkp93T6HcZIVyY/7/YuO4j+dAP+Fb99mOk9C8Mhp4uOw5CDrf
	szmtTemEFAdIxdXql3si/VE6nw7RxW2blDulQ7c8bTZv21oj+CttoNUgn/O2eoPk
	rZVWBb5MUGCD01hHuV/3qFXvzGoyAYhWS2o7xYfbrSmgal4DUZTztGmqNWj+QS0u
	PDecwB5ek+AvmsKwSl/ECOd8efLs88b6LqSbeuwdEk4fr27Nw0v4xHZjtuDmY3g3
	lGMgVFIcATYUnhqK6D8cl2IBQgebZB3Kn0gG+ULdU/j6SWhGTCgL0YVMSpJnujsX
	x6Kog==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752617; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:pG6l6WQ4Ow9NCLuYjjK5cI50EGlVdycHjF/EZkThVy0gTPT
	XtmML+JGf3DaudLOBvGQwy/jKJbcocxh6sPo0zWPMJP8NPD0qeNBWPMNRRc+j/3B
	G38oD+ziZTfPKPUx7GTKmD1db42i3LOA9IJ9u3TBfiSk5JCBgxSN6ZjP3OOHjtvb
	cR5egecAdQQSzpkIthYk+JbZoNtvwaq585xGUY0rhzgMvYRksB/vk0aETY5I7buL
	JarjGHgD66HxQwLFjJG54U/njncZPfwAxstvpLtNrw22FUC0ZlheXeK/jIxIHUVg
	GHpSHUoqQHxyB4A1jieT1NZFsC16z+5FzcKmbVw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:F9E6qWiwg4cvhOhIJtn6kISajLylC7+UvbG145FwMco=:Yo9EZf0k+OOWkIgBqtUmipj3B6Ddp/Y8HE9Ky149mAI=;
X-ME-Sender: <xms:6TvbajFVsDzH33qXl3G-kVASlAIpX-s29Plaorhax76pive6v195KQ>
    <xme:6TvbanRgavGGLKIFwwaXklQ2kZAVg60A2-uheTNHJ-wgoWQA6QVrQoMJ5MJDo4g71
    d54gQ7T0FPMqH6X-Xt6Zq9IN2usECcnwNCiRmK37oXEo1oNNgXSH9Ay>
X-ME-Received: <xmr:6Tvbaqy0BVzRgkJgQ_NaGnNOjXWWA41rLWOt1_b6HNp82v82giwKpoA7o_HyZ2mPJUJCw6EKkmloi1L11PhSv9k3YQejaHE>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWK3
    3wHNX/XKF70VR+sCAo59FWdPaguZ/fDL49QKpGgq/TReQ+dTE1EQ1r06XJeTfRnprkIR7v
    cMcQwhFYmKWqgfmcNdZliicowyBynzDd8POE7iw7roZteKMPmH7A/szjEDuqTMowzQtJgn
    axoK/zBa9NTEdFNkCQDFz8DOYhwpxruaps/vOAFPHPE4L0Wjm6uw87sXUzWSvjon9VKfla
    DFVbX1D+/U5lHQtujtI2mGdUQva8WwWCDw8nmVJMCeZZ2UDgaZp2icuVaT4j3ryo38QQ70
    x/du6w6YrN3MjgfP00Ay8O6nee2HKZ5ZbJV0o/g+CBTRtYzz5wu9Czbg00tw
X-ME-Proxy: <xmx:6TvbamP2xW0cFGPrEX6wTluAa1z6r-LPbB8eKw3mgDLVXii6Ln8DJQ>
    <xmx:6TvbapPPDzdgNTcobKyAQ8BFpqI984ks3HyzASCEWOEL-8qBSuT8lQ>
    <xmx:6TvbaoRgaD1LXfEh3i40vxxbzvfiWsBpWjFLbNhVaQ9iDm7RLp7aUg>
    <xmx:6TvbarC51mzeTReYQSpbXqvYlX-e2g5f7Kb6n5QL0ipdydZy5yuo9g>
    <xmx:6Tvbaum9PShl99Jve51jKcDjYSdAiuQzvuQc-UmmxhnQAEE5lySzc-4u>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:17 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:17 +0100
Subject: [PATCH scarthgap 16/19] python3-certifi: upgrade 2026.4.22 ->
 2026.5.20
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-16-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752609; l=1872;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=6632cn2jajjolmwb1goRsaicnA0CTaeJjsvm7Jr3D+8=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgeRTq74jUmZlooHyjjDThEc6gG5/H6iSqCg6y5HWJ1QsAAAAgOiD4/MXYRXjwDM
 KS61Y6F8gY3ApwuiIAKvibN5TVpD0=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248533

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
index 03cd00d78f4b..6794924b1a7f 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.4.22.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.5.20.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580"
+SRC_URI[sha256sum] = "69dea482ab64caa7b9f6aba1c6bf48bb6a5448d1c0f1b17ab42ad8c763a5344d"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

