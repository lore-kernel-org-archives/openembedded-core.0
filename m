Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 80F5F7C29B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 09:38:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43qJFm1mwFz4v
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:38:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1548841100;
	bh=MDC/8A2kRF3t5yprHk3SfGGiMyB5uKvCNiTjVDrJJP0=;
	h=From:To:Subject:Date:From;
	b=R+xSPl+bQv9lrHVunWfB/rgFzYSHLOrNzkm19PHu70bLVUBFwCPTG9m7Am4cdb5uS
	Ja99sLcvYhcBSzMfaVG24GhlT2RAf2daTnJZjfkjdw6fmGfgqVBdfEpm57X6KFSRfj
	HWVZ+nMlwnsVyKbqh35l2RYWozgGjWNGJmWT6ofMBGeNEhi3mAV/Eb08zjrQ0aO99f
	YGvFRqec+k/HGLmdCyIUxKZq0CuBQURfTxJwhU2WgSbOMX3HakcLyADsSUMX5Wk75u
	MbXJUlosQuL94bvEV+4jtoFW5MCjtm03M70dxo7HxTdZjKT/9NsX3dScMfw0/SUe9t
	jrw4xHTzDhk7ooCIGmODLs+3w8JTBnabDaI+j0gWySiaeigFnPAUM/zY7noGrMUw+u
	8asc/3MpT2vDYePEbgxU7fKVTXoDFNHFchWBwX0Hkgvyrq8eJej7qB5I8Gv2iLyd2J
	f68hZDYdPX5B6vP4IHc7uSZ4rMCA3TdEyxNRkiFb6BGj5RoMJSx3z/c8ZA+BeMMjRE
	6tOh+gF+tGBnReXQFVCS1YgjL9j/kEEchejFOIyHxTxXe/CivyOLsQfw3rIxzyNMbc
	ErrDtC11nkJ+g8fy0G8weT+itoUneM5aqaOt5O3MDAhUd49SqsItASsO/29FpTL2uN
	t9Imd5OmLr2cOKUxhtFlTZZs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:38:19 +0200
Message-Id: <20190130093819.10786-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [thud] [PATCH] Ubuntu 16.10 is not LTS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 09:38:19 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 documentation/ref-manual/ref-system-requirements.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/ref-system-requirements.xml b/documentation/ref-manual/ref-system-requirements.xml
index 69d4b4e726..500b2f8f39 100644
--- a/documentation/ref-manual/ref-system-requirements.xml
+++ b/documentation/ref-manual/ref-system-requirements.xml
@@ -97,7 +97,7 @@
                 <listitem><para>Ubuntu 15.04</para></listitem>
                 <listitem><para>Ubuntu 15.10</para></listitem> -->
                 <listitem><para>Ubuntu 16.04 (LTS)</para></listitem>
-                <listitem><para>Ubuntu 16.10 (LTS)</para></listitem>
+                <listitem><para>Ubuntu 16.10</para></listitem>
                 <listitem><para>Ubuntu 17.04</para></listitem>
 <!--            <listitem><para>Fedora 16 (Verne)</para></listitem>
                 <listitem><para>Fedora 17 (Spherical)</para></listitem>
-- 
2.11.0


