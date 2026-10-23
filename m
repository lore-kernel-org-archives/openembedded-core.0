Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3918.1792751309153358952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=bmO8E35d;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=YxTt6T2G;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 39026EC0114
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:28:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 23 Oct 2026 06:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792751308;
	 x=1792837708; bh=ona6UsTeGRqJhTRBGRkIWJ+eL64VAWZBf5gHgKjm/Uc=; b=
	bmO8E35dbZOgUpsMlGoLJAObPGaS4AYJdaGcR+NrKOwTihySVWiZOsVVrWe0v0H9
	hUvSoyFiKPGKNnVN8MVJjBU+wjISgbHDYsYRpmyizikRn30qQAgCcuxQ/9tyC7Rc
	TGZ1iw+VNCeKYQxWbAv2oPJ6j3+lK5V15j48lLhib8dK+96ls4lw3jNoLp+6Zrgy
	3jvKY2T0BhwpzL//CKcOM0waOhv1o/ndh/YAHsTmdNSd1y7NqH7dJ2GxG3E8TWHn
	LnjDPF8CGRgUql4b7F4FCILF+t2LXKqEHLQq/P9kwySrJO3NvjmILfyPgUeBnfxh
	Y98vcbfKWWsJZw/n8v+Gxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792751308; x=
	1792837708; bh=ona6UsTeGRqJhTRBGRkIWJ+eL64VAWZBf5gHgKjm/Uc=; b=Y
	xTt6T2G0KThxHvJqWp4QPnpR2qVQpfnC3OD0I9oJkLJbfE2OOkjN/BPPpvOm/QbV
	8YJqJEDHG837oSZtN/beFCv9Nz2zibGt8iAtwywskETGt9SkzjvopN3Wk2srkOXg
	8SdnDpyKuQn1TPF+N0dTdtxT8yoB0WiaQNrKOAunIgY8EMfZsfwsZUIKR2sc9gUa
	0yfe2r5OaZqqzmTPi3tLxhBoANGp0BDAd1635unInBXCHxxdbRWIz1V0ZSnnbwMv
	Ux+TF0E7aEzRO2zLZCRQw3WhsiSlMp295Hx5cp1f29mi+iT0ytG9xECL1qocEomf
	H6MPBjp4nlKY26ADZWyLg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751308; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:MphGuutFQ73vx1KbKPYsGHU889tuzEqkh/BP/7qolrmrJpJ
	iAmdCZrJO833K9mk+xR6cKUV+5ngCZNSEenhxxFaxz/Rvdv9HmgdQx9K/D5ikqZ+
	sMbIMtrjNAH3arVt/P/B7zhcaAxohrB0dzuY9IrIL00b9TrcLBTb7NgeQ5tFRqjH
	dGsZVMm4IFvZfPvn86Flenqml+6m1FM92WDOVih9GHlZ6Epr8X1ENDU/JOQqZ6eq
	eE0WVzqvg1+IfWpChmt4LIDWSbq7X7Gw8jnw1cugR9ZRcGKGN+bmsDjrDEDmM4pM
	CAfoPMG9MHLRx7PjKqZzDx2xofBR6sToNUxCksw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:n1/3OPvXwHUpU/blg1OPIXyX9s/xU6eRVFXj2U5drlw=:n5Euz3HHbPa1+befQDcj2XxUeANCjET394eU1hisgaU=;
X-ME-Sender: <xms:yzbbahwFgMnGKoCNXD4E-_nYoSGoB7d3o6NLLjCJ_8Vdkqqh-eLGiQ>
    <xme:yzbbaoQVGDFctbyi7PyP3iWf5jk0YPyJBv8PHjHVPFckbHisXzRNAce0mY69rakky
    QTGwQEmLNLcDkaupl-Ga2cCwGKOzFwJ7l_98aRq4BA0pv8kvzcXY0CY>
X-ME-Received: <xmr:yzbbagXPL0arf0rpifrku86rUTwYvVkRgt_fRaHpYOkZMdEZPGRQhs3oGylSnZhL2J5U-mD_U4_G7KIqI4i6rMqfmTwk9gI>
X-ME-Proxy-Cause: dmFkZTFjYn69FDD+K7y18HdSBKKDWkFjucq55n3aZUo84lp4iYHsGQmG6IR21HGg3gj/Hc
    NEAxqFcvTcqqV72p9XjzlllQSdPE0KZzPePWpweNhBhopB4mlKfwZbrrgdXs2HjFwPFi+D
    yDrz4LbzOm06VG9NAhgkwdKsmOY6eoJFWJu8YBHRMw1ppfWVMt8xpY4BLN4vsZFeYKlMq8
    EJL+sByxQD4ftaU8FgmD4i7lz9TTK7Ym7s6qhC/jWWJy0NPw3UUlDXs+O3Y/8Isd9RjPFP
    Z1uRRDd5n0RBdDf1Vrkr0pmqY6efX17g2RpbR9OqWZl+uulX4tUIb0H5fpcexPDgHLUoMw
    eAscLKbrO6APIemJSfghPnsism5KAVeyWw8zKAszurC/TpF2WvnUJafvK8mh/A0mnQKcxq
    e4ohOsa5GJKjPfUQsbhroCFZBA7aOXwwhxE5+mwbjot5shYCPoAI0lGfryBsI3R6AD8okx
    B61tIwIAnlbyq2II+HSl6v4ZvTNbMlDP7NpyBuCSFeu6KQLx+4PoLlAxnW2IbB6+Uyr+HR
    dXo2IWaVjf6payfEPYuAEzc3a/ab/AD7KECFB9FbPcK5ACdJoVCL88K4Tc2MLzYdHvLo5y
    Uy8NvaVZ0F5z1qAgDgUZLLJN/2giwbkATNrEg9w3FJ4dGEoIg+LIaE+sF2kw
