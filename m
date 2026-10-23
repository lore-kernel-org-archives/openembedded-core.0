Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4438.1792752616170450043
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=c+47d0ZA;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=dZjXcmXN;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 85BD7EC0067
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 23 Oct 2026 06:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752615;
	 x=1792839015; bh=QI3GVYqPFloiff8Dqiu2rCtnK10istKDiQ38PMp74kM=; b=
	c+47d0ZAGoD2aEOOeNYnYw7TGw0vcCOJTbMkTbqPInNV9OvcFeJtdt/aQ4SfmaKB
	BGvgs4JF4KHhzk5H9GX5Jm7tiJZA9xs/WKLezLoGuRLuioN5mPdMX3n1qiPubk9C
	YoTU+1S31mkqrMnN/XLcAAY7bqi3WX9WRnnZ+VQ8rfoNXbFKdr6xWZ4uniKRdImR
	7Idecrk8CblhpW36GL+NG+Z3injfIoMYL1UBvCbOVTbACudYPaBBEoLFZdIEQcUW
	6Bddig92OxKzjT1LqjqjjhZ4FHDHaMiNy4mvQCoq9QB41HxL2c97C9GMqMzCoktn
	5nHkvQ5I2hkPzj4XoZ82EQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752615; x=1792839015; bh=Q
	I3GVYqPFloiff8Dqiu2rCtnK10istKDiQ38PMp74kM=; b=dZjXcmXNQObSZkVDo
	gPXkEGpKgiOQlothVsQmAnoliT3TjZTh1GS4/rbdoCW3qLtlWGzTl7+El5L8/IEa
	HHOIY2LATzAaijypAcumEw0vL8U1uIrLl7wGYVn/dbDw8W4HYECXSqaXRy9icVHF
	b19Omkx75gkUkQ128V7xKbEl+S1FkXWescVOCkKF+Gy984AeDZOGaGzcsWzDqtuq
	0Di+O/VM0imwFHwzI5smF912uE5+iVrzueMzsOFsb+Q3NKJRA69BA+UX/TOGpvhu
	GMI4IiGx0V3649VzH3WPhchCX9kOATXGXKx+fhof8gU6UroS4eJakFPLYtphgG/2
	Ce/eQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752615; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:sITNPygnhOF7f9jLOr8+8oCg6GtNORDIAVxtc3l8GazxmWd
	CqXu7LSDgxbf9/lLQNNPFDUoRn8EX+q7VRmVGWnV/do7xFDXDf1qLW4kD+bCyA1x
	3n9uh0FF1yIlWRtirDCeRZMHDnRBYrYKo0YUGDai5JPxo5owG9+h66zUx5WT+Kel
	bPhqN3Egb5xH+ptJ4f9feukLmFvipkMTjjncL/t8KO877bQNLKLzW0i3RMpRz65k
	mlClhrCkUq0khcCudLPCkjfcdYjJhReABMlHxAUbxFqYEbcpgNk+yL9wCauIl3kK
	KI/5Bwc3BHNYr3l+sp2/tp7TEbRu4iXup24sfew==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jiBJ1HX9N0NgO9gOZVWpg0JJ/2icEQ8787Mpks3gD9w=:h4zXhGN952yN8UjKPkExmqMNYFZ64VYH5rxMx7fZJqw=;
X-ME-Sender: <xms:5zvbapja4Y1e7Xr2C3NCnHPn1hiC_achU-YWgMh0dx3ERvUMy9hgTg>
    <xme:5zvbak-3Tk4kMSUPgIVNSRuVkG7gAlXcn-hF3Iqb3tqiKrmd8h_HBgjszRDgdiGoW
    U2V760v2GyURroY4e7aXp7d_feDhNOzTMIgPL1TZSkKI0WmtKcO91aLPg>
