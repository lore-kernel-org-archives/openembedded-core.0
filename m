Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QR145-0004A4-RK
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 13:55:21 +0200
Received: by wwi18 with SMTP id 18so1541206wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2011 04:52:13 -0700 (PDT)
Received: by 10.217.6.198 with SMTP id y48mr2510717wes.81.1306756333063;
	Mon, 30 May 2011 04:52:13 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k10sm2437980wed.28.2011.05.30.04.52.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 04:52:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DE34B8D.5080907@eukrea.com>
Date: Mon, 30 May 2011 13:52:10 +0200
Message-Id: <52C5B1F0-9BDF-46F7-A8BC-2AB020E0E47A@dominion.thruhere.net>
References: <53EA452E-5E40-471F-8AF7-BE8303945241@dominion.thruhere.net>	<4DE34507.2090107@eukrea.com>
	<C74466A4-5C79-4E68-8D19-443498EF130E@dominion.thruhere.net>
	<4DE34B8D.5080907@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Any volunteers for fixing all the kernel version	checks?
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
X-List-Received-Date: Mon, 30 May 2011 11:55:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 mei 2011, om 09:47 heeft Eric B=E9nard het volgende geschreven:

> On 30/05/2011 09:33, Koen Kooi wrote:
>>=20
>> Op 30 mei 2011, om 09:19 heeft Eric B=E9nard het volgende geschreven:
>>=20
>>> Hi,
>>>=20
>>> On 30/05/2011 08:52, Koen Kooi wrote:
>>>> As some of you might have seen already: =
http://lwn.net/Articles/445223/ - linux 3.0 is going to happen.
>>>>=20
>>>> This means all the crufty "is it 2.4 or 2.6" checks are going to =
need a rework :)
>>>=20
>>> Does supporting 2.4 kernels still makes sense in 2011 ?
>>=20
>> No, but I bet there are still checks present for that :) Or at least =
references like modprobe.26.
>=20
> so can the fix be : remove any reference to the check and assume we =
are using a 2.6/3.0 kernel ?

That would get my vote!

regards,

Koen=


