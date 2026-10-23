Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4440.1792752616661493610
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=EMthUF2X;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=pZuyYR+6;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 074EA1400163
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 23 Oct 2026 06:50:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752616;
	 x=1792839016; bh=uNK4pCiVPzKa3KzdksMwLfIxQG/nO9nzwq39l+C3q1o=; b=
	EMthUF2XVPX0ev6lUbry+aHWos6e24+FIkus3s510XlD66mvlmwritvgypU4IvcB
	3WROCMkC1XDphmD34+R7d8AExjNUR5vAoK1K2ZQU+/3B9Y/ExC/DrhUkUu1qR3Ax
	Iq5rzOntHbNJnKvWCSlC1MhbYbWv9vhhEYKKt+QbKYevx0JLhH48Ol55eDWdh3zJ
	J10DiZwoU6tIqiEaPoCKr8CjusYnyqAQhu5RjtDc+E1RzFudCM8RnVYF9C+2dHTk
	hZB4MwdXUvlIXJ3VhD5Vltis1ZqhM4VaSV0BPV8pB+By1YdzCqq7fYPZZgitlI1C
	lI18e8jq/sxrp/bpNfRnGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752616; x=1792839016; bh=u
	NK4pCiVPzKa3KzdksMwLfIxQG/nO9nzwq39l+C3q1o=; b=pZuyYR+6GUd965cxP
	8uFH950IjB84PhQYPjhREpVYe/uLABgtcSfEP77eAt6o+b3/Ez9NSgFHqEjebelK
	WQzefEb3e7wR9yu/9kvNJvgz/HxTGf4hEYlMsPVKdngTM6YjmGsJa5lMiMyW/KsR
	EnRxEW49MZKe0ZRZ/GB5ugiwyy0mSDdXA+a6l1rEDr2zXLdIhwY24TWFlEKGgpm3
	A7DukR5H1IP/STDyenbHMngQkmB0YCgWTElkJFT+9ybDgmRWNNjCLElnifw4mAjX
	Y8xBh1eHSgN5+3HPx8TF4fat9l9m1b9wRvlItHZMoMe7md4CbVRkugm1HJ41bvAk
	nqMcA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752616; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:GmROSiBMQfFmfQXzEtOkWVcdYPmMY1+LqmUwY1FHQbPyUkn
	kfJuUyKSYiD2ftiepe8ByyTXzKRnjviZYrE8J9W+wAt27CYG+cwlzwVd1Mun6HPs
	ENn4gZ2CJf6qJyMBaQLr7YrR+/+pwe1EZqCUGiEXvroH9WNfAIleq1qtyahDtv4q
	A0VfLOlC4bEUjW1yRGB+0V0wHJHHV5tcWTLG9kCiNO0zKLFY9QrBivM+dMlamZLD
	aCbMWy3bBLxCYCqDRBmBFiS/26g8ZtRkT29+ew+L+G+VxKFxqFRlII/A2hJFp8JA
	bE4/5fB5UGTnpxmBTD38B7+eZPy9KthtIwFxPdw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tb2x0vx05ypZdq7Yy31KJ+r7tBumfCSADNCQYkT8Mh0=:ojaY0zKdICeEzTeA8F4Mb6XQrP+T4QLqXRnfdKnenxQ=;
X-ME-Sender: <xms:5zvbauACdqK-C9qaEjZN70Hqtrcs_POOGCBKp6YR3szwIlPGPe8YwA>
    <xme:5zvbaveN9L9mfvA-9cIBl1Vgz9hsA13zPEWkDgLY48emiVa073uGlYckcec0q0IM4
    0MF_WcfJ8nQIeJiwNzN0yatMqmuOxvQHfNKFs6zEK2Ed4dTV54PUg>
