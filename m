Return-Path: <twoerner@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id A4D7665CF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 14:44:12 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id rp18so15243013iec.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jan 2015 06:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=0Yj+X33ytzgoQDkpK6M0Rdz+eX6NvZs7aaFPrZdYsPk=;
	b=boUkz46Y7eq8XfY02x0L4MI78s/poHRbKvlWFkaJjRRr2++3htjfzXRXOGYucwavN8
	DUFYOuuV8h1K7WDoj4+8btEPI4bMeSmx5cNlKp8reqQT2kpX6rsLuBzT6Vpf4IiNoKo1
	/HvjpP6k/khuo5USk+cRf09TdzHXNzhyyyb7xNHwUqE1hHI7yJwIAawsltO+NZzxp4dY
	gI8B/Ia9lkmmrfzNB/7r2Js6jSXDoup2kkK439ueIX5XAICip+7tqldyA3XqWlnGCth/
	RxNvq/G7DsEGMWZMUzNv0V5GidvArvCFLzZnrWgQx5L3mCp+c0efXcJcf2MInauLMWPL
	ILYg==
X-Received: by 10.107.128.138 with SMTP id k10mr15339215ioi.69.1420814652846; 
	Fri, 09 Jan 2015 06:44:12 -0800 (PST)
Received: from [192.168.141.85] ([67.55.37.231])
	by mx.google.com with ESMTPSA id
	j139sm3896300ioe.20.2015.01.09.06.44.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Jan 2015 06:44:11 -0800 (PST)
Message-ID: <54AFE938.20906@gmail.com>
Date: Fri, 09 Jan 2015 09:44:08 -0500
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1420622709.25779.60.camel@linuxfoundation.org>	
	<54ADA374.8050006@gmail.com>
	<1420666251.25779.76.camel@linuxfoundation.org>
In-Reply-To: <1420666251.25779.76.camel@linuxfoundation.org>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Bug reporting and good bug reports
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
X-List-Received-Date: Fri, 09 Jan 2015 14:44:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

[If I reply, people will think that I'm really big on this MAINTAINERS
file thing, which I'm really not. But if I don't reply I'll feel as
though my point was missed :-(]

On 01/07/15 16:30, Richard Purdie wrote:
> On Wed, 2015-01-07 at 16:21 -0500, Trevor Woerner wrote:
>> On 01/07/15 04:25, Richard Purdie wrote:
>>> I also have a patch. Where should I share them? How do I ensure everyone
>>> with an interest in this defect actually gets the patch? Sure I can
>>> create email and send to the people who I think need to know.
>> When I went through that whole "let's add a MAINTAINERS file" thing last
>> year this is exactly what I had in mind at that time.
> But that isn't what I'm talking about.

Okay, sorry for going off-topic.

> I'm talking about people being able to say "I have some interest in a
> particular defect and I'd like updates about it". That is completely
> different to a MAINTAINERS file. The user and easily opt in to specific
> things using the web UI and its self maintaining to a large degree.

While, on the one hand, it would be nice for random people to say "I'm
interested in this defect, I'm going to add myself to the list of people
who are notified when something about this defect changes" (which, as
I'm trying to point out, is a use-case of the MAINTAINERS file), I
believe your more basic question of "I have a patch, who do I email it
to?" needs to be addressed as well.

At this point, we don't have much of a mechanism for people to figure
out who to email their patches to. Emailing one's patches to the right
people is a good thing since it'll increase the chances of it being
reviewed by the most relevant people, and every project could stand to
have more reviewers. What we have is a README file. But this mechanism
requires people to read the README file (which isn't always a given) and
follow its instructions (which is prone to various errors).

The MAINTAINERS file automates the process of figuring out who the
relevant people are to email your patches to. Not only can people add
themselves to the list for a given area of the project, but the
MAINTAINERS mechanism (i.e. the script) will also look at the git
history of the lines your patch is modifying and add those people to the
list as well (the assumption being the last person who modified the code
you're about to modify might be interested in what you're doing to their
code).

Can you email your patch to bugzilla? And have bugzilla figure out all
the people to forward your patch to? Not that I know of.

Do you expect people working on a bug they find in the code one random
day to go searching through bugzilla in case someone else has already
noticed this bug and filed a report so they can look at the bugzilla
issue's CC list to find out who to email the patch to?

If a developer starts their day by looking through bugzilla for an open
issue to fix (or is assigned such an issue from a manager) then your
workflow makes sense. They will prepare a patch, update the issue, and
then email the patch *hopefully* CC'ing the people in the bugzilla CC
list and/or updating the issue with a link to their patch submission.

But if a developer is working on their own thing and stumbles across
some bug, completely unaware that this has been reported in bugzilla,
they will prepare their patch and email it to the mailing list (and most
likely nobody else). At least the MAINTAINERS file would help a little
bit in this case (if for nothing else but to figure out which mailing
list to email!) and if people added themselves to the MAINTAINERS file
as being interested in a certain area, then those people would be
emailed too.

The biggest difference between what you're talking about and what I'm
talking about is the granularity. A bugzilla entry addresses a defect,
which could cross many files and layers. The granularity of the
MAINTAINERS file is more about individual files and directories.

Thanks for listening :-)

