Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4479.1792752617626854285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=s9wCAwu/;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=amHcV7fe;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id EF38AEC0067
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 23 Oct 2026 06:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752616;
	 x=1792839016; bh=kltt570nuPBzFKIsc1Yz6ywxVUw94JwAlXZhnBmvWEE=; b=
	s9wCAwu/PpZC/y1iqcvpqszKWDn0sDTbsLPEbYfzwz55suqkbc+Q/WmbLRCEfHn8
	oKaTytIaV2Rp6fZoG6X6+TtwVe70ddwm+qJiDYnNYBUoF5Kqd/s0sGFH533tTdX6
	BRibR+/e9EcDgbM4uOJKbmpCNIs1lzZpZXBe1i/fDZaf8D7MyJzGiN01s+yoi6ag
	RLtRcBqyr5v84gb0/38/DdnbdEduYhOdMtBH6zBZgn3x6DwXRLyY+SJolFxxW/0N
	r3lBtKTy56F+ucgT8sMtLYnwI/tkbUkudCXtgc5XbiVl3oM8zeA0HI535e1TTuv1
	Tvb6u+MYqQI2IwE4kxp5TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752616; x=1792839016; bh=k
	ltt570nuPBzFKIsc1Yz6ywxVUw94JwAlXZhnBmvWEE=; b=amHcV7feB7c8d12LO
	PNynNb5D7Hv0NhNdiGD6eNSlvz7YouS92umPgRIJa0tP4Mwevy8BjgmhsMrGyDfi
	6GmhPEcvF5c+ps4Vw1ri40zvgM8EEqCvqFFtYX3P4ZzGeiWTiTT7yf65On4vbPj5
	zmQa/7Fh+bt+sUzASwypD995EkM22c9Nb98aUD3uaGnkvXrVyCipxwNkLXrTcSkp
	KkDk7O2RncKG0IUi2YgDDqJqDkcsl4dwJW6gGJYvoUcuZ2y9xiXMw5wqSGTOwR05
	jRBVQEAIcTXnZBjRp2XQb/ZQTSr0oL+4zEUWfnSd/6y8vYWe1L1d8NApc4hu01XC
	WAisA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752616; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:YLU/WwmX7GlAZL+IGfJc2XhbwcU3Oj5YdiboTWp0jbmo+bX
	Q0tipnpUjPAdezqj2RObJcucpR5vZVwcogVwXF9ktNPAY7OxqhJK9+qghEQXqrz4
	QtJqLgC/MKb90/YYkBGicVUtlsrCKAMzhrSUPYvhCZ13L8Dr83NflfVb73oC21cI
	2dK36DWEmJ5kJuKjICPxqNcISu84k7OrsSboR/vgkqABuqaA58Cgfy+asTOVDXCS
	fPah/ksRBI26p/RQFVix06ZvrIRwBeTf6ukcvgTDzgkbdKkHI5fmHxxmnVSsQ49/
	FvoJeU/NH6bvmM5L04pY1NcXtHvYpyTFfl5sfNw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:L4xiN5Ftgh/PhJ/28M3XierCMKMe4rYcNjsNXLYaF+g=:hmr+a361NK0GL/CcnGVDpzZaWrmoAvRPYqaWRC7pg9M=;
X-ME-Sender: <xms:6DvbamT9giVr-sWDykqz1KBtQHx_Ekv5UfsvADoq7EKaQ4OqC-xBHQ>
    <xme:6DvbaivQPZ-qO2QBxVIiy3w011coUeLzjMS4P41QisJi64MN6sEC-KypFRiBigTAz
    TlAdPk4UJn_NdN6VL22OIAFsplgMB7bid4j2WuVicGLZOEzLpRiHWbl>
X-ME-Received: <xmr:6DvbapevHgS_6ro15m-n6_2qPpFRnQ_j31ZVN6hQsSOOvhQFrmrz0YgL6oXwxzRSNWCYEIUIAunVjq-vOU8FDB195xG7aZs>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWUz
    98tHraJe1EuXLxNWUtf4tYx7Mx+G5OzuZ5O2ZQkcZEg8Ui+exbFeK727Zpv9R3qe2PuGkk
    0QoxZNTqpp/3JBujhw49XyZv7asUcXv/e8ZSV+nTzF6jCrtpEM7RHpYJYw7l7QLs8Hwv2U
    cUNUu3RgRilNr39t06wMVbXIAkWm3ZVkr4kMrwcp+GiAXwxD6mk66iP48L+NDQhFs7ypzg
    W2PdS/g2SG3VqAz0XqLvo042LJ+baX+8DqzyAfmrm8GOoePKY2gEPU6AhAkeQ0GNkp5jWU
    PMAwPWyCSjcJFEZvYFo5rmmN79w/GdKAlkLwuCETJmdGEiVVs6p8OiNTfuDw
X-ME-Proxy: <xmx:6DvbanLue4x8pMrLNx4nncves1KA4rVrCl7n6nL75I6MFIaKUSKxGA>
    <xmx:6DvbavbnO3cl_7O5UodBW2T0HishfuNhQQ9-jyeQQsbxunR4FOHqGg>
    <xmx:6Dvbaqu0W4PGF5QKdB-IHK2CeQbHCbpMkxcN8w2XAq6WHTtGWKRYQw>
    <xmx:6DvbakuYADmfNCKON0N3RmHt_8nnF4KHXj8mFNREI7LWYevp5me9xA>
    <xmx:6DvbaqhFVxj4Vg4ygdayOVnvTvJQzimmEDAppzar3II25_jkNkcZ2uaj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:16 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:15 +0100
Subject: [PATCH scarthgap 14/19] python3-certifi: Upgrade 2026.1.4 ->
 2026.2.25
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-14-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1494;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=46yQtO57S4RiCxXReVtEyGrW90OBvM0oyf8ljyk+Na8=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgBwnrgVY2g883WuhASUAVbvfOUZYSd4QppcMISA6XdqMAAAAgEAUjJ7YsRyoSyK
 EJSDodRbpA2P5eNdF77wcCOuBSf90=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248531

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2026.2.25:

- Updated dependencies

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 117a5139318390c54571246130c06f97cc8c2746)

This only changes GitHub Actions workflows and cacert.pem. See
  https://github.com/certifi/python-certifi/compare/2026.01.04...2026.02.25

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2026.1.4.bb => python3-certifi_2026.2.25.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
rename to meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
index ef2d93cbc5cb..eff12fe3280b 100644
--- a/meta/recipes-devtools/python/python3-certifi_2026.1.4.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2026.2.25.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "ac726dd470482006e014ad384921ed6438c457018f4b3d204aea4281258b2120"
+SRC_URI[sha256sum] = "e887ab5cee78ea814d3472169153c2d12cd43b14bd03329a39a9c6e2e80bfba7"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

