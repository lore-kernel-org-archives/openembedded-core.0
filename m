Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 89E0C7D28D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 10:11:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2019 03:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="207683384"
Received: from pruecklm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.36.159])
	by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2019 03:11:17 -0700
To: openembedded-core@lists.openembedded.org
References: <20190820205917.21297-1-alistair.francis@wdc.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5b4e3af1-4f54-2b8d-a378-48cca0d98816@intel.com>
Date: Wed, 21 Aug 2019 11:11:16 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820205917.21297-1-alistair.francis@wdc.com>
Subject: Re: [PATCH v2 1/3] qemu: Upgrade to version 4.1
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
X-List-Received-Date: Wed, 21 Aug 2019 10:11:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

I think this series is responsible for testimage failing on qemumips:

WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login into 
serial console as root using blank password
WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
root
7
<<< run_serial(): command timed out after 60 seconds without output >>>

Ross

