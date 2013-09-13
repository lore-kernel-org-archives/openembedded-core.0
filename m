Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 29D4C60579
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 20:36:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Sep 2013 13:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,900,1371106800"; d="scan'208";a="403059468"
Received: from unknown (HELO [10.255.15.78]) ([10.255.15.78])
	by orsmga002.jf.intel.com with ESMTP; 13 Sep 2013 13:36:06 -0700
Message-ID: <52337736.1070906@linux.intel.com>
Date: Fri, 13 Sep 2013 13:36:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Hans Beckerus <hans.beckerus@gmail.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
	<5231F548.6010801@linux.intel.com>
	<CAFyqS9r3WOEjfrPe5s=n1H9SzFsnJ4FAdo=AGprWUkufUe6QRQ@mail.gmail.com>
	<52322D8B.7080406@gmail.com> <52324915.6030708@gmail.com>
	<CAFyqS9omO7majs22+o-DPii9wpw15rrhxkgQAUD35GRWjRFqLw@mail.gmail.com>
	<1379062359.3484.243.camel@ted>
	<CAFyqS9qFA-gRZw_9XXtZfROmzc5vaWSyg6MRobhFiWkzekAnHA@mail.gmail.com>
	<CAFyqS9pUHcEDZOpw9r2-LjCwN9EwK4Y0cpQp+oVCV2VzWL2FdQ@mail.gmail.com>
	<CAFyqS9oavyrMkDL_W8MM36_fA9p_mxweiCk17j470WTv4YFvYw@mail.gmail.com>
	<CAFyqS9pQdQMSBJ04Rz+AeRkfgZbPDZAsTK6DPerRdiB5LHRQ+w@mail.gmail.com>
	<1379074896.3484.262.camel@ted>
	<CAFyqS9q1RMXjV-L3M3ZGz+Bw2Ky81WjDQSLmdZJUmm2yp5-pqg@mail.gmail.com>
	<CAFyqS9pvkL9dv=Oh=S8LmApy2wQppttJeQH+1+s6+bqmKXwRyg@mail.gmail.com>
	<52335040.101@linux.intel.com> <5233538E.9020404@gmail.com>
	<523367D6.4050604@gmail.com>
In-Reply-To: <523367D6.4050604@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Fri, 13 Sep 2013 20:36:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 09/13/2013 12:30 PM, Hans Beckerus wrote:
> On 2013-09-13 8:03, Hans Beckerus wrote:
>> On 2013-09-13 7:49, Saul Wold wrote:
>>> On 09/13/2013 06:29 AM, Hans Beckérus wrote:

<<SNIP>>

>>>>>>
>>>>> Agree. Since all my patch did initially was to make sure gcc was
>>>>> queried when --with-libtool-sysroot was not specified this is the only
>>>>> possible reason I can think of that causes it to break like this. And
>>>>> there is only one side on this coin. The result before the patch if a
>>>>> sysroot *was* specified is the same now also after the patch. I will
>>>>> get back later with a status update on my world build. Will probably
>>>>> take all weekend since it is a simple dual-core ARM mini-server :(
>>>>> I am not really concerned about what release this is targeting. I
>>>>> consider this a workaround until I can dig deeper into what is
>>>>> actually going wrong. My primary goal is to make sure that the SDK
>>>>> does not break as it did before when installed in different paths. Of
>>>>> course that must not affect legacy features so hopefully this
>>>>> workaround eliminates that.
>>>>>
> The current patch looks good so far. I am still running a world build on
> my "failing" host and no errors as of yet. The packages that failed
> before has now passed. Should I make a v5 out of this and then someone
> else (Saul?) can give it an extra spin?
>
Sure, I will give it a local test and if it passes here I can throw it 
on the Autobuilder over the weekend and see what happens.

Sau!


>>>>> Thanks.
>>>>> Hans
>>>>>
>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>> Richard
>>>>>>
>>>>>>
>>>>
>>>>
>>
>

