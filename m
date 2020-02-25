Return-Path: <scott.branden@broadcom.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4816062A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 00:11:21 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 4so6207324pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xZDvGZ7g7lJf25iioZ78jp+JPlB+PAyUOUDq+LoU7Q8=;
	b=DKlxrHrw1GnSvBk4zJPznWUa9BuIJ/r5jPDlYCmiV2BrnGWoqN+poTtfXlxcPzCNGB
	9SGNxYdRCYqHyHdG7HgFk3W/p27grzX+cTGw5D+skXMcwaNvwZgK51O9/SdAE2Bb+eCW
	PyMW83mv6oBNHa462fo84EIDAszejM2K+W0Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xZDvGZ7g7lJf25iioZ78jp+JPlB+PAyUOUDq+LoU7Q8=;
	b=oFeItf0qhb03yGJAi92/0Dqa9jdJEV1f7PcrqmTWADOgY8doUhICMnT8dCx9PxoWhJ
	4TMZ0gXiyyYhRMXnsNiJT6pfmJgHxonZ0W6uuj1lnes11Bgbd2xKH3O2qfMXc9tIV2au
	XVOkuHrlgJP/rgnuI9aFteka8PDjAqMXh+PlgpDjp6j7YVf0QFj+W9xHEwqV/Jsyj8oB
	OauDM/ylldgkY4AUTiuWweA64taYLH50QRcENnNFoLlJ7Q/u+48PYGWN0eYri++i/ZQO
	o2WViAjCgY/EqdrhOASmwRsrsiiI6Mj6409FM6cZJ9nDetlwj4rlvkS8KAqj7whkdVK6
	DbCA==
X-Gm-Message-State: APjAAAVleG1wlTmJ2OJDFbspyv02LqldXIdU8OczvH6LMQe60VVgI1uz
	2lkhmTQaZ8aSda55f0A6Fm+5KJSlIIAhqdOPLCVOzRS7DiirSdnU4wMmVWaA0+G91FfLKwkI8sF
	mrJGyy+Bozt+I3egRQ/UxzZFiiJ4i0fAgUkruc284aQGriR048ft5k6nmuU9dXw7OlR4bHaz6gn
	Ytq+89S2V7Q77/copMx7GPQtgRyaI=
X-Google-Smtp-Source: APXvYqwCsloc/G9VP/VTQjiPhRkMH5O8oLuPL6rnqBJNb+deDErsjO37zgP+bhMt94FhTFxznwe4Mw==
X-Received: by 2002:a65:6405:: with SMTP id a5mr55971404pgv.284.1582589481818; 
	Mon, 24 Feb 2020 16:11:21 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	t65sm14016432pfd.178.2020.02.24.16.11.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 16:11:21 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 16:11:14 -0800
Message-Id: <20200225001115.18188-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Mircea Carausu <mircea.carausu@broadcom.com>
Subject: [PATCH 1/2] common-license: add fdk-aac license file
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
X-List-Received-Date: Tue, 25 Feb 2020 00:11:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mircea Carausu <mircea.carausu@broadcom.com>

Add Fraunhofer FDK AAC Codec Library license.

Signed-offby: Mircea Carausu <mircea.carausu@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 ...aunhofer_FDK_AAC_Codec_Library_for_Android | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 meta/files/common-licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android

