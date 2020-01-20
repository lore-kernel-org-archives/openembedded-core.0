Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 8504D7E31D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 12:38:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 04:38:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="258696108"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 04:38:07 -0800
To: Vladimir Molokov <vladimir.molokov@gmail.com>
References: <CAE2LOAym2eC+yJ9pFmGUGDaC9LjjO=RKr_TA_ON+m6GvRtW3YA@mail.gmail.com>
	<f17d90f6-e302-2ef5-b768-04e36d64b9cc@intel.com>
	<CAE2LOAyYuAMsE0OZUbjDex5eRHTCKrnw1ww7mOpt1_=YeO-08A@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <b7fdb180-3b13-facc-e440-8df89e28e471@intel.com>
Date: Mon, 20 Jan 2020 12:38:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAE2LOAyYuAMsE0OZUbjDex5eRHTCKrnw1ww7mOpt1_=YeO-08A@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: attr dependency on linux-yocto
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
X-List-Received-Date: Mon, 20 Jan 2020 12:38:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 17/01/2020 16:07, Vladimir Molokov wrote:
> whoa, thanks for the information
> though I think it is not great,
> when applications, like vim, get linux dependecies.
> 
> did anyone try to fix this?
> could it be considered as a bug?
> i can try to file the bug and fix it

It won't affect installation, it's just that bitbake wants to ensure all 
possible dependencies are built.

Ross



