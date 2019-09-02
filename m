Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id E52546BCA4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 18:45:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2019 11:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,460,1559545200"; d="scan'208";a="172995174"
Received: from oakcakay-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.252.38.52])
	by orsmga007.jf.intel.com with ESMTP; 02 Sep 2019 11:45:01 -0700
To: openembedded-core@lists.openembedded.org
References: <20190902100409.129032-1-alex.kiernan@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <54567476-aa1a-860d-c13c-dd09b044e296@intel.com>
Date: Mon, 2 Sep 2019 19:45:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902100409.129032-1-alex.kiernan@gmail.com>
Subject: Re: [PATCH] iputils: Set prefix correctly for usrmerge
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
X-List-Received-Date: Mon, 02 Sep 2019 18:45:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 02/09/2019 11:04, Alex Kiernan wrote:
> -EXTRA_OEMESON += "--prefix=/"
> +EXTRA_OEMESON += "--prefix=${prefix}"

Probably good to explicitly point out that this moves all of the 
binaries in the non-usrmerge case.  Did you test that the system still 
works with these moved when usrmerge isn't enabled?

Ross

