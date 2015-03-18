Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 185C560034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 09:37:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2015 02:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,421,1422950400"; d="scan'208";a="468840153"
Received: from mferguso-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.10.180])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2015 02:30:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Wed, 18 Mar 2015 09:37:53 +0000
Message-ID: <2207285.bfXnGOtJqf@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <53581d89959ef4370e3f38ff49927d6de391b350.1426670089.git.Qi.Chen@windriver.com>
References: <cover.1426670089.git.Qi.Chen@windriver.com>
	<53581d89959ef4370e3f38ff49927d6de391b350.1426670089.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] packagegroup: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 18 Mar 2015 09:38:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Qi,

On Wednesday 18 March 2015 17:16:12 Chen Qi wrote:
> We treat a license without checksum specified as invalid. In specific,
> find_license_files in license.bbclass needs LIC_FILES_CHKSUM there.
> 
> This patch adds LIC_FILES_CHKSUM information to packagegroup recipes to
> avoid warnings like below at rootfs time.
> 
>     WARNING: The license listed MIT was not in the licenses collected for
> packagegroup-core-boot

FWIW, I *really* don't want to see us do this. Packages produced by 
packagegroup recipes don't ship any files, they shouldn't have to declare a 
LIC_FILES_CHKSUM. Same goes for any similar recipe. (Perhaps license.bbclass 
ought to be checking whether the package contains anything before 
complaining.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

