Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4475.1792752613788003508
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=dg0OVpwc;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Qw13xxA2;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 282711400163
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:13 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 23 Oct 2026 06:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752613;
	 x=1792839013; bh=ZKAN2iQIbrEDEI5haHgRwdrtpCQ02XJVQKflz8HJH7M=; b=
	dg0OVpwc/1DcfjmnU/v8kNldtgXJt0rUK8XQae3WmDqnqwwMgY/CfuGHVDq2KSQ2
	SpPsmzgEBgzpp37cJZ+eW4k8ckpu/3nqWnWi07F4u/TfXC2Hm9cx2d5a6wq4MeC2
	8dkkNEsQenfm+btSB2KVKWGOjRqLH9tV9iTUo/KnVmjFkxqjOnVFmWXnWf/XRe5v
	CNXK5ZjctMFqAz6pepc+xWnE2vmmZnmWdtpJAdrLM+TLM2IIF3WkAR86z3Bj/B92
	rUq73A121WIyrovX6OLGjMusCtioIZsenNuUerLgvN/JwsLwyLyNFV8yGEuZOsbV
	k4Pk788nXiQAbe+i6dUCWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752613; x=1792839013; bh=Z
	KAN2iQIbrEDEI5haHgRwdrtpCQ02XJVQKflz8HJH7M=; b=Qw13xxA2JOD/31OQ2
	9VomdOyy1BrSRN9pb4FfDAA+CxOzreVBQkpnSAqLk8JLDWHLrQOLlimLw7myk7m2
	YK3ClUSFxncLCGBVm9nrzJOR+JyEBC+IBS626/hBl5mU1brxf8aXDbRKFUMvV4+o
	jVs7916Ujgdy5tNviH2owO1RBqmgIoUe7bw6Rx+kHPWd6bF2zOWQxyZrjAD2mC7i
	Wz8v5nlQm8sKsFYJLh7qzPmlrUMiK51wDNPsY3N1R1d1iRIsMrfxBfP9NSfunDzT
	DM2Pcm/I7lGm8JVoCmdONfS8k+YWUzs7svdWAkkyoSVftGlmoK0zR1SlNytahs01
	Kr1ZQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752613; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:i3n7VxUTR8FzwSRyCph5ZUZ9LscqqWfWhDGeo9qCK3ubdmB
	mDjKn/7506NOf+1QpLGalD66ennqqHHx5J57BkneoK3ppxQp1R5bQJT3YCVZV+bG
	1C1ONLLG68/9Yuno/96t9ze+MOoL4Imelw8sX0LE4OYqjE/IVQPhgaXZQ7z+YJdl
	dWbgx5I06IU0k7581d4UlKz8qmxNBr6oIoA+AN5zxVeitFE4d5AEZmD1y+AVZAj/
	+zlWllb+vLrNC4Z7uRHNmpisWIGMGFWPkXbH0bQPQtNieuw0Bgv3HHg86eTv8KDg
	2hEjGptQGNjzReWSUxMfBBWAhoyefpKWxf6JGXw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oSApb/0JH3FBhKlDIRBuITha2wsT0Wx/5UT+jX9c6P4=:YhtT76E2qziOio2TrvJWmDqRmAulqxUkYtDtPy44QAo=;
X-ME-Sender: <xms:5TvbakIq9T7WkoWHhFR2ov0_0QxYVaRVBW1Urm1Qr8VapHqRjjZxrg>
    <xme:5TvbarFe0umsEG8oIVJppr7R5K7gKj6GjPLXfmtlA1oswcWy-kX8-7dQviNula5PR
    7IbuKK9_uUfR1Kz8apIL3uYuk3r7iIc0I0TBCDKiiSk3kbRCtyI3A>
X-ME-Received: <xmr:5TvbaqXC89SobZR0dv6UK6aOq0p0iHtAKSNNVkfpH8YEY-LsWi1E7mUFvDV7pdqA_N7k_BJgVIXV2bRjNqQQwTy7YJEYP6A>
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
X-ME-Proxy: <xmx:5TvbamifO5tp9un_LVOVgm_Op1H95NIydIxqTKvlkOa3bbtRMWto6A>
    <xmx:5TvbarREn261ynnjJwlh8U6nriAdq1e7GvsE2jA1aDgITAwsOu_R3A>
    <xmx:5TvbapHlJGGCpORObKMQr4LIyRFKay-MVpTiAz7aUk-MMxJy7JcGaQ>
    <xmx:5TvbajkOofHdms7-SCbbuXT1hERXoKJMLH04jjGlrLlCze8sA-ycYw>
    <xmx:5Tvban6RlLCArHbjucJGbOtpmutL0BOVxZWowCmWHg3RDUedYrReBAnL>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:12 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:07 +0100
Subject: [PATCH scarthgap 06/19] python3-certifi: upgrade 2024.8.30 ->
 2024.12.14
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-6-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1493;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=N0/jGV0NijMjAicO1LAb2WW0zzDhPy372tbFh2JRAZo=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgcUdnw2kzN2X9pQC9NklnOk2+uYiylK0ZVR3PkEoYTm0AAAAgKaRJllCrY+9RuK
 1ND5W4/w4UjSwCJT/PHYoNFhPB/Ow=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248523

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc24b0e7b647a655a0e34d446aa867e8b6a445e4)

This changes GitHub Actions workflows, cacert.pem and adds a classifier
which is safe to do on the stable branch. See
  https://github.com/certifi/python-certifi/compare/2024.08.30...2024.12.14

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2024.8.30.bb => python3-certifi_2024.12.14.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb b/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
index eddd05282df9..cb2cc969aec7 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.8.30.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "bec941d2aa8195e248a60b31ff9f0558284cf01a52591ceda73ea9afffd69fd9"
+SRC_URI[sha256sum] = "b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

