Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4431.1792752612050778602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=cQdn4PKo;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=j7GhSjQx;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2413C140016B
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 23 Oct 2026 06:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792752611;
	 x=1792839011; bh=jN+MlX5Hcohw+ZRDcgPHKTmMwKvSZwp4o0CEYkmbz20=; b=
	cQdn4PKoDHxImh4FaWkrBoZIULXKkK7AYsfU4ebPsxbf6FdXPeRoS46faoTJEQT0
	RvoxsImEEIGT8aWLKsyzs5jRmm588yoYfBaG5uHJu4itkJtRucjABPKX4ob5wJp6
	eesSNQcwez0txtY/MlJLl0Pz3VhdG5h9ImyWMfwFS0MX9tGuebfjwdfOLPJMuG5T
	ikmzc19m9RZxgOP3lgWeaZMMliDZXRQR8ZiRvOr/mfkFfZjnymTUhjm4HnNMnlnK
	PAtbIK//3Vq6DqczJQ5CgCtyC4qW7MHSgkPBrcPDghWl3oLb3MNaaQjNs3t8N+U4
	zmX0e3phx+fNDigCtfrnDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1792752611; x=1792839011; bh=j
	N+MlX5Hcohw+ZRDcgPHKTmMwKvSZwp4o0CEYkmbz20=; b=j7GhSjQx9vw2tpXCC
	HV01B9+2KNIhlasC8KDBHlK5nnb1ZxdSYnmZSFHBNGG32NeN4SxObExitpN7YpmL
	ZDjcJQd4zAoOfDicaCBaTAV9T0D4MGFYYdvEDTAGaAJ8MocChWfMMpsXuPvfILlw
	qACpK4OMAFY2AFFEAn8J6fDgDEUyz826jEnTrbhRXowzIHaQO6IIkHQ9YbQ/iOS+
	tu63RkNyIYJoULxwF9ueSFCMhoxKLTZGqpIgggT4zHP5RTAZNueKAS1qZZDt8h67
	/IMDdeZ9yTMs1aAyGcPxMomr+FEWo6BTYiRAzPmhhymTV7GTGvurTFfbPyfAPvGj
	W0Oag==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752611; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:LiFEtK4eL6Ll5u9I+8IgZ2lCUUBiNN8BdVWPwI3qswBvGws
	MIuSCo5kOSeJdBBWI0S0ECLvS2U3jk67MJrykrdrJjRmOt5qDiXQq8zssz4FSHYl
	3CG4O2pY1hJnMZ04oNmcGcYmqrhA0yRzyLKqk2hdE5vHM0JZKrtuvw84GOdmJlu4
	xtq05z6YSLO2et1dJcXasp7SCLluhoPnjcqA0/Y0ZZFNSSphpuHC05LV5qQ4Fk81
	Ugv5D1zafdhlvWa0vLZvaBibwTeeaN8xAV4wQQVenxuv/dH1iv5xpYYNZfQnx1tp
	22xtGicECbMdfVC1rf3Oq8E7jY+hj3iAK9EwNag==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Z50lI2oxlD7EAavkQOWKnZTnojeLtPa/Lt1Ggh4dDqA=:SPVLJNQ1r6dU6sSoFRQjyXdsOcvnqBFKxETELKHyJaE=;
X-ME-Sender: <xms:4zvbauUHghZzve-YYgr2dpg1ojNAoQ5pFoJGu7Ip2yXAFhcAH7jzhg>
    <xme:4zvbahgvMeyMUup1A1q3oNDCXDyQXAzgAPCkrHqbhosAdOuwnCvRIsMcill6TXcX0
    PHfspijCB84-CieKU67ROp4D70lS7R5F2v3OuroBcd9PR-Ys5gkOVU>
X-ME-Received: <xmr:4zvbaoAIg3dXW2lR7q_vGOM65j7IhKPIVnj-YPlnaCN-gppXE-cyUez7UbesLIfY-uC1dN5GbTstJ5bl41mMAjEL0Y2ux1g>
X-ME-Proxy-Cause: dmFkZTER2m1YIMQ8eg4MnNIsZi4FBhMIWqS+ZbVhuw44e/27Tf4AY+BIRzUquKEjhnhqTt
    0g6mNqv1U4MXkuCVTEXHNpw7k6cApW8LB3Imp3g3tgBd1M7lN1nyNBlZ6ljZ7+w7s0kABJ
    OV8tzTnnhZsHV87VOCEnnZFbKd0n7dJt7inA1oB89LeOnbhKaS7Zl7E4arQgdppveXVqY+
    /ejNy2IbeLlV0yWnZ/3utWpncsMkMtxPfg/jUWMsYZjsi+TmiqBcjObVWshyFBAv3oJQ9F
    JgGzmA7v5p9VzUuc3bYY1CVs5RvcX5e8N3Cet7kuxRSynSJadNIj13L+qM6pWAHS3btCTa
    9x0QnovirxjAVUn41IDWbQA9qq+lnf8Y85kOxEepn8WxW5TNS56I5lJVpaUZmGQNEcuXxk
    uxTP8ZV4NDpkaFN1NyNaLXTLmP/csoGaxiZvaKNzW0ETSCulbPsnGhdl3x5GUGRJssVzeF
    xQR6udILvh/HK3JJT9PkeayAFbCMUJMopSmha/9tqnEFawc5tLBmwClY2ihjl9KmI6nnTu
    BJtYzbcBhtkXh+E1Mzh4BtICPOuUuOBaYwqbAx5RnrkIPd+z9s/0eFK8XXX9PPYHe0npMz
    i3wXmTrUcNjEvSzJJQDUXLKebDPtj4XCU78Nrk12kypXXy3/dl8FzEOC61DA
