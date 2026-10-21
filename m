Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5775.1792566032817082865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 00:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=s0dA87/h;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=T+ZpDIXg;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 16B2A7A0103
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 03:00:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 21 Oct 2026 03:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792566031; x=1792652431; bh=Jb
	dn0IXsjxhoPnUFvgku1bothhTZ6Skzd+Q7oq2tbBc=; b=s0dA87/h6o767sFyd4
	MP8t9UnCA40kTwPDqdBup8OC7nhEjkRyuVrJE1Jr/7BF2ZWzSvpf6n1yc9CdR4hM
	4WmcuH4lxUBaf9B5fiQ5GwQmWqB2juL4GductwPO8NJ3QQuOi2x141KBygZ+JOuU
	X5A+QNEe/wfcUbuGn7iPqN9q60dnfePO8mKWXyB4M5GzxBsAhJO9MlmEjt6KcqFb
	15+W+cXa2mJ1DAamArDiI698Tv11jSBx2bmp9SpHD2UteucR769ivTQw0LDDMr+U
	coLph39ur1DXFQtbdYFDpk6sSgAKanc51MadWcRUg7u45GEonQ3IRK+VhkrCb/bv
	PcVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792566031; x=1792652431; bh=Jbdn0IXsjxhoPnUFvgku1bothhTZ
	6Skzd+Q7oq2tbBc=; b=T+ZpDIXgFBVARDEiKOxe1tjiiCYzaWz2wKCvcXSWLIS/
	M3vvYGjMKH1lfAq9Y2E7ESWjbCWih1vTarARDlr3LJ97LhabuBNQc82p8zrav3Yg
	7tZfkaulXKFxvnTa3qSaWygV67zb6CTqUolfJk3Vy3BhAmG7whC5I5FS1zbj8Fai
	8Jlzb6gUSVGv+EDbnZX/kABcUU0YzlrTuf8K4Xe3ObAHH6OsI1fDsOrjAQLtewXA
	bZZZNe94tC8Gz+LKnwXknzCfe/FmIITZyRiSrsNI3qlEJYg2KvAkO7oZ16qy7TFl
	dIT0pyPwJrAdO6UJT3hoSTyV3M6r0PQO7EU24Lb+mQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792566031; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:Un/x2TCeVdQVy5bgR//pBkyEuJZQocAXyTl+wN/8vozxcrg
	jzJ+tx7Gw2OJnOl3vqJ31zsxk/u6un37iwIrbNt/v0OrxXK/WFuJx8DqvNcTrg9D
	urhXvbNVGn0Mzrghqp9AhAPdmmjq2eplftS88bB9dQ4qnJXXUdl3egMj/de1rlpI
	WReEOLm3p111ZSYnpFYBAlSh7iIfXICHEs77xfgPb3KgmAE2hPFGugwDXhmPaDdn
	pzbF/VvTWezGRGrBdsfhZC9cK0uHhCrnUeDsRZ5dNDmjjeQU91Bdm0Cqqpijlbkm
	jBbGR//49r52efC7tnQatkWAqlMuciYydoiqNbQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:v2oRX9l4d0WNiTt3MdTb3EvydxU9RGpvb5gqXtGW7fg=:XaFy8OfdiVj9yUDssi0rdKRYpSS3uFBtZdTZDTMgw7M=;
X-ME-Sender: <xms:D2PYaj4jQLLvAZmEJ0W2osJiTKLBBXNZXHCFDIsyCuS0R60zikcOVA>
    <xme:D2PYau5UtJ4xe6iL_HVFVT7R_uN4mB7TN2gtHkzzFsREHAetpgkip7LGHI_IBHI_r
    GFf8ajO_07iZNmjduoYhmy_CYlLgbJ9ywHqs5NtaKzCEOE2rqG9g9uu>
