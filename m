Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0EB6F595
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 15:14:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2PFERG4020663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 08:14:27 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 25 Mar 2014 08:14:27 -0700
Message-ID: <53319D52.5070805@windriver.com>
Date: Tue, 25 Mar 2014 10:14:26 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1395676843.24890.7.camel@ted>
	<CAP9ODKo8S2PjwqdxgwLYC=fWLMsdqLKkLXGuvnxf4xd3nqCJJA@mail.gmail.com>
In-Reply-To: <CAP9ODKo8S2PjwqdxgwLYC=fWLMsdqLKkLXGuvnxf4xd3nqCJJA@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Mar 2014 15:14:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/14, 7:22 AM, Otavio Salvador wrote:
> On Mon, Mar 24, 2014 at 1:00 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> As development on 1.6 finishes up, its time to think about what we
>> should be doing in the 1.7 cycle.
>>
>> I think from my perspective, in 1.7 I'd like to see us looking at
>> "Developer Workflow". Its a generic topic which I think covered multiple
>> areas (in no particular order):
>>
>> * the ADT/SDK and how it intergrates into the rest of the system
>> * toaster
>> * python devshell
>> * exteralsrc.bbclass
>> * memory resident bitbake
>> * how a standalone app developer might build an image
>> * locked sstate
>>
>> and probably more I'm forgetting.
>>
>> If anyone does have things they plan to work on, or ideas for things
>> that should be worked on, please do file enhancement requests in the
>> bugzilla:
>
> I'd like to cover
> http://lists.openembedded.org/pipermail/openembedded-core/2014-February/089287.html
> but this got no replies. So I am unsure people think it is an
> important thing or not.
>

I think what you have is something we need to strongly consider to YP 1.7.  I 
advantages to supporting both the "toolchain" and populate_sdk methods for the 
SDK.  But in the end, I think the populate_sdk method should be the default for 
normal users.  And the 'toolchain' approach used for people who are producing 
incredibly targeted application SDKs.

I don't have much to add to the QT/QTe side, simply because I'm not familiar 
with all of the issues, but in general this should help make it easier for users 
to create SDKs.. hopefully use them with the eclipse environment(s) and produce 
working software.

I like the ability also to enhance the environment files with plug-ins via a 
sourced '.d' directory.  This would resolve a lot of the hacky patches I've had 
to make in the past.

--Mark

