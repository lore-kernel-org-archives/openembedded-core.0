Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E9AB07FE39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 12:51:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 04:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="209688926"
Received: from kdobros-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.194])
	by orsmga008.jf.intel.com with ESMTP; 17 Dec 2019 04:51:22 -0800
To: openembedded-core@lists.openembedded.org
References: <20191217125020.25932-1-ross.burton@intel.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f8fb3939-f098-348b-9c07-c2e0c204df31@intel.com>
Date: Tue, 17 Dec 2019 12:51:21 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217125020.25932-1-ross.burton@intel.com>
Subject: Re: [PATCH] chrpath: do less work
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
X-List-Received-Date: Tue, 17 Dec 2019 12:51:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 17/12/2019 12:50, Ross Burton wrote:
> Instead of trying to change the RPATH in every file under the binary
> directories, check that the file is an ELF first.
> 
> This means that we don't attempt to change the RPATH on the entire
> Python standard library, for example.
> 
> Also return early if the directory to iterate doesn't exist.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Retracting this, a chunk is missing.

Ross

