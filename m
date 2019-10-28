Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 285337FA8C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 21:42:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 14:42:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="205288764"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Oct 2019 14:42:51 -0700
To: openembedded-core@lists.openembedded.org
References: <20191019155242.100169-1-trevor.gamblin@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <5edff47c-d214-888e-c243-f0921273c66b@intel.com>
Date: Mon, 28 Oct 2019 21:42:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191019155242.100169-1-trevor.gamblin@windriver.com>
Subject: Re: [PATCH] libgcrypt: upgrade 1.8.4 -> 1.8.5
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
X-List-Received-Date: Mon, 28 Oct 2019 21:42:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/10/2019 16:52, Trevor Gamblin wrote:
> Note that the patch 0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
> was removed as its intent was to provide a pkg-config option, but
> libgcrypt upstream added one in commit 813b002eaf.

/me faints

We've been asking upstream periodically to add this for literal years. 
I wonder what changed their mind.

Ross


