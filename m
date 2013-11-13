Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 72B7F6D9A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 02:28:11 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id g12so6431444oah.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 18:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=mwV2sDRKZVqp4tu4NCUBYAlPs1HyKerc0YbWKOItCEM=;
	b=k4LX82DjZRHV1To5Lk5q1U3/uEz+spJ56MR+MQEytdWEGEK/sKFyJRGlx3NO+Y55F0
	LSMK5tDRoO38jywhkKbDWKceokYrHRy+BYlr83a8ksDbqpDXbe+37JigMgrbhRBwy7wi
	Wnza8Kwnb9I072JC4wp/YtDJZpW/8QQ4YYIXRiTy4N9CCS2WcD54pQLzsSjd7LJZvAtM
	5G97fDymOpzXdRxRaqzWPPjHQYoTNGf+64KCzFnq8eUYs4SmlObKSJ/jIETIST+/R58L
	XUxvgW63QVGsLR/C58MDsin21qN+qqAKD79dNWBRlcclOsKqfCfpmwQgoiiuxfmV5UXP
	wVUg==
MIME-Version: 1.0
X-Received: by 10.182.66.164 with SMTP id g4mr14402962obt.47.1384309693192;
	Tue, 12 Nov 2013 18:28:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 12 Nov 2013 18:28:13 -0800 (PST)
In-Reply-To: <5282E376.5060109@windriver.com>
References: <cover.1384305535.git.mark.hatle@windriver.com>
	<c9dd76ae9feb0069409763f3f65ae4ff2ef10634.1384305535.git.mark.hatle@windriver.com>
	<CAP9ODKpK=eqk_UCR+RQB0N4u+qv8iGTit5S2iHCeu2LJgjhrUQ@mail.gmail.com>
	<5282E376.5060109@windriver.com>
Date: Wed, 13 Nov 2013 00:28:13 -0200
X-Google-Sender-Auth: rxF1OljZlBEBKe2-IDZl_UT3sGk
Message-ID: <CAP9ODKrjWvxyii4saao3v7=SoMBY=Qw=R_cpOpMVZD4fOaF6sA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] gcc: Use alternatives for the *-symlinks packages.
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
X-List-Received-Date: Wed, 13 Nov 2013 02:28:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 13, 2013 at 12:27 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 11/12/13, 8:24 PM, Otavio Salvador wrote:
>>
>> On Tue, Nov 12, 2013 at 11:23 PM, Mark Hatle <mark.hatle@windriver.com>
>> wrote:
>>>
>>> The various gcc related symlinks should be provided as alternatives
>>> instead
>>> of hard coded symlinks.  This will permit multiple toolchains on a
>>> system.
>>>
>>> Multiple toolchains could come from multilib configurations or
>>> alternative
>>> open source or commerical sources.
>>>
>>> Note, gccbug was skipped since it doesn't seem to be generated anymore.
>>>
>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>
>>
>> Wouldn't be better to squash patches 1 and 2 so it makes a real 'logic
>> change'? You add code to remove in patch 2, I think the end patch
>> would be easier to review, no?
>>
>
> It was done this way to match how binutils was implemented.  These are
> actually two logically separate patches.  The first switches from hard coded
> symlinks to using update-alternatives.  The second patch says that a
> separate -symlinks package is no longer needed.
>
> See binutils:
>
> 1395aefcaeac94dd0e6ed3a718b7e58dd43b355e
> 24093e26f246f222c385dc37a2f8cf8b0f183175
>
> (The second of the patches can be reverted -- if ever needed -- and the
> update alternatives functionality will still work properly.)

Ok; you got a point :-)

Agreed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

