Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9863B7C79F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 16:19:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Dec 2019 08:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="208176883"
Received: from aguttman-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.249.33.85])
	by fmsmga007.fm.intel.com with ESMTP; 02 Dec 2019 08:19:50 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-13-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <be94e0da-16b3-d525-98db-81078737be37@intel.com>
Date: Mon, 2 Dec 2019 16:19:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129131152.128311-13-alex.kanavin@gmail.com>
Subject: Re: [PATCH 13/15] libffi: update to 3.3 final
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
X-List-Received-Date: Mon, 02 Dec 2019 16:19:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Fails for ppc:

In file included from ../libffi-3.3/src/powerpc/ffi_sysv.c:35:
../libffi-3.3/src/powerpc/ffi_powerpc.h:65:9: error: '__int128' is not 
supported on this target
    65 | typedef __int128 float128;
       |         ^~~~~~~~


Ross

