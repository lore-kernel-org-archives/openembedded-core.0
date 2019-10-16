Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 54B0E7F3B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 10:10:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2019 03:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,303,1566889200"; d="scan'208";a="370759382"
Received: from dirkbeck-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.40.171])
	by orsmga005.jf.intel.com with ESMTP; 16 Oct 2019 03:10:45 -0700
To: openembedded-core@lists.openembedded.org
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
	<20191015061510.21803-1-dan.callaghan@opengear.com>
	<e41fa2a4-1744-993c-d38a-f98229726251@gmail.com>
	<1571123420-sup-6304@galangal.danc.bne.opengear.com>
	<84b5c0f5-e790-84e4-967c-6eace1f673ba@intel.com>
	<1571178617-sup-8448@galangal.danc.bne.opengear.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <37f8a95f-310d-ee4b-bf5e-b91041955076@intel.com>
Date: Wed, 16 Oct 2019 11:10:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571178617-sup-8448@galangal.danc.bne.opengear.com>
Subject: Re: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Wed, 16 Oct 2019 10:10:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/10/2019 23:46, Dan Callaghan wrote:
> It does seem like it would be simpler to just take bzip2-native out of
> ASSUME_PROVIDED, but I guess leaving it in there lets people avoid
> building bzip2-native under some circumstances.

I believe it's a bootstrap speed thing.  If we can assume bzip2 on the 
host exists we don't need to build it to get going, which is especially 
fun if you need to decompress bzip2 files to build bzip2...

Ross

