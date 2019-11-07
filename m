Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id EF4567F362
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 23:58:35 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n1so5023478wra.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 15:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K9AWkewqYfPG3vY62VkCTLkWVkHgCdL7Mn3fJP7OVYk=;
	b=zhkYPZWztesdAOQPgVets9j0BrAHO3JggKPN91y1chfTyuD7+j5C8SSt3WPWj5ukwZ
	7VI3BedNGH5eilqbFmdulxz0/ap2FlZRA8q0ZF2PyDKWeKK+JBsLM5UQ8Wr1Rnn2JeoM
	tMtSxsCte3THJy6DufHXrYbIqLTl/OyQhWsUUAY7yGedyPZCVXxdodHy+X6oKWxMwV2a
	JI/8Milrsw18XKss/a/70RT2etaVCoZtI1QQofEI+aDD0A/tZndu7r8vPSPCfxVrPbZ6
	pmfFJBPLU1C8MOD0QIW5HrEgRPWPuMDyC4yKcc1pxBvMYtSX2ayjejG8z7Kr8JNkq+eA
	RVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K9AWkewqYfPG3vY62VkCTLkWVkHgCdL7Mn3fJP7OVYk=;
	b=fK9d7Esip/TviKK0rFJ6BgL1RIr1hgZ18QOCLJLpshjcCwHIKwdmun/QMc0lq7BsbK
	WZ6UD3TS6OhmjOIk/zn4wp/Z33V2vFOxygwxs2SOKDMTQGoWpi1nEINptwAnTvvP25Az
	1xB8uAA71BB+0d32QUmsJbFqzpUnIc3CS7w7pxhbP88+4dwaQAhZHTXdwbdGx6rwrhc7
	955ufBrg42TvgDHsA5cC5xW+NKGAurEiVIdVTuCJ1U8mTmyklV6CKgxenXZBLjX+l3C9
	LhttKKG13cxNeSKU7DIg+k5bDUmfeUbYPQMdumKi0CfqX/uyZr4s6MYZQW/KdTO2tS27
	WUPA==
X-Gm-Message-State: APjAAAXaDcyBRMYFFK1eSGU/Ubrved7hKXPYurR6hrLkztZNn3ydlXPv
	iSVO8D/1W2fhGYnNW4gPMaKsLNyLLTw=
X-Google-Smtp-Source: APXvYqxMyTpR+3sWm2kKlZjbq7q9AMQ9QhZ2bohxmxQsIWwwAoPas4r6DFJ2UYIXMKj6iarRmPMt+A==
X-Received: by 2002:adf:e889:: with SMTP id d9mr5929868wrm.266.1573171116083; 
	Thu, 07 Nov 2019 15:58:36 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f13sm3702821wrq.96.2019.11.07.15.58.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 15:58:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 23:58:27 +0000
Message-Id: <20191107235830.26644-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107235830.26644-1-ross.burton@intel.com>
References: <20191107235830.26644-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] acpica: upgrade to 20191018
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
X-List-Received-Date: Thu, 07 Nov 2019 23:58:36 -0000
Content-Transfer-Encoding: 8bit

The upstream tarballs now have a unified source license of Intel|BSD|GPLv2 and
the old BSD|GPLv2 tarballs are deprecated.

Add the Intel license to the license collection, update the LICENSE field, and
update the license checksum to actually point at a license fragment.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/files/common-licenses/Intel              | 105 ++++++++++++++++++
 ...{acpica_20190816.bb => acpica_20191018.bb} |  12 +-
 2 files changed, 111 insertions(+), 6 deletions(-)
 create mode 100644 meta/files/common-licenses/Intel
 rename meta/recipes-extended/acpica/{acpica_20190816.bb => acpica_20191018.bb} (75%)