X-ME-Received: <xmr:5zvbautxKwv_QgRtg_EcajFAB9Lq7i3Okp6BebR6MUQUPQWGVdkkVSiHWa0Lm0f4hAS0n3q3RcZneoJLKaCC9xoxnVtaLFc>
X-ME-Proxy-Cause: dmFkZTEYL66LKxuu5HVY++NlSHw9z/QngGMigoi5osVdPoW9fgdtTzhDgRBe/YMIIHEqGU
    MYuwYmkQk0E1JIjfm7z8ADHQi61jADv0FEajF/3/DJ+x5Y0VWzMkdk52wPDfghXkSWFZ5i
    z6EAyo2YjSJDDZwtfXJXqKAkUjY6BFCDFGqPWbNohqV1ejfsNU4u7U3khETapy0mckVQ0H
    Qq2gjYgSV/u8qm2Yg+88Ke8ow5PuL8fReHLrvV8DROAwiZEwtB/Nd0Vvcrx97fDfCwEziB
    ASTo7oYoVQk6oddkEdgPUYOiL1KYTOvGkI8UliMDh6zmTg5khkPWPJMszG+DpboL4jYpUA
    1123AbXa71h4u0USXXVyoJLYlPzA0XEiXqeRCdI1wK5VE2Sny8ncCB526rQFJRB3XrMI2M
    gchBum8wwutesqD+TFvbw7vE56F+fzOrK1ZxBF7Jng8/QTE517HtM2Tj0LtdOr7pUfQf/X
    gtuM+vgUTcHzRmaRcONoYKi+X7dmPMgRaHLqJkHziMlyjZF1a4/hr2gwu+KfRL7xYuzVpC
    k5e1Fj+juzIzsQ5E8JlC75zqaSYS2oh1mmIletGPtw+4v+QG9r93nAxSXEw3NzCPXMbRFJ
    MsFEYknqWCGbUbZXPIQ7kcv7FsIsjyGf/YjiP+5vLKUsvBxKim/rlUq5VT2Q
X-ME-Proxy: <xmx:5zvbajYk8gD8uSgLvQ8VanLpeKl43S3S0ho1oaS0Gc2I7pDFJMBc2Q>
    <xmx:5zvbamrkjsojeK7Nyb76eU-lpagllC9EVBPMcSDyAyxEWMKBUyO3wQ>
    <xmx:5zvbag9qcd-XG5GsP9cKmtm1PveS87oP8GsCfpfyMaBZ48Dg2TKgPw>
    <xmx:5zvbat-rZt9t3s4xKjZLgMl-7IlMfn1ljjqqk6xOfwen3Z4Jc1Rvew>
    <xmx:5zvbaqwclL9tQSsM79b7rn0rXnRToTpXkgBHeSeaONIOorVc0fq1yl4Z>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:15 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:12 +0100
Subject: [PATCH scarthgap 11/19] python3-certifi: upgrade 2025.7.9 ->
 2025.8.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-11-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752608; l=1732;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=BZIugiB6XItvDVnVpC9djOPfz0e/qEmR5jheFqGTt04=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGUAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEoAAAAhAKX4em+w/bi18Vr+bl0dxXSVvuGwJKC+AF0dPQW34F0wAAAAIQDJJ3daPNiHWp
 R7O5vM9d9cHewHA8qv8IIMYpfv3yU1JA==
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248528

From: Tim Orling <tim.orling@konsulko.com>

2025.08.03:
https://github.com/certifi/python-certifi/pull/362
https://github.com/certifi/python-certifi/pull/362/commits/4c1bfa53ef5aad0339d9ae7bbcefc32872a95f6d

2025.07.14:
https://github.com/certifi/python-certifi/pull/359
https://github.com/certifi/python-certifi/pull/359/commits/1c50d2bb6a10403300c0f1c17cff1b6277cb88d1

Comparing changes:
https://github.com/certifi/python-certifi/compare/2025.07.09...2025.08.03

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6067498b14ca5d90640169384e51aa9cf5c1b8e2)

These two releases (2025.07.14 & 2025.08.03) are just cacert.pem
updates.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../python/{python3-certifi_2025.7.9.bb => python3-certifi_2025.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb b/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
index f6607dee0a48..22cb0778cb9c 100644
--- a/meta/recipes-devtools/python/python3-certifi_2025.7.9.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "c1d2ec05395148ee10cf672ffc28cd37ea0ab0d99f9cc74c43e588cbd111b079"
+SRC_URI[sha256sum] = "e564105f78ded564e3ae7c923924435e1daa7463faeab5bb932bc53ffae63407"
 
 CVE_PRODUCT = "certifi:certifi"
 

-- 
2.43.0

