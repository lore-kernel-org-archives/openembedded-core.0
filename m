Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 335D96AC74
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 03:46:08 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id c11so8772477lbj.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jul 2014 20:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=SIbKont/67iFHnba4WlcTkKtzm4cyQVlBuUpA/TwYH8=;
	b=L9VKfHkbadnpUR7b/+vaTRUgZGn1YxATRxsjcF5aSkNTN4iY0hKf3lqbXiEp+N+9G+
	8SvAtG2604nk4AiIdDaIoU0SK9SdefCNjIG+YFZ74pQECKjSOPm3rk7PX8oLQ8NOvp7n
	VVdKqNyhCRqtz+ZesrFCqD0rYahEvdGDj2OlyUj+mMqGtKb1iLo8KGoJfwdUA6d383cG
	M/QF2EjPiq0qrC+XHpW4y4uYbjJ3XYvrCHFTKIBtTxqHNCFyad92rgZy+htgN1mUsnrF
	Dn956FqnXXASICQq82qjudPMQtzlkxA/K+DySoszAU2hvd5r/4SO/F+IGwCxKV0YCTEQ
	6dOA==
X-Received: by 10.112.180.70 with SMTP id dm6mr1504853lbc.32.1404359169015;
	Wed, 02 Jul 2014 20:46:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.31.165 with HTTP; Wed, 2 Jul 2014 20:45:48 -0700 (PDT)
In-Reply-To: <53B4BF4B.5090306@windriver.com>
References: <1404286429-13962-1-git-send-email-ming.liu@windriver.com>
	<CABcZANn4B6SzNTT+eCi9bsWQxDcDJ4PCFT5kHwV6c5nxShmyhg@mail.gmail.com>
	<53B45FDC.1050703@linux.intel.com> <53B4BF4B.5090306@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 2 Jul 2014 20:45:48 -0700
X-Google-Sender-Auth: 6ux5UOXvf7AeZWcuVq0vI5z0CDc
Message-ID: <CABcZANnpq=UnWN6YNaPtuGrg6Xb3CUh9Pqc0bxL0G2o9cirdRQ@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: add usleep support from RHEL
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
X-List-Received-Date: Thu, 03 Jul 2014 03:46:17 -0000
Content-Type: multipart/alternative; boundary=089e011826806805b004fd41d98f

--089e011826806805b004fd41d98f
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 2, 2014 at 7:26 PM, Ming Liu <ming.liu@windriver.com> wrote:

> On 07/03/2014 03:39 AM, Saul Wold wrote:
>
>> On 07/02/2014 10:37 AM, Christopher Larson wrote:
>>
>>> On Wed, Jul 2, 2014 at 12:33 AM, Ming Liu <ming.liu@windriver.com>
>>> wrote:
>>>
>>>  Add usleep in to support sleeping some number of microseconds.
>>>>
>>>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>>>>
>>>>
>>> Maybe it's just me, but initscripts seems like a horrible place to put
>>> this.
>>>
>>>
>>>
>>>  It's not just you!  Not sure why it's being added here and I don't see
>> any usage of it, so more information is required.
>>
> Why I've sent this is because I noticed there was no usleep binary in any
> of the packages in oe repositories, and I assumed that the end user might
> like to use it in their rootfs, so I migrated it from initscripts package
> of RHEL. Anyway, if all you guys think it's not necessary and not
> appropriate, I will not insist it, we could just ignore my proposal. :)


The tool itself sounds like it could be of use, but it should likely get
its own recipe in meta-oe until/if something in oe-core actually needs it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e011826806805b004fd41d98f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 2, 2014 at 7:26 PM, Ming Liu <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ming.liu@windriver.com" target=3D"_blank">ming.liu@windriver.com</a>&=
gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On 07/03/2014 03:39 AM, Saul Wold wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 07/02/2014 10:37 AM, Christopher Larson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Wed, Jul 2, 2014 at 12:33 AM, Ming Liu &lt;<a href=3D"mailto:ming.liu@wi=
ndriver.com" target=3D"_blank">ming.liu@windriver.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Add usleep in to support sleeping some number of microseconds.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@windriver.com" targe=
t=3D"_blank">ming.liu@windriver.com</a>&gt;<br>
<br>
</blockquote>
<br>
Maybe it&#39;s just me, but initscripts seems like a horrible place to put =
this.<br>
<br>
<br>
<br>
</blockquote>
It&#39;s not just you! =C2=A0Not sure why it&#39;s being added here and I d=
on&#39;t see any usage of it, so more information is required.<br>
</blockquote></div></div>
Why I&#39;ve sent this is because I noticed there was no usleep binary in a=
ny of the packages in oe repositories, and I assumed that the end user migh=
t like to use it in their rootfs, so I migrated it from initscripts package=
 of RHEL. Anyway, if all you guys think it&#39;s not necessary and not appr=
opriate, I will not insist it, we could just ignore my proposal. :)</blockq=
uote>

</div><br></div><div class=3D"gmail_extra">The tool itself sounds like it c=
ould be of use, but it should likely get its own recipe in meta-oe until/if=
 something in oe-core actually needs it.<br>-- <br>Christopher Larson<br>

clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e011826806805b004fd41d98f--
