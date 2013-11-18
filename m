Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id DCABC6D125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:49:58 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so2476352obc.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 07:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=v31jyM3IsSG9VGhliCgb+WfBOvtrzZg3pR59UVbGIxs=;
	b=Q2M1bN30qXx7OaY/zGYLjfnzzs+mQEJRKnAtrJJ6havMgPe6ESQiZgbZ7GaIlSUbMQ
	MeMCKbCUWXRxcpTBJDiVp6neaZgqPbLQIGo0BUs1D04q20xh7OEnR+YMKKdK3vpXwqPX
	FdzuCq9S9EH6rfwAHIAl/T6f+OBgisupAOxssHe8jpF3MSulFvpW9meC8fuNFiXHCkLZ
	EJF9AeF3jNFATT2zSPSD+MjbFKnozGM5EKuJ6iFkiQNvCDIVxfcWRj6tSdUxh3V4HTmv
	MTcIGVJhLxDi/94XZMeUpucaIxp1PjTzUsEphFLx5wD6M4/pv2TebPr1Df2M2oqhgYmi
	GoZg==
MIME-Version: 1.0
X-Received: by 10.60.45.196 with SMTP id p4mr155752oem.81.1384789800292; Mon,
	18 Nov 2013 07:50:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 18 Nov 2013 07:50:00 -0800 (PST)
In-Reply-To: <528A32C4.3030306@intel.com>
References: <1383312696-421-1-git-send-email-otavio@ossystems.com.br>
	<5283F507.7050607@linux.intel.com>
	<CAP9ODKotnjmFwd3SqG_=HDpDWXBDkuaJsqUerM_8BnT9mPU0GQ@mail.gmail.com>
	<CADkTA4M8GkRVnHr5bW-1=Ff2PSdsYaOo6ROisjZDybnNpom2OA@mail.gmail.com>
	<5284F5D1.4010004@linux.intel.com>
	<CADkTA4ObDkKgm+_-RG650m2TtugDh4tZ+OHyOateGSUvv9hmhQ@mail.gmail.com>
	<CADkTA4MCL8pe8jACx8T9o7S17XvjUiBj5GwSp9nW2snWjpCQxQ@mail.gmail.com>
	<CAP9ODKo+dR_FSj4djpGKcbQFWRiWqSK6XApGtjS6NM1r5scJDg@mail.gmail.com>
	<528A0755.2060100@windriver.com>
	<CAP9ODKqfdgCe_wpzyzGqgbfvOoT1HrgM_7PoSvuNDBtueBi1tA@mail.gmail.com>
	<528A2927.7070009@windriver.com> <528A32C4.3030306@intel.com>
Date: Mon, 18 Nov 2013 13:50:00 -0200
X-Google-Sender-Auth: 5le_Kgj_vL7BgfzMOoWK-eWVk7o
Message-ID: <CAP9ODKqrKrqWPg6ZCnM715RLjjRJ3satfm3ouOwWmpt+ygBU_A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <saul.wold@intel.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] lttng-modules: Update revision to grab last bugfix releases
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
X-List-Received-Date: Mon, 18 Nov 2013 15:50:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 18, 2013 at 1:31 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 11/18/2013 06:50 AM, Robert Yang wrote:
>>
>>
>> On 11/18/2013 10:18 PM, Otavio Salvador wrote:
>>>
>>> On Mon, Nov 18, 2013 at 10:25 AM, Robert Yang
>>> <liezhi.yang@windriver.com> wrote:
>>>>>
>>>>>
>>>>> This should be considered for Dora as well as it fixes the deadlock
>>>>> and building with 3.12 kernels.
>>>>>
>>>>
>>>> Hi Otavio, thanks for suggesting this for dora, but dora's kernel is
>>>> 3.10.11,
>>>> and this is an update for lttng-modules, I'm not sure whether dora needs
>>>> this.
>>>>
>>>> Add Saul in the CC list.
>>>
>>>
>>> I think Dora ought to get the new 3.10 kernel updates; this can go
>>> along side with it.
>>>
>>
>> Hi Otavio,
>>
>> I'm sorry, but I'm not sure whether we need update dora's kernel from
>> 3.10.11
>> to 3.10.17, since we seldom do the package update for a stable branch,
>> let's wait for others' comments:-).
>>
> This is correct, I do not think we will be updating the kernel for a stable
> branch.

This is wrong. We should update to 3.10.17 as this is the LTS release,
otherwise what is the point of us using a LTS at all?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

