Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2B2B57FD3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 21:33:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jan 2020 13:33:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="400136598"
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
	by orsmga005.jf.intel.com with ESMTP; 22 Jan 2020 13:33:17 -0800
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
	IRSMSX107.ger.corp.intel.com (163.33.3.99) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Wed, 22 Jan 2020 21:33:16 +0000
Received: from vjuntune-mobl.ger.corp.intel.com (163.33.253.164) by
	irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Wed, 22 Jan 2020 21:33:15 +0000
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	<openembedded-core@lists.openembedded.org>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <a1bf063f-99b5-648a-b0cb-095a84585c60@intel.com>
Date: Wed, 22 Jan 2020 21:33:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
X-Originating-IP: [163.33.253.164]
X-ClientProxiedBy: irsmsx603.ger.corp.intel.com (163.33.146.9) To
	irsmsx602.ger.corp.intel.com (163.33.146.8)
Subject: Re: [PATCH] ethtool: upgrade 5.3 -> 5.4
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
X-List-Received-Date: Wed, 22 Jan 2020 21:33:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

WARNING: ethtool-5.4-r0 do_patch: Fuzz detected:

Applying patch avoid_parallel_tests.patch
patching file configure.ac
Hunk #1 succeeded at 2 with fuzz 1.

The context lines in the patches can be updated with devtool:

     devtool modify ethtool
     devtool finish --force-patch-refresh ethtool <layer_path>

Don't forget to review changes done by devtool!

WARNING: ethtool-5.4-r0 do_patch: QA Issue: Patch log indicates that 
patches do not apply cleanly. [patch-fuzz]

