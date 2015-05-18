Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4EBD96AC28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 12:43:37 +0000 (UTC)
Received: by pabts4 with SMTP id ts4so150818158pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=zqF1l6g5nz9zAI55iWiOqhjWtIsCtp2P2jCrzf5HHdM=;
	b=nMbo17pgJwGAu+O8VUkysws1u0hMwYu3CW5SHlkkjd8fAggJL20hbAS+lA3wlGflQ5
	KmCJFEH9ZVwk9xX38mCBY4TDedpRQhfw+ayxT7BBvaZWmcyj/dtdHwPvnBEj+0ZYrcs1
	ZsRPVUY6SAG7uzOA3j4UYpLu0wyNrgLi8asp8Y9nSqcf2G0a0J6UzW+eb2jZpYe3hjED
	NhchKORqpNKHJXSxhneNSk/kmq1xRwdK0Coh4K8KY7b9oqw8VheDvX9awimJhUVoa7SV
	OLb6JrqvvTBAhA/w/9yCAXakVURlG4sX1/eiWMtY6Y5mzzdtKxaDZeLBRITj00JQUyAa
	vwGg==
MIME-Version: 1.0
X-Received: by 10.66.141.77 with SMTP id rm13mr43945885pab.14.1431953018974;
	Mon, 18 May 2015 05:43:38 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Mon, 18 May 2015 05:43:38 -0700 (PDT)
In-Reply-To: <CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
	<CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
Date: Mon, 18 May 2015 14:43:38 +0200
Message-ID: <CALbNGRSnxG0ZmFH2sAFL0B3uEy3mi97t30fSnn2JCSyFLr9Pdg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Mon, 18 May 2015 12:43:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 1:55 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, May 18, 2015 at 6:00 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, May 18, 2015 at 10:01 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>> On Mon, May 18, 2015 at 09:46:03AM +0200, Andreas M=C3=BCller wrote:
>>>> Hi,
>>>
>>> Hi,
>>>
>>>> have seen that a while ago but had no time to take care.
>>>>
>>>> Since oe-core commit
>>>>
>>>> commit 3e760031f91fb87c3e2f62b77a117eb41164f259
>>>> Author: Martin Jansa <martin.jansa@gmail.com>
>>>> Date:   Wed Feb 18 15:40:35 2015 +0100
>>>>
>>>>     feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thu=
mb suffix
>>>>
>>>> I get
>>>>
>>>> ERROR:  OE-core's config sanity checker detected a potential misconfig=
uration.
>>>>     Either fix the cause of this error or at your own risk disable the
>>>> checker (see sanity.conf).
>>>>     Following is the list of potential problems / advisories:
>>>>
>>>>     Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
>>>> (cortexa9t2hf-vfp-neon).
>>>>
>>>> I don't understand this fully but it seems that
>>>> fsl-dynamic-packagearch.bbclass would add this pkg arch but this never
>>>> happens because sanity.bbclass is executed first and interrupts
>>>> parsing. What I don't understand: Am I the only one having this issue
>>>>o
>>> I'm not using meta-fsl*, butdo you have this patch in your setup?
>>> http://patches.openembedded.org/patch/90989/
>>> it was discussed off-list a while ago and this change looks like result
>>> of that discussion.
>>>
>> Have meta-fsl-arm current master in my layers. This contains a similar p=
atch:
>>
>> commit bfe01a0ebde407086f4a7710ea165c6beff310d7
>> Author: Max Krummenacher <max.oss.09@gmail.com>
>> Date:   Mon Mar 30 23:49:32 2015 +0200
>>
>>     fsl-dynamic-packagearch: add all MACHINE_SOCARCH feeds
>>
>> Have rebased the mentionioned patch -> same result.
>>
>> My problem seems to be that sanity.bbclass bails out before code in
>> fsl-dynamic-packagearch.bbclass is executed (and would fix). Playing
>> around with layer priorities / order of layers nothing changed
>> situation.
>
> What board are you using?
>
For this I used imx6qsabresd (want to build for another machine but to
be sure that my layer does not cause trouble I removed it from
bblayers.conf and select imx6qsabresd).

Updates:

1) when replacing DISTRO =3D "angstrom" by DISTRO =3D "nodistro" in
local.conf and using imx6qsabresd as machine -> parsing of recipes
starts.
2) selecting custom machine [1] and DISTRO =3D "nodistro" -> sanity causes =
break

I get the feeling that there is some kind of race:
check_sanity_eventhandler in sanity.bbclass might get called before
python code in fsl-dynamic-packagearch.bbclass was executed.

[1] https://github.com/schnitzeltony/meta-variscite-community/blob/master/c=
onf/machine/varsomimx6q.conf

Andreas

