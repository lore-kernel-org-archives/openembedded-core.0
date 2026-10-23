Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4430.1792752611513127752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=GCVsOTyW;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=k0XiGTlH;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 99BDFEC0067
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 23 Oct 2026 06:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752610;
	 x=1792839010; bh=YyuDw90ZCrex6ItJTfBFkD7VsgFy8G/YrU+/jWqJhIM=; b=
	GCVsOTyW7rQTbVJE+Q1YriIj1b7b+/0V1zCIxw3CZn7kQdqIRNf0vBwr5+oIcnz4
	s+C2TUV09Lc9MZMrGKeoc5dsRnuFf/caBjUqH6yd97Pqofe/TgDLjEmeCUbkflyh
	Skreu7YWFpJ6qEF5BCDsCmG3YkoVHt88q1edlshCu/c89R9jB9wNOxiprV4hit7Y
	BxM55FVyur9mmJuI92ZSr1iEdQOyiBKEceMmEmWjfuCLbRKdWP01jItBAAttortW
	j/+/5qqE6vNTQIGcEqHmjbqTsXHnLH2dShl3DtRQBlXr9X6Osl3wg1OP1R1/O3pd
	yJMHQy1q9/UYbdJq9xVQlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752610; x=1792839010; bh=Y
	yuDw90ZCrex6ItJTfBFkD7VsgFy8G/YrU+/jWqJhIM=; b=k0XiGTlHV2VN3MegQ
	AVFA7wps/9Pn/Z+Be6dlnShIX408SfPy/O20b516cyw/t0TjtXHIw8Qo01RSCffD
	3aAhqZelvBLD/tZ5RJwnl9RXPYiEhqWmybjobm1psv90pRRdwI/TAzZdh9AU2Usv
	PcpsV/PEHprAYkwMGWMGb1Us9kVQS9MwkhxIatD6QTdV1NXGsnXiriPj6dOtTy+r
	IMQVBdUd4rq/cFUm2454NfSgVppxQ3zPq2hlEDUPmw5MQPFff1f/Sm+78bSdSpPr
	spHwJgAocPrKsrNpnSB2Fhkk0/PxDaBbPyyhWgqbTYifNsEswORutbfl8tqoJJbv
	+Wa1w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752610; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:Z8OJYta3y0fCszLMF2JWxzp+qC8o9G6Fssh9tEjYaG9kfyg
	DFe54xpDMZncZipvz+OHgPsT3QAtm8uqMdpLO1klT8Z3waLp8BoPYf8nil15l4TD
	Aq7hjeDZN7m/PCBss+gLS98LUOMuqMITtC5lQdkbN9VM9XfpinC633DCB7bGZuZN
	BKhgnU7/PTpGn2WAop2Nw67DyHFwMobzaCJFewFWSN8OWEvV1i+eKEnIEaRocM3x
	ucDGDOIojso1rigrTDt8+lDDsXXkiepY1QpbkJbfyuJuWY3g8cuM3tcrdgLC9G60
	Cgd56OEagZ9tsMciFTKN+mcdnfS7ZqcQRoUvuiQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:WS9dTmZULEb6xFGvEVr/2CCicEvPbb84Qc2XrazOC+0=:GOL3OWbf6tPvEcyYt4NAtAzLNybDhep84moYZvNf4f0=;
X-ME-Sender: <xms:4jvbauv-x9zjBiKHRBpH1gVgCJk8boKS2C43T3tCL9uFclhoFmTAjA>
    <xme:4jvbaqbAciHqpcvwUkxGOnfuepabAiVlqmO5twwFZPsk9_VLDFu1RHEJqR-hv9df3
    QmblGjdipo_m2gQcKEYmfHnNxh3bidTIrZxFFDFo295ehmWFNmEBTU>
