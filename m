Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4429.1792752610980663819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=IjS0RlZE;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=odemUtwf;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.138, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 0538913807F4
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:50:10 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 23 Oct 2026 06:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1792752610; x=1792759810; bh=UKjqcCnBjp
	fLfr24YjEaKeDxGRJQFUQ0ssbuZVZ8OrM=; b=IjS0RlZEgakY61wMt5wbm12DZx
	oEJ5Cusg/yAs5BTWZA5byv8OJIWx9L7zPM22n+3hzhHFuK+HqP+ZZNyTstO65RUm
	rqHcVeT1a8WuRYHAbJ4O5SrMbnXX34CjkVkUbFNjtHQwfikdX00ErYBsqQODdO9o
	Uk+C5WSDBGczgMz2f0QVEpJBCW2Kly+lYRD0Heh0FUramctjdag+D/dCw6eC74FK
	gZjS1fRow78UPNMMruqPj56xQD8rdIjR5YL32NX6PGOqi5wLBFiWk4savavXdFI0
	yvK4GwGudWIRWIJlepHO1LmYiFYCrzSM2B0E8zX540dS4LFxyW9uOM0mbLtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792752610; x=1792759810; bh=UKjqcCnBjpfLfr24YjEaKeDxGRJQFUQ0ssb
	uZVZ8OrM=; b=odemUtwfxfNAP+QVkUQe1pnxtDv98sxYrFcWaFoZfLs25246qF9
	l6dbTdD8EcrwF5iPz2ryTeU5+sZyeyy+VmQYsOZLliR/kiGQc5P0LWBWcun6vFKP
	KxzP14Z+x/pAYb2HIKEMCPerYK6K1TvaDXsXqqo1TlidKEis71FG5ctVfrNU1M4N
	WmRwXtPotdny7fTk0ZhXpGmK60DO4p/9gYgYjzoWvRA4dvYneyAqQYv++oLKpw0S
	sX6s33sTBgjdPPDP/0tIf8PWWjGMKLY2idonBzhY1rX3F9SxEMM2LuGrHpl7Rmv+
	Ud5gJswKnIu5ZVkUNkWb9Rc1ABhvLphz/Hg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792752610; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:FLNu7JbsII6KD4N6kyT2ojwkk1Jah9hdrGeY9BQrrxAZVn6
	mLqOGVzoIceGTGoSbL/MWyOBXkjRL1zWcuhZNCzRXCvyCjEFrgNDSusCsB5T3hwf
	uCq86xSsngoxx49Jik8l2WzpJmCypzC5h65ftSeaIx+fBK2emx1Sq6jEYn9H6eZ4
	E1r6FAWo7L/OezSxtrbT3dQhJAvwk5n7nlWs3f5UC1z8HnVyg4vmO82BV8FTxr1s
	mueP+tS4QWqPmja6ADVsfcahPx5mjfeoyCr2U4wG88yIVLCvyenyQfN8x5I2Xo0X
	eMw1YiLGQQQ/9yB9E/OSgKGP2q7ER7MeXtGTr/Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:oqb7rvtG7RAfOtfCfl1SW7/YYb0I/50TUmqacz5T40Y=:5wB1C+7SXvDTWan+ncoLd2NJ1TbPE0KXHsUxsRot04s=;
X-ME-Sender: <xms:4Tvbao0lrQpcd9hE3p7NcSmmPMG6LeuivtxiQH2MZMaqH8GdFBEPLg>
    <xme:4TvbaqC_EaZClEJ-0oZLss5qpKm3FcAj0_hfBSEGKQ4K6o3HjAT-xWOtipdOXdFWw
    0c7Tx-aDLN_cODPkk2X1y2kqdmgSLRt6k9IaoXQOk5NvVzCgYMkFzsQ>
X-ME-Received: <xmr:4TvbamjCWotyOspHikGC2dDnu5uww7fskkWfP4xNBC-o_fX-gf5rDEAHwLw5qiFu2hzB46SNhfEmI5RENzCzUXfQplaY89g>
X-ME-Proxy-Cause: dmFkZTGjzTRuChon4SfDV8EJ4k18FeJdmKh9YcIqnkUXVswgWK/MN9Mt4JUqMyneYWzVk7
    k+e3xfiZgKtpsvLqKuT7D9vQjYI5ULvd7UkWMpYva+1t0V/SJZvAoViIRDalZ3VNVZo1uN
    635szMkugHzZf1PBBmQstF58uK0pmgJCK8tYx0lGAE5aKC7vQc2859J2gjUR6dAuRdnaxG
    o6VRMnvEgUEgDz/l+yk38a6HcM8Pi/A9NULvdMHlxwkU4Z9pUakaTBdUL23JzNGNInOyj5
    oSImF5xRFq2fdm54YwG4wVbOf8DchingC/y1/Q+44vjmRQfokHAhuKuW7vCwJAFzZwyYSi
    5cBti79Pv/wrFZwxoUGsQ17h5D0REGdbCDUVZBGtRF3y5CgGm2RFREltLUVdWHaVWFB5q4
    GbKfE5hNNGwWd+kt2S8FPFAmTPceglfb0AJfIUu21uTP16zo4/ognpY2ogiYqWJdFVgoLR
    Aej58uArki649IbVDd+b3JNjvIWF7dPBG8ggrDXJ2I3KfIV/Crolg21VmMU/JZCdoKmmtE
    PlY2JjqINleOILN6PtbltGdpB1fn+GE2YtdXjj2dnkkI5IbKv3Ld24p025N94mG0c3c4Jm
    SKuh8uivsd8GbAQ3IE/fdJDnJPj1mtrRu/gKT5M6FGl++QuK4D+s50LeAR/w
