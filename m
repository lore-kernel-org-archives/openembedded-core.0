Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9A471C84
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 05:58:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v215wV1a012240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Feb 2017 21:58:31 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Feb 2017 21:58:31 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8bbaa675-7c8b-d00d-3b22-f051abf763a2@windriver.com>
Date: Wed, 1 Mar 2017 13:58:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: About scripts/oe-find-native-sysroot
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
X-List-Received-Date: Wed, 01 Mar 2017 05:58:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi RP,

The common STAGING_DIR_NATIVE is gone, so the OECORE_NATIVE_SYSROOT
defined in scripts/oe-find-native-sysroot doesn't make any sense
currently:

OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`

But the following ones depend on it:

meta/classes/populate_sdk_ext.bbclass
meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
scripts/oe-run-native
scripts/runqemu-export-rootfs
scripts/runqemu-extract-sdk

What shall we do on oe-find-native-sysroot? Remove it and
make other ones work without it? Or let it depend on build-sysroots,
please ?

-- 
Thanks

Robert

