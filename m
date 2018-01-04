Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 399BA783AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 12:16:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 04:16:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="7996629"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 04 Jan 2018 04:16:07 -0800
To: "Bystricky, Juro" <juro.bystricky@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1514934973-80578-1-git-send-email-juro.bystricky@intel.com>
	<1514934973-80578-2-git-send-email-juro.bystricky@intel.com>
	<fc0ebed5-abd0-9926-3c57-6443d7f22241@linux.intel.com>
	<6E51916E4A1F32428260031F4C7CD2B6404A265A@ORSMSX112.amr.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dc3dfbcc-cfea-5c51-007a-b352a3ed0036@linux.intel.com>
Date: Thu, 4 Jan 2018 14:16:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6404A265A@ORSMSX112.amr.corp.intel.com>
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH 1/1] rpm_4.14.0: clamp timestamps by default
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
X-List-Received-Date: Thu, 04 Jan 2018 12:16:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/03/2018 06:59 PM, Bystricky, Juro wrote:

>> A technicality: do not patch mnacros.in, set the macro directly from
>> package_rpm.bbclass.
>>
> 
> Yes, I considered this (see the [patch 0/1]). I chose to patch macros.in in the
> recipe rpm_4.14.0 instead because the new macro is introduced in RPM 4.14.0.
> I assumed we did not want to have RPM version dependencies in package_rpm.bbclass.
> But I have no strong feelings regarding this, I am pretty sure the new macro is here
> to stay in the future and it is unlikely anyone would want to use a pre-4.14.0
> version of RPM either. If you think patching package_rpm.bbclass makes more sense,
> I can send in another patch.

Yes please. Setting configuration options at runtime is always 
preferable to patching the upstream source code, for maintainability 
reasons. We are already drowning in patches.

Alex

