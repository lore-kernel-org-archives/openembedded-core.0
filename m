Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 92796606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 15:40:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3LFeUsi032470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 08:40:30 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 08:40:29 -0700
To: <openembedded-core@lists.openembedded.org>
References: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
	<CAJTo0LakXXOvj9_aKmYxy4OdxgP6rOp5EqLZtAajp8iFf7qkuA@mail.gmail.com>
	<alpine.LFD.2.20.1604210848320.4088@localhost.localdomain>
	<1461244566.31320.119.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1604211022280.31857@localhost.localdomain>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5718F46D.8010309@windriver.com>
Date: Thu, 21 Apr 2016 10:40:29 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1604211022280.31857@localhost.localdomain>
Subject: Re: trying to reconcile OE builds with rpm4-format rpm files built on centos 6
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
X-List-Received-Date: Thu, 21 Apr 2016 15:40:31 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 4/21/16 9:25 AM, Robert P. J. Day wrote:
> On Thu, 21 Apr 2016, Richard Purdie wrote:
> 
>> On Thu, 2016-04-21 at 08:50 -0400, Robert P. J. Day wrote:
>>> On Thu, 21 Apr 2016, Burton, Ross wrote:
>>>
>>>>
>>>> On 21 April 2016 at 13:06, Robert P. J. Day <rpjday@crashcourse.ca>
>>>> wrote:
>>>>         next bit of muttering is, "can we downgrade the OE build to
>>>> use
>>>>       rpm4-format packages?", which is not a path down which i want
>>>> to walk.
>>>>
>>>>
>>>> Assuming that the obviously correct option of "build the
>>>> packages inside OE" really is being written off for mysterious
>>>> reasons, rpm4 was only just removed from oe-core (though
>>>> depending on what releases you're using you may have never
>>>> noticed it be added and removed again).  So you could just
>>>> recover that from history (oe-core
>>>> a6e7a86f1635be9a688c56c25e9d215ea4d2cc84 removed it) and fix it
>>>> up.
>>>
>>>   just to be clear, if i can dredge up the recipe for rpm_4, i'm
>>> assuming i'd want to specify that i want the "package-management"
>>> image feature, as well as stating:
>>>
>>> PREFERRED_VERSION_rpm = "4.%"
>>> PREFERRED_VERSION_rpm-native = "4.%"
>>>
>>> correct?
>>
>> Just to confuse things further, you could write an OE recipe which
>> took the v4 rpm files from the other system and then simply
>> repackaged them into v5 rpms files. Nothing says you *must* compile
>> from source, the input could be the v4 rpms.
> 
>   great, just what i needed ... yet *another* strategy. in any event,
> can i confirm that if i have the recipe for RPM4, i can use
> PREFERRED_VERSION to use it for the OE build and, later, to install
> RPM4-format rpms built elsewhere?
> 
>   also, *if* i build an image based on RPM4, is it feasible (or even
> possible) to upgrade the whole thing to RPM5 later? i'm not sure i
> even want to think about the grief possibly involved in that.

Due to potential endian and header differences, I don't know.

It was certainly possible in the past to do this (and easy).  But at this point
it may no longer work.

I think this is a question that probably should go to the rpm5-users mailing
list, as they may have more information.

--Mark

>   thanks muchly.
> 
> rday
> 


