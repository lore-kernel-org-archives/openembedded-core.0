Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 52CE87965B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 14:40:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f78-v6so7734527pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=EiJ34b9F+9JdF5n49K1z9TVlqPu0Q7iJXMBj4MqJhf4=;
	b=nJIxHi8ZtHfB093BDvPajGmMBIB6uui4BXm/gruseWm2teleyh4p8maF1QJ1Ihl72G
	StNXuiJHEk0b0iJ6f/z637LdXKz8EsOL5cf2TSTQEmSqLnqYZnpOKaxfKSRLzUgYn5Q6
	4sxVNPVe3SbXYytuz9SGzcRZ/OGnoHHuC3Q/Z6LucBUFla4QPUexlcb0LYe/bokwyi8n
	pjHCJoi01ME6SdyKvWM2L8UrikkNdojGk80GwSDvikAYwMdmr1qmkqwNIot4di/Gv0HK
	bNIvI0M1d/ifGTfUXCaN/s3Bd0ZjmP6UpfOtxLdiCaSOjkUim91CLjMH8cuHYR+v/NjL
	BqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EiJ34b9F+9JdF5n49K1z9TVlqPu0Q7iJXMBj4MqJhf4=;
	b=Gtc/4OfIVKLlwpJKEr8hkddz/qBlohqkzltwi20CSrZa1uWIhcUJfNUsYaZQaRu+jk
	PQ8ILmF8pvhp148QFuLTiNEvgbuzNIIN3yzDVs2YAYcrTJT8qGz+h8YePQD5wis9KLAK
	H2ivb+18/PPbVMpOVDPYx6vOgC53FztFElupn+c2MBtyVRxNbCS0wSKmQ7dG58jLC3b4
	wl18/3mtnS5J/3fRatPSH/xG2/nOyHTc2u3uCFtaeYODQvH3LecwSEWO1rUsiMnufzbK
	EoNQSzlebi9U+XqWsyBOd/cmXt0XzldKwvHwIiXQfdvfNAJeJlqfQ4hrp69WDKAWRBSr
	X5kw==
X-Gm-Message-State: AGRZ1gKUWKbsitxoT3tsBoNOCl+IOfcspqHew93SZZlJMNtSmEIAJGQ9
	u1IipZneYX8o57Jj9hxGjGYv5bG2
X-Google-Smtp-Source: AJdET5fYsIj1YKSryKY0B6eTawwy9+XOn0ApPjEwF6W1Y6/6c9VX8bqWsqVUmrT9IHXSDqfo+G1jxA==
X-Received: by 2002:a62:6181:: with SMTP id
	v123-v6mr3734208pfb.117.1540996802080; 
	Wed, 31 Oct 2018 07:40:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:571:f5d0:d940:5c94])
	by smtp.gmail.com with ESMTPSA id
	h17-v6sm7123568pfj.125.2018.10.31.07.40.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 31 Oct 2018 07:40:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 07:39:56 -0700
Message-Id: <1540996800-29855-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [master-next][PATCH 1/5] tzcode-native: update to 2018g
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
X-List-Received-Date: Wed, 31 Oct 2018 14:40:01 -0000

  Changes to code

    When generating TZif files with leap seconds, zic no longer uses a
    format that trips up older 32-bit clients, fixing a bug introduced
    in 2018f.  (Reported by Daniel Fischer.)  Also, the zic workaround
    for QTBUG-53071 now also works for TZif files with leap seconds.

    The translator to rearguard format now rewrites the line
    "Rule Japan 1948 1951 - Sep Sat>=8 25:00 0 S" to
    "Rule Japan 1948 1951 - Sep Sun>=9  1:00 0 S".
    This caters to zic before 2007 and to Oracle TZUpdater 2.2.0
    and earlier.  (Reported by Christos Zoulas.)

  Changes to past time zone abbreviations

    Change HDT to HWT/HPT for WWII-era abbreviations in Hawaii.
    This reverts to 2011h, as the abbreviation change in 2011i was
    likely inadvertent.

  Changes to documentation

    tzfile.5 has new sections on interoperability issues.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../tzcode/{tzcode-native_2018f.bb => tzcode-native_2018g.bb}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2018f.bb => tzcode-native_2018g.bb} (70%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2018f.bb b/meta/recipes-extended/tzcode/tzcode-native_2018g.bb
similarity index 70%
rename from meta/recipes-extended/tzcode/tzcode-native_2018f.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2018g.bb
index 816e34d..3e2b60a 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2018f.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2018g.bb
@@ -11,10 +11,10 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzdata.md5sum] = "e5e84f00f9d18bd6ebc8b1affec91b15"
-SRC_URI[tzdata.sha256sum] = "0af6a85fc4ea95832f76524f35696a61abb3992fd3f8db33e5a1f95653e043f2"
-SRC_URI[tzcode.md5sum] = "011d394b70e6ee3823fd77010b99737f"
-SRC_URI[tzcode.sha256sum] = "4ec74f8a84372570135ea4be16a042442fafe100f5598cb1017bfd30af6aaa70"
+SRC_URI[tzcode.md5sum] = "b48f0282b80bb7dbe16e35626f446ae9"
+SRC_URI[tzcode.sha256sum] = "aa53f4fb6570f02081be61dc11ade19ea5a280c23822a5b4016ce0c6be23c427"
+SRC_URI[tzdata.md5sum] = "e71cb1f9d8d53c43904d79d7aeeedc1b"
+SRC_URI[tzdata.sha256sum] = "02dfde534872f6513ae4553a3388fdae579441e31b862ea99170dfc447f46a16"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


