Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4435.1792752614527281907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=QvwbfoxQ;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=sp0Jkncu;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A4E46140016B
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 23 Oct 2026 06:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752613;
	 x=1792839013; bh=/khFKDUjsZ0ykwwR9nhRWdqWFs6Vxmpa4p4vdaO/Um0=; b=
	QvwbfoxQAR0CFrhA3fpeUQeoDOBwQGOCV9fsVYOcdmeRNJj1vya0NNXH+XTZqggI
	0Qr/KbzOLZrwxlagxmvrD/wYAAcdPNT7HVtCEHWyzv920zeDg19nvQPp63rgk8Bx
	ecSMzZ64w2h0JM5MxrmuE0KOCE/XifBSkGTdv/D89WHQm8y5k8w0QjScruSwrkYn
	2bLgM+0aY1e90ZvQc7GaKD6oD2tfPxhBFT88DcptzMQPKb3drupJePu+S7wpDYGN
	6IECdrXR9mYcFGp/ptUy3anxrCqNAM6UchjV1JZ9SydvIbsL8woX9iTVOOWu149z
	mwoD7O9aTsJKNpZwbxUzqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752613; x=1792839013; bh=/
	khFKDUjsZ0ykwwR9nhRWdqWFs6Vxmpa4p4vdaO/Um0=; b=sp0JkncutGpHCaTmm
	C8scFsqC4SfNfMeCV2nrYX7+i/98Df+gmt2uYx4CV0sJRAjb91vl+UIU8hgP/XhR
	mSmI8fiJbkoPhsBUJyWEsnmJYtB252Ig0o/vivAsUIYEssdRKHVSvR00FigEgphv
	dUpPO0mdVZau+ZxBBsd0EE1voMnPbukrrRkiyodIseHKuPUDPamgsVmB4P0UHpfs
	jtYWuVmZwaP3Mr8jMu1eQKPle7o4UOu2vUj3COS0U4kT4J/DxxdnAyUpi01YsH3+
	YJo7Y5TCoFOEMeY6TpQdaC0PTSF7g5ZDEnw2mPSWK9eBgQyeyk2IV77B7VaMgz+I
	ACW+w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752613; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:Y25+abdOrZksbpU/IjKOpcKNp2AwWZxcuZvVdbqBpPoB0aS
	wazJ24op8CMbljXg/1osfR7tjx5CHNmSQ9T+DL2HUle7M18qfJjoe0XZbzrZEZau
	znNe/VREJOIqon5ArmXZJ03wkqmgIarxUrqxupKoBqgSPDXvjM9f5S8j7NCH7vBR
	6p8tKQh9B2CY5+omCMmjG/jYZTgyrmCD+5vECUTm2CDucLGT0siUKuq4C7rz+UB1
	VdpNl2IB6KE13QSO5t44SLHmeCH/tk/SBg9qRWKH0jzLtBY2wUcupVQ76NpPQroe
	zLGKroKj36OuMrumJx4zzpIerzSk/fd1XZ2ul9Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:RgqJKyUg2OTaZ3NnlE5MSxFV0V+ZJ2GpX6oF8nJAZtI=:TIPxp7w3qWJ++cEHxVnyQ7Q6tt4VfGFS+kRWQtXlQDk=;
X-ME-Sender: <xms:5Tvbatm3ZJQkX8QwzCKXjaGmHHGHRojhqqcq8N5U1XcJhl4VvYYn_w>
    <xme:5TvbavxRu_x7d9k7x0W-uDJ_1-QNbpwIQjmx_JRrSj0nL5Z0CYwaLDWCz0ME3Xu1V
    9WCNyH68vWE9AyVWaDMp4qmoTa3uKPVBLop-LuXL8LTvQJTEydRnlvx>
X-ME-Received: <xmr:5TvbapS73H-o_6kSCfBOqdAIAt27GvL2DCVAYWdLwThHyXfHRmTgDgSypNdqdwQ7LX2cFVZFp1ewo-r2wZeqQaMxgRsj5V0>
X-ME-Proxy-Cause: dmFkZTGyOagm9BfzPb+YtFk66N3nGLsZpb/VPM8XjyvCI6H5ALoAzhuChEVFVvDnkE/SF/
    JqM9HdccU5QGXh85+PcHSXfPlinR50XvCANansdfjHdI2y4yWT98LB5sYItFtv/YCkRC+D
    gCz49oXUOiIA3GSaVy8hQyIFhJVj70/v42lZYRXkC6yDHyO8Mxh8BPFCEOUQWBw2ymS8E7
    RnCBWgaoCjRMBc+ufLfygswQfPbZu8I30UCpB32sT/SGJkXdSH8ooLc1ooYQLEosEVguDB
    nl2tS57Hfyetr9KYXK2lnhEOBFdFfv/pn1dtrEglp90LQOD/J+D0fLXSLeer7z4rPcHWjS
    jI5oXyvGYx/7zxwunj9V4aI0VwLSJc6ggRO1Xnv2gs2QNXNCSl8Nal6FGe8KAi3wc+5qXb
    l0Kmb2w8OZArDZgKrOzgGDs6sqQnepx53uGC88NBsXYWWvpxmgtIAmZ4N1pBMESdSAb6px
    fvn7a3qX/FiPumyuMAf4nB9iZ2yJNIoIGvrib5CUNqwakK0L9/3G1zhzA4YzyyDDhPmWfF
    t8wSpFPZwCL5+dpMIhwI5rgSAP2A0o/qnFGBT+PDR1anwKRb+U3FFNTr8iCppgdhw5h2UD
    qWwmcM8WHBmeiupsDWfzyejF1RQt0thcfWa1pe8EIcT+lkSB2cQFZ3acDeEA
X-ME-Proxy: <xmx:5TvbaitXaG7_CYsXuqTm3Lz6SugKLYJMKNQYWDOPupBJtotkj_iewA>
    <xmx:5Tvbaru0hgd19mCrscRwHCFnnEzACVmpphVSihW_BXJNHae_pywcFQ>
    <xmx:5TvbaoziycKUwsqvDNtbxaheJ22QvLkclEyyVbaytsnRGILFDHQ6Sw>
    <xmx:5TvbahhHjqFJ-qa6yOs_-F6NoB5EEVneu6O99kBDZwciNqyfQ9DGlQ>
    <xmx:5TvbajFF5N1JElZnCnmwnWC8VKDc69bwlT29rzTQ7z_C_faCLZxptOT0>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:13 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:08 +0100
Subject: [PATCH scarthgap 07/19] python3-certifi: upgrade 2024.12.14 ->
 2025.1.31
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-7-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1314;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=KcRuXV7Vq3y8jATnBWEDDoyJWGg1Oy8F97cfoPNTfa8=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGUAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEoAAAAhANpJ+wuhQWEP6/n65opxvzLdUT+COg6eORh5yUsVerlEAAAAIQCWJGDdJSjd1H
 xp57WhRPwTIDnHTJwaQ+84gUukApklqQ==
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248524

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7bfeecb1321171521cb73060f6367467b6084562)

This only changes GitHub Actions workflows and cacert.pem. See
  https://github.com/certifi/python-certifi/compare/2024.12.14...2025.01.31

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2024.12.14.bb => python3-certifi_2025.1.31.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb b/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
index cb2cc969aec7..4283376110f3 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db"
+SRC_URI[sha256sum] = "3d5da6925056f6f18f119200434a4780a94263f10d1c21d032a6f6b2baa20651"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

