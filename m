Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id E21076FFE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 19:34:13 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id 7so2640572qgj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=IG32kcWzsddU3Py1bjYaAT87SG8/06GDt0LdJY4bCWU=;
	b=O+Y6K08m/M3yIl613/XKihAdrcGplb3Md4DPt8U58Zlmu1p3XRGQXYk411y3S6F0pl
	t5GxND2aCjeIdHHaNKmrJoRO3/kepOCUqwEDTce1u7DckqRy8SlE97kq4jPOlowzKmUm
	8wGI5iH0mwaWW5Q6dEHNeQWp38pQ57W2CIhwd3Dzez5Mg+qo2Q/qQ8iw0+tIBFamBcfw
	oQ4I3jvwhb1g/+imUFAreaet+QLRuUAL49aT/H49l4pJ8hATVwxOcXnCY6LtDVEFh0gI
	wwfq/qljmuD6dXG59agRTUz37tDm/hLKzuUpHEPVkOKtU3rtkkJ0uwzXHnD+MCtrbL8a
	tEEw==
X-Gm-Message-State: AOPr4FVF+BD0n54r1Ctt1oLp7gNhG+5l2kVdpuoZ1GSuyRBOx0bI8FQD65eu3He0QbLTFA==
X-Received: by 10.140.146.142 with SMTP id 136mr6282610qhs.30.1461094454145;
	Tue, 19 Apr 2016 12:34:14 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	l21sm29444986qgd.10.2016.04.19.12.34.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 12:34:13 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 19 Apr 2016 16:34:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 16:34:01 -0300
Message-Id: <1461094441-3445-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1461094441-3445-1-git-send-email-otavio@ossystems.com.br>
References: <1461094441-3445-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] syslinux.bbclass: Add AUTO_SYSLINUXMENU as variable dependency
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
X-List-Received-Date: Tue, 19 Apr 2016 19:34:14 -0000

The value of AUTO_SYSLINUXMENU has impact on the generated
configuration file so this needs to be added to the vardeps flag.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/syslinux.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index fd04ac6..4f238e8 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -190,4 +190,4 @@ python build_syslinux_cfg () {
 
     cfgfile.close()
 }
-build_syslinux_cfg[vardeps] += "APPEND"
+build_syslinux_cfg[vardeps] += "APPEND AUTO_SYSLINUXMENU"
-- 
2.8.0


