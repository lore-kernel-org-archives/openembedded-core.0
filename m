Return-Path: <mike.looijmans@topic.nl>
Received: from smtp09.online.nl (smtp09.online.nl [194.134.42.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3481D65D68
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Apr 2014 13:35:34 +0000 (UTC)
Received: from smtp09.online.nl (localhost [127.0.0.1])
	by smtp09.online.nl (Postfix) with ESMTP id F32A71E30A;
	Sat, 19 Apr 2014 15:35:32 +0200 (CEST)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp09.online.nl (Postfix) with ESMTP;
	Sat, 19 Apr 2014 15:35:32 +0200 (CEST)
Message-ID: <53527BA4.5000908@topic.nl>
Date: Sat, 19 Apr 2014 15:35:32 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <53523CF6.2040208@topic.nl> <20140419105904.GI2486@jama>
In-Reply-To: <20140419105904.GI2486@jama>
X-Online-Scanned: by Cloudmark authority (on smtp09.online.nl)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to migrate from PRINC to PR_SERVER?
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
X-List-Received-Date: Sat, 19 Apr 2014 13:35:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/19/2014 12:59 PM, Martin Jansa wrote:
> On Sat, Apr 19, 2014 at 11:08:06AM +0200, Mike Looijmans wrote:
>> Attempting to move to the current OE-head now yields about a hundred
>> messages like this:
>>
>> WARNING: Use of PRINC 7 was detected in the recipe ...
>>
>> The https://wiki.yoctoproject.org/wiki/PR_Service page tells what the PR
>> server is.
>
> PR_Service doesn't help with PRINC removal, because PRINC is applied on
> first number in PR and AUTOPR is appended as extra number after dot.

So what is the relation then? Why is PRINC now suddenly declared 
obsolete, without providing anything to replace it?

>> However, it does not tell what to do with the recipes. Just removing
>> PRINC from the recipes will break the upgrade path.
>
> You were supposed to send corresponding PR bumps to upper layers when
> removing PRINCs, like:
> http://git.openembedded.org/openembedded-core/commit?id=c6825ec6e92e20bb64a051d1576f363c16e98d68
>
> but it's probably too late for daisy.
>
>> What are we supposed to do now?
>
> You can wait for PV/PE upgrades in upper layers or in worse case break
> upgrade path and remove PRINCs without replacement (e.g. if it's in your
> private layer and company doesn't care about upgrade path).

That would also mean hand-crafting several dozen of PR numbers. And for 
a project like OpenPLi for which there are something like a million 
embedded boxes running and upgrading it in the field, I'd definitely 
want to keep the upgrade path clean...

Would a patch that bumps PRs for so many packages be accepted?


-- 
Mike Looijmans

