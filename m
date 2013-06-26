Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A062B6A973
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2013 20:36:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jun 2013 13:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,946,1363158000"; d="scan'208";a="361034470"
Received: from unknown (HELO [10.255.13.111]) ([10.255.13.111])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2013 13:35:58 -0700
Message-ID: <51CB50AD.2060008@linux.intel.com>
Date: Wed, 26 Jun 2013 13:35:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Felipe Tonello <eu@felipetonello.com>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<20130607174252.GI22710@jama>
	<CAGrhNMwW6mbg7WUKbVtjRX1qojb8j6q2krcL9cMVz3JJHaRaSg@mail.gmail.com>
	<CAGrhNMw_82j-RUx7gfdKMqawBQ=JhZ6cusRivSpv=aiU0mHW5Q@mail.gmail.com>
	<20130607183730.GK22710@jama>
	<CAMKF1so+vopBv1nJX6pRjzcQDLeRGYxY4p_7j1jwHE=SfnEbcg@mail.gmail.com>
	<CAGrhNMzXiTRTt=9wmYH0Bu4TsN3N82nkrERLmXAd-bBWH1U=iQ@mail.gmail.com>
In-Reply-To: <CAGrhNMzXiTRTt=9wmYH0Bu4TsN3N82nkrERLmXAd-bBWH1U=iQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: added perl dependency
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
X-List-Received-Date: Wed, 26 Jun 2013 20:36:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2013 11:39 AM, Felipe Tonello wrote:
> Should I send another patch?
>

I think that Khem pointed out it should be an RDEPENDS not DEPENDS and 
you can drop the PR bump.

Sau!

> On Tue, Jun 11, 2013 at 12:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Jun 7, 2013 at 11:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> On Fri, Jun 07, 2013 at 10:51:14AM -0700, Felipe Tonello wrote:
>>>> I got this:
>>>>
>>>> valgrind/usr/bin/ms_print
>>>> 1:#! /usr/bin/perl
>>>>
>>>> valgrind/usr/bin/cg_diff
>>>> 1:#! /usr/bin/perl
>>>>
>>>> valgrind/usr/bin/cg_annotate
>>>> 1:#! /usr/bin/perl
>>>>
>>>> valgrind/usr/bin/callgrind_annotate
>>>> 1:#! /usr/bin/perl -w
>>>>
>>>> valgrind/usr/bin/callgrind_control
>>>> 1:#! /usr/bin/perl -w
>>>>
>>>> valgrind-doc/usr/share/doc/valgrind/html/manual-core.html
>>>> 165:<code class="filename">/usr/bin/perl</code>, or whatever interpreter
>>>>
>>>> valgrind-doc/usr/share/doc/valgrind/valgrind_manual.ps
>>>> 55978:(/usr/bin/perl) 77.7083 Tj
>>>>
>>>> Do you know if these "binaries" are part of the main package or can be
>>>> extra? I'm not that familiar with valgrind.
>>>
>>> Neither am I, but from filenames I would guess they are not mandatory to
>>> run valgrind binary, hopefully someone who is using valgrind daily will
>>> respond soon...
>>>
>>
>>
>> they are fine with valgrind package itself. although its a rdepend and
>> not depend
>>
>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

