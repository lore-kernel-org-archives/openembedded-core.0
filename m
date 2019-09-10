Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4883C6010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 09:50:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Sep 2019 02:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="184111133"
Received: from fwan32-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.38.244])
	by fmsmga008.fm.intel.com with ESMTP; 10 Sep 2019 02:50:50 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
Date: Tue, 10 Sep 2019 10:50:49 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
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
X-List-Received-Date: Tue, 10 Sep 2019 09:50:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/09/2019 19:41, Alexander Kanavin wrote:
> and find_installation() method of meson does not merely look for the 
> native python binary, it runs the binary with a meson-supplied python 
> script designed to obtain all sorts of information, including 
> target-specific things that we patch native python to report. If the 
> target python installation is not present in sysroot, the script will 
> fail, and meson will declare that 'there is no valid installation of 
> python on your system'.

So the python3-native pokes around the target python3 to get the right 
values?

Ross

