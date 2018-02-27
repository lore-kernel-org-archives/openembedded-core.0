Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6827E65C8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 09:42:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 01:42:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,400,1515484800"; d="scan'208";a="23512982"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.16.40])
	([10.221.16.40])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2018 01:42:55 -0800
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <1519721818-32415-1-git-send-email-anuj.mittal@intel.com>
	<CAP9ODKqodPyQQcTptx1oPPTZXSLg+w7tFNsOPTr15wsQZmHyDw@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <d74384df-0069-b3da-8713-c7905d962afa@intel.com>
Date: Tue, 27 Feb 2018 17:42:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqodPyQQcTptx1oPPTZXSLg+w7tFNsOPTr15wsQZmHyDw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer: enable ptest support
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
X-List-Received-Date: Tue, 27 Feb 2018 09:42:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/27/2018 05:38 PM, Otavio Salvador wrote:
> On Tue, Feb 27, 2018 at 5:56 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:
> ...
>> +++ b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
>> @@ -0,0 +1,61 @@
>> +From 442691c7778601e3e4b88d0fbfb9d512ed34f414 Mon Sep 17 00:00:00 2001
>> +From: Anuj Mittal <anuj.mittal@intel.com>
>> +Date: Tue, 27 Feb 2018 09:27:01 +0800
>> +Subject: [PATCH] add targets for test installation
>> +
>> +Targets to make sure tests can be installed and then run on
>> +the target.
>> +
>> +Upstream-Status: Pending [specific to oe setup]
> 
> You choose the wrong status. It should be Inappropriate.
> 

Yes, you're right. Thank you! I will wait for other comments and send v2
later.

Thanks,
Anuj

