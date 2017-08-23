Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 480A478195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 16:54:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7NGsSiS023848
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Aug 2017 09:54:31 -0700
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 09:54:26 -0700
To: Andrei Gherzan <andrei@gherzan.ro>, openembedded
	<openembedded-core@lists.openembedded.org>
References: <CAK18fxG23fiaTMk86hQUYZVbRZApZMtM3StvuM5QefmCEHdw-g@mail.gmail.com>
	<CAK18fxEj3ZLHzBAh5FgEKq8P9=QPr8MNBO6r4fri47nZZCeVbg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <9530249c-064a-8489-d8b5-f9687fa5c2a3@windriver.com>
Date: Wed, 23 Aug 2017 12:54:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAK18fxEj3ZLHzBAh5FgEKq8P9=QPr8MNBO6r4fri47nZZCeVbg@mail.gmail.com>
Subject: Re: kernel-yocto class requires BSP definition now
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
X-List-Received-Date: Wed, 23 Aug 2017 16:54:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Already discussed with Khem and Richard in the original
thread.

I'm sending another patch shortly to back this off to a note/warning.

Bruce

On 08/23/2017 12:48 PM, Andrei Gherzan wrote:
> (Resending this from the yocto mailing list)
> 
> Hello all,
> 
> Since...
> 
> commit b6f78c7a27d6d3acae63cf1fdb7b56c11c919830
> Author: Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>>
> Date:   Sun Aug 20 22:58:21 2017 -0400
> 
>      kernel-yocto: ensure that only valid BSPs are built
>      There was a bug in the search routines responsible for locating
>      BSP definitions which returned a valid match if only the ktype
>      matched.
>      This meant that someone looking for "qemux86foo" (which is an
>      invalid definition) would potentially end up building "qemuarm"
>      and be none the wiser (until it didn't boot).
>      With this fix to the tools search routine, and improved return
>      code testing, we will now stop the build and report and error to
>      the user.
>      [YOCTO: #11878]
>      (From OE-Core rev: 44aea7b87307795fe4e089c51d45afccaa2f6525)
>      Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>>
> 
> 
> ... the build fails for cases where there is no scc definition used. 
> meta-raspberrypi was using this for configuration fragments feature but 
> without defining any scc or using any feature branches etc. This got 
> broken now since finding BSP definition files is a requirement in the class.
> 
> --
> Andrei Gherzan
> 


