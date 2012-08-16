Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28kR-0005CX-Lp
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:41:03 +0200
Received: by wibhq4 with SMTP id hq4so993537wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=+RjAu/Yh5WepmCSzxFthjjAdvkfzkaMVFPwvCbywCGE=;
	b=S99KmXIAS+njaKPtwWRE20pgEq/Jq0h0wTQIE1Y7JE9POp6fMixTgFaaVz9BnCNQ/h
	xf3mKT6FQdg7cWoU9mtpy1rNl7//08alLGXpbSfAGINM2MEgRTjNlLocgEMOdhvejAgh
	tO57SNdRb2TiMdUODj8x452WOXTuAmR3N8eG8OI/A5kq5wSLKqjp5i6NIjUf5Qd2fnFM
	VNugBNBnf9H+smd90ktiaH4YXFUVd8/hA1m/Zt2yiHcZqz8ZXe1+2g8vWJ7mk/Ndlctv
	gPWFsB4O6l5tRqSNtzEoL5qYaLvQ1IXo800HoXVb7I1wiqcq2g3WDQh0eoXT3imkorS6
	iL+g==
Received: by 10.216.241.203 with SMTP id g53mr1392105wer.142.1345156145946;
	Thu, 16 Aug 2012 15:29:05 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id cu1sm6321240wib.6.2012.08.16.15.29.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:29:05 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:28:50 +0300
Message-Id: <9a29343d541a95400e26f8c37da38b961ab42bd5.1345155936.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
In-Reply-To: <cover.1345155936.git.andrei@gherzan.ro>
References: <cover.1345155936.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQl1xnLiBHb0YsgPY5QKf4UVoaN0gE0T3i8a55VaAE4m8n5tWRlcTFR1kpxjaROZQno7GKnH
Subject: [V2 PATCH 4/6] bitbake.conf: Add rtc to MACHINE_FEATURES_BACKFILL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 22:41:03 -0000

This was done this way so that the current machine configuration
would remain unaffected.
The rtc MACHINE_FEATURE will specify if a real time clock is avalaible.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4773d50..bc2d47d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -724,7 +724,7 @@ IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 DISTRO_FEATURES_BACKFILL = "pulseaudio"
 DISTRO_FEATURES_append = "${@oe.utils.features_backfill("DISTRO_FEATURES",d)}"
 
-MACHINE_FEATURES_BACKFILL = ""
+MACHINE_FEATURES_BACKFILL = "rtc"
 MACHINE_FEATURES_append = "${@oe.utils.features_backfill("MACHINE_FEATURES",d)}"
 
 COMBINED_FEATURES = "\
-- 
1.7.9.5



