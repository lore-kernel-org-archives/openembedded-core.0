Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 71FA973177
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 14:12:06 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 28A3E68A01C; Mon, 11 Apr 2016 15:12:07 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id AE12268A019;
	Mon, 11 Apr 2016 15:12:06 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 6300F6740509;
	Mon, 11 Apr 2016 16:12:06 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<20160410225130.GK16135@denix.org> <570AFBA4.40201@windriver.com>
	<20160411014945.GL16135@denix.org>
	<1460363748.9308.30.camel@linuxfoundation.org>
	<20160411134240.GO16135@denix.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <570BB0B6.4070907@mlbassoc.com>
Date: Mon, 11 Apr 2016 16:12:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160411134240.GO16135@denix.org>
Subject: Re: [RFC PATCH 0/2] unique -dev package
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
X-List-Received-Date: Mon, 11 Apr 2016 14:12:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-04-11 15:42, Denys Dmytriyenko wrote:
> On Mon, Apr 11, 2016 at 09:35:48AM +0100, Richard Purdie wrote:
>> On Sun, 2016-04-10 at 21:49 -0400, Denys Dmytriyenko wrote:
>>> On Mon, Apr 11, 2016 at 09:19:32AM +0800, Robert Yang wrote:
>>>> On 04/11/2016 06:51 AM, Denys Dmytriyenko wrote:
>>>>> On Tue, Apr 07, 2015 at 05:58:13AM -0700, Robert Yang wrote:
>>>>>> Hello,
>>>>>>
>>>>>> I think that one recipe should only have one -dev package, I'm
>>>>>> not sure
>>>>>> whether this is right or not, please feel free to give your
>>>>>> comments, we
>>>>>
>>>>> I know it is already 1 year since this change. But I can't seem
>>>>> to find any
>>>>> discussion or any explanation to why this change was required and
>>>>> what
>>>>> specific problem it was supposed to fix. Please point me to a
>>>>> clear reasoning
>>>>> of this change. Thanks.
>>>>
>>>> There is only one source package, so there should be only one pack
>>>> of header
>>>> files, dev libs, and so on, and they should be placed in a uniq
>>>> pkg.
>>>
>>> Since you are using "should" twice in the same sentence, can you
>>> please point
>>> me to a ratified RFC?
>>
>> I couldn't seem to see the history of this discussion in my mail folder
>> but I do remember some patches along these lines.
>>
>> The reason for a single -dev package is that the "package chain"
>> functions we have assumes this. I know there are some specific cases
>> where we do have multiple -dev packages (qt4, gcc-runtime) but they are
>> very much in the minority and are special cases.
>>
>> I'm definitely on record as saying the depchains code needs revisiting
>> and redoing, preferably with a structured rethink so that we can better
>> handle situations like this. Until that is done, multiple -dev packages
>> can cause issues and we did remove some where there didn't seem to be
>> any real benefit.
>>
>> Which case is causing problems for you?
>
> Thanks, Richard.
>
> I was updating some of our old recipes to work with the latest code and had to
> replace dependencies on libblah-dev to blah-dev as well as -staticdev and -dbg
> in several places. When tried to dig up any relevant discussion on this matter
> either as a discussion or clear explanation of the problem this causes, I
> couldn't find any, hence my inquiry.
>

You might have been thinking about my problems with -dbg packaging that
currently breaks a number of dependencies.  Bug #9104

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

