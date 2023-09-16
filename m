Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BCCCD37B0
	for <webhook@archiver.kernel.org>; Sat, 16 Sep 2023 00:34:17 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.3852.1694824453318782396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 17:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 38G0X96F016212;
	Fri, 15 Sep 2023 19:33:10 -0500
Message-ID: <37719bf9-730f-30fc-0598-70e69bba6eea@kernel.crashing.org>
Date: Fri, 15 Sep 2023 19:33:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [OE-core] [Openembedded-architecture] Security processes: YP
 needs
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <CAApg2=SqAzD9zCnAGB+mtZoTnMCzcnocarpTSCQ0weH15j8KhQ@mail.gmail.com>
 <a7bd9391-7800-4de8-82c7-62ae708a5f0c@ni.com>
 <17f052c2-5604-4df5-bb95-bf18a34ea871@kernel.crashing.org>
 <CAApg2=RXOFJPOm+UZfB=XSiK=fYeBt6nLb4Lb5gSTuWUuD4Kvg@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAApg2=RXOFJPOm+UZfB=XSiK=fYeBt6nLb4Lb5gSTuWUuD4Kvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 38G0X96F016212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Sep 2023 00:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187771



On 9/15/23 2:59 AM, Marta Rybczynska wrote:
> On Wed, Sep 13, 2023 at 6:28=E2=80=AFPM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
>>>> * Visibility of the security work of the YP
>>>>
>>>> There is much work on security in the YP, but it lacks visibility.
>>>
>>> Is there a common nexus for this work? eg. do most of the folks who a=
re
>>> doing security work tend to congregate on the security sublist?
>>
>> Security means different things to different people.  I.e.
>>
>> 1) Secure design
>>      - Is the system designed to have security services, if so are the=
 defaults
>> setup to both be appropriate and also functional?
>>
>> 2) Additional security software
>>      - i.e. meta-security, what additional software can be available t=
o enhance
>> security design/implementation of the system
>>
>> 3) Security (bug) response
>>      - This is where I see a lack of common nexus for work.  We don't =
have a good
>> place to discuss CVE specific information.  Now the question really is=
, should
>> we have a separate space.  CVEs are just bugs.  Bugs are usually worke=
d on via
>> the main mailing list.  So that argument says no, we shouldn't have a =
special
>> list.  BUT the perception is CVEs are "special", so maybe a list speci=
fically to
>> discuss the ramifications of a CVE, fix/mitigation strategy or similar=
 would
>> make sense -- keeping actual bug fixes to the main mailing list?
>>
>=20
> It might e interesting to have opinion on people who are submitting CVE=
 fixes...
> Would keeping that discussion in a separate place be helpful?

Ya, a security mailing list can be interesting for those types of discuss=
ions,=20
but ultimately the code needs to go to the regular pull list -- which dep=
ending=20
on the project (and level of discussions) it may make sense just to have =
those=20
discussions on the regular list.  It's tricky, and I'm not sure what the =
right=20
answer is here.

>>>>
>>>> * SRTool
>>>>
>>>> We might decide to use it again. It allows one to do much but requir=
es
>>>> constant commitment.
>>>
>>> I think I passed over the wiki pages and presentations for SRTool onc=
e,
>>> a while ago. But I didn't pay much attention at the time because it
>>> wasn't clear *what it did*.
>>>
>>> After reviewing it again, I think it might be the kind of tooling I'v=
e
>>> been searching for to help my team coordinate our CVE response work.
>>> I'll test it out and see if it is something I can use/contribute towa=
rds.
>>
>> SR Tool requires constant feeding and maintenance from staff, at a min=
imum to do
>> initial triage work.  This means we need a small group of individuals =
who can
>> take the new items (and changes to existing) and comment on a regular =
(daily)
>> basis.  This is the part we've not been terribly successful in the pas=
t.  People
>> are great at delivering patches, but trying to do the proactive (befor=
e
>> cve-checker) evaluation of CVEs is an activity that often feels like b=
usy work,
>> so it's easy to get behind on and never catch up.
>>
>> I would love to see the project use SR Tool to manage CVE information,=
 (bugzilla
>> is where the bugs need to be managed and processed), as well as cve-ch=
ecker to
>> be able to continue to feed information or what we believe the current=
 state of
>> things are.  This combination would give us per-emptive notification o=
f new
>> items (SR-Tool), and late validation of items (cve-checker) on the per=
ceived
>> state of things.
>=20
> SRTools code base (https://git.yoctoproject.org/srtool) has seen no cha=
nges for
> 4 years. If we decide to use, we'll also need to maintain the tool. Is =
Windriver
> going to update the fork? David (adding in copy), do you have any infor=
mation?
>=20
> Otherwise we would need to maintain our version, and update to the code
> to take into account how the world have changed. For example, with the
>   CVE v5 JSON, using the CVE database directly for the feed of new CVE =
list
> makes more sense than using NVD, for example. For the reason of perform=
ance
> and delay. When SRTool was developed, that data wasn't available.

Last time I used it was almost exactly 4 years ago.

The tool itself is pretty simple, it's the data import/export that is the=
=20
complex bit(s).  Maybe the lesson here isn't to use SR Tool, but take som=
e of=20
the concepts from it and maybe implement something ourselves (in the futu=
re).

The key things are:

1) Automatic import from external CVE/Security sources (not all security =
items=20
are CVEs)

2) A way to triage the information, and do LOCAL edits of the information
    - Way for the user to query what's new?
    - Way for the user to query what's changed since last time?
    - Way for the user to query other things...
    - Local edit could be YP 'status'
    - Local edit could add public OR private information about a given it=
em
    - Local edits should be able to link a problem with a bug and release
    - Local edits should be able to TRACK progress of a bug
    - Local edits to CREATE security items not otherwise known (either YP=
=20
specific, or based on bug reports, etc)
    - A way to temporarily set things as 'restricted', only for specific =
people=20
to view until it's public information.

3) Way to generate reports for users.
    - General report
    - CVE Specific report

3) Export connection, primarily to a bug tracking system.
    - The tool should allow creation and tracking of the bugs (filed in a=
=20
standard way based on the security information)


The above sounds complicated, but honestly shouldn't be.  Some of the ite=
ms=20
above are really optional, or could even use the bug tracking system dire=
ctly=20
which just makes this more of a reporting tool.

(The above of course all assumes we have the desire and ability to triage=
=20
incoming security information, vs simply reacting to what cve-checker or=20
specific people report to use.  The later is reactive and useful, the for=
mer is=20
proactive but can be resource intensive.)

--Mark

> Cheers,
> Marta

