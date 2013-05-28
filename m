Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 49D2B6A34E;
	Tue, 28 May 2013 15:36:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4SFaQdr018978
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 May 2013 08:36:26 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 28 May 2013 08:36:25 -0700
Message-ID: <51A4CF04.3080103@windriver.com>
Date: Tue, 28 May 2013 10:36:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20130528132841.A450B5039B@opal> <20130528134606.GJ3192@jama>
	<1369749977.14887.165.camel@ted>
In-Reply-To: <1369749977.14887.165.camel@ted>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Mark Hatle : base.bbclass: Deprecate the PRINC logic
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
X-List-Received-Date: Tue, 28 May 2013 15:36:27 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/13 9:06 AM, Richard Purdie wrote:
> On Tue, 2013-05-28 at 15:46 +0200, Martin Jansa wrote:
>> On Tue, May 28, 2013 at 01:28:41PM +0000, git@git.openembedded.org wrote:
>>> Module: openembedded-core.git
>>> Branch: master-next
>>> Commit: e1cf564ebc8e7b4fa626a645356f6a4d7f5ba064
>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e1cf564ebc8e7b4fa626a645356f6a4d7f5ba064
>>>
>>> Author: Mark Hatle <mark.hatle@windriver.com>
>>> Date:   Tue May 21 13:29:03 2013 -0500
>>>
>>> base.bbclass: Deprecate the PRINC logic
>>>
>>> The PRINC logic is now deprecated, the PR server should be used to handle
>>> the automatic incrementing of the PR (package release) field.  The default
>>> setting of '0' has been removed, and a warning message has been added.
>>
>> How are people supposed to remove existing PRINC without causing version
>> going backwards?
>>
>> Do I have to choose between seeing 100 warnings about deprecated PRINC
>> or 100 ERRORs from buildhistory about versions going backwards?
>
> Sorry, this is coming out a bit backwards.
>
> At the TSC meeting, we discussed ways of progressing with removal of
> PRINC as it is causing pain and we shouldn't need it any more. We were
> wondering if we could have the system warn on usage of PRINC, then
> accept PR bumps to the main recipe at the same time that the usage of
> PRINC was removed (taking PR bumps and removing PRINC seems to be the
> only way to proceed). Initially I wondered if we could make it a hard
> error, which would then force the PR bump to be in sync with the
> removal. People are justifiably concerned at the idea of hard errors
> though.
>
> Mark sent me a patch, I thought it was an RFC on the list and applied it
> to master-next to experiment with. It wasn't send to the list, I'm not
> sure what Mark's intention was, its possible I was supposed to raise the
> subject, then post the patch.

Ya, this was a result of the TSC discussion.  I sent it to Richard to get 
feedback on the approach, before it went to the list.

> Anyhow, as you point out, the patch has a couple of issues. We need to
> put back the default value into local.conf for now at the very least so
> this warns, rather than gives an obtuse error. Its not going into master
> until there is more discussion.
>
> So lets reset here, Mark will post the RFC patch and we can discuss
> whether there is a way we can get rid of the PRINC usage without causing
> people too many problems. Sorry for the confusion caused :/.

I'll be happy to do so.

--Mark

> Cheers,
>
> Richard
>
>


