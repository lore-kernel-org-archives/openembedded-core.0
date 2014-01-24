Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id C61B760E7C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:22 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 20so4142562yks.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=lLhz2DTeCq97pwCYCc1rIWKazQYZumaEG6xvNqwyuH8=;
	b=DTZPkT7dkhuA0AgDe6R/o4ugJA3IA2kXG6haCjpT5CkaWDqTupeu4/TX23d18GjkYh
	CieQuF4ZPWpJOS7Lt+T6XPe+Ae6juWe08ge35XE/8h8ZokWOSzVAbL/Z0HaDl+TOhnQ3
	8MNlyCH/wyTwwZb9DUwX3yuIX2SyERf/5M02Irzi4u1F/nhYIAX89emFOz3bTWriQR/+
	ZDGAOmCbhBSYcAY6W/tMvOvsKkf4Hd5z/1HC+ARk6Ca5zLNppssvmnrwKZ8DaoEGwFsj
	oP6924s+/9JiUy3T/ltrGcaKX/RuaF4j91OYff160XXrraxCeVbHhnUpVdZ4Vc3bZUZQ
	Bauw==
X-Received: by 10.236.101.227 with SMTP id b63mr9960856yhg.37.1390526782988;
	Thu, 23 Jan 2014 17:26:22 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	c44sm42499379yho.20.2014.01.23.17.26.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id F344317BF8CEB; Thu, 23 Jan 2014 23:26:18 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:04 -0200
Message-Id: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-fsl-arm][PATCH v3 00/11] Freescale 3.10.17-1.0.0-beta - part 1
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
X-List-Received-Date: Fri, 24 Jan 2014 01:26:24 -0000

Hello folks,

I did some small fixes that I found during test at O.S. Systems'
autobuilder and I dropped some fixes that were pushed to master (as
you've probably noticed from the e-mail to the mailing list).

I am awaiting people's feedback for the patches as this upgrades
package versions and we should have a better test coverage.

Please give a try in the 'master-next' branch and comment in anything
that could be improved in the patches. All comments are welcome...

Lauren Post (7):
  imx-test: Update to 3.10.17-1.0.0 version
  imx-lib: Upgrade to 3.10.17-1.0.0_beta
  imx-vpu: Upgrade to 3.10.17-1.0.0_beta
  libfslparser: Upgrade to 3.0.10 version
  libfslvpuwrap: Upgrade to 1.0.45 version
  libfslcodec: Upgrade to 3.0.10 version
  gst-fsl-plugin: Upgrade to 3.0.10 version

Otavio Salvador (4):
  libfslcodec: Drop sanity check override for .so files
  libfslcodec: Enable/disable the VPU support based on SoC
  libfslcodec: Add 'test-bin' and 'test-sources' packages
  gst-fsl-plugin: Add runtime dependencies for 'beep' plugin

 recipes-bsp/imx-lib/imx-lib_3.10.17-1.0.0.bb       | 14 +++++++++
 recipes-bsp/imx-lib/imx-lib_3.10.9-1.0.0.bb        | 10 -------
 recipes-bsp/imx-test/imx-test_3.10.17-1.0.0.bb     | 15 ++++++++++
 recipes-bsp/imx-test/imx-test_3.10.9-1.0.0.bb      | 10 -------
 .../build-Allow-CC-and-AR-to-be-overriden.patch    | 33 ----------------------
 recipes-bsp/imx-vpu/imx-vpu_3.10.17-1.0.0.bb       | 14 +++++++++
 recipes-bsp/imx-vpu/imx-vpu_3.10.9-1.0.0.bb        | 11 --------
 recipes-multimedia/gstreamer/gst-fsl-plugin.inc    | 10 +++----
 .../gstreamer/gst-fsl-plugin_3.0.10.bb             | 14 +++++++++
 .../gstreamer/gst-fsl-plugin_3.0.9.bb              | 17 -----------
 recipes-multimedia/libfslcodec/libfslcodec.inc     | 23 +++++++++++----
 .../libfslcodec/libfslcodec_3.0.10.bb              | 10 +++++++
 .../libfslcodec/libfslcodec_3.0.9.bb               | 13 ---------
 .../libfslparser/libfslparser_3.0.10.bb            | 10 +++++++
 .../libfslparser/libfslparser_3.0.9.bb             | 13 ---------
 ...slvpuwrap_1.0.40.bb => libfslvpuwrap_1.0.45.bb} | 11 +++-----
 16 files changed, 102 insertions(+), 126 deletions(-)
 create mode 100644 recipes-bsp/imx-lib/imx-lib_3.10.17-1.0.0.bb
 delete mode 100644 recipes-bsp/imx-lib/imx-lib_3.10.9-1.0.0.bb
 create mode 100644 recipes-bsp/imx-test/imx-test_3.10.17-1.0.0.bb
 delete mode 100644 recipes-bsp/imx-test/imx-test_3.10.9-1.0.0.bb
 delete mode 100644 recipes-bsp/imx-vpu/imx-vpu-3.10.9-1.0.0/build-Allow-CC-and-AR-to-be-overriden.patch
 create mode 100644 recipes-bsp/imx-vpu/imx-vpu_3.10.17-1.0.0.bb
 delete mode 100644 recipes-bsp/imx-vpu/imx-vpu_3.10.9-1.0.0.bb
 create mode 100644 recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.10.bb
 delete mode 100644 recipes-multimedia/gstreamer/gst-fsl-plugin_3.0.9.bb
 create mode 100644 recipes-multimedia/libfslcodec/libfslcodec_3.0.10.bb
 delete mode 100644 recipes-multimedia/libfslcodec/libfslcodec_3.0.9.bb
 create mode 100644 recipes-multimedia/libfslparser/libfslparser_3.0.10.bb
 delete mode 100644 recipes-multimedia/libfslparser/libfslparser_3.0.9.bb
 rename recipes-multimedia/libfslvpuwrap/{libfslvpuwrap_1.0.40.bb => libfslvpuwrap_1.0.45.bb} (57%)

-- 
1.8.5.3


