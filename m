Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 233C370648
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:56:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2014 08:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="573502468"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2014 08:56:36 -0700
Message-ID: <53C54F34.7030802@linux.intel.com>
Date: Tue, 15 Jul 2014 08:56:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <alpine.LFD.2.11.1407150923000.13777@localhost>
	<53C5477D.3030501@linux.intel.com>
	<CAJTo0La_uMvwmqZSX-8uaRk3ZcZDY=54+3A1X+oNNtf9-fydaQ@mail.gmail.com>
In-Reply-To: <CAJTo0La_uMvwmqZSX-8uaRk3ZcZDY=54+3A1X+oNNtf9-fydaQ@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: curious about why bitbake.conf setting of FILES_${PN}-bin
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
X-List-Received-Date: Tue, 15 Jul 2014 15:56:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2014 08:51 AM, Burton, Ross wrote:
> On 15 July 2014 16:23, Saul Wold <sgw@linux.intel.com> wrote:
>> Blame me for that patch!  Looking back at the commit message from about 2
>> years ago I think this got mid-way through a change, with the plan to
>> actually remove lib_package completely since all it contained was the
>> setting of PACKAGE_BEFORE_PN, therefore having FILES${PN}-bin. Not sure why
>> we did not end up completing that.
>>
>> So another option is to remove the inherits and replace it with
>> PACKAGE_BEFORE_PNs, Which would finish off the orignal plan!
>
> Wouldn't that change the packaging by putting all binaries into a
> PN-bin package?
>
No the change would be to rmove the inherit lib_packaging from the 
recipes that use it and replace that with setting PACKAGE_BEFORE_PN with 
${PN}-bin.  So it's just doing what the recipes do already, not a 
general change in bitbake.conf.

Sau!


> Ross
>
>

