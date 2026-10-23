Received: from flow-a3-smtp.messagingengine.com (flow-a3-smtp.messagingengine.com [103.168.172.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4263.1792751825456396943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=C92t8iSD;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=lcZvjdSv;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.138, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 9888E1380852
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 06:37:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 23 Oct 2026 06:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1792751824; x=1792759024; bh=XJ3mfodE0C
	qVulNjPnYLK9YTGVSH6+sPK4DIHZucMVE=; b=C92t8iSDgvprkWgH9L9ZubZaBY
	qwQwJ4tzFCYlNeXta8D1dqcwVVa/Lpt2T31i42nilHEd5BjAORmhrQlib/se2JA9
	NjdABXwByw/J3vYpqnkrt1Toc6fLXNtVXRdwv7Pe51oznPMp2Bwc6SJ4ybGxTiJq
	jizNLpmWj052Mge9W+s48PmVXZ1nlndOCHakry2yZ7I/WLdyXUdDXf5daNxRhj7B
	vn6LHBtlxYAVFiOiEXQo8XH8ssrEEZ0gW2JGVLDiaRVdTCrSpbAw3OmIN574Fccu
	4pDULBS4XIqBwcuPLUDTV2nI5c9+I6nD2edUxIQZ1AG2+r+MrFlIggnqJURg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792751824; x=1792759024; bh=XJ3mfodE0CqVulNjPnYLK9YTGVSH6+sPK4D
	IHZucMVE=; b=lcZvjdSvmmNlbgYVubgQU6hH9EySRlPdEHXsbHIkwsy7CH86MpQ
	fg1KprO8eGoW1jWNt+ZSAPkVZIAfCtZfb36GWeZAlt0YQJKnVj9r6CMqtJE3Gui0
	KPfoC174e5ej+dx3xSZf75RVYSQ0RX2tVXxBubaZSIy7rQbJDYUGsOLxY6I0LPSf
	IKEtJGcBCsfGi3qqZUSsL8ZCPpppkLpes23oi0+hmla4OR9JnlGzaT8Uzod68TaY
	+Ttz9cioplcGpKo5ACJJ9FDNoeBPRFYEWqhcai+PfORlxmf40lYGcB6GwQJQQ3+q
	py6zKH/VONIpmyuZJNj/LwZdloY0B5A6I4g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792751824; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:NeqdyMTF6rvIm+0y93x+sxfvHR6AMp6qCuY1qaL3pAN2bNW
	vT/V/x69bAchvlxRpEGK8yNHy9G/xj9D0lzy9HRL2oaUDEaDuWLqCQ3E+ZjdYxiB
	rf+76FUpSHZGLOTQ3KGDtlRi5On+VgkQT08thb9o7VZsDRl04fvJZLqK80uJrzDU
	48aM0YNYqj1ikIagFZKqkLi6CsmLvxEzxWaWQTzpaVXmsgQcqn/xnNHBUTS5clTT
	aBHdnfSxyCuqZd5gMriN3hIZf/AW59y1nCxHaMCD849MwkP+J8zrQD4NMKzQ7u/t
	vSuiZ745Vd3gEKSTIUWJYLPPtlNb2k6bKWyElDA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:DvBnWM8gxplOKmAAhZJZ9Gc40SH8ZLM33lKiBbHwAZs=:O/QRGb4OqoDlKe/ZBFPF7FPTWUcjhjM0Fl0CzVggk3g=;
X-ME-Sender: <xms:0Djbami4mp3CbO5H7tK3kwbOZ727o6sWAbC98l5Khnpp7VXltf8GDA>
    <xme:0Djbat8IDvMAzZFa55fPhZey_ijcVv9w0ElmqZ6UDFCEvPUN5FeVfm_gYM5OihsUA
    06M_YOflfXtdW-88oZ8_oqAzeOo5JA6bOqMXqQh75oF6ZmuNpu4f_y0MA>
X-ME-Received: <xmr:0DjbajuMqCSXk79t9ubktJGAJA_vuCc0FFCMrIW6JHHeJxmzh2mraFTqI5_Al_PqMkwN57r1X3FnLyDHmCNQmfEie-MlRkQ>
X-ME-Proxy-Cause: dmFkZTEDjWLQK149iyLXoG/mB3R79DPbQIf0m5WPchlSl7RlMhMjO7KchzxiaDisD+Y6YW
    VA2bZNLhi0aFI33/p0NOMfsE6gWhc3yrxoMpijx2Vz4dhquGHLTxJk7O63K2Xhj7aaB8W5
    z5D4krBvKDqEbbl5Nw8iz8TCLoE7SiZxycL6KFAF7eMnGcyO/B4mzKf+/RXZ9C45/2OKtW
    ldj8JsnmRdUoNVvcbCROFbOf4kDM9O6r1va1uCPB5hxc/Ed0Ozpixfk7RA7cQFUpi5iSW5
    MMwnv7XrtovVgbZTu9FzDohqvMtBKEIAMvqrqxYTQdzbMphz7+HIpbdheAVUcc83IdwrDO
    bKuw20cPXpGpStd7NJ7uZxvdbILVE0nBvQrKp6TGb9dYxHGXHWwSQewRYoxcwH/Iytsa3+
    bpAj1JFqeR5dmQeaOTEB1Vg5B2ut+bzn2sLHYP+tq6xw5Ig3q9ye8fNq2csbsntBBuzSOM
    diSejkp8d/kzGIqwve4ufAbToHdYQalRjpVqVF8iIwqnanVDiHKK59/Y6Gaix9B1g2/kSG
    Uskm63R5J/z79hs6iMSSbexzXgFDdplGbb3/hHzn5L2rqa1p1eBP/DOB6pvSY06+WpwznP
    cwz2hYy+ytk82rtjAznw46PhWceSZaJGu7U0UFK6juGMIE1qKYxxhtkKFCYg
X-ME-Proxy: <xmx:0DjbakY4muLMiNCHLX48RQOd5J5L3cMH_arFEPGWAzp9eCGJ7tJotQ>
    <xmx:0DjbajrP5T-dgM8GY-NpUfxTZdy6PwhQSKUzY4ngbXvz9jy5DKT-oA>
    <xmx:0Djbap9EKsSnFUXUy7qnIZR7Pj6VGjfPE0XE4MkKKHTHqnkm_yTu_Q>
    <xmx:0Djbai8bObPHA5DN6fI0Tyb8Fjo6xCYRK-brBvrAcK6WvCjzd401LA>
    <xmx:0Djbaqk2a330G33ccrDOGQQzTs0BLYpzSp-iNyDh5I8wnWKh5iEY9Gw->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 23 Oct 2026 06:37:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Subject: [PATCH wrynose 0/6] Disable compromised CA certificates
Date: Fri, 23 Oct 2026 11:36:54 +0100
Message-Id: <20261023-certs-wrynose-v1-0-83dd2facdbd3@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMY422oC/y2Muw7CMBAEfyXaGks5R0rBryCK2FngKBx0FyAoy
 r9jHuVod2aF05SOfbPC+FDXqVSQXYN8GcqZQcfKiG3spY1dyLTZw9NeZXIGSX1mSjIOnaA6N+N
 Jl2/vgP8Jx9/g93Rlnj81bNsb1eUEVnoAAAA=
X-Change-ID: 20261023-certs-wrynose-1b6cebb1da31
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792751817; l=1303;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=O/QRGb4OqoDlKe/ZBFPF7FPTWUcjhjM0Fl0CzVggk3g=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAhAP7znLO9HTfU+kGkHRyIixndguUCeGVu1n0xdysTvw4jAAAAIH6eKvR29nWKuI
 vzJ9nzvGd1VjZtWPNxLtVcsv5H2z4l
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248509

These changes update ca-certificates & python3-certifi for wrynose to
handle the fallout of the recent Emudhra CA certificate compromise.

Assuming these patches pass testing, they will be merged to wrynose
outside of the usual stable review process.

Branch: https://git.openembedded.org/openembedded-core-contrib/log/?h=pbarker/certs-wrynose
AB Build: https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4985

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
Paul Barker (1):
      ca-certificates: Disable compromised CA certificates

Richard Purdie (1):
      python3-certifi: upgrade 2026.2.25 -> 2026.4.22

Ross Burton (1):
      python3-certifi: upgrade 2026.7.22 -> 2026.10.19

Tim Orling (3):
      python3-certifi: upgrade 2026.4.22 -> 2026.5.20
      python3-certifi: upgrade 2026.5.20 -> 2026.6.17
      python3-certifi: upgrade 2026.6.17 -> 2026.7.22

 ..._2026.2.25.bb => python3-certifi_2026.10.19.bb} |  2 +-
 ...mSign-ECC-Root-CA-G3-and-Comodo-AAA-Servi.patch | 35 ++++++++++++++++++++++
 .../ca-certificates/ca-certificates_20260816.bb    |  1 +
 3 files changed, 37 insertions(+), 1 deletion(-)
---
base-commit: 636e5d3b12d54951c13d57346648bc29a0e6b24e
change-id: 20261023-certs-wrynose-1b6cebb1da31

Best regards,
--  
Paul Barker

