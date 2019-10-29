Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 08AB37F9C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 20:51:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 13:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,245,1569308400"; d="scan'208";a="211881767"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2019 13:51:18 -0700
To: openembedded-core@lists.openembedded.org
References: <20191015061510.21803-1-dan.callaghan@opengear.com>
	<20191015224456.22136-1-dan.callaghan@opengear.com>
	<20191029201821.GA26658@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ea2156a7-8f39-ffdc-55ca-6488b115eb2b@intel.com>
Date: Tue, 29 Oct 2019 20:51:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029201821.GA26658@localhost>
Subject: Re: [PATCH v3] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 29 Oct 2019 20:51:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 29/10/2019 20:18, Adrian Bunk wrote:
> On Wed, Oct 16, 2019 at 08:44:56AM +1000, Dan Callaghan wrote:
>> Elfutils has optional support for bzip2 and xz (lzma). It uses
>> this for decompressing embedded ELF sections like the .gnu_debugdata
>> section for "mini debuginfo":
>>
>> https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
>> ...
>> +PACKAGECONFIG ??= "bzip2"
>> +PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
>> +PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
>> ...
> 
> Is any tooling actually doing this compression by default?
> 
> It is a bit surprising that this has the mostly-obsolete bzip2 enabled
> by default but not the more common (and better compressing) xz.

Exactly.

Ross

