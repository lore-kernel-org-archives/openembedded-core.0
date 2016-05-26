Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 69AED6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:30:38 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id ww4so91540712igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=RlZ4JHcHqbOEJ5TSZxLekrXEcdsIjkPLyASN9krEEgo=;
	b=lhJgHEu4cqCJIH5bn/StR4plKRG53+PcHvbM5KpbUS1QckvK8wWNcl5lmXB8G8Ke4M
	CfCToAtrsJikz8Pf2kH/b8nl/VvOj4ORisRPH/JaRvqyZslEv1KevMcUKyPMdF6vNPCO
	MsZWqJgcQDqfkK7kUr6N3EbejB1lp9qAi73yzBK6OKEhKz7gTkrRHH18sqWUCkWxPwTL
	7nP8O2bgvGH4fngwSemJoYj7LiWDuJvuHK2otaa89LmboPCtaEd1Scn6Mw37iUOoiIz4
	tLES9CaBSHOAAVHUlVXiw9m4uXLN2ddu6bbBFv2RCYam8hu9g+nVkwGcf7NmAuYGoa/d
	T31Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=RlZ4JHcHqbOEJ5TSZxLekrXEcdsIjkPLyASN9krEEgo=;
	b=VrbimwTJVuznn2Evuqe/TKbPc6ISMZeHTEClHvtvULKAJBk9N8e7UxcfaQyU/hk86g
	5p5mBQ64clmutTGlo2kjBUn0KnOFrswGy00fYrM6xua0LhZcGQdhQ9th2mHr79PmuBiY
	w1Q/TcNwOcqzj8W4xUwfs7GtAIlZqKK9JoR1fYBTq1j+y5NGEVm/NdsVWqfke/eivw+q
	FHc5PLTHxpETQcwe328SL49PZh/RSOvZoy1lbLss84haHwfleC/y91TEcla7pns4fkpa
	g6LM/rJxV3d65M24mzC4wkU3TTJu1CQa5PbsXCz+b5kjcib/exWGBVv0tGpFMuJz6jb0
	/e4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=RlZ4JHcHqbOEJ5TSZxLekrXEcdsIjkPLyASN9krEEgo=;
	b=NmOE24q9aRVezUCXVWTR7wjUAQBv8am5Rhy76TqZDDPIghr0N53y5++Nu2RMMYbUgj
	usuvpSGtc8VddEE5ry7Z3fhJlWDMfgAWEfQWIaV+3/ghLclIiOfckHVuvf4z/56mJdGZ
	BfQRQyZq9dpjOh/HFIdYS1tnqc0c+ZOfrknCxSl+aK+m2v44S19nieC4dJ3ATiiFG+3I
	Ro/IBTj+JB/n2MqaKSur5CHF0nKFZJoQrc6mspbCkpHGOTjmrW3brANTPiK+Q/sD0Qvg
	7u4hucApcS1YGdT1XMFoT5WhIIuk60D+SoXRBS6Es3PJP1bFZMBBHfalAKnXXLuv7vZj
	eh5A==
X-Gm-Message-State: ALyK8tLdTZvsDFGJCAUiJi8ZiiUw2Ep1HBHkTWYCytYfRqXIdcCTeZQkSSMDMh4ZUM+LA5Sx+vubM+8qlBoi2w==
X-Received: by 10.50.136.165 with SMTP id qb5mr3549549igb.87.1464273038539;
	Thu, 26 May 2016 07:30:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Thu, 26 May 2016 07:30:19 -0700 (PDT)
In-Reply-To: <5746B002.8090908@windriver.com>
References: <cover.1464168189.git.liezhi.yang@windriver.com>
	<1357d837c72abd1d9552aa77fd63126f7275aa23.1464168189.git.liezhi.yang@windriver.com>
	<CAJTo0Lb0W-tTtcjnAA1pVFU2=nDWxX2Fc7HXjYs2WYGfRYQx-A@mail.gmail.com>
	<5746B002.8090908@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 26 May 2016 07:30:19 -0700
X-Google-Sender-Auth: wNexHinC1gKtfsAYbBoo_2coktY
Message-ID: <CABcZAN=AVGU4yqeBOocNuxYzk5BK=ic7CHcxutHph9E8S15WRw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] utility-tasks.bbclass: fix do_listtasks
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
X-List-Received-Date: Thu, 26 May 2016 14:30:38 -0000
Content-Type: multipart/alternative; boundary=089e01494f6e5103370533bfa201

--089e01494f6e5103370533bfa201
Content-Type: text/plain; charset=UTF-8

On Thu, May 26, 2016 at 1:12 AM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> On 05/25/2016 07:17 PM, Burton, Ross wrote:
>
>>
>> On 25 May 2016 at 10:23, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>
>>     It lists deleted tasks which is unexpected, use __BBTASKS to fix the
>>     problem since deltask() which is defined in bitbake/lib/bb/build.py
>>     updates __BBTASKS correctly.
>>
>>
>> Wouldn't an alternative be to change deltask so that it also remove the
>> "task"
>> flag from the variable?
>>
>
> The problem is, if we do:
>
> d.delVarFlag(task, 'task')
>
> Then maybe we should remove the whole task from d rather than only
> remove the flags ?


IMO, no, deltask and addtask control whether an existing function is a task
or not, so can be run like a task. If you want the variable deleted, that's
what delVar is for.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e01494f6e5103370533bfa201
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, May 26, 2016 at 1:12 AM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 05/25/2016 07:17 PM, Burton, Ross wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
On 25 May 2016 at 10:23, Robert Yang &lt;<a href=3D"mailto:liezhi.yang@wind=
river.com" target=3D"_blank">liezhi.yang@windriver.com</a><br></span><span =
class=3D"">
&lt;mailto:<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">l=
iezhi.yang@windriver.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 It lists deleted tasks which is unexpected, use __BBTASKS to =
fix the<br>
=C2=A0 =C2=A0 problem since deltask() which is defined in <span class=3D"il=
">bitbake</span>/lib/<span class=3D"il">bb</span>/build.py<br>
=C2=A0 =C2=A0 updates __BBTASKS correctly.<br>
<br>
<br>
Wouldn&#39;t an alternative be to change deltask so that it also remove the=
 &quot;task&quot;<br>
flag from the variable?<br>
</span></blockquote>
<br>
The problem is, if we do:<br>
<br>
d.delVarFlag(task, &#39;task&#39;)<br>
<br>
Then maybe we should remove the whole task from d rather than only<br>
remove the flags ?</blockquote></div><br>IMO, no, deltask and addtask contr=
ol whether an existing function is a task or not, so can be run like a task=
. If you want the variable deleted, that&#39;s what delVar is for.<br>-- <b=
r><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth d=
ot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib=
<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--089e01494f6e5103370533bfa201--
