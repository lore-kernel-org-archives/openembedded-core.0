Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17DA67649B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:21:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6UFLLqt025486
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 08:21:21 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 08:21:02 -0700
Message-ID: <55BA40EF.30608@windriver.com>
Date: Thu, 30 Jul 2015 23:21:19 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Olof Johansson <olof.johansson@axis.com>
References: <1438249425-5423-1-git-send-email-olofjn@axis.com>
	<55B9F7A5.3040100@windriver.com> <1438255416-sup-6247@axis.com>
In-Reply-To: <1438255416-sup-6247@axis.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Don't warn about "invalid" PACKAGECONFIGs by default
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
X-List-Received-Date: Thu, 30 Jul 2015 15:21:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/30/2015 07:24 PM, Olof Johansson wrote:
> Excerpts from Robert Yang's message of 2015-07-30 12:08:37 +0200:
>> I have a new patch for this, it will be moved into insane.bbclass,
>> and the recipe can set INSANE_SKIP:
>> +
>> +    # Check invalid PACKAGECONFIG
>> +    pkgconfig = (d.getVar("PACKAGECONFIG", True) or "").split()
>> +    if pkgconfig:
>> +        pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
>> +        for pconfig in pkgconfig:
>> +            if pconfig not in pkgconfigflags:
>> +                pn = d.getVar('PN', True)
>> +                error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
>> +                package_qa_handle_error("invalid-pkgconfig", error_msg, d)
>>
>> I'm testing it, and will send it out sooner.
>
> Thanks, such a patch would work nicely with my use case!

You're welcome, sent:

http://lists.openembedded.org/pipermail/openembedded-core/2015-July/108119.html

// Robert

>