diff --git a/meta/files/common-licenses/Intel b/meta/files/common-licenses/Intel
new file mode 100644
index 00000000000..29ddf57a8c2
--- /dev/null
+++ b/meta/files/common-licenses/Intel
@@ -0,0 +1,105 @@
+1. Copyright Notice
+
+Some or all of this work - Copyright (c) 1999 - 2017, Intel Corp.
+All rights reserved.
+
+2. License
+
+2.1. This is your license from Intel Corp. under its intellectual property
+rights. You may have additional license terms from the party that provided
+you this software, covering your right to use that party's intellectual
+property rights.
+
+2.2. Intel grants, free of charge, to any person ("Licensee") obtaining a
+copy of the source code appearing in this file ("Covered Code") an
+irrevocable, perpetual, worldwide license under Intel's copyrights in the
+base code distributed originally by Intel ("Original Intel Code") to copy,
+make derivatives, distribute, use and display any portion of the Covered
+Code in any form, with the right to sublicense such rights; and
+
+2.3. Intel grants Licensee a non-exclusive and non-transferable patent
+license (with the right to sublicense), under only those claims of Intel
+patents that are infringed by the Original Intel Code, to make, use, sell,
+offer to sell, and import the Covered Code and derivative works thereof
+solely to the minimum extent necessary to exercise the above copyright
+license, and in no event shall the patent license extend to any additions
+to or modifications of the Original Intel Code. No other license or right
+is granted directly or by implication, estoppel or otherwise;
+
+The above copyright and patent license is granted only if the following
+conditions are met:
+
+3. Conditions
+
+3.1. Redistribution of Source with Rights to Further Distribute Source.
+Redistribution of source code of any substantial portion of the Covered
+Code or modification with rights to further distribute source must include
+the above Copyright Notice, the above License, this list of Conditions,
+and the following Disclaimer and Export Compliance provision. In addition,
+Licensee must cause all Covered Code to which Licensee contributes to
+contain a file documenting the changes Licensee made to create that Covered
+Code and the date of any change. Licensee must include in that file the
+documentation of any changes made by any predecessor Licensee. Licensee
+must include a prominent statement that the modification is derived,
+directly or indirectly, from Original Intel Code.
+
+3.2. Redistribution of Source with no Rights to Further Distribute Source.
+Redistribution of source code of any substantial portion of the Covered
+Code or modification without rights to further distribute source must
+include the following Disclaimer and Export Compliance provision in the
+documentation and/or other materials provided with distribution. In
+addition, Licensee may not authorize further sublicense of source of any
+portion of the Covered Code, and must include terms to the effect that the
+license from Licensee to its licensee is limited to the intellectual
+property embodied in the software Licensee provides to its licensee, and
+not to intellectual property embodied in modifications its licensee may
+make.
+
+3.3. Redistribution of Executable. Redistribution in executable form of any
+substantial portion of the Covered Code or modification must reproduce the
+above Copyright Notice, and the following Disclaimer and Export Compliance
+provision in the documentation and/or other materials provided with the
+distribution.
+
+3.4. Intel retains all right, title, and interest in and to the Original
+Intel Code.
+
+3.5. Neither the name Intel nor any other trademark owned or controlled by
+Intel shall be used in advertising or otherwise to promote the sale, use or
+other dealings in products derived from or relating to the Covered Code
+without prior written authorization from Intel.
+
+4. Disclaimer and Export Compliance
+
+4.1. INTEL MAKES NO WARRANTY OF ANY KIND REGARDING ANY SOFTWARE PROVIDED
+HERE. ANY SOFTWARE ORIGINATING FROM INTEL OR DERIVED FROM INTEL SOFTWARE
+IS PROVIDED "AS IS," AND INTEL WILL NOT PROVIDE ANY SUPPORT, ASSISTANCE,
+INSTALLATION, TRAINING OR OTHER SERVICES. INTEL WILL NOT PROVIDE ANY
+UPDATES, ENHANCEMENTS OR EXTENSIONS. INTEL SPECIFICALLY DISCLAIMS ANY
+IMPLIED WARRANTIES OF MERCHANTABILITY, NONINFRINGEMENT AND FITNESS FOR A
+PARTICULAR PURPOSE.
+
+4.2. IN NO EVENT SHALL INTEL HAVE ANY LIABILITY TO LICENSEE, ITS LICENSEES
+OR ANY OTHER THIRD PARTY, FOR ANY LOST PROFITS, LOST DATA, LOSS OF USE OR
+COSTS OF PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES, OR FOR ANY INDIRECT,
+SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF THIS AGREEMENT, UNDER ANY
+CAUSE OF ACTION OR THEORY OF LIABILITY, AND IRRESPECTIVE OF WHETHER INTEL
+HAS ADVANCE NOTICE OF THE POSSIBILITY OF SUCH DAMAGES. THESE LIMITATIONS
+SHALL APPLY NOTWITHSTANDING THE FAILURE OF THE ESSENTIAL PURPOSE OF ANY
+LIMITED REMEDY.
+
+4.3. Licensee shall not export, either directly or indirectly, any of this
+software or system incorporating such software without first obtaining any
+required license or other approval from the U. S. Department of Commerce or
+any other agency or department of the United States Government. In the
+event Licensee exports any such software from the United States or
+re-exports any such software from a foreign destination, Licensee shall
+ensure that the distribution and export/re-export of the software is in
+compliance with all laws, regulations, orders, or other restrictions of the
+U.S. Export Administration Regulations. Licensee agrees that neither it nor
+any of its subsidiaries will export/re-export any technical data, process,
+software, or service, directly or indirectly, to any country for which the
+United States government or any agency thereof requires an export license,
+other governmental approval, or letter of assurance, without first obtaining
+such license, approval or letter.
+
diff --git a/meta/recipes-extended/acpica/acpica_20190816.bb b/meta/recipes-extended/acpica/acpica_20191018.bb
similarity index 75%
rename from meta/recipes-extended/acpica/acpica_20190816.bb
rename to meta/recipes-extended/acpica/acpica_20191018.bb
index 8f799747756..4692275762b 100644
--- a/meta/recipes-extended/acpica/acpica_20190816.bb
+++ b/meta/recipes-extended/acpica/acpica_20191018.bb
@@ -9,19 +9,19 @@ ACPI tables."
 HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 
-LICENSE = "BSD | GPLv2"
-LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
+LICENSE = "Intel | BSD | GPLv2"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=b5690d9ef8d54b2b1e1cc98aad64cd87"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "bison flex bison-native"
 
-SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz"
-SRC_URI[md5sum] = "6a73b1e34715916fa31132dbe11008b0"
-SRC_URI[sha256sum] = "888e80f3bb77381620a5ead208e1a1be06f3ea66ddc8cfdfa62811cae5f03752"
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
+SRC_URI[md5sum] = "539a0252bcb42c383ceeaeb12ae9a60d"
+SRC_URI[sha256sum] = "029db4014600e4b771b11a84276d2d76eb40fb26eabc85864852ef1f962be95f"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-S = "${WORKDIR}/acpica-unix2-${PV}"
+S = "${WORKDIR}/acpica-unix-${PV}"
 
 inherit update-alternatives
 
-- 
2.20.1


