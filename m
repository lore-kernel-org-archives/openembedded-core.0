Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4264.1792751826079210755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=hbwXM90y;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=gekRiSMJ;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2898C1400088
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:37:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 23 Oct 2026 06:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792751825;
	 x=1792838225; bh=IsM7/XsIrVXB4r+CS1PHKwLuTdex9oPK7hEoE0M1szA=; b=
	hbwXM90yQJF7ALRnTQSPnYR2xnPezw4B6tydyHeYdD4T2okQbEEWx3Z/gdttnSLd
	qALQ48Mnqg+XwlNiPZ3JiEdWWQ4eqJHHharIvWKYm6XZzUuFEkOQ2nO+piFfLTjS
	At8PCxn0njO89bkGllWR0zl+PBqIK74DiwaBUwpLnaZdLPRQelGvJqiJDXvnDc/k
	X7H5Eo7QbDpBHiKJhwKgJvUe3jWSn67qlpfspjniOCwNggq/RZp6bmNCS3UIXXWP
	1by/7BZjldxWxQAnavtaRhsv+N9yVlJ/3ZYTDow5aLxMSlz/Vqf72vEtimKFYAp7
	ekpo6YSwN2u1nGWrNxF+MA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792751825; x=1792838225; bh=I
	sM7/XsIrVXB4r+CS1PHKwLuTdex9oPK7hEoE0M1szA=; b=gekRiSMJP46Fx7ygY
	8LywUvCZN5bOOdDmfFoGPKPHaDPilAPyx5GO7jKOxAIL5uBKcvJ3Vf9tFXnp5JX9
	mIZsAcKb0Poqtzlm8LoYlINC0zd2xcfxWLe7LZRcTlW8Si91s4BWQDmRQK1MBT3i
	WiyiWFR528UVLLKUqYZH4IHTo8WI6lgp+bzUK11rCuEqPLCNrmkuqyEDVjjpeCA7
	B8flcAgGoqh3WdGXFtxvhu1AdA8+T9VxwdooSaBz+KYSgaoaryaXS7riKIxUL6Fn
	fD2icULZeKiMpS/jYGUeJdycv31tzmocYBQCTFQdYyKAm3KMQx7IC3pq7r9OwTrN
	ZeFmQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751825; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:aSRh6geXCagS7Hmb5eKP5g0tIsERV+3+jL3pdDp8h8k+Amu
	sTu04Eb2IVxI5YDVTfPWEWUb/qWvIvWHBiClskkC+R5aOP6bLRcMumNmdROmnjlH
	9MOeNi/10qvwzU6Xd2iX1Hx0Kh3Ioho0o7HUbH0OVsl1QOfVH8+pxLD9JYKeR8Vv
	DNaoycQkExUII41+p/dZvpPRbFiRRYaLJRANMgudSEzB1sHmGcFGFx1BZKPw60ne
	Ya+tN3bM67+/YvIjmD4in7YB1Sv0MJaMYBvj0ZzJvkn9jNTFPrcr0L0PxCi7tV5a
	iiPCy6aOgcDfkPwMOYdPxd7El3vEwgi4oCOtzWw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:dFNaPb02LM5Q9d+S/lNUSnHDgtRaYkX6e0Ge9oTbL1g=:eGRFDuAtbX2bjQIU/+EuSzSVPVDkLX2QVwpLnVzjs8g=;
X-ME-Sender: <xms:0TjbalQ_NNPC-ZPtODzAots6AgeX4vGxmA8veVdrJcPNc3VlkgKQ0g>
    <xme:0TjbaluDNL5TDx3CSkU9d7K7onghOa8WtKPEpv8OUcSf2GGeFDQd0RsWzQWwl_GHB
    T2dqrOWe6GxGkt2e8GFiyLJD8HlIZELce7sYC0k_qAqtLBrgHNRjUQx>
X-ME-Received: <xmr:0TjbagcbZqht4wV-W2xeA5tkRAp5Y0etavlrA31a5IhlUPwpYRrf6BnFvrav_ebUK6rQzL9G6yyGLjF9Ppz8Vu70pypLv2s>
X-ME-Proxy-Cause: dmFkZTEerW58kBxmfujaOJWJQ0MHMYD6sksBew91+uBIkutLUnP6hrOM65iYpZbjmHoIhU
    SdcJ8OSFTp82r+O/YsuJ+8kogYeMNod0ZzBgzPX99HMbWN837TcfRIwaUXHHKmCZkgoNDP
    zmrgmyUjWZj6sOM33FpQpe4xn2UvdIluLbNrPIzN7IwNk0qe9dX7sPCzMmXGo4otFEeEcG
    B+95w/owbGOGQWup5Wuq9OqIoqDS7Fw9V/g71unTmQ+6pL7MH1qXxi+W418FooMTgWUq5d
    DYCPdpai3WnmJwRz/+/ZWCc3tnOWAxo84pncDX1vR4cW8egFWbQhkMG8xNZw61h9IRc4NC
    9z8bwhNq2vij3yjo0UBNR/oc3H6u5TcDf6n2618CN3mExJvMVh84XFw+SC+W78pLJ48wNc
    zYVm8XiiIfTiJ3kkWZV1LYLbDQ05ndDh4A2vS5pVnoNw/33MLDw2hlLCD6Jhnu5NoVGRUD
    EnzbQq1iTSKJR2WxPuTFo6Nu347lj6zasxSihjSoZlrBRDeRH+gognj4ZbjRlPOsoNCc6F
    xcxAMJ4dswS6IC3q+0RBajYxQExGrjHURw26OG4p7LcvZvDdscpBWJvCWz7rCoBMS7mNBe
    ts5k16uxB2TGyIiivbFWXjHqzeThOwIU2BaIpEjf0zjiRaJjP8CCOHPZQ8wA
X-ME-Proxy: <xmx:0TjbaiJNq9S7WPdT8YUcbFqI2Uidnx7tLcS6bQIJdvJmifoIY3N-Kw>
    <xmx:0TjbauZYuawSJX6rapeAhw_rdDzB46CI8Pj7kmDtr96djCbRcdg2JA>
    <xmx:0TjbattqfDqxFsru9Vd8Jg6H5PoNmrxsW7tTib69h9atMr54XscfMA>
    <xmx:0TjbartK3SkLiuG7LpWZqycNKbRQEFya3BFsZOsdJFhqa52R1w32nQ>
    <xmx:0Tjbalir-aTKPCjYEHX5PWlE59hzS-g2fQTk98K8ZNUDNSar-l8dCYgm>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:37:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:36:55 +0100
Subject: [PATCH wrynose 1/6] ca-certificates: Disable compromised CA
 certificates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-wrynose-v1-1-83dd2facdbd3@pbarker.dev>
References: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
In-Reply-To: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751822; l=3496;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=eGRFDuAtbX2bjQIU/+EuSzSVPVDkLX2QVwpLnVzjs8g=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgcwUT0/1pyVCd+t5AXuofdD6bqt8z1rKRMjb+Gb8sr0gAAAAhAJCjrzNHGz+HOj
 e/cx211SVVAA/4mqS6N5IZOrrxYr6o
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248510

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
index 9dd3a05948c4..1b3865f33bb2 100644
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

