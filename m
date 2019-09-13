Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id B46B87EC56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:15:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2019 12:15:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="336988611"
Received: from asomsiko-mobl1.ccr.corp.intel.com (HELO blackadder.local)
	([10.252.54.186])
	by orsmga004.jf.intel.com with ESMTP; 13 Sep 2019 12:15:08 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190912153644.19473-1-alex.kanavin@gmail.com>
	<20190912153644.19473-3-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <d4f3db04-7102-ee23-8bee-f8b3c3f42af1@intel.com>
Date: Fri, 13 Sep 2019 20:15:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912153644.19473-3-alex.kanavin@gmail.com>
Subject: Re: [PATCH 3/3] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Fri, 13 Sep 2019 19:15:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 12/09/2019 16:36, Alexander Kanavin wrote:
> -    def test_testimage_virgl_gtk(self):
> +    def test_testimage_virgl_gtk_sdl(self):

Failing on the autobuilder: 
https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/707/steps/8/logs/step2d

Ross

