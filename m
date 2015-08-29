Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA4F759D5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 15:45:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 29 Aug 2015 08:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,429,1437462000"; d="scan'208";a="778139761"
Received: from ngniech-mobl.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.55.139])
	by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2015 08:45:04 -0700
Message-ID: <53E80792.8070008@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.LFD.2.11.1408081529290.23581@localhost>
	<53E54245.4070704@linux.intel.com>
	<alpine.LFD.2.11.1408090914290.7338@localhost>
In-Reply-To: <alpine.LFD.2.11.1408090914290.7338@localhost>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Remove "SRC_URI_OVERRIDES_PACKAGE_ARCH = 0" from tslib.bb
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
Date: Sat, 29 Aug 2015 15:45:05 -0000
X-Original-Date: Sun, 10 Aug 2014 17:00:18 -0700
X-List-Received-Date: Sat, 29 Aug 2015 15:45:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/09/2014 06:17 AM, Robert P. J. Day wrote:
> On Fri, 8 Aug 2014, Saul Wold wrote:
>
>> On 08/08/2014 12:31 PM, Robert P. J. Day wrote:
>>>
>>> Given that there are no machine-specific files for the tslib recipe
>>> anymore, might as well remove this line.
>>>
>>
>> Robert,
>>
>> Can you please review the commit guidelines
>>
>> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>>
>> The summary line should be in the form of
>> tslib: Remove ...
>
>    serious question -- how does one identify the "primary item" under
> consideration if it's scattered over several files. recently, i
> submitted a patch to remove a few references to "do_package_write",
> a deleted task. the existing references under meta/:
>
Great question actually and maybe this needs clarification in the Wiki.

Ideally if it's an atomic change around a "primary idea" than that's the 
focus. Sometimes with refactorings we do bulk and sometime it's 
individual, depends on if the small changes will cause bisect failures.

> conf/documentation.conf:do_package_write[doc] = "Creates the actual packages and places them in the Package Feed area"
> recipes-core/meta/meta-ide-support.bb:do_populate_ide_support[recrdeptask] = "do_package_write"
> recipes-core/meta/package-index.bb:do_package_write[noexec] = "1"
> recipes-devtools/installer/adt-installer_1.0.bb:do_package_write[noexec] = "1"
>
>    i'm assuming, in this case, the primary item would be
> "do_package_write"?
>
Yes, that would be the primary idea in this case.

Sau!

> rday
>

