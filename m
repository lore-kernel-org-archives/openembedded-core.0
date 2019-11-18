Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1327C7F88C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 09:53:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 01:53:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,319,1569308400"; d="scan'208";a="199911070"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by orsmga008.jf.intel.com with ESMTP; 18 Nov 2019 01:53:52 -0800
To: Joseph Reynolds <jrey@linux.ibm.com>,
	openembedded-core@lists.openembedded.org
References: <adf92df5-06d4-ea38-ad9f-55dde92148b2@linux.ibm.com>
	<bb5c3045-8131-095a-f7bc-0ff91f36af5a@linux.ibm.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <afda9a22-8075-93c2-64db-91061bee6a11@intel.com>
Date: Mon, 18 Nov 2019 09:53:51 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <bb5c3045-8131-095a-f7bc-0ff91f36af5a@linux.ibm.com>
Subject: Re: How to add build date?
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
X-List-Received-Date: Mon, 18 Nov 2019 09:53:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 16/11/2019 21:56, Joseph Reynolds wrote:
> 
> Is there a best practice for folks who want to put the build date into 
> their generated os-release file?  I've seen this question come up at 
> least 3 times in my brief involvement with OE.  I could perhaps add 
> comment to the OpenBMC os-release.bbappend file to provide the proper 
> guidance.  I would like to hear your ideas.

There's an image-buildinfo class that can inject build-specific 
information of your chosing into the image.

Ross


