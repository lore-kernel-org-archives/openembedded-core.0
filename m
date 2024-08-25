Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6829C5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 11:52:52 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.30490.1724586765808759968
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 04:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=ZWpw6HHl;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8D3E9240104
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 13:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1724586763; bh=lox2arzNoqM/TJlClNR+TtbKNZg1hPTupB879T3TiKA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ZWpw6HHlcAcqd5fNjzHtXRImrvvqiIAJRET48erbYEzZICikJPJaxIUTecAiXl8Mv
	 dwIh6ojoTpZE8qYk4mr/JuSLphGTXq6c+wqjPu6c32nSh5rXxFD/kb40kVtBj4BgvP
	 0hHCx5dyEXWdCu5u78x/FglfsHFQMQORkdkzd0b2DRgtWA0UxQoUZOKr+G5I29wXOm
	 rkQ4WYIWFRXpi7gwyx1iBedgYBaw2TOn1DAN1e066gRQBOngGOC8/qQz9Lk0eyFJ39
	 ZuaBxj3snp6D/vQz/A4cgruci4SOgfo0v/zy7caUdEoDSM52HJtY6ecC2MV4KJP6Qf
	 zhv2d2l0wL7hQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4WsBy25dy7z9rxG;
	Sun, 25 Aug 2024 13:52:42 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] curl: Ignore CVE-2024-32928
Date: Sun, 25 Aug 2024 11:52:34 +0000
Message-Id: <20240825115234.58306-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203718

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

This CVE affects google cloud services that utilize libcurl wrongly.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-support/curl/curl_8.9.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.9.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.9.1.bb
index 4d96a4e034..745224929b 100644
--- a/meta/recipes-support/curl/curl_8.9.1.bb
+++ b/meta/recipes-support/curl/curl_8.9.1.bb
@@ -20,6 +20,7 @@ SRC_URI[sha256sum] =3D "f292f6cc051d5bbabf725ef85d432df=
eacc8711dd717ea97612ae59064
=20
 # Curl has used many names over the years...
 CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
+CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VERIFYPEER was disa=
bled on google cloud services causing a potential man in the middle attac=
k"
=20
 inherit autotools pkgconfig binconfig multilib_header ptest
=20
--=20
2.39.2


