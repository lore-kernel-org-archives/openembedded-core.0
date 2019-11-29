Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 224D77DE3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 22:56:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2019 14:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,259,1571727600"; d="scan'208";a="221720351"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2019 14:56:06 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-7-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <7aa33e57-5cdc-f82a-36d1-82919e9bcd4c@intel.com>
Date: Fri, 29 Nov 2019 22:56:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129131152.128311-7-alex.kanavin@gmail.com>
Subject: Re: [PATCH 07/15] p11-kit: convert to meson
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
X-List-Received-Date: Fri, 29 Nov 2019 22:56:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Is this intentional?

packages/corei7-64-poky-linux/p11-kit/p11-kit: FILELIST: removed 
"/usr/libexec/p11-kit/trust-extract-compat 
/usr/share/p11-kit/modules/p11-kit-trust.module 
/usr/lib/pkcs11/p11-kit-trust.so /usr/bin/trust"
packages/corei7-64-poky-linux/p11-kit/p11-kit: RDEPENDS: removed all 
items "libtasn1 (['>= 4.14'])"

Ross

