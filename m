Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 62C277FC46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2019 10:31:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Nov 2019 02:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,281,1569308400"; d="scan'208";a="193126044"
Received: from felsner-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.57.88])
	by orsmga007.jf.intel.com with ESMTP; 08 Nov 2019 02:31:56 -0800
To: Alistair Francis <alistair.francis@wdc.com>,
	openembedded-core@lists.openembedded.org
References: <20191104224805.3149-1-alistair.francis@wdc.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
Date: Fri, 8 Nov 2019 10:31:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191104224805.3149-1-alistair.francis@wdc.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH v6] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Fri, 08 Nov 2019 10:31:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 04/11/2019 22:48, Alistair Francis wrote:
> From: Alistair Francis <alistair@alistair23.me>
> 
> Upgrade mesa and mesa-gl to 19.2.1.
> 
> The license hash change was a trivial new line removal.
> 
> The glx-tls option was removed as it isn't included in the meson.build
> file. It has been replaced with 'use-elf-tls' instead.

I think this has regressed something, this is a new warning on musl builds:

do_package_qa: QA Issue: ELF binary 
'[...]libgles2-mesa/usr/lib/libGLESv2.so.2.0.0' has relocations in .text 
[textrel]

(ditto for libGLESv1_CM.so.1.1.0 libGL.so.1.2.0 libglapi.so.0.0.0)

Ross

