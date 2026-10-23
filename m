Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3917.1792751308362343684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=BPdO6Zgp;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=XAM/diBu;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.138, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 288741380884
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:28:27 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 23 Oct 2026 06:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792751307; x=1792758507; bh=Vw
	T6iM7jRVaxM5aAF+fOykdHxkiHBeVT9qlKzJZ94bY=; b=BPdO6Zgp+C1kw7j7bI
	lbZVGzKDbhZUsuizZO1CUDP8ZimyYBxSXn9dBj0CH5JIgfb53Y+xmZiuCqSf9RmJ
	vF2eIfxqHzMxsvKiBaeAYwoY+xrHwXXDzrY4/zDrK0bQvdsR6FdVq771pCcZ6pTb
	O6hP2qz5wWFPi7DWsHbi8bKNDZk53k1oRi2T4jyGStswmEfMQ1vNxhlOC9q5tw43
	0UxjdHaPVGagHKAgVlaLJh7Z7kfqiVqiE+JK96zaJiIPDwAXGWfzW7kYwYusvlsp
	PYPyBYIjblUNWj55WWvdXQEEKKPfiXECZKgfdzCICHUz2UIadtMho9BOirkhgPSX
	2Jyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792751307; x=1792758507; bh=VwT6iM7jRVaxM5aAF+fOykdHxkiH
	BeVT9qlKzJZ94bY=; b=XAM/diBupW2mak3oIYv+awTTY2VzeJHsNtIJv08yMP+W
	hUBa7UR0VbQBKXtz6khTEkMAX2B+EkeP4LKE5Y5VObKWDB/GZlgvOsHzYetRafwu
	+CB1YAze2zcoxVbplrsEE95Q2yUSukfGATWm/DAOEvVfF/jdcgdijguTmBrHM+sX
	0bYk0P1sVyKU+LXHcKXQtLlufvPwmvXPaTpsH8DK4w5Ujpyh3AsxydkLDi7+m65T
	O4cpLVb9/8U2+WiFfzrWjavGveGZDZldBkhzqA8c+Lc7J/+fkFw+KrHgg/rKUkj0
	YD+y1d06pSgqNUtgNmQ3BBKxP40aJDKIZKNU+XPOCw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751307; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:H3A92nKNs5I4SOwCtsGbltuPB+9neyjX9oVk/TUfHHNNTGE
	xclTyGur6A4TW2dh6a6sAIf+LGeGtfWZxg2oM4pCDZfyJhN828G+jvasQ/t8eu9G
	H8R+j9mLQSgPS1077m2yFKbP8nN2HSDsloztRRuJC/x9qvStjEXjfXaY0uyjnO0c
	O6+FxwzmOQKPt1EB3RNIiAV/5lsWE6Wpi85eKner1sA21xeVf9Gaa9UGF8PfK44P
	34yLeL4d+HDODwSMPiih4PkvZGfLT2jlbk317+vWWWJzyI7ftidPCYalY29havsk
	fJGl5hxSiYsZPNuqYxifiXpr2bZ1RUHLwAXFV3A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:+IHJat7zLd+KxdtLNoRlH862Ln+Rj40sly+9+RV8mvI=:U0e0hbWaNxE9m/2sjWe7/0/A/+N/rohVbzUt8MFqyBM=;
X-ME-Sender: <xms:yjbbaj2qbUXo57P4AL6hDYs3qghKMl6AQYFPN0pIP3OaICXOUk1mzg>
    <xme:yjbbao8wDQhwIZkX-9YALFyqaZwqnbppFCSjJWrolWHHQiCmdDflGe4w_sCz22FsY
    VqjAKJ2zV4BJspdCXq6U_l8TauAEk77KNcBYrqcPZ2X6ATR9aZFOfzq>
