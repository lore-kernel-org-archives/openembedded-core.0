Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD5665DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 11:02:39 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id x12so113805wgg.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Oct 2014 04:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=lMA/bHeYhh49ZPeKLdPrGFyP7zfQxRVqvbY+aeV9q7I=;
	b=ijr13S+Wo4tn5RlbKNXXtAm2BUsJzSJd4ZDZqrLAWImkVlOnQTbLJa5nAjE/pI1xEq
	qC56z9bxkJRsv8TYu8XObi+6sMLoRHn/+uAiseDMrxakxBXlfL3fo0tJgrvPYfRm/522
	OKU6LV/HxYXzVnTRe7Ig1/ClyJ1cSfldCjTHb1uL8GbAxGtUop4GG1lfYned/pHw2JGr
	xTzkvUUo16g4zkos8/JfoxRuPQoTARhFG2JXT9M0SF/mW+9nfGxtXWZxthGTsW+OGjWX
	DpwftSrHJ+smAMVysIJb7VxEdbsHjMLpL8ttKDKzHcbT5VjDjrRVGnH3bJE00UWq+19l
	vPLg==
X-Gm-Message-State: ALoCoQknERplX8a+BIY0xoYw2AvCqcKtPCAFZWRLnxqJCWKWmdcKRgOsUdhdkCDfDJEW+NthABAr
X-Received: by 10.180.84.193 with SMTP id b1mr13630951wiz.25.1412161359779;
	Wed, 01 Oct 2014 04:02:39 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d092:c699:9a58:70cb?
	([2001:610:612:0:d092:c699:9a58:70cb])
	by mx.google.com with ESMTPSA id bi7sm972214wib.17.2014.10.01.04.02.38
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 01 Oct 2014 04:02:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1412151136.17658.10.camel@ted>
Date: Wed, 1 Oct 2014 13:02:37 +0200
Message-Id: <C023D4F6-0FD5-490B-B5E9-8619CB8202DE@dominion.thruhere.net>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
	<20141001013231.GQ2480@denix.org>
	<CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>
	<20141001041020.GC25706@jama> <1412151136.17658.10.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Wed, 01 Oct 2014 11:02:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 okt. 2014, om 10:12 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Wed, 2014-10-01 at 06:10 +0200, Martin Jansa wrote:
>> On Tue, Sep 30, 2014 at 08:55:53PM -0700, Khem Raj wrote:
>>> On Tue, Sep 30, 2014 at 6:32 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>>>> On Tue, Sep 30, 2014 at 06:25:57PM -0700, Khem Raj wrote:
>>>>> On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko =
<denis@denix.org> wrote:
>>>>>> This line above ^^^^ has a very long trail of whitespaces and it =
got commited
>>>>>> that way, unfortunately :(
>>>>>=20
>>>>> Better was if you commented before it went in.
>>>>=20
>>>> And how would you suggest I was supposed to see it?? Nobody saw it. =
My email
>>>> client is no different than others - it doesn't mark trailing =
whitespaces. The
>>>> reason I saw it is because I ran "git log -p" on the file and that =
explicitly
>>>> highlights trailing whitespaces in BRIGHT RED... :)
>>>=20
>>> just for that may be we should start using gerrit ;)
>>=20
>> I'm all for it, it would make my e-mail - review - patchwork -
>> master-next workflow a lot easier and reliable.
>=20
> And I am not. Why? I've actually tried using the thing and I =
absolutely
> *despise* its interface. This isn't just a mild dislike, I simply =
cannot
> do the things I want/need to do with it.

I use gerrit at work and I despise the interface as well, but it does =
address a number is issues plaguing OE-core:

1) pull-request doesn't match emailed patches
2) Patches are forgotten
3) Wrong version of patch gets applied
4) Review comments aren't tracked

But patchwork can be used to address the above problems as well. Anyway, =
this isn't a purely technical problem, see below.

> I believe I should have some kind of a say in this since it will
> directly affect my workflow and general life (since I spend a lot of =
my
> time dealing with this). Its appears to be very easy for other people =
to
> tell me how I should work though :(.

I think the real solution doesn't involve extra layers of tools, but a =
move to a kernel style environment where subsystem maintainers collect =
and vet patches and send pull requests to RP. But that would require =
formalizing the commit and review rules which I suspect will be =
controversial.

--
Koen=

