Return-Path: <ross.burton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A69C57F638
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 20:52:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2019 12:52:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,258,1571727600"; d="scan'208";a="261607280"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Nov 2019 12:52:20 -0800
To: openembedded-core@lists.openembedded.org
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <1b6971c1-ce0d-5cda-862b-d0a84b5be20a@intel.com>
Date: Fri, 29 Nov 2019 20:52:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129131152.128311-1-alex.kanavin@gmail.com>
Subject: Re: [PATCH 01/15] rpm: upgrade to 4.15.1
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
X-List-Received-Date: Fri, 29 Nov 2019 20:52:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

This is reliably crashing for me when running rpmdeps:

Exception: bb.process.ExecutionError: Execution of 
'/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/temp/run.BUILDSPEC.1481' 
failed with exit code 139:
Building target platforms: corei7_64-poky-linux
Building for target corei7_64-poky-linux
Processing files: systemd-compat-units-1.0-r29.corei7_64
Processing files: systemd-compat-units-dbg-1.0-r29.corei7_64
Processing files: systemd-compat-units-dev-1.0-r29.corei7_64
Checking for unpackaged file(s): 
/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/recipe-sysroot-native/usr/bin/../../usr/lib/rpm/check-files 
/data/poky-tmp/master/work/corei7-64-poky-linux/systemd-compat-units/1.0-r29/package
Segmentation fault (core dumped)
WARNING: exit code 139 from a shell command.

Ross

