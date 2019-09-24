Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C21CB7F2DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:16 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so297398pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sRFkFtQNu/c9RuPbZQKQ20iMl/cNy+QCK9j3pq4pBWs=;
	b=hoK2OVcljegj9VBr3P45OOxIz7H4InD0MJBnGwclWKU5fbFNY4v+M/m33yjI9E+DcO
	2Zg3Onts3OUZ1rLtTijCU50IYHcsBc5mNMDrUHxr0ftkGt+uY8od4+AAkdbQUse8DrfR
	R5KUAOPOtUTOdGXKDPlnNNqBkUo66gXEkCBiSDtToUGGtMzDpMz6c/GT/ea0NgbadbHH
	yTOppq8UTvKen+DE5N5sebkYrd3CwDI0AHKNDMwnNkWkCZVI600FCitpyVarxK+F0mO7
	ZzdgWOfSFTB+tIN6g/yS4wZ2H4bUVhDdSjXBaypFK9RlzdGa80uNusO4do23sqs+TGJE
	lhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sRFkFtQNu/c9RuPbZQKQ20iMl/cNy+QCK9j3pq4pBWs=;
	b=cJczFZ9PRwZe3XoEHnYHDDKr13jSx/GADRfl5GF4uoquSCxIJSydserIovaHaLj1os
	45ubMjslOQEXs5lA8uHjKiseMYf4wYlStIj/2xvDgAETKIlLDvU2u3LMihZPE6ELOIQ8
	Ebt6g6A2XAvHy9MBPFAsKwj2aScNkNdiBredyAeiMgPrIDukJneh5IMUBPDoDbS3Grw/
	uXhjprn+2F+HPuKlRNYFivr16frGrQC/CpcJBpFjcjEjaR6SNzQ0jGmmWdGwwtWhLeoK
	lEgZPy/EvToyI32eBMzJFNJWeJvNyamtPpXnN4V/5YSoUbxlfa619XG5H6m9mh75YVP3
	uqmw==
X-Gm-Message-State: APjAAAX9w7uYuVqA3Y5A15N/HnlyEqIeI4k5s5VeYqxFlwxriDguX9du
	/q2r7+nhc6Bal+aft26AcmBND2pKNKg=
X-Google-Smtp-Source: APXvYqwcsotRKBsiA9qdkaV6f/Y7i0DYNdwybZzDNEA0xQi4iCQHjID6CxLmf0KLh5dK48esCfn1qQ==
X-Received: by 2002:a65:628a:: with SMTP id f10mr760141pgv.155.1569293417809; 
	Mon, 23 Sep 2019 19:50:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:24 -0700
Message-Id: <143ff6959233db2ebd10791a3b2b362097593aba.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 44/50] kernel-fitimage: uboot-sign: fix missing signature
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:17 -0000

From: Jun Nie <jun.nie@linaro.org>

u-boot.bin with dtb & signature should be placed in ${B} so that
it can be deployed by u-boot as expected. Otherwise, the version
without signature is installed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/classes/uboot-sign.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8beafff..1fc2a37 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -66,7 +66,7 @@ concat_dtb_helper() {
 		install ${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
 	elif [ -e "${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}" -a -e "$deployed_uboot_dtb_binary" ]; then
 		cd ${DEPLOYDIR}
-		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${UBOOT_BINARY} > ${UBOOT_IMAGE}
+		cat ${UBOOT_NODTB_IMAGE} $deployed_uboot_dtb_binary | tee ${B}/${CONFIG_B_PATH}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
 	else
 		bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
 	fi
@@ -77,10 +77,12 @@ concat_dtb() {
 		mkdir -p ${DEPLOYDIR}
 		if [ -n "${UBOOT_CONFIG}" ]; then
 			for config in ${UBOOT_MACHINE}; do
+				CONFIG_B_PATH="${config}"
 				cd ${B}/${config}
 				concat_dtb_helper
 			done
 		else
+			CONFIG_B_PATH=""
 			cd ${B}
 			concat_dtb_helper
 		fi
-- 
2.7.4


