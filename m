Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AD59C7FC81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:10:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 09:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="221492258"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by fmsmga008.fm.intel.com with ESMTP; 20 Jan 2020 09:10:34 -0800
To: Khem Raj <raj.khem@gmail.com>, =?UTF-8?Q?Martin_Hundeb=c3=b8ll?=
	<martin@geanix.com>
References: <20191018112819.16210-1-ross.burton@intel.com>
	<CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	<1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
	<9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
	<CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f6cb669c-d302-c1fa-e2ed-5995b82677ed@intel.com>
Date: Mon, 20 Jan 2020 17:10:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] file: explicitly disable seccomp
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
X-List-Received-Date: Mon, 20 Jan 2020 17:10:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/01/2020 15:45, Khem Raj wrote:
> pseudo needs some love since it alters syscalls which go out of bounds
> what is allowed by libseccomp until then pin your file version to 5.37
> in arch till a supported distro is affected by same problem. It wont
> be long better option is to fix pseudo

That's not quite right.  pseudo LD_PRELOADs itself into file, and makes 
syscalls which are not whitelisted in file's seccomp configuration.

There's nothing pseudo can do to solve this.

Ross

