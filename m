Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AADE87FC49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 15:56:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 07:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="306953483"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2020 07:56:28 -0800
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
	<1579523214-47426-5-git-send-email-wangmy@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f42b1312-8827-d3dd-f5a3-df447a561c9f@intel.com>
Date: Mon, 20 Jan 2020 15:56:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579523214-47426-5-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [PATCH] iproute2: upgrade 5.3.0 -> 5.4.0
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
X-List-Received-Date: Mon, 20 Jan 2020 15:56:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Something changed so now the documentation isn't built at all:

packages/core2-64-poky-linux/iproute2/iproute2-doc: PKGSIZE changed from 
55247 to 0 (-100%)

packages/core2-64-poky-linux/iproute2/iproute2-doc: FILELIST: removed 
all items "/usr/share/doc/iproute2/examples/diffserv/Edge2 
/usr/share/doc/iproute2/examples/diffserv/regression-testing 
/usr/share/doc/iproute2/examples/README.cbq 
/usr/share/doc/iproute2/examples/diffserv/Edge1 
/usr/share/doc/iproute2/examples/cbqinit.eth1 
/usr/share/doc/iproute2/examples/diffserv/afcbq 
/usr/share/doc/iproute2/examples/diffserv/Edge32-ca-u32 
/usr/share/doc/iproute2/examples/diffserv/Edge31-ca-u32 
/usr/share/doc/iproute2/examples/diffserv/Edge32-cb-chains 
/usr/share/doc/iproute2/examples/gaiconf 
/usr/share/doc/iproute2/examples/SYN-DoS.rate.limit 
/usr/share/doc/iproute2/examples/diffserv/efcbq 
/usr/share/doc/iproute2/examples/diffserv/README 
/usr/share/doc/iproute2/examples/README.iproute2+tc 
/usr/share/doc/iproute2/examples/diffserv/Edge32-cb-u32 
/usr/share/doc/iproute2/examples/diffserv/Edge31-cb-chains 
/usr/share/doc/iproute2/examples/diffserv/ef-prio"

Is this intentional?

Ross

