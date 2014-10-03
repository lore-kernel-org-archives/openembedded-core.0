Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE8F6FD16
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 08:24:21 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hi2so6393229wib.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Oct 2014 01:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=AXYpwtkkpvG+UlqwRAtlefZAsGBS5gr96vrPAkYMz+s=;
	b=Gyj1x93sk194h6dshX7TOJGwhPxqlYnLwZzriT3uMe6NKGbJinD8rx0fMWh2INeL4B
	ngp3bUJu1QHqicbq01tI1TJieviWurxoIxW01uSqT9eWeWpeAviNT/E5aiyN9LRgRX8K
	arcpbxcKtR2F263FnEUtUDGqASdHEFWHgQN76HohBtByrOFn938kHlnjMAAXqPIetR5P
	rml+4y+kKjHm/4M5KwRKWD6w4lyj90T9bTn2V/9EwsDeCGk5ef/BcyKXOeiYcrAzVO6q
	7Yo/jKGPl2b2SSmUdmDG9ClY9e+u/Sbb1n/VGq+fXKsrPRwAARudalnT4ItiDJT3cEVD
	TciA==
X-Gm-Message-State: ALoCoQnSafGy1cczUIbLo5krCCxGUspWs/UtoNag8ID5mjrJsBYj5pJcubs89I4M8eVAGZHXi5bB
X-Received: by 10.194.3.42 with SMTP id 10mr5305916wjz.98.1412324662829;
	Fri, 03 Oct 2014 01:24:22 -0700 (PDT)
Received: from ?IPv6:2001:610:612::2850:f1dd:95b5:4541?
	([2001:610:612:0:2850:f1dd:95b5:4541])
	by mx.google.com with ESMTPSA id ga9sm7156768wjb.45.2014.10.03.01.24.21
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 03 Oct 2014 01:24:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20141001153415.GF25706@jama>
Date: Fri, 3 Oct 2014 10:24:28 +0200
Message-Id: <CC366DA2-152C-4E5C-9F9C-2BB6C1ED73B7@dominion.thruhere.net>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
	<20141001013231.GQ2480@denix.org>
	<CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>
	<20141001041020.GC25706@jama> <1412151136.17658.10.camel@ted>
	<20141001153415.GF25706@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Fri, 03 Oct 2014 08:24:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 okt. 2014, om 17:34 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Wed, Oct 01, 2014 at 09:12:16AM +0100, Richard Purdie wrote:
>> On Wed, 2014-10-01 at 06:10 +0200, Martin Jansa wrote:
>>> On Tue, Sep 30, 2014 at 08:55:53PM -0700, Khem Raj wrote:
>>>> On Tue, Sep 30, 2014 at 6:32 PM, Denys Dmytriyenko =
<denis@denix.org> wrote:
>>>>> On Tue, Sep 30, 2014 at 06:25:57PM -0700, Khem Raj wrote:
>>>>>> On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko =
<denis@denix.org> wrote:
>>>>>>> This line above ^^^^ has a very long trail of whitespaces and it =
got commited
>>>>>>> that way, unfortunately :(
>>>>>>=20
>>>>>> Better was if you commented before it went in.
>>>>>=20
>>>>> And how would you suggest I was supposed to see it?? Nobody saw =
it. My email
>>>>> client is no different than others - it doesn't mark trailing =
whitespaces. The
>>>>> reason I saw it is because I ran "git log -p" on the file and that =
explicitly
>>>>> highlights trailing whitespaces in BRIGHT RED... :)
>>>>=20
>>>> just for that may be we should start using gerrit ;)
>>>=20
>>> I'm all for it, it would make my e-mail - review - patchwork -
>>> master-next workflow a lot easier and reliable.
>>=20
>> And I am not. Why? I've actually tried using the thing and I =
absolutely
>> *despise* its interface. This isn't just a mild dislike, I simply =
cannot
>> do the things I want/need to do with it.
>>=20
>> I believe I should have some kind of a say in this since it will
>> directly affect my workflow and general life (since I spend a lot of =
my
>> time dealing with this).
>=20
>> Its appears to be very easy for other people to tell me how I should =
work though :(.
>=20
> Please calm down, we just said that we like it, we're not forcing it =
on
> anyone and I don't think khem would start installing it on OE servers
> without much longer and broader discussion between all people who =
should
> have some kind of say in this..
>=20
> FWIW: I despised the UI at first as well, then I got used to it (after =
a month
> or so), now I really like it especially with the "New screen" UI
> introduced IIRC in 2.8 version.

That 'new screen' is indeed an improvement and I also found the switch =
to make it show a unidiff instead of side-by-side. I still despise the =
UI, though, but not as much as before :)

regards,

Koen

> Only annoying part for me is more
> complicated permissions model (which I luckily don't need to
> change so often) and missing option to use "simple" server side hooks.
>=20
> Regards,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


