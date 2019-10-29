Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 89E297F9C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 20:00:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2019 13:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,245,1569308400"; d="scan'208";a="230192679"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2019 13:00:42 -0700
To: openembedded-core@lists.openembedded.org
References: <20191015061510.21803-1-dan.callaghan@opengear.com>
	<20191015224456.22136-1-dan.callaghan@opengear.com>
	<3accc96ca5ddaf4240f535f655ca8d89a314dc1d.camel@linuxfoundation.org>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <d1bd117c-98c9-ef23-f1f0-ee2b5aa71e05@intel.com>
Date: Tue, 29 Oct 2019 20:00:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3accc96ca5ddaf4240f535f655ca8d89a314dc1d.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 29 Oct 2019 20:00:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 22/10/2019 13:53, Richard Purdie wrote:
> Breaks nativesdk-elftutils:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/1157
> 
> Probably need to do:
> 
> DEPENDS_BZIP2 = "bzip2"
> DEPENDS_BZIP2_class-native = "bzip2-replacement-native"
> 
> 
> but I still think the default should be bzip2 off for -native unless
> someone can tell me why we need it. That would mean adding something
> like:
> 
> PACKAGECONFIG_class-native ??= ""

Proposal: lets just disable bzip2 support in elfutils by default.

Ross

