Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 8114774813
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 16:28:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 09:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="384754486"
Received: from unknown (HELO blackadder.local) ([10.249.39.47])
	by fmsmga005.fm.intel.com with ESMTP; 11 Sep 2019 09:28:07 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
	<ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
	<CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
	<268869ab-aa03-cf7c-c75d-9aa8dd7fd5ab@intel.com>
	<CANNYZj_DyE_oxXjk+NeK4je72gYF0pG-_MbxVMv8ck37Qcp2bw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <3c52de40-410b-2df3-799e-ab9fb4aaeba6@intel.com>
Date: Wed, 11 Sep 2019 17:28:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_DyE_oxXjk+NeK4je72gYF0pG-_MbxVMv8ck37Qcp2bw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Wed, 11 Sep 2019 16:28:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 11/09/2019 16:27, Alexander Kanavin wrote:
> I have to say, the latter patch is rather ugly. It would be better to 
> split python3native class into two: python3native (just for running 
> scripts, does not depend on target python3), and python3target (for 
> actually obtaining information about the target configuration, does need 
> target python3). Until then, I'd just pull in target python, for 
> simplicity's sake (also there's one or two recipes where the same meson 
> problem happens).

Oh yes, the patch isn't pretty.

I was wondering how many recipes actually need the ability to run 
nativepython getting information about target python.  Splitting the 
class, or having a toggle, was an idea I had too.

Ross