X-ME-Received: <xmr:5zvbanPHggCEG-23Sz9bQeFbIdJ45c_ZcaH8JaFDnVJTz4YN6Ldm_LTRM7CnFCKMb6SmT0vixO_TPrzRTnUC-8oUFm7umqU>
X-ME-Proxy-Cause: dmFkZTGTN+mLSiTF+ri5KUlfQAaLV+dGMhxbATVdNpgXrfgaFmBoF6og03/WuDCbZe94dG
    LYuvr1Du4ppmhBJwvArW81qArDNsBFZQ8Afly7JtqqzxFM49MAK7uiaxNpuUzEKE4lPBnW
    sLzwTuDMmkNbNH/qvFH0F54mwYdEwcfW6vTJ6CKAG5dxC1bTnxLZhS8KMDXV54sDQFl9C7
    /vpHTEftuZm+Hb7fvW+b8C3HuTDFywtAdHrzEqfZKF9QJoThiL0/iQL73hjNmpUXzCNCK7
    blaV/rHK1dGHDlCuiLuV0joj1j2CBCjP6KHWXXbqSLSb7+EurxOLkavjX3zINWT6DZB3s8
    pw7EFtHfEncGahD89Ngx3AWfGx64Doa2lPsFdD/yfSK2KgdCDfDYUYSYEY2s2Kh5YLTSdV
    qdFcqwkuIixkaNooeVqtBp77AT2n+QM8rrUeSVnN1vFrJVlTmJ1sMdEswvCwVGG33DpIUN
    w5nKdCoCpqHVZvIgQNcTppvgpjx+zHc3YTg0IkctsRFEFKiZrdXUqm/kHTkpg63Fupo8RS
    hdb7llocaKofcDMsacn/f+O1EEwVJ/yU5OF0uS9/AX6Qq0hJALnokpFwZcHqXT3fQu+9dQ
    1n0eGM+BPeeort0W+fLowQ2riYNr9GJ3DnmAPQ1RycpC0Qp2t03DLrmTsR0w
X-ME-Proxy: <xmx:5zvbah6_WbfGG4wvWWZojHvAoYoVa_vPlxuGi-3FWX3gOt4RPspPAg>
    <xmx:6DvbajJJuIeRLb7HfWYfV0fs-1_-YsUqIXyGEoozByKvwEQH83IVlA>
    <xmx:6DvbajcD_fIRiH61U5gJ3EGlyZNRHaixr1Mr6p7qC1hMXYtiQj943w>
    <xmx:6DvbaufRUH5jcv1LwgOqWxSCcDaH4DzjvdFHNW2sHlXUz_g8wgkrVQ>
    <xmx:6DvbahSoDDQk2Ghm0nRdhxTDXU-Fs3q_Ywi9XXiDWD-uEboBFoDEkTyq>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:15 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:13 +0100
Subject: [PATCH scarthgap 12/19] python3-certifi: upgrade 2025.8.3 ->
 2025.11.12
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-12-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1700;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=h/U40LMMse3GYdDhrelcaoMH41KRaLjEMuZmnl+sCbM=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAhAPzeoIFwPk9EnKXtfCueQJqvxvrQwd85Gu1YKRJPGw3fAAAAICzh+A654k1AzA
 JSqG6Ec8+N84ZU6kW3l7mhT8AGOW1p
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248529

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3cfca11c5d5a7fec9ea06aff400ac5a41e7aae47)

There are two releases here (2025.10.05 & 2025.11.12). Both include the
usual GitHub Actions workflow changes and cacert.pem updates. The
2025.10.05 release also added a classifier for Python 3.14 which is safe
to do on the stable branch. See
  https://github.com/certifi/python-certifi/compare/2025.08.03...2025.10.05
  https://github.com/certifi/python-certifi/compare/2025.10.05...2025.11.12

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../{python3-certifi_2025.8.3.bb => python3-certifi_2025.11.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb b/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
index 22cb0778cb9c..cbda3ee9e0a0 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.11.12.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407"
+SRC_URI[sha256sum] = "d8ab5478f2ecd78af242878415affce761ca6bc54a22a27e026d7c25357c3316"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

