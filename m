Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BD12D7F2C7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 22:21:24 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 15:21:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,471,1559545200"; d="scan'208";a="358598384"
Received: from oakcakay-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.252.38.52])
	by orsmga005.jf.intel.com with ESMTP; 05 Sep 2019 15:21:24 -0700
To: openembedded-core@lists.openembedded.org
References: <1566782044-23998-1-git-send-email-liu.ming50@gmail.com>
	<21a085a1-2aef-8990-7cc1-51ad003d2f07@intel.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <20aad17c-e5f8-7570-53de-a7919f7673d7@intel.com>
Date: Thu, 5 Sep 2019 23:21:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <21a085a1-2aef-8990-7cc1-51ad003d2f07@intel.com>
Subject: Re: [PATCH] weston: uprev to 7.0.0
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
X-List-Received-Date: Thu, 05 Sep 2019 22:21:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 05/09/2019 23:14, Ross Burton wrote:
> On 26/08/2019 02:14, liu.ming50@gmail.com wrote:
>> From: Ming Liu <liu.ming50@gmail.com>
>>
>> - Adjust patches to comply with weston-7.0.0.
>> - Also drop the obsolete patch 0001-make-error-portable.patch.
>>
>> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> 
> Fails with musl:
> 
> ../weston-7.0.0/libweston/weston-launch.c:790:4: warning: implicit 
> declaration of function 'error'; did you mean 'perror'? 
> [-Wimplicit-function-declaration]
>    790 |    error(1, 0, "-u is unsupported in this weston-launch build");
>        |    ^~~~~
>        |    perror

This is from 
0001-weston-launch-Provide-a-default-version-that-doesn-t.patch.

Ross

