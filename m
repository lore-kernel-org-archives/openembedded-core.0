Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QFBg4-0007gg-42
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 22:49:40 +0200
Received: by wye20 with SMTP id 20so1785635wye.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2011 13:47:05 -0700 (PDT)
Received: by 10.227.172.140 with SMTP id l12mr2654471wbz.222.1303937225110;
	Wed, 27 Apr 2011 13:47:05 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id o23sm687943wbc.27.2011.04.27.13.46.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Apr 2011 13:47:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTimB1pq=f=62d=RC6MjOtqbzrS7OUg@mail.gmail.com>
Date: Wed, 27 Apr 2011 22:46:58 +0200
Message-Id: <BFC18F4B-D292-44D4-9776-C58F8628CAFA@dominion.thruhere.net>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
	<f78273c64ab21b1a0691585a2140d5fdf24f3f3a.1303113405.git.Martin.Jansa@gmail.com>
	<1303115695.5518.70.camel@rex>
	<20110418084520.GB24192@jama.jama.net>
	<BANLkTimB1pq=f=62d=RC6MjOtqbzrS7OUg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 3/4] task-base: allow distribution to define apm provider
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
X-List-Received-Date: Wed, 27 Apr 2011 20:49:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr 2011, om 22:08 heeft Khem Raj het volgende geschreven:

> On Mon, Apr 18, 2011 at 1:45 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> On Mon, Apr 18, 2011 at 09:34:55AM +0100, Richard Purdie wrote:
>>> On Mon, 2011-04-18 at 10:00 +0200, Martin Jansa wrote:
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> ---
>>>>  meta/recipes-core/tasks/task-base.bb |    5 ++++-
>>>>  1 files changed, 4 insertions(+), 1 deletions(-)
>>>>=20
>>>> diff --git a/meta/recipes-core/tasks/task-base.bb =
b/meta/recipes-core/tasks/task-base.bb
>>>> index 138e617..10f3af4 100644
>>>> --- a/meta/recipes-core/tasks/task-base.bb
>>>> +++ b/meta/recipes-core/tasks/task-base.bb
>>>> @@ -179,8 +179,11 @@ RDEPENDS_task-base-acpi =3D "\
>>>>      acpid \
>>>>      libacpi "
>>>>=20
>>>> +# Distro can override apm provider
>>>> +DISTRO_APM ?=3D "apm"
>>>> +
>>>>  RDEPENDS_task-base-apm =3D "\
>>>> -    apm \
>>>> +    ${DISTRO_APM} \
>>>>      apmd"
>>>=20
>>> Can you explain a little more about why a distro would do this =
please?
>>> I'm a little worried this whole file could become a set of DISTRO_*
>>> variables :/.
>>>=20
>=20
> may be define virtual/apm package and use that in RDEPENDS

runtime virtuals are a *bad* *bad* idea. At least opkg has no way of =
handling those.

regards,

Koen=


