Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBD87450C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:07:07 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v5-v6so2726382wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4DkUM46ANuVYC8Mb4eftkXzyQPzjBZcGr7rwqj39gOY=;
	b=VTWhkiJ1/Ca/b0HCLIc2Qz9G3RxXmLTNgqX9C6Qcafcugz6crL6/nmPQph1FgvWDX3
	Z30QqmEiSZexG50CTUj94axVn0x/kl7DkMrFC5t+bPYtXgLquYWOqKC9MiqVSu1cHYW6
	XfVDINcEItHJ5yvukz3DnUDi00v6q16IgCPGesjVsd3uopPToM7Hbl4EvGI4kCv9vVpj
	obip3BE2hluZatci/hZmCqNRxoZ02P9zkkNXqfiONYP2443zDyL1rbPzGeQsZOuwJHMm
	BMXl+aCn4DfyEh1QxTsbPrpnxZtNWYO2Mpj1mKPTVsQl8DnfGSgyypQsCaDWw82mQihJ
	745A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4DkUM46ANuVYC8Mb4eftkXzyQPzjBZcGr7rwqj39gOY=;
	b=a2VRwe6NI6z9lmO/CqCG7C82zcHQPlvqdUYa78YZRdLaJqXKLEyrltUCV1RF6j5r2j
	2aiRownWVJQi/9Lg39Ex3KkUObi2KUFYRasX4cW02UcRSIqhhJ0TSY2z7f2PtfiYkN3y
	voqmltZvD/L3dndegdJUQiQ3fxGVNa8I/2pUnaWmputgigtZ+jS3dSZhFYpvP5Y+00x3
	etDoTQD4Q3ZKij6hta4t4WIL/ddkb7lhqXpmTz8a0sVvIHjyAAXeIVBzYQ4g8hN5OpcU
	6ptgHSZ/Zozz0euBluU3o99vd8UcoAsZ/17tMRUZYKIjjJdf6SH8WkJa9Qn/gDMCFJzJ
	Mrdw==
X-Gm-Message-State: ALQs6tAesZ5h5reh/1qU8FX/jfdU7rrRxUqyn7+Ud3O5QAE2/OvqT1yr
	n6CvSh/9u25te2ijx83BzC4=
X-Google-Smtp-Source: AIpwx4/bVYBWaDOHCHdAeJ7lo/Djz1hnN+sG+m3YVnmAMTiDHAVj3nTjh3hjio9V31wVVKlELlhOWQ==
X-Received: by 2002:adf:9607:: with SMTP id
	b7-v6mr22230253wra.129.1524665228344; 
	Wed, 25 Apr 2018 07:07:08 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o20-v6sm16909816wro.7.2018.04.25.07.07.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:07:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:07:04 +0000
Message-Id: <b85550e147e2172dd8990e8b4475c7ca359679c3.1524665115.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1524665115.git.Martin.Jansa@gmail.com>
References: <cover.1524665115.git.Martin.Jansa@gmail.com>
Subject: [pyro][PATCH 2/3] sstate-diff-machines.sh: Replace MACHINE_ARCH only at the beginning and separated with dash
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
X-List-Received-Date: Wed, 25 Apr 2018 14:07:08 -0000

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