X-ME-Received: <xmr:4jvbavaVG2Bp-E2qJuvlBHKL3wY8vRG8Lemqt1m8JU3l9fALc05NuzAZGhKZMEnI8ClI6F79-LEcCB_W6boUWcAGPJvlyg4>
X-ME-Proxy-Cause: dmFkZTEPIDhShl3yCcgAurf/hJzv2/GxphN22zqirSF7PuziOE9ewuEc6wT8xq1sBMxLgz
    2hzvm9Lq8wKKIoZ97WZRVGqSLWOGMl1la23XPA9ul1B43sTAzW9GBPyp4Z5QR3mWWKNMdJ
    hBZ/uNU98t/emI9hX1dYnsjLafZ8g32WPQsrCiSZ5pVTEEzt6GHUpymGP9/iagc/lpW3nP
    jWuQnTwGchgICTHWd1esL6L8191AOExE6Ye9W1vhMwm5W/KNvzQZ0Z0fowjRjoWv7ckbHJ
    kmpqAS9xU+PUF9tPRI9zFCPQoSpFT4l4ZlszJkf+WYCzs1MwisRPdGT1wZ8WixFWpIe0G8
    /yqUHZaBlmt9kEIQN/Xs0DNI5jMCE/59f9iC/ilkeEkHe8fvY+e6zZpD/WaaYsjP57HmQF
    EYS7KbfO0HVIXNamJQlDtyTufOWCD1x+EpQi81/KFZ6iAvFwAyTpwMpVO7QVjNB3ZOcmqL
    yicBYrghi8WrmuTI/FrMdHuA3OWsoXB8LmCiR9q9jVeb6pqJLJwL8oPgW+znzwNyta3auh
    kiHDi4p2AUWk8GmN8svas2ubs7jLZeCp+zPghDhkrDCk879ly8l9y7YJHsKlQxgj0AKIVG
    lab3BwcynZMZ8yCR/UQL3YCuIRccAHjt9YnzYhf+Lgkb3LsPDUO6H8b8JUfg
X-ME-Proxy: <xmx:4jvbauVet695gML1RlWJHWPQbK06sVGVfZlLCBVWb1tDy-MPvBSd9Q>
    <xmx:4jvbau0alkKPG3nE8M8xF7QFnVEE44z_k2gNV9AdqFEnjSM0QOYrrA>
    <xmx:4jvbatZRQVAhiVY3blZjNwrYGu5wqPgk9ODqpfp6erhAOFQcCnk8Fg>
    <xmx:4jvbapolne9qwMehwgPG3wjpouwzvVE2Tstt51ndifaA_R8raI4OAg>
    <xmx:4jvbagvZNn8eQ_bc-N1WQY1wLSkBAqvouL7uUipRAM3vXcDRqDrnTeac>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:10 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:02 +0100
Subject: [PATCH scarthgap 01/19] ca-certificates: Disable compromised CA
 certificates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-1-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752607; l=3356;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=GOL3OWbf6tPvEcyYt4NAtAzLNybDhep84moYZvNf4f0=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGUAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEoAAAAhAPnG8xj2X3qd7SsaGYrhbUPw4WKeXRj5S37M4dvNkorHAAAAIQCfMz53rJAWRl
 zmDedPXREgZx0HStw3PSrTopMu3M1RMw==
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248518

Backported a patch to address the eMudhra Intermediate CA Compromise
disclosed at https://emudhra.we-have-a-problem.com. As this is a
certificate authority compromise rather than a software flaw it doesn't
have a CVE number, but this should be treated like a CVE fix.

This is a backport rather than a version bump as Debian did a
"non-maintainer upload" 20260816+nmu1 instead of a typical new version
release.

Signed-off-by: Paul Barker <paul@pbarker.dev>
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
index 33ca9291f4d9..6291fab0a1ff 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
@@ -19,6 +19,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
+           file://0001-Blacklist-emSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch \
            "
 S = "${WORKDIR}/ca-certificates"
 inherit allarch

-- 
2.43.0

