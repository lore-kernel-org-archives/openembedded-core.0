Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QfI3S-00087r-OY
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 22:53:42 +0200
Received: by bwf20 with SMTP id 20so2380576bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 13:49:50 -0700 (PDT)
Received: by 10.204.7.85 with SMTP id c21mr532659bkc.260.1310158189777;
	Fri, 08 Jul 2011 13:49:49 -0700 (PDT)
Received: from [10.87.31.240] ([80.187.195.39])
	by mx.google.com with ESMTPS id ld17sm360636bkb.21.2011.07.08.13.49.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 13:49:49 -0700 (PDT)
References: <cover.1310080780.git.jessica.zhang@intel.com>
	<1310142693.20015.906.camel@rex> <4E174E52.2@mentor.com>
	<C6510F6D410BB64A8C15398EDC6B847C02A284@ORSMSX101.amr.corp.intel.com>
From: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: iPhone Mail (8J2)
In-Reply-To: <C6510F6D410BB64A8C15398EDC6B847C02A284@ORSMSX101.amr.corp.intel.com>
Message-Id: <7A271CF8-4DB2-43E9-9FC2-860A9ACD3649@dominion.thruhere.net>
Date: Fri, 8 Jul 2011 22:49:40 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (iPhone Mail 8J2)
Subject: Re: [PATCH 0/1] [bug 1195] site/mips-common: Cache	cvs_cv_func_printf_ptr
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
X-List-Received-Date: Fri, 08 Jul 2011 20:53:42 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have a crude merged version of siteinfo.bbclass in meta-oe, any volunteers=
 to have =C3=A0 look at the differences?

Op 8 jul. 2011 om 21:07 heeft "Zhang, Jessica" <jessica.zhang@intel.com> het=
 volgende geschreven:

> We only have arm-common, common, ix86-common, mips-common, powerpc-common,=
 sh-common under site, no Linux-common or glibc-common, and it's defined in a=
ll the arches-common files except mips-common.
>=20
> Thanks,
> Jessica
>=20
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedde=
d-core-bounces@lists.openembedded.org] On Behalf Of Tom Rini
> Sent: Friday, July 08, 2011 11:37 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/1] [bug 1195] site/mips-common: Cache cvs_=
cv_func_printf_ptr
>=20
> On 07/08/2011 09:31 AM, Richard Purdie wrote:
>> On Thu, 2011-07-07 at 16:23 -0700, Jessica Zhang wrote:
>>> The following changes since commit c412674cf818e77e35857fb93353e392e7ac9=
e53:
>>>  Khem Raj (1):
>>>        package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "=
0"
>>>=20
>>> are available in the git repository at:
>>>=20
>>>  git://git.yoctoproject.org/poky-contrib jzhang/1195
>>>  http://git.yoctoproject.org/cgit.cgi//log/?h=3Djzhang/1195
>>>=20
>>> Khem Raj (1):
>>>  [bug 1195] site/mips-common: Cache cvs_cv_func_printf_ptr
>>=20
>> Merged to master, thanks.
>=20
> Late again and my fault this time but why is this in site/mips-common
> and not site/linux-common or glibc-common?
>=20
> --
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


