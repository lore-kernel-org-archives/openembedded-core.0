Return-Path: <leandro.maciel.dorileo@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 19FEB605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 19:59:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 23 Apr 2015 12:58:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,633,1422950400"; d="scan'208";a="718293228"
Received: from unknown (HELO [10.218.100.119]) ([10.218.100.119])
	by orsmga002.jf.intel.com with ESMTP; 23 Apr 2015 12:58:57 -0700
Message-ID: <55394F00.6040008@intel.com>
Date: Thu, 23 Apr 2015 16:58:56 -0300
From: Leandro Dorileo <leandro.maciel.dorileo@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1429722072-13369-1-git-send-email-bruno.bottazzini@intel.com>	<1429722072-13369-4-git-send-email-bruno.bottazzini@intel.com>	<20150422172752.GA5915@ad.chargestorm.se>
	<CAP9ODKoacgFv4sxM8MU_TcF9COZi7iFWERfesRzpoAac_VLA5Q@mail.gmail.com>
In-Reply-To: <CAP9ODKoacgFv4sxM8MU_TcF9COZi7iFWERfesRzpoAac_VLA5Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] systemd: split modules into packages
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
X-List-Received-Date: Thu, 23 Apr 2015 19:59:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Otavio,


On 04/22/2015 02:30 PM, Otavio Salvador wrote:
> On Wed, Apr 22, 2015 at 2:27 PM, Anders Darander <anders@chargestorm.se> wrote:
>>
>> I'm repeating the comments from my review of the earlier version.
>>
>> I'm slightly worried as we're changing some of the default
>> configurations here. And we're suddenly starting to build almost
>> everything in systemd...
>
> I am in favor of the modularization changes but against the default
> change. If it is done:
>
>   - needs further discussion
>   - needs to be another patch



No *intended* default configuration changes AFAIK. We must work a bit
on that, as pointed out by Anders, default configurations should remain
the same and use PACKAGECONFIGS troughout the build options.

Regards...

--
Dorileo

