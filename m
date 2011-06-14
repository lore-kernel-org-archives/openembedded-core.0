Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWbIT-0003tK-Ec
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:37:17 +0200
Received: by wwi18 with SMTP id 18so94209wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:33:52 -0700 (PDT)
Received: by 10.227.1.102 with SMTP id 38mr6941707wbe.109.1308087230899;
	Tue, 14 Jun 2011 14:33:50 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm5350134wbb.15.2011.06.14.14.33.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 14:33:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTindy9m5Vd7B8ccC9RnkhaC9KbscQA@mail.gmail.com>
Date: Tue, 14 Jun 2011 23:33:49 +0200
Message-Id: <BAF9DAD6-B3A3-4256-AB14-162020A3AC51@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<BANLkTindy9m5Vd7B8ccC9RnkhaC9KbscQA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:37:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 23:32 heeft Khem Raj het volgende geschreven:

> On Tue, Jun 14, 2011 at 2:24 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/classes/allarch.bbclass |    5 +++--
>>>  1 files changed, 3 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta/classes/allarch.bbclass =
b/meta/classes/allarch.bbclass
>>> index e3ac392..b9ba28b 100644
>>> --- a/meta/classes/allarch.bbclass
>>> +++ b/meta/classes/allarch.bbclass
>>> @@ -2,9 +2,10 @@
>>>  # This class is used for architecture independent recipes/data =
files (usally scripts)
>>>  #
>>>=20
>>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
>>> +# before we reset it
>>> +FEED_ARCH :=3D ${BASE_PACKAGE_ARCH}
>>>  BASE_PACKAGE_ARCH =3D "all"
>>> -PACKAGE_ARCH =3D "all"
>>> -
>>>  # No need for virtual/libc or a cross compiler
>>>  INHIBIT_DEFAULT_DEPS =3D "1"
>>=20
>> This is a *really* bad idea. An "all" package should have no need to =
set
>> architecture specific values into FEED_ARCH.
>>=20
>> Just for those not following IRC, the problem is Angstrom adds =
FEED_ARCH
>> to OVERRIDES. Adding "all" to overrides turns out to do nasty things =
to
>> classes like rm_work with "_all" in the function names.
>>=20
>> I'd suggest that various machines should start adding things like =
armv7a
>> to ${MACHINEOVERRIDES} which has a much more clearly defined scope =
and
>> that FEED_ARCH should quietly die ;-).
>=20
> Would it make sense to add TARGET_SUBARCH variable ?

and have it mean the same as BASE_PACKAGE_ARCH?=


