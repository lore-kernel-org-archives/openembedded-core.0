Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web09.7602.1621936825795046607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 03:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=VET7S7t6;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: crg7475@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Fq8hl2jXszQjw8
	for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 12:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-transfer-encoding:mime-version:message-id:date:date
	:subject:subject:from:from:received; s=mail20150812; t=
	1621936818; bh=Z1rmwkucuFmuZtVjEgHGIJu6ie9F7608D6uaoJRxPgg=; b=V
	ET7S7t6HdFBFcOVNbZaw5Zq0qU9y90nLKzcL2EwYGa7zD3eGyJ8w6Wt3SsxfDDcu
	FUre1YkLve5d/6+W0JnUCqdO/DfavlwxC3p98ujFTQEf8h7PWWttxx6konzjqw8/
	R22O8vxvrf9L3ibI93fYE2Ni4h7c0Q2MXefabcnFXt5JW4b5hLV+/yAPB5LptSkP
	0f8m4xVLPFWuymtP+9gdUiTMSVPT4AxznrPNMloUH9NZX4qKCSjgmcfeY3xjtVuM
	PtiN1LaSoccjkw/WfPoQ/M3vw2See2VSrdRiUpVMf7zRbgcv+iRm7DXvZ3d4psCj
	C6DrCN87xyE+PsoEt57Zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1621936823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E4Z+v3wqsjMDDVB4YFDtfl4ZH9frG/UFDj+iQ9TjD1I=;
	b=gG9lJyPbr9PNlUyICLRfDU2pAoGxORWj9GntGAsAVhYhCgT3Z1j+4p+TEK12maBHT/29G3
	4Wj+Oqj4TKBd+Vco4nX3LiAOETr/tbHJfeU3TAmRQc/a+lFQ3T/wB/2SRMbXwN8wmvF9Kq
	CUehVCdh/Ylrr0w+T2Pe+EF3CST45MIykJ3KJdZlPWQHO8hiyN1tMh7cy3tOSOcG2RuVNw
	lYLKsYzyIrHaT4+lMuL0+6ezmzs86AsLWKJImAPyjgpQg1AyrKWE/FIUjhNoFAMX3fGJuD
	xbdCi+ZAYNkUmj2HCJW+d53mPRZMPQeWhgxgUDsw6DtwLHBuYBcQkviQgDCUqw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173]) (amavisd-new, port 10030)
	with ESMTP id uy3iymSUHTJ7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 May 2021 12:00:18 +0200 (CEST)
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ffmpeg: Add libopus packageconfig
Date: Tue, 25 May 2021 12:00:13 +0200
Message-Id: <20210525100013.188568-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ***
X-Rspamd-Score: 3.13 / 15.00 / 15.00
X-Rspamd-Queue-Id: 24BA71850
X-Rspamd-UID: fa5cf9
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_4.4.bb
index 384e07362a..664fc6066a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -64,6 +64,7 @@ PACKAGECONFIG[fdk-aac] =3D "--enable-libfdk-aac --enabl=
e-nonfree,--disable-libfdk-
 PACKAGECONFIG[gpl] =3D "--enable-gpl,--disable-gpl"
 PACKAGECONFIG[gsm] =3D "--enable-libgsm,--disable-libgsm,libgsm"
 PACKAGECONFIG[jack] =3D "--enable-indev=3Djack,--disable-indev=3Djack,ja=
ck"
+PACKAGECONFIG[libopus] =3D "--enable-libopus,--disable-libopus,libopus"
 PACKAGECONFIG[libvorbis] =3D "--enable-libvorbis,--disable-libvorbis,lib=
vorbis"
 PACKAGECONFIG[lzma] =3D "--enable-lzma,--disable-lzma,xz"
 PACKAGECONFIG[mfx] =3D "--enable-libmfx,--disable-libmfx,intel-mediasdk"
--=20
2.25.1

