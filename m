Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 48D866ABF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:35:05 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb1so2957782pad.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=Xi75N3LbWkxaDsJ5Zwtn4F0M6UXdDK1njwixzVt1Hrk=;
	b=CW0xmUDEo5wc9283bVQk7NruzwnissMIorrae2d/MuyLLg5eOR1fjSSEhYF7epzeqx
	IjChwiQi/BF4sRuc3A4HQhDsH/cBer5T7zrXkkrvTEYIPI7/h59EKCtb6ewWf/A8pege
	B550Tvx/lWNcrBbFeysEqIyaQMy0L147N/SdCWvLvVDojfD9DmIhfpb/x4SJKfuKvSyn
	zOxaNKWANCEO9/fsGLzwFI5JgQz4qhtBFFjrCN53BFKiYpukvoXkHic2W6Z/SKCHdi0U
	gbbvzLUJa6QUVy+aS6zp752fpGN/YIVP8yjm+lVEnZfwHsYWHto7/fvWyF4d6/B2mLxC
	R/iw==
X-Received: by 10.66.155.230 with SMTP id vz6mr13506652pab.30.1372458906530;
	Fri, 28 Jun 2013 15:35:06 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id ie3sm9945577pbc.13.2013.06.28.15.35.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:35:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAGrhNMzXiTRTt=9wmYH0Bu4TsN3N82nkrERLmXAd-bBWH1U=iQ@mail.gmail.com>
Date: Fri, 28 Jun 2013 15:35:04 -0700
Message-Id: <68153C61-E08B-4F36-B04C-7F6D2332DE18@gmail.com>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<20130607174252.GI22710@jama>
	<CAGrhNMwW6mbg7WUKbVtjRX1qojb8j6q2krcL9cMVz3JJHaRaSg@mail.gmail.com>
	<CAGrhNMw_82j-RUx7gfdKMqawBQ=JhZ6cusRivSpv=aiU0mHW5Q@mail.gmail.com>
	<20130607183730.GK22710@jama>
	<CAMKF1so+vopBv1nJX6pRjzcQDLeRGYxY4p_7j1jwHE=SfnEbcg@mail.gmail.com>
	<CAGrhNMzXiTRTt=9wmYH0Bu4TsN3N82nkrERLmXAd-bBWH1U=iQ@mail.gmail.com>
To: Felipe Tonello <eu@felipetonello.com>
X-Mailer: Apple Mail (2.1508)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: added perl dependency
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
X-List-Received-Date: Fri, 28 Jun 2013 22:35:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 26, 2013, at 11:39 AM, Felipe Tonello <eu@felipetonello.com> =
wrote:

> Should I send another patch?


Please do.

>=20
> On Tue, Jun 11, 2013 at 12:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Jun 7, 2013 at 11:37 AM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>>> On Fri, Jun 07, 2013 at 10:51:14AM -0700, Felipe Tonello wrote:
>>>> I got this:
>>>>=20
>>>> valgrind/usr/bin/ms_print
>>>> 1:#! /usr/bin/perl
>>>>=20
>>>> valgrind/usr/bin/cg_diff
>>>> 1:#! /usr/bin/perl
>>>>=20
>>>> valgrind/usr/bin/cg_annotate
>>>> 1:#! /usr/bin/perl
>>>>=20
>>>> valgrind/usr/bin/callgrind_annotate
>>>> 1:#! /usr/bin/perl -w
>>>>=20
>>>> valgrind/usr/bin/callgrind_control
>>>> 1:#! /usr/bin/perl -w
>>>>=20
>>>> valgrind-doc/usr/share/doc/valgrind/html/manual-core.html
>>>> 165:<code class=3D"filename">/usr/bin/perl</code>, or whatever =
interpreter
>>>>=20
>>>> valgrind-doc/usr/share/doc/valgrind/valgrind_manual.ps
>>>> 55978:(/usr/bin/perl) 77.7083 Tj
>>>>=20
>>>> Do you know if these "binaries" are part of the main package or can =
be
>>>> extra? I'm not that familiar with valgrind.
>>>=20
>>> Neither am I, but from filenames I would guess they are not =
mandatory to
>>> run valgrind binary, hopefully someone who is using valgrind daily =
will
>>> respond soon...
>>>=20
>>=20
>>=20
>> they are fine with valgrind package itself. although its a rdepend =
and
>> not depend
>>=20
>>=20
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>=20
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>=20


