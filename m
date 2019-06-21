Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16A247E7AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:47:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5L9lDGt028626
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jun 2019 02:47:13 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 21 Jun 2019 02:47:13 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1561018476.git.liezhi.yang@windriver.com>
	<b7589dd06670ead7a2ca7e8c7301b289e2543249.1561018476.git.liezhi.yang@windriver.com>
	<20190620082858.GC27107@localhost>
	<07882a06-4c45-07aa-9696-8de4f86b8c0b@windriver.com>
	<20190620091913.GD27107@localhost>
	<fd9aef39-bbbc-f6ed-e9b2-37009952e3ab@windriver.com>
	<3b30ab5eae1506d44fc9c95543d7ae833018c087.camel@linuxfoundation.org>
	<CAJTo0Lb3EwnoC28cesYt9BnuKucW_dCp5bangpdYscLgNOZ7_w@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <16624d28-0bdc-e9c3-c9a5-f534f9694a9e@windriver.com>
Date: Fri, 21 Jun 2019 17:48:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb3EwnoC28cesYt9BnuKucW_dCp5bangpdYscLgNOZ7_w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gtk-icon-cache.bbclass: Depends on gtk+3
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
X-List-Received-Date: Fri, 21 Jun 2019 09:47:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ross,

On 6/20/19 9:56 PM, Burton, Ross wrote:
> Why DEPENDS on gtk?  The recipes will typically already do this, but
> all this class needs is the rdepends.  Also, there's no explanation
> for the hicolor addition.

I got errors when running adwaita-icon-theme's postinst on target
(command gtk-update-icon-cache not found), the recipe doesn't depend
on gtk, and gtk-update-icon-cache is introduced by gtk-icon-cache.bbclass,
so I think that we should add this DEPENDS in the bbclass? If only add gtk
to RDEPENDS (no DEPENDS), there would be a warning like:

adwaita-icon-theme rdepends on gtk+3, but it isn't a build dependency?

For hicolor-icon-theme, it is an existed rdepends in gtk-icon-cache.bbclass,
so I left it there.

// Robert

> 
> Ross
> 
> On Thu, 20 Jun 2019 at 14:54, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Thu, 2019-06-20 at 17:58 +0800, Robert Yang wrote:
>>>
>>> On 6/20/19 5:19 PM, Adrian Bunk wrote:
>>>> On Thu, Jun 20, 2019 at 04:46:16PM +0800, Robert Yang wrote:
>>>>> ...
>>>>> Maybe gtk+2 is out of date? Since gtk+4 is on the way, so I think
>>>>> that we
>>>>> need something like virtual/gtk to fix these problems totally?
>>>>
>>>> GTK+2 is mostly obsolete.
>>>>
>>>> I just checked the GTK4 sources, and there it is renamed to
>>>> gtk4-update-icon-cache. Based on that I would say that your
>>>> patch is actually fine at least for now.
>>>
>>> Thanks, I updated the commit message in the PULL:
>>
>> Please resend patches rather than updating the branch as they get lost
>> really easily and also don't get reviewed properly this way.
>>
>> Cheers,
>>
>> Richard
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

