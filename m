Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 731046EF89
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 19:50:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2VJoOj2018276
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 12:50:24 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 31 Mar 2014 12:50:23 -0700
Message-ID: <5339C6FD.1070506@windriver.com>
Date: Mon, 31 Mar 2014 15:50:21 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>	<e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>	<CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>	<5339C30B.1060005@windriver.com>
	<CAMKF1srfDpeGkQMnHkK_AFPy6N7pujtLwMRsgbsDeHem82_5nA@mail.gmail.com>
In-Reply-To: <CAMKF1srfDpeGkQMnHkK_AFPy6N7pujtLwMRsgbsDeHem82_5nA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libc-headers: set TC default to 3.14
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
X-List-Received-Date: Mon, 31 Mar 2014 19:50:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-03-31 03:47 PM, Khem Raj wrote:
> -Khem
> On Mar 31, 2014 12:33 PM, "Bruce Ashfield" <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>  >
>  > On 14-03-31 03:29 PM, Khem Raj wrote:
>  >>
>  >> On Mon, Mar 31, 2014 at 10:56 AM, Bruce Ashfield
>  >> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>>
> wrote:
>  >>>
>  >>>
>  >>> -LINUXLIBCVERSION ?= "3.10"
>  >>> +LINUXLIBCVERSION ?= "3.14"
>  >>
>  >>
>  >> Does this  buy us much ? Infact its too late to change usespace APIs
>  >
>  >
>  > This was always the plan. I've been building with all the 3.14 -rc
>  > headers for ages .. and as we've talked about in the past, we always
>  > will update them to the newest kernel in any release.
>
> well i think its good to update them however may be some components
> should be given enough soak time and kernel headers are one of such
> pieces since its effects are across layers and they will start testing
> them now.

To be fair, we've had the -dev kernel and headers available for
over a month now.

This is also my second send of this series, so it isn't like this
hasn't been available or broadcast.

People noticing it now, or being busy, isn't something I can directly
control.

>  >
>  > They are compatible with 3.10, and I've tested the combinations of
>  > old kernels, new libc and new kernels with the new libc interfaces.
>
> i dont believe you tested all layer combinations

I've tested everything I can, as has the autobuilder. I can't offer
any more than this.

>  >
>  >
>  >> at this point. 3.10 being LTS
>  >> I would assume its a better option to keep at 3.10
>  >
>  >
>  > I disagree, this is consistent with other releases and the documented
>  > plan of action. I'd rather not have a massive version jump in the fall.
>
> its probably not a bad option to stick to LTS version for kernel headers
> after all

Again, I disagree.

We can maybe keep the 3.10 recipe around, but the default should
be 3.14, we need a matched kernel and libc-headers to get the best 
integration
and leveraging of the latest features.

If we pull the headers, pull the kernel.

Bruce

>  >
>  > Sure 3.14 slipping out by a few weeks upstream was a problem, but its
>  > not like we haven't been testing with it.
>  >
>  > Bruce
>  >
>  >>
>  >
>


