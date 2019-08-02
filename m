Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 925937F2F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 10:21:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Aug 2019 03:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,337,1559545200"; d="scan'208";a="173185973"
Received: from mekarim-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.49.129])
	by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2019 03:21:25 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1564741458.git.liezhi.yang@windriver.com>
	<6e12b495c74cfe8497e067fe1b4c4b823c6d4abe.1564741458.git.liezhi.yang@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <67a9995b-8401-7308-bb0b-b6b81da03abb@intel.com>
Date: Fri, 2 Aug 2019 11:21:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6e12b495c74cfe8497e067fe1b4c4b823c6d4abe.1564741458.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] kill-bb: Add it for killing abnormal bitbake processes
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
X-List-Received-Date: Fri, 02 Aug 2019 10:21:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 02/08/2019 11:24, Robert Yang wrote:
> There might be processes left after Ctr-C, e.g.:
> $ rm -f tmp/cache/default-glibc/qemux86/x86_64/
> $ bitbake -p
> 
> Press 'Ctrl-C' multiple times during parsing, then bitbake processes may not
> exit, and the worse is that we can't start bitbake again, we can't always
> reproduce this, but sometime. We can only use "ps ux" to find the processes and
> kill them one by one. This tool can kill all of them easily.
I've noticed this, and also noticed that it got a lot worse recently.

But let's fix bitbake instead of adding tools to work around it?

Ross

