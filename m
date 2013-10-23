Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id B2F826D2DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 15:35:57 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id ey11so1096765wid.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=sDt86OUhCidpJF9VacnoO0zUN3GEGJKAxWqnfTjkWnY=;
	b=y2hqhEPTyPhNFIN/roOSXSGE0S1xs1KFIcptcXyShxKfBDdZNb3fc6aKse2CX2pok3
	PQ6YQYqx/Z9dPRiNVqjLkIfbDd/NqjsQkpG8+di2KbXFpMNPitiEerKL2AkRhiZVVfHT
	DUuxFVAuU7/ZegsfhzChcqO9MaMJpFrwCUisW8xtjf2zNQI+2SA2Rafn8fez3YOnamMy
	AmF4Yim7cRL+jDf2WUCVfmk+6hRaGgszA0GhEK0bCH1CgZr3/0A0a86BA1YJeJLghZG+
	rsQeOI6mLuqbYobo2uGSvAhFXR1H1IN0U9Ynog99Czz16usrB+74GWsTm9xLh5iojIcJ
	nMaQ==
X-Received: by 10.180.13.174 with SMTP id i14mr2666012wic.49.1382542558701;
	Wed, 23 Oct 2013 08:35:58 -0700 (PDT)
Received: from nysan (ed03490-ge-0-0-0.mgdfwr.lumison.net. [212.20.242.100])
	by mx.google.com with ESMTPSA id b7sm18109601wiz.8.2013.10.23.08.35.57
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Oct 2013 08:35:58 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 12D8440068D; Wed, 23 Oct 2013 16:35:57 +0100 (BST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org,
	yocto@yoctoproject.org
Date: Wed, 23 Oct 2013 16:35:54 +0100
Message-Id: <1382542555-12171-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [yocto-docs][PATCH] ref-manual: Added description of sdk-pms DISTRO_FEATURE
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
X-List-Received-Date: Wed, 23 Oct 2013 15:35:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Added description of DISTRO_FEATURE sdk-pms in the Yocto reference manual.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 documentation/ref-manual/ref-features.xml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/ref-manual/ref-features.xml b/documentation/ref-manual/ref-features.xml
index 92c5e8a..f042bba 100644
--- a/documentation/ref-manual/ref-features.xml
+++ b/documentation/ref-manual/ref-features.xml
@@ -115,6 +115,10 @@
                     supports it.</para></listitem>
                 <listitem><para><emphasis>wifi:</emphasis> Include WiFi support
                     (integrated only).</para></listitem>
+		<listitem><para><emphasis>sdk-pms:</emphasis> Include Package 
+		    Management Tools in the nativesdk toolchain tarball,
+                    This to allow easy sandboxing of rootfs creation when using 
+		    the SDK tarball.</para></listitem>
             </itemizedlist>
         </para>
     </section>
-- 
1.8.3.2


