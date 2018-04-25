Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A233F72EB3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:06:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o78so7080644wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4DkUM46ANuVYC8Mb4eftkXzyQPzjBZcGr7rwqj39gOY=;
	b=I2tm0iACx8QdQ3CAkD656kzO/M28aJBSexQlxZaHEy5OMHRaZ7I5Pf6sQNOKY6KlI8
	H/oP19HC9F63TMbLnb6T2wikcRiai0Fit1MlZyMPWBYq9H2DGBbeyNK5+N/6UcF7Oidc
	/Gino+KC6WHWA05NrgfUo/SHii3M6xQNgSLpRsQsxmHMNHK7oUkQlG2wUJuxPnthy8iA
	Ri2FIi+c9v3YGnSBLSmsza7+ry9y4JxNDWpPbazSp2gKUht6UDvDZXexw2A0yyxbm4Os
	UGcCIPFk9QPDGZAd56aMn7bSlvhvgqxvB+3297YhhlRRrgPh37h+hkGmHocNDmRumrHE
	dlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4DkUM46ANuVYC8Mb4eftkXzyQPzjBZcGr7rwqj39gOY=;
	b=Xrf5b3l9yAA6YD3WY11f99Fo2XqAG7J/6pOnK0eQdUfzgA3XMOp5qao1HDsPfHQv4A
	CFHMAmMSM+oh8x/8tMBZvZXPDeNdJjas0iMUCdLHDPrAWZQLXVXpyHnv4fQY8du1bQot
	sPgIOc25Un5rfN78z+fJQli0Nw0tUC2H8owOBn1qRNz3caY5BAUZjzNeycpnbSyiujrR
	UagcFSHmXfnCEZaVU5rJNPewfbWTLrXLo8qyTsPHgSwqT37aoGMzNfL1B7sCsRcrVZsv
	DWtyTOLQ2OSXO99g5zpuw1dEdL5xe5PCe3ocpeFQ5BgHtzJZWKD/oKrfL4QCGIRtaqUY
	26wg==
X-Gm-Message-State: ALQs6tBLAFamUF0SbeWDSLuBOnBoXcH5eWMHID2DjRmfNzpW25LCsT5t
	bs8Cgpj93ozJASAJY+PkMFc=
X-Google-Smtp-Source: AIpwx48uOBFo1pzb/MDZ3V5IWn1Xy5XZ+fabNS0T56WNdPJ4X9thMLy1O5qyBFtaQO/zD4SP4UZs6w==
X-Received: by 10.28.212.149 with SMTP id l143mr13997906wmg.144.1524665217078; 
	Wed, 25 Apr 2018 07:06:57 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	q81sm16426858wmg.8.2018.04.25.07.06.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:06:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:06:47 +0000
Message-Id: <c906f8ebabc3c3a3373753c1007ccc0e3d29ce1f.1524665112.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1524665112.git.Martin.Jansa@gmail.com>
References: <cover.1524665112.git.Martin.Jansa@gmail.com>
Subject: [morty][PATCH 2/3] sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning and separated with dash
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
X-List-Received-Date: Wed, 25 Apr 2018 14:06:57 -0000

* I had some components where the MACHINE name was also included in PV of allarch recipe
  which was tripping the script into saying that they have different signatures (because
  for one MACHINE was the string in PV replaced with 'MACHINE' and not for other MACHINEs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-diff-machines.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
index 056aa0a04c..27c6a33006 100755
--- a/scripts/sstate-diff-machines.sh
+++ b/scripts/sstate-diff-machines.sh
@@ -118,7 +118,7 @@ for M in ${machines}; do
     cp -ra ${tmpdir}/stamps/* ${OUTPUT}/${M}
     find ${OUTPUT}/${M} -name \*sigdata\* | sed "s#${OUTPUT}/${M}/##g" | sort > ${OUTPUT}/${M}/list
     M_UNDERSCORE=`echo ${M} | sed 's/-/_/g'`
-    sed "s/${M_UNDERSCORE}/MACHINE/g; s/${M}/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
+    sed "s/^${M_UNDERSCORE}-/MACHINE/g" ${OUTPUT}/${M}/list | sort > ${OUTPUT}/${M}/list.M
     find ${tmpdir}/stamps/ -name \*sigdata\* | xargs rm -f
   else
     printf "ERROR: no sigdata files were generated for MACHINE $M in ${tmpdir}/stamps\n";
-- 
2.17.0


