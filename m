Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A3B7D6C3AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 16:38:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 09:38:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="193312986"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by orsmga008.jf.intel.com with ESMTP; 28 Oct 2019 09:38:14 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20191019130633.9488-1-schnitzeltony@gmail.com>
	<CALbNGRSQzPw7OepACxSgBfdC2ZKC+kTFwkuqVzSJyw4q8gr0Pw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <2384a02f-84c6-5394-cb1d-648036c72dc8@intel.com>
Date: Mon, 28 Oct 2019 16:38:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSQzPw7OepACxSgBfdC2ZKC+kTFwkuqVzSJyw4q8gr0Pw@mail.gmail.com>
Subject: Re: [PATCH] libical: add PACKAGECONFIG glib and enable it by default
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
X-List-Received-Date: Mon, 28 Oct 2019 16:38:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 25/10/2019 08:38, Andreas Müller wrote:
> On Sat, Oct 19, 2019 at 3:06 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
>>
>> * As long as there is no solution upstream [1] build src-generator native and
>>    adjust cmake file to find it
>> * libical-glib is a mandatory dependency for evolution-data-server >= 3.34
>>
>> [1] https://github.com/libical/libical/issues/394
>>
>> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> Haven't tested but it might not apply no more after patch adding
> DESCRIPTION & HOMEPAGE in gnome recipes. Before I go and rebase I want
> to ask (seems motivation to apply this is limited): Does this has a
> chance of being accepted. If not:
> 
> * Why - it is meant as temporary solution
> * What way would be accepted to get libical-glib building?

Looks good to me and merges fine here.  Upstream is told they're broken, 
so unless we find someone who understands cmake enough to fix the build 
properly we can hang on to this minor hack.

Ross

