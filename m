Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDKBX-000445-6q
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 19:30:27 +0200
Received: by eye27 with SMTP id 27so219622eye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 10:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=A6S8UJh8Si6bvxDJZ8jiKwMkrqhaq4uPaoZ/NBnRGJk=;
	b=YeSkfr4mp7PfxIvv1AA+X1wqnhOyXVpV8Y93zLO/D9LXAwPD8sUzaLBwHo7mERCrw4
	NaEkXeJVBQRSQxtG5hmzX4872wUmiJnZ4KNyr2QPrDaeSieHcaL9Q01nKa36z4IIDpH7
	05EqlHUa3oj9xtQXpVNaFZ0YwPnous3OUKBx4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=APth9GLgy/G98y1+oP9GKxrtHFJLhBHoTSMniPdmeN3ecokdyKVoQsctULC+JuPWvz
	7Y2hdVshfN7VSbuRsLu9b3qgbZQnJBfmIeWD9idrtNWd05/HlQwnfYoZdaGTf8SB2OpB
	DQbxwUg8vrNG7NvH3CaP0oP+czau6XTsuOLV8=
Received: by 10.14.133.141 with SMTP id q13mr465875eei.156.1303493281364; Fri,
	22 Apr 2011 10:28:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Fri, 22 Apr 2011 10:27:31 -0700 (PDT)
In-Reply-To: <6B8E23E1-B345-4127-BC51-A92612BE94FB@dominion.thruhere.net>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<0daf49a24c9ff05b60377dad60234107009efbdb.1303453279.git.sgw@linux.intel.com>
	<BANLkTiksRbTcCmjcJDeiK=dzhY01N=O6CA@mail.gmail.com>
	<6B8E23E1-B345-4127-BC51-A92612BE94FB@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Apr 2011 10:27:31 -0700
Message-ID: <BANLkTi=wNAZ2GG7PntqPXmQ3BGLgQwVD5w@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 28/33] python-pycairo: fix installation path of __init__.py
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
X-List-Received-Date: Fri, 22 Apr 2011 17:30:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2011 at 10:25 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 22 apr 2011, om 19:16 heeft Khem Raj het volgende geschreven:
>
>> On Fri, Apr 22, 2011 at 12:24 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>>
>>> This fixes Bug [YOCTO #477]
>>>
>>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> ---
>>> =C2=A0.../python/python-pycairo_1.8.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A08 +++++++-
>>> =C2=A01 files changed, 7 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb b/me=
ta/recipes-devtools/python/python-pycairo_1.8.10.bb
>>> index 7d73dc2..24b3ff2 100644
>>> --- a/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
>>> +++ b/meta/recipes-devtools/python/python-pycairo_1.8.10.bb
>>> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1 & MPLv1.1"
>>> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df2e071ab72978431b294a0=
d696327421"
>>> =C2=A0# cairo >=3D 1.8.8
>>> =C2=A0DEPENDS =3D "cairo"
>>> -PR =3D "ml0"
>>> +PR =3D "r1"
>>
>> any reason not to use mlX
>
> Because rX is a standard and mlX isn't

why did we use ml to start with then ?


