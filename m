Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1D07D00A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 11:05:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2019 04:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="197193690"
Received: from unknown (HELO blackadder.local) ([10.249.39.47])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2019 04:05:46 -0700
To: openembedded-core@lists.openembedded.org
References: <20190911172256.11378-1-alistair.francis@wdc.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <19564aa8-9c3d-ca10-82e0-843b397db2cd@intel.com>
Date: Thu, 12 Sep 2019 12:05:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911172256.11378-1-alistair.francis@wdc.com>
Subject: Re: [PATCH] gdb: Mark gdbserver as ALLOW_EMPTY for riscv32
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
X-List-Received-Date: Thu, 12 Sep 2019 11:05:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 11/09/2019 18:22, Alistair Francis wrote:
> riscv64 already has gdbserver set as ALLOW_EMPTY, so let's set it for
> riscv32 as well.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   meta/recipes-devtools/gdb/gdb.inc | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
> index 0f10b41734..249e24dc52 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -10,4 +10,5 @@ PACKAGES =+ "gdbserver"
>   FILES_gdbserver = "${bindir}/gdbserver"
>   
>   ALLOW_EMPTY_gdbserver_riscv64 = "1"
> +ALLOW_EMPTY_gdbserver_riscv32 = "1"

Is this because gdbserver doesn't build for RISCV?  The recipe doesn't 
appear to make that explict anywhere.

Ross