diff --git a/meta/files/common-licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android b/meta/files/common-licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android
new file mode 100644
index 0000000000..05b32bdeaf
--- /dev/null
+++ b/meta/files/common-licenses/Fraunhofer_FDK_AAC_Codec_Library_for_Android
@@ -0,0 +1,92 @@
+Software License for The Fraunhofer FDK AAC Codec Library for Android
+
+© Copyright  1995 - 2018 Fraunhofer-Gesellschaft zur Förderung der angewandten
+Forschung e.V. All rights reserved.
+
+ 1.    INTRODUCTION
+The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec") is software
+that implements the MPEG Advanced Audio Coding ("AAC") encoding and decoding
+scheme for digital audio. This FDK AAC Codec software is intended to be used on
+a wide variety of Android devices.
+
+AAC's HE-AAC and HE-AAC v2 versions are regarded as today's most efficient
+general perceptual audio codecs. AAC-ELD is considered the best-performing
+full-bandwidth communications codec by independent studies and is widely
+deployed. AAC has been standardized by ISO and IEC as part of the MPEG
+specifications.
+
+Patent licenses for necessary patent claims for the FDK AAC Codec (including
+those of Fraunhofer) may be obtained through Via Licensing
+(www.vialicensing.com) or through the respective patent owners individually for
+the purpose of encoding or decoding bit streams in products that are compliant
+with the ISO/IEC MPEG audio standards. Please note that most manufacturers of
+Android devices already license these patent claims through Via Licensing or
+directly from the patent owners, and therefore FDK AAC Codec software may
+already be covered under those patent licenses when it is used for those
+licensed purposes only.
+
+Commercially-licensed AAC software libraries, including floating-point versions
+with enhanced sound quality, are also available from Fraunhofer. Users are
+encouraged to check the Fraunhofer website for additional applications
+information and documentation.
+
+2.    COPYRIGHT LICENSE
+
+Redistribution and use in source and binary forms, with or without modification,
+are permitted without payment of copyright license fees provided that you
+satisfy the following conditions:
+
+You must retain the complete text of this software license in redistributions of
+the FDK AAC Codec or your modifications thereto in source code form.
+
+You must retain the complete text of this software license in the documentation
+and/or other materials provided with redistributions of the FDK AAC Codec or
+your modifications thereto in binary form. You must make available free of
+charge copies of the complete source code of the FDK AAC Codec and your
+modifications thereto to recipients of copies in binary form.
+
+The name of Fraunhofer may not be used to endorse or promote products derived
+from this library without prior written permission.
+
+You may not charge copyright license fees for anyone to use, copy or distribute
+the FDK AAC Codec software or your modifications thereto.
+
+Your modified versions of the FDK AAC Codec must carry prominent notices stating
+that you changed the software and the date of any change. For modified versions
+of the FDK AAC Codec, the term "Fraunhofer FDK AAC Codec Library for Android"
+must be replaced by the term "Third-Party Modified Version of the Fraunhofer FDK
+AAC Codec Library for Android."
+
+3.    NO PATENT LICENSE
+
+NO EXPRESS OR IMPLIED LICENSES TO ANY PATENT CLAIMS, including without
+limitation the patents of Fraunhofer, ARE GRANTED BY THIS SOFTWARE LICENSE.
+Fraunhofer provides no warranty of patent non-infringement with respect to this
+software.
+
+You may use this FDK AAC Codec software or modifications thereto only for
+purposes that are authorized by appropriate patent licenses.
+
+4.    DISCLAIMER
+
+This FDK AAC Codec software is provided by Fraunhofer on behalf of the copyright
+holders and contributors "AS IS" and WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES,
+including but not limited to the implied warranties of merchantability and
+fitness for a particular purpose. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
+CONTRIBUTORS BE LIABLE for any direct, indirect, incidental, special, exemplary,
+or consequential damages, including but not limited to procurement of substitute
+goods or services; loss of use, data, or profits, or business interruption,
+however caused and on any theory of liability, whether in contract, strict
+liability, or tort (including negligence), arising in any way out of the use of
+this software, even if advised of the possibility of such damage.
+
+5.    CONTACT INFORMATION
+
+Fraunhofer Institute for Integrated Circuits IIS
+Attention: Audio and Multimedia Departments - FDK AAC LL
+Am Wolfsmantel 33
+91058 Erlangen, Germany
+
+www.iis.fraunhofer.de/amm
+amm-info@iis.fraunhofer.de
+
-- 
2.17.1


