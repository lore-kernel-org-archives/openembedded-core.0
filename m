Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R8zAU-0003Qs-Ot
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 20:47:42 +0200
Received: by ywf7 with SMTP id 7so7811440ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 11:42:15 -0700 (PDT)
Received: by 10.150.180.3 with SMTP id c3mr8701084ybf.15.1317235335202;
	Wed, 28 Sep 2011 11:42:15 -0700 (PDT)
Received: from [10.0.1.28] (adsl-68-88-70-1.dsl.rcsntx.swbell.net.
	[68.88.70.1])
	by mx.google.com with ESMTPS id o15sm1530775yba.12.2011.09.28.11.42.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Sep 2011 11:42:14 -0700 (PDT)
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-2-git-send-email-dbaryshkov@gmail.com>
	<CADkTA4NxfSaEinraLQMsLT4ZWQKOPAZ76uNujFXg0zSrRvVnFA@mail.gmail.com>
	<0E901391-C9FC-48AE-88A4-C1064E57376E@dominion.thruhere.net>
	<1317221697.12332.13.camel@ted>
In-Reply-To: <1317221697.12332.13.camel@ted>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <89CD0BCB-1457-4C76-87BA-5ED03454C343@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 28 Sep 2011 13:42:09 -0500
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel.bbclass: respect MACHINE_KERNEL_PR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2011 18:47:43 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 28 sep. 2011 om 09:54 heeft Richard Purdie <richard.purdie@linuxfoundatio=
n.org> het volgende geschreven:

> On Tue, 2011-09-27 at 18:40 -0500, Koen Kooi wrote:
>>=20
>> Op 27 sep. 2011 om 08:52 heeft Bruce Ashfield <bruce.ashfield@gmail.com> h=
et volgende geschreven:
>>=20
>>> On Sat, Sep 17, 2011 at 6:18 PM, Dmitry Eremin-Solenikov
>>> <dbaryshkov@gmail.com> wrote:
>>>> MACHINE_KERNEL_PR was introduced long ago in org.oe.dev. It's present i=
n
>>>> meta-oe kernel.bbclass. Several machines depend on this functionality.
>>>=20
>>> I don' t have a big problem with this, since the change is obviously
>>> harmless if it
>>> doesn't need to be used. But similar to my comment on patch 3/5, is ther=
e any
>>> history/technical reasons we can capture here ?
>>>=20
>>> I did a quick search to dig up a bit on this myself, but a summary
>>> would definitely
>>> help, since I see that this has a long and sometimes twisting history. I=
s it as
>>> simple as ?
>>>=20
>>> "A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>>> rebuilds for kernel and external modules"
>>=20
>> It is that simple :)=20
>=20
> I have reservations about this patch given we soon plan to stop needing
> to bump PR values. This patch is actually a perfect example of how brain
> dead the current manual PR bumping is and why we need something better.
> I don't want half the code in the repo to be a mass of PR values which
> need to be incremented manually under weird and wonderful circumstances
> which is where the direction things are currently going...
>=20
> I'd like to hold off on this one.

This patch improves the current situation and I don't foresee the autoPR cod=
e working soon


>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


