Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25DE9601A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 13:08:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3ID89hU023656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Apr 2016 06:08:09 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 06:08:08 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<62a9bef209d903048c1095d90387384115eb6fd5.1459147231.git.hongxu.jia@windriver.com>
	<CALbNGRRL0O+j6axaHL3W2bKZLLyYEe1kxsiguZGL0=a1Lz8ryg@mail.gmail.com>
	<571496CC.8010607@windriver.com>
	<CALbNGRQwKQJxC+17UAoLBhhN9ZfXrYF4Ysur68NCD8v24Uavcw@mail.gmail.com>
	<57149B89.2090607@windriver.com>
	<CALbNGRTgnNYhN68zcDBKrhQ==fxP9wJ7wjj8pQ5jvMEgF=DF4g@mail.gmail.com>
	<5714A30A.9000204@windriver.com>
	<CALbNGRSBJSR4xMqCOUvu2yQcG38E=1UZBehkjmFZLdrtRyfamw@mail.gmail.com>
	<5714AA1E.9020505@windriver.com>
	<CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <5714DC35.7040206@windriver.com>
Date: Mon, 18 Apr 2016 21:08:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRSe6B9-QRftL54DEEKrmCjxTt91K7FXk+CUzuGxjTvf5A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/17] conf/bitbake.conf package.bbclass: fix dbg package not contain sources while -fdebug-prefix-map used
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
X-List-Received-Date: Mon, 18 Apr 2016 13:08:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 04/18/2016 05:52 PM, Andreas Müller wrote:
> On Mon, Apr 18, 2016 at 11:34 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> On 04/18/2016 05:15 PM, Andreas Müller wrote:
>>> So remote debugging is no more available for standard settings. I am
>>> tempted to send a revert: Installing -dbg causes bloated images and
>>> debugging on machine is slow and last resort only.
>>
>> I think we support remote debugging better since -fdebug-prefix-map used,
>> It is easy to construct sources paths.
>>
>> Yours remote debug was limited to original build environment.
>>
>> //Hongxu
>>
>>> Andreas
> OK I checked the documentation for this. You say setting sysroot is
> broken now. How exactly is your suggested option for *remote*
> debugging? And please note: Installing -dbg packages is not an option:
In your case for remote debug with build environment,

My suggestions is:

Plan1:

If sysroot is not required, just install extract *-dpb to /usr/src/ in host

Plang2:

If sysroot is required, override DEBUG_FLAGS to remove -fdebug-prefix-map

//Hongxu


> * It explodes image's size
> * problems are caused by having only one -dbg per recipe: due to
> dependencies conflicting packages are installed causing build to break
> * it is terribly slow: All source code is transferred by network
> during debugging
> * a quick starting up of debugger is impossible - a new image has to be created.
>
> Andreas