X-ME-Proxy: <xmx:4Tvbam-3o7D4Oyz3Bc9bQx2uc09aKOdOKTHiKpv6E1T99LwHk5TinA>
    <xmx:4Tvbaq_J-0nriv61HREASkk9HYWt5F49KkWbP8RETKqOkUTcpIYD-w>
    <xmx:4TvbanAGZyi6tgTwglPBvf27MQhTCQ3T88tmQv9TeUms4Pz80wU8Ew>
    <xmx:4Tvbaixn5eFFzOm5WhmzogTUByVfl6Z_q9FME3tbnptl15H8RmgT7A>
    <xmx:4jvbal64-JWfZ5CHVkOnaVCebl2bt7sNPr7hiVRDuAyEb0AOUwsdeGxe>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:50:09 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH scarthgap 00/19] Disable compromised CA certificates
Date: Fri, 23 Oct 2026 11:50:01 +0100
Message-Id: <20261023-certs-scarthgap-v1-0-0ba436174193@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANk722oC/z2MQQrCMBBFr1L+2kCTaBZeRVwk49iOi1pmYimU3
 t2o4PLx/3sbjFXYcO42KC9i8pwa+EMHGvM0sJNbY4Q+JN+H6Ii1mjPKWschz45O8RhLTD5RQLN
 m5bus3+IF/xuuv8le5cFUP0Xs+xvd+CalfgAAAA==
X-Change-ID: 20261023-certs-scarthgap-c5343b3616c2
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792752606; l=2507;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=5wB1C+7SXvDTWan+ncoLd2NJ1TbPE0KXHsUxsRot04s=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAhAIAZRIhVzPpju0Au4vyvMDExarwuttnzJBCrcIN4qgVHAAAAIBnwLd7C6cs1by
 LddytG1dTCw0aByAzxNuYWFNs9YTGL
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:50:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248517

These changes update ca-certificates & python3-certifi for scarthgap to
handle the fallout of the recent Emudhra CA certificate compromise.

These patches have already passed testing on the autobuilder, they will
be merged to scarthgap outside of the usual stable review process once
they have landed in blacksail & wrynose.

As a consequence, the build backend for python3-certifi is changed to
python_setuptools_build_meta and support for Python 3.6 (EOL since
2021-12-23) is dropped. Both of these are considered acceptable. See
commit "python3-certifi: upgrade 2025.4.26 -> 2025.6.15" for details.

Branch: https://git.openembedded.org/openembedded-core-contrib/log/?h=pbarker/certs-scarthgap
AB Build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4976

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Alexander Kanavin (1):
      python3-certifi: upgrade 2025.8.3 -> 2025.11.12

Leon Anavi (1):
      python3-certifi: Upgrade 2026.1.4 -> 2026.2.25

Paul Barker (2):
      ca-certificates: Disable compromised CA certificates
      Revert "python3-certifi: Fix CVE-2024-39689"

Richard Purdie (2):
      python3-certifi: upgrade 2024.12.14 -> 2025.1.31
      python3-certifi: upgrade 2026.2.25 -> 2026.4.22

Ross Burton (1):
      python3-certifi: upgrade 2026.7.22 -> 2026.10.19

Tim Orling (6):
      python3-certifi: upgrade 2024.2.2 -> 2024.6.2
      python3-certifi: upgrade 2025.4.26 -> 2025.6.15
      python3-certifi: upgrade 2025.7.9 -> 2025.8.3
      python3-certifi: upgrade 2026.4.22 -> 2026.5.20
      python3-certifi: upgrade 2026.5.20 -> 2026.6.17
      python3-certifi: upgrade 2026.6.17 -> 2026.7.22

Wang Mingyu (6):
      python3-certifi: upgrade 2024.6.2 -> 2024.7.4
      python3-certifi: upgrade 2024.7.4 -> 2024.8.30
      python3-certifi: upgrade 2024.8.30 -> 2024.12.14
      python3-certifi: upgrade 2025.1.31 -> 2025.4.26
      python3-certifi: upgrade 2025.6.15 -> 2025.7.9
      python3-certifi: upgrade 2025.11.12 -> 2026.1.4

 .../python/python3-certifi/CVE-2024-39689.patch    | 69 ----------------------
 ...i_2024.2.2.bb => python3-certifi_2026.10.19.bb} |  7 +--
 ...mSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35 +++++++++++
 .../ca-certificates/ca-certificates_20260816.bb    |  1 +
 4 files changed, 38 insertions(+), 74 deletions(-)
---
base-commit: e95fc48cd797a013178c71d374810e2c08917d0f
change-id: 20261023-certs-scarthgap-c5343b3616c2

Best regards,
--  
Paul Barker