X-ME-Proxy: <xmx:yzbbaiaxFd6caEfS1m2af00ueT7Ph8mRxDX1GbLzFYi6_VHdogOJqQ>
    <xmx:yzbbau3GrfxFtkgJUV811i9m6P-WSvgwgNIGnw0Un54crK9iMYa5zQ>
    <xmx:yzbbasjuyO1KP3xnZba2TwqBXDyxxIs0zPZKx4F631obVvh_qy6BBQ>
    <xmx:yzbbaqZuYN0NOyuBCthXaa1Pz23HmtHY8JNzxCw6c_YsCiT5yrljrQ>
    <xmx:zDbbanvtLAP40GUFC1XGJT2iy4TzwdvY7C4ZACtEwZOG03IfaodXhks4>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 06:28:27 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:28:20 +0100
Subject: [PATCH blacksail 1/2] ca-certificates: Disable compromised CA
 certificates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-blacksail-v1-1-6c7ed969eafa@pbarker.dev>
References: <20261023-certs-blacksail-v1-0-6c7ed969eafa@pbarker.dev>
In-Reply-To: <20261023-certs-blacksail-v1-0-6c7ed969eafa@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Yoann Congal <yoann.congal@smile.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751304; l=3496;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=n5Euz3HHbPa1+befQDcj2XxUeANCjET394eU1hisgaU=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAhAN+sCAeUewEwISiS/sjKkinFlanx9JSAQjxP3qHBJxevAAAAIF+xyez/dpGRoQ
 HD4UCOgLLHrkSsqAGJVZdKIvFidRGO
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248506

Backported a patch to address the eMudhra Intermediate CA Compromise
disclosed at https://emudhra.we-have-a-problem.com. As this is a
certificate authority compromise rather than a software flaw it doesn't
have a CVE number, but this should be treated like a CVE fix.

This is a backport rather than a version bump as Debian did a
"non-maintainer upload" 20260816+nmu1 instead of a typical new version
release.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5098a7074996258e448bc6cf3d4fb1a708f7a42)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...mSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35 ++++++++++++++++++++++
 .../ca-certificates/ca-certificates_20260816.bb    |  1 +
 2 files changed, 36 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
new file mode 100644
index 000000000000..9a0258919aa6
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch
@@ -0,0 +1,35 @@
+From d5e08f63b1ca6746a51e62cda4df5483c0d3e2ec Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@pbarker.dev>
+Date: Wed, 21 Oct 2026 07:16:23 +0100
+Subject: [PATCH] Blacklist "emSign ECC Root CA - G3" and "Comodo AAA Services
+ root"
+
+[PB: Backported to address the eMudhra Intermediate CA Compromise
+     disclosed at https://emudhra.we-have-a-problem.com. As this is a
+     certificate authority compromise rather than a software flaw it
+     doesn't have a CVE number, but this should be treated like a CVE
+     fix.]
+
+Upstream-Status: Backport [https://salsa.debian.org/debian/ca-certificates/-/commit/4a0203e5ce4ce1a064b97387f52ca6a00c97185c]
+Signed-off-by: Paul Barker <paul@pbarker.dev>
+---
+ mozilla/blacklist.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/mozilla/blacklist.txt b/mozilla/blacklist.txt
+index d84ceb919906..ba3635f7af87 100644
+--- a/mozilla/blacklist.txt
++++ b/mozilla/blacklist.txt
+@@ -3,4 +3,9 @@
+ # Blacklist explicitly distrusted certificates to explicitly ignore them and prevent build errors
+ "Explicitly Distrust DigiNotar Root CA"
+ 
++# Blacklist "emSign ECC Root CA - G3" (cf. #1151413)
++"emSign ECC Root CA - G3"
++# Blacklist "Comodo AAA Services root" (cf. #1151413)
++"Comodo AAA Services root"
++
+ # Expired CAs
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
index c9702d545a1c..be1ffeae4f54 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
@@ -19,6 +19,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
+           file://0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch \
            "
 S = "${UNPACKDIR}/ca-certificates"
 inherit allarch

-- 
2.43.0