X-ME-Proxy: <xmx:4zvbaqcf49r7U1bFiSoPYy_QveSNhq1YNIwJ1x3MhpJOzDrH_3DvUw>
    <xmx:4zvbaod5PeKPet6vp1ai6V28IBdpmtibXyHgGq8JNwi2eWoZg6NRHg>
    <xmx:4zvbamj1emu_l0Ow-dUNdkhOlPokMmvkUCmmawCzCPkdAxCHk-7UPw>
    <xmx:4zvbasT2tLaD90pqAo-6aSasR4n8cwQTi7gRIo9Ov-O8c1j4nWXfQw>
    <xmx:4zvbam0g75jvRf1N87S81ceDcRGS-tP1lKp6zlMSYnbM3w-z1pKB0MYj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:10 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 23 Oct 2026 11:50:03 +0100
Subject: [PATCH scarthgap 02/19] Revert "python3-certifi: Fix
 CVE-2024-39689"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-certs-scarthgap-v1-2-0ba436174193@pbarker.dev>
References: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
In-Reply-To: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752607; l=5122;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=SPVLJNQ1r6dU6sSoFRQjyXdsOcvnqBFKxETELKHyJaE=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgeh88ZyduFUbeRNuEdvWaQ5eH0rzl7Q5sbxHQWWCoNPEAAAAgbboEUxc/IfO+2d
 OuxxoT584U96kKfFw0k9lRYqZ68os=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248519

This CVE fix will now be handled by upgrading python3-certifi instead to
ensure that we capture other changes to certificate validity.

This reverts commit 2ec1ba32a23611484e5d3819008bbab85336ae20.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../python/python3-certifi/CVE-2024-39689.patch    | 69 ----------------------
 .../python/python3-certifi_2024.2.2.bb             |  3 -
 2 files changed, 72 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch b/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch
