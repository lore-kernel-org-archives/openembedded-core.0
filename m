Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6866A7D258
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2019 15:45:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Oct 2019 08:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="276092009"
Received: from karthik-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.38.183])
	by orsmga001.jf.intel.com with ESMTP; 04 Oct 2019 08:45:49 -0700
To: openembedded-core@lists.openembedded.org
References: <20191003164043.17347-1-nicola.lunghi@jci.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <3a61b4fb-de17-0222-100d-3fd27ce611f8@intel.com>
Date: Fri, 4 Oct 2019 16:45:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003164043.17347-1-nicola.lunghi@jci.com>
Subject: Re: [meta][PATCH] ofono: run oe-stylize over recipe
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
X-List-Received-Date: Fri, 04 Oct 2019 15:45:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 03/10/2019 17:40, Nicola Lunghi wrote:
> From: Nicola Lunghi <nick83ola@gmail.com>
> 
> Variable ordering changed slightly and add the SRC_URI to the inc file

If you're tidying up the recipe we might as well merge the bb and inc 
file, as the inc is pointless.

Ross