X-ME-Received: <xmr:yjbbasO5JLDDL_N-PQob38IYV84PVt9RUz9jHADddA6eWCU8dAFwSsJHIBr0teZmRBwUF1dyJPMP1i_Cq3vlugDx9oL__iQ>
X-ME-Proxy-Cause: dmFkZTGT7D3fVeGFnBXDvMSVF5sgjPvb8/Wz23znuFOFQKkSfcJeq8kAlfHltpj0Hh90Px
    yc7vYHu0B5Lub9D1Ed5eeN/HHR5SUTXnAeTOIlcCnqekjjqbmYMdE3OH5RdOTLkunM4VRT
    GQb08Gjejwjv5vclonzxQBvqTbegw9FgkDGhdNQaUof6APMO6rSabnjtSRssgA8XLjORWG
    TbPHgRHG602Ljw6dr4QKeP8UaLuYRNhEHvPJKv+x81mncc/DLYlwnlrv5zDd53Vdjcx6wp
    E04Y4+XJW8g80uSUcjUiXq20081g4dRfJYJTnXY3+5fg32CQpebPJ0FQ7ShK7cnCgcJVdU
    qDi5n+AqD2tUmG3K7Mxx3KPVb9oIHGcc8YFllC/gZHE7Ns6w7WCQKD95R6Vwv+olMlCRmy
    wREEhsHqhDTJ+QmcNjwak/eS82V0agzDdfbkmghRmNY7EEZNIrHHd+ecvG7mcienshgxE1
    mAXPA/L6uzAf1+ySSFCk8SxMeY+U9BTR1jZbCl8bKe5mn4uZ/JkgNbgzA5PMwqbK82r/+X
    rE83D5ev6SoBVYilGYyLr3nLOiM2ADOQqyw9qm4/LaphYeF1Jet6SThHAetJjCIohq1V9w
    uN7pNWx3Ziq1cVUXFeYnvhsjAgAoPT2D0zTMqNa1koq/Hbykd8/kG/+DmiaA
X-ME-Proxy: <xmx:yjbbakd07d06vqK3SC8ELYLS11FBL2_Y2mOlqTtRj821sS-SsS0P0A>
    <xmx:yjbbajUJHM1yX2-mvtTmlCDj55znt5E5jDT237Pw14qANTUZ8OdLqQ>
    <xmx:yjbbakjjDfwqO98M0LyhUe4caPXEMVHWXrVGbkPnQdi7DoAo6gCTHQ>
    <xmx:yjbbaq-9tRiH65CiM3NRQYL7VXAlcMjcX49k4VyJcJ74Hn6FICub3g>
    <xmx:yzbbaiJZ5A9cPm3lH9kBESTrTbZS-iQmM4xkiJQhgf0OyETI39iP1kQU>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Oct 2026 06:28:26 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH blacksail 0/2] Disable compromised CA certificates
Date: Fri, 23 Oct 2026 11:28:19 +0100
Message-Id: <20261023-certs-blacksail-v1-0-6c7ed969eafa@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMM222oC/z2MQQqDMBREryKzbiCJUppeRbpI4m/7VazkqxTEu
 zcqdPmYeW+FUGIS3IsViRYW/gwZzKVAfPvhRYqbzLDaXo22pYqUJlGh97ETz71yvnSVqbRxt4B
 sjYme/D2KNf43PM5J5tBSnPYitu0HYeUEQX4AAAA=
X-Change-ID: 20261023-certs-blacksail-9a394140198b
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Yoann Congal <yoann.congal@smile.fr>, Ross Burton <ross.burton@arm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751302; l=1049;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=U0e0hbWaNxE9m/2sjWe7/0/A/+N/rohVbzUt8MFqyBM=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGMAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEgAAAAgTr92t0BbQPRVpDtYj+4LaMW949f8sBqd9S/I9YN5GIYAAAAgMjoDqVknOaWc8G
 kRy0k4FrnyLm9H9kVoFIkwRemuC6c=
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248505

These changes update ca-certificates & python3-certifi for blacksail to
handle the fallout of the recent Emudhra CA certificate compromise.

Assuming these patches pass testing, they will be merged to blacksail
outside of the usual stable review process.

Branch: https://git.openembedded.org/openembedded-core-contrib/log/?h=pbarker/certs-blacksail
AB Build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4983

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Paul Barker (1):
      ca-certificates: Disable compromised CA certificates

Ross Burton (1):
      python3-certifi: upgrade 2026.7.22 -> 2026.10.19

 ..._2026.7.22.bb => python3-certifi_2026.10.19.bb} |  2 +-
 ...mSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35 ++++++++++++++++++++++
 .../ca-certificates/ca-certificates_20260816.bb    |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)
---
base-commit: a4461e117c1c501b7021d20c1380e4187fcda4c1
change-id: 20261023-certs-blacksail-9a394140198b

Best regards,
--  
Paul Barker

