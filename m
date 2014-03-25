Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 7E13A610D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 14:32:12 +0000 (UTC)
Received: from [172.16.141.133] (172.16.141.133) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 25 Mar 2014 15:32:10 +0100
Message-ID: <5331935A.6060009@enea.com>
Date: Tue, 25 Mar 2014 15:31:54 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, yocto <yocto@yoctoproject.org>
References: <1395676843.24890.7.camel@ted>
In-Reply-To: <1395676843.24890.7.camel@ted>
X-Originating-IP: [172.16.141.133]
Subject: Re: Features in Yocto Project 1.7
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
X-List-Received-Date: Tue, 25 Mar 2014 14:32:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-03-24 17:00, Richard Purdie wrote:
> As development on 1.6 finishes up, its time to think about what we
> should be doing in the 1.7 cycle.
>
> I think from my perspective, in 1.7 I'd like to see us looking at
> "Developer Workflow". Its a generic topic which I think covered multiple
> areas (in no particular order):
>
> * the ADT/SDK and how it intergrates into the rest of the system

> * toaster
> * python devshell
> * exteralsrc.bbclass
> * memory resident bitbake
> * how a standalone app developer might build an image

+1
My wishlist:

1. Assembly of an image from a package repository using the SDK.
2. Ability to easily package multiple kernel flavours(builds with 
different kernel configs) with linux related bbclass:es.

Br,
David


> * locked sstate
>
> and probably more I'm forgetting.
>
> If anyone does have things they plan to work on, or ideas for things
> that should be worked on, please do file enhancement requests in the
> bugzilla:
>
> https://bugzilla.yoctoproject.org/
>
> Cheers,
>
> Richard
>
>
>


