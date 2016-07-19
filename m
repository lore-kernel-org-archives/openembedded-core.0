Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1DEF607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:44:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6J0iljs007923
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 17:44:47 -0700
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Jul 2016 17:44:47 -0700
To: <openembedded-core@lists.openembedded.org>
References: <CAJTo0LYNjoPfahXjaKEVP6ey=mY3MKDKK5DoCPB9Dp151UgFpw@mail.gmail.com>
	<1468880306.2228.69.camel@pbcl.net>
	<CADkTA4OMij4vsjGfw9Vwjh3ymGYkJDUsAKou6=hU7f0Yt05FXA@mail.gmail.com>
	<FD626B02-4D25-4358-8983-298FD08E6240@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <f004993f-3539-c846-cabd-4a226ebeedb3@windriver.com>
Date: Mon, 18 Jul 2016 19:44:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <FD626B02-4D25-4358-8983-298FD08E6240@gmail.com>
Subject: Re: [Openembedded-architecture] Removal of uclibc from oe-core?
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
X-List-Received-Date: Tue, 19 Jul 2016 00:44:50 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 7/18/16 6:27 PM, Khem Raj wrote:
> 
>> On Jul 18, 2016, at 3:48 PM, Bruce Ashfield <bruce.ashfield@gmail.com
>> <mailto:bruce.ashfield@gmail.com>> wrote:
>>
>>
>>
>> On Mon, Jul 18, 2016 at 6:18 PM, Phil Blundell <pb@pbcl.net
>> <mailto:pb@pbcl.net>> wrote:
>>
>>     On Mon, 2016-07-18 at 23:01 +0100, Burton, Ross wrote:
>>
>>     > Now that musl is fairly mature I think it's time to take uclibc out to
>>     > pasture, where the pasture is possibly called meta-uclibc.
>>
>>     I think this is a splendid idea.
>>
>>
>> Agreed.
>>
>> But do we need a sharpened stake to make sure it doesn't come back ?
> 
> I think its just about time. Given the health of uclibc project and maintenance
> burden we impose on OE-Core, if someone
> needs to have it beyond 2.1, please step up and we can create a new layer
> mnta-uclibc and it can be hosted there. but it
> certainly should go out of OE-Core. 

Agreed.

--Mark

>>
>> Bruce
>>  
>>
>>
>>     p.
>>
>>
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>> -- 
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
>> its end"
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 