deleted file mode 100644
index a2ecc15d2c3c..000000000000
--- a/meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From bd8153872e9c6fc98f4023df9c2deaffea2fa463 Mon Sep 17 00:00:00 2001
-From: github-actions[bot] <41898282+github-actions[bot]@users.noreply.github.com>
-Date: Wed, 3 Jul 2024 21:34:29 -0400
-Subject: [PATCH] 2024.07.04 (#295)
-
-Co-authored-by: alex <772+alex@users.noreply.github.com>
-
-CVE: CVE-2024-39689
-
-Upstream-Status: Backport [https://github.com/certifi/python-certifi/commit/bd8153872e9c6fc98f4023df9c2deaffea2fa463]
-
-Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
----
- certifi/cacert.pem | 40 ----------------------------------------
- 1 file changed, 40 deletions(-)
-
-diff --git a/certifi/cacert.pem b/certifi/cacert.pem
-index 1bec256..6bb8cf8 100644
---- a/certifi/cacert.pem
-+++ b/certifi/cacert.pem
-@@ -3857,46 +3857,6 @@ DgQWBBQxCpCPtsad0kRLgLWi5h+xEk8blTAKBggqhkjOPQQDAwNoADBlAjEA31SQ
- +RHUjE7AwWHCFUyqqx0LMV87HOIAl0Qx5v5zli/altP+CAezNIm8BZ/3Hobui3A=
- -----END CERTIFICATE-----
-
--# Issuer: CN=GLOBALTRUST 2020 O=e-commerce monitoring GmbH
--# Subject: CN=GLOBALTRUST 2020 O=e-commerce monitoring GmbH
--# Label: "GLOBALTRUST 2020"
--# Serial: 109160994242082918454945253
--# MD5 Fingerprint: 8a:c7:6f:cb:6d:e3:cc:a2:f1:7c:83:fa:0e:78:d7:e8
--# SHA1 Fingerprint: d0:67:c1:13:51:01:0c:aa:d0:c7:6a:65:37:31:16:26:4f:53:71:a2
--# SHA256 Fingerprint: 9a:29:6a:51:82:d1:d4:51:a2:e3:7f:43:9b:74:da:af:a2:67:52:33:29:f9:0f:9a:0d:20:07:c3:34:e2:3c:9a
-------BEGIN CERTIFICATE-----
--MIIFgjCCA2qgAwIBAgILWku9WvtPilv6ZeUwDQYJKoZIhvcNAQELBQAwTTELMAkG
--A1UEBhMCQVQxIzAhBgNVBAoTGmUtY29tbWVyY2UgbW9uaXRvcmluZyBHbWJIMRkw
--FwYDVQQDExBHTE9CQUxUUlVTVCAyMDIwMB4XDTIwMDIxMDAwMDAwMFoXDTQwMDYx
--MDAwMDAwMFowTTELMAkGA1UEBhMCQVQxIzAhBgNVBAoTGmUtY29tbWVyY2UgbW9u
--aXRvcmluZyBHbWJIMRkwFwYDVQQDExBHTE9CQUxUUlVTVCAyMDIwMIICIjANBgkq
--hkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAri5WrRsc7/aVj6B3GyvTY4+ETUWiD59b
--RatZe1E0+eyLinjF3WuvvcTfk0Uev5E4C64OFudBc/jbu9G4UeDLgztzOG53ig9Z
--YybNpyrOVPu44sB8R85gfD+yc/LAGbaKkoc1DZAoouQVBGM+uq/ufF7MpotQsjj3
--QWPKzv9pj2gOlTblzLmMCcpL3TGQlsjMH/1WljTbjhzqLL6FLmPdqqmV0/0plRPw
--yJiT2S0WR5ARg6I6IqIoV6Lr/sCMKKCmfecqQjuCgGOlYx8ZzHyyZqjC0203b+J+
--BlHZRYQfEs4kUmSFC0iAToexIiIwquuuvuAC4EDosEKAA1GqtH6qRNdDYfOiaxaJ
--SaSjpCuKAsR49GiKweR6NrFvG5Ybd0mN1MkGco/PU+PcF4UgStyYJ9ORJitHHmkH
--r96i5OTUawuzXnzUJIBHKWk7buis/UDr2O1xcSvy6Fgd60GXIsUf1DnQJ4+H4xj0
--4KlGDfV0OoIu0G4skaMxXDtG6nsEEFZegB31pWXogvziB4xiRfUg3kZwhqG8k9Me
--dKZssCz3AwyIDMvUclOGvGBG85hqwvG/Q/lwIHfKN0F5VVJjjVsSn8VoxIidrPIw
--q7ejMZdnrY8XD2zHc+0klGvIg5rQmjdJBKuxFshsSUktq6HQjJLyQUp5ISXbY9e2
--nKd+Qmn7OmMCAwEAAaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMC
--AQYwHQYDVR0OBBYEFNwuH9FhN3nkq9XVsxJxaD1qaJwiMB8GA1UdIwQYMBaAFNwu
--H9FhN3nkq9XVsxJxaD1qaJwiMA0GCSqGSIb3DQEBCwUAA4ICAQCR8EICaEDuw2jA
--VC/f7GLDw56KoDEoqoOOpFaWEhCGVrqXctJUMHytGdUdaG/7FELYjQ7ztdGl4wJC
--XtzoRlgHNQIw4Lx0SsFDKv/bGtCwr2zD/cuz9X9tAy5ZVp0tLTWMstZDFyySCstd
--6IwPS3BD0IL/qMy/pJTAvoe9iuOTe8aPmxadJ2W8esVCgmxcB9CpwYhgROmYhRZf
--+I/KARDOJcP5YBugxZfD0yyIMaK9MOzQ0MAS8cE54+X1+NZK3TTN+2/BT+MAi1bi
--kvcoskJ3ciNnxz8RFbLEAwW+uxF7Cr+obuf/WEPPm2eggAe2HcqtbepBEX4tdJP7
--wry+UUTF72glJ4DjyKDUEuzZpTcdN3y0kcra1LGWge9oXHYQSa9+pTeAsRxSvTOB
--TI/53WXZFM2KJVj04sWDpQmQ1GwUY7VA3+vA/MRYfg0UFodUJ25W5HCEuGwyEn6C
--MUO+1918oa2u1qsgEu8KwxCMSZY13At1XrFP1U80DhEgB3VDRemjEdqso5nCtnkn
--4rnvyOL2NSl6dPrFf4IFYqYK6miyeUcGbvJXqBUzxvd4Sj1Ce2t+/vdG6tHrju+I
--aFvowdlxfv1k7/9nR4hYJS8+hge9+6jlgqispdNpQ80xiEmEU5LAsTkbOYMBMMTy
--qfrQA71yN2BWHzZ8vTmR9W0Nv3vXkg==
-------END CERTIFICATE-----
--
- # Issuer: CN=ANF Secure Server Root CA O=ANF Autoridad de Certificacion OU=ANF CA Raiz
- # Subject: CN=ANF Secure Server Root CA O=ANF Autoridad de Certificacion OU=ANF CA Raiz
- # Label: "ANF Secure Server Root CA"
---
-2.40.0
diff --git a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
index 617b597a40eb..e5325b1f12b9 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
@@ -7,9 +7,6 @@ HOMEPAGE = "http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI += "file://CVE-2024-39689.patch \
-           "
-
 SRC_URI[sha256sum] = "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
 
 CVE_PRODUCT = "certifi:certifi"

-- 
2.43.0