X-ME-Received: <xmr:D2PYaoHzxnoAhKAdAF5WU98A_9g_FqlCC8Fd0yAkV9N4dtyeyL_Ws9PEB1UrzpTxyPyyATRVK0aKpFoS51jIqRYqegNOa0s>
X-ME-Proxy-Cause: dmFkZTFbXDEbS1M4pjjMfNJVYHlc8hZLHHVvj8OF9yOeIqLQWQUtSVAvuuuY2JTyRszqdZ
    3fFDNRDZlF0Rkvr43foQ1+TmAY9GYcIw/otUHyBXwQ5afGmhdTGqkhvlam2cOxXz1hwAnQ
    QKYnFrlnSgnQE70h3SQcsOlr81e4YuVBGDPlp+Id01niuafu/KigQpwUzmxp7Oqzp09TOp
    pi5CV7kmVav/TEQMov0UghwdZilcXQWpZc6g3uWYx6vZgQKhSwkMeaFJNzdzoq6wwReFj0
    uTQEYZdaXEw3fwtu1Sbfq6T1IgajvUYRVUxB9qci0dUqDe7ifnt765ROwVzfbsFgyGxhOs
    0/RGgXcyS5NLFguKluSPJgF/Zqi0pdFCh8dTmqQgoooIG+0mB/68QIcWjfr65cIfU8Naz7
    KWxfFEC+Mov50yh2JbU/DPj2ZKkkQXUuqNcRMju8WDlg0og1H/9brJH1lM0Ka6xyOndEIS
    WsNm4uk53nOkw4btvQHVvKOdPA1aG2OAatyO874E23TYT7pQjsrRjRflmk6eKOfeTJT2EK
    Uprfw0hjHUG3F6Lzt0euFuUnyl6brM/qrGIax4lcLlK9CscM1ECtdK0E6s+pbnu1L4I4x1
    9AU2vEgZzu8hDL5A6/Mb9p+Pcb9OTbHQ5azRT1PL56g/Hlq2NJR7BUBBYKjw
X-ME-Proxy: <xmx:D2PYavTcQYYjxZhvHFdQ-XSUiSSeWB0sMkNehlvTtpjZfpELpve4YQ>
    <xmx:D2PYapvJRIlnkGtQH3Fba6VYbzSaL8ps0YpLU4Oa1EAuyD7jlqwLTA>
    <xmx:D2PYamwE5yH7im7aVrwqBTHNhEVWdoO7Gy9Ou5RO0Tpk0iccPbU3Kg>
    <xmx:D2PYar6cepSFlD4rkfZ4N9GK1heFW5ZAP7ngB-2iyiDSTGvb4oK7Sg>
    <xmx:D2PYamf7_p7owDzFg0I7IGwexxL5CQWN3mjVtuFkjleI6h8raewzJXdv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 03:00:31 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 21 Oct 2026 08:00:14 +0100
Subject: [PATCH] ca-certificates: Disable compromised CA certificates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-ca-certs-v1-1-b12c7c3bf7c2@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAP1i2GoC/yXMQQ5AMBCF4avIrDVpuyBcRSxqTBmLkg4ikd5ds
 fyS/70bhCKTQFvcEOlk4TVkmLIAnF2YSPGYDVbbymhrFDqFFHdRo/eN1w6p1gZyvkXyfH1XXf9
 bjmEh3N89pPQAjv59rmwAAAA=
X-Change-ID: 20261021-ca-certs-dff9f0ace701
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792566027; l=3431;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=XaFy8OfdiVj9yUDssi0rdKRYpSS3uFBtZdTZDTMgw7M=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgYDKO0UNtK+n7L4Ye3xBi+Xf1NSCBWkMnXPmVpE5E/noAAAAhAPhZ1fIWMObIpB
 1RVDsVWTJLAMTGteT1zpxUerkR+rkU
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248365

Backported a patch to address the eMudhra Intermediate CA Compromise
disclosed at https://emudhra.we-have-a-problem.com. As this is a
certificate authority compromise rather than a software flaw it doesn't
have a CVE number, but this should be treated like a CVE fix.

This is a backport rather than a version bump as Debian did a
"non-maintainer upload" 20260816+nmu1 instead of a typical new version
release.

Signed-off-by: Paul Barker <paul@pbarker.dev>
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

---
base-commit: 94fd491210b5269f7242df59db1541379e25754f
change-id: 20261021-ca-certs-dff9f0ace701

Best regards,
--  
Paul Barker

