Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RiDhy-0000jY-5y
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 00:23:54 +0100
Received: by wibhq7 with SMTP id hq7so9716354wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2012 15:16:33 -0800 (PST)
Received: by 10.181.12.43 with SMTP id en11mr117955988wid.6.1325632593105;
	Tue, 03 Jan 2012 15:16:33 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f19sm36147636wbo.13.2012.01.03.15.16.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 15:16:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F037FA2.4050705@linux.intel.com>
Date: Wed, 4 Jan 2012 00:16:31 +0100
Message-Id: <59A8742A-65EA-4D16-A74D-ABEEFC62488C@dominion.thruhere.net>
References: <1325347496-9980-1-git-send-email-koen@dominion.thruhere.net>
	<4F037FA2.4050705@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] procps: raise update-alternatives priority
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
X-List-Received-Date: Tue, 03 Jan 2012 23:23:54 -0000
X-Groupsio-MsgNum: 15189
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C8D9A96C-0EE0-4B89-8D61-B45524B0A31C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C8D9A96C-0EE0-4B89-8D61-B45524B0A31C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 3 jan. 2012, om 23:22 heeft Saul Wold het volgende geschreven:

> On 12/31/2011 08:04 AM, Koen Kooi wrote:
>> This fixes a problem with the uptime utility:
>>=20
>> root@beagleboneA3-0088:/var/lib/cloud9# busybox uptime
>>  16:00:17 up 2 days,  6:46,  load average: 0.14, 0.04, 0.05
>> root@beagleboneA3-0088:/var/lib/cloud9# uptime.procps
>>  16:00:22 up 2 days,  6:46,  1 user,  load average: 0.14, 0.05, 0.06
>> root@beagleboneA3-0088:/var/lib/cloud9# uptime.coreutils
>>  16:00pm  up 4382 days 15:58,  1 user,  load average: 0.13, 0.05, =
0.05
>> root@beagleboneA3-0088:/var/lib/cloud9# ls /usr/bin/uptime -la
>> lrwxrwxrwx 1 root root 16 Dec 26 08:56 /usr/bin/uptime ->  =
uptime.coreutils
>>=20
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>  meta/recipes-extended/procps/procps_3.2.8.bb |    4 ++--
>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb =
b/meta/recipes-extended/procps/procps_3.2.8.bb
>> index d989955..6a41ccd 100644
>> --- a/meta/recipes-extended/procps/procps_3.2.8.bb
>> +++ b/meta/recipes-extended/procps/procps_3.2.8.bb
>> @@ -1,12 +1,12 @@
>>  require procps.inc
>>=20
>> -PR =3D "r3"
>> +PR =3D "r4"
>>=20
>>  inherit update-alternatives
>>=20
>>  ALTERNATIVE_LINKS =3D "${bindir}/top ${bindir}/uptime ${bindir}/free =
${bindir}/pkill ${bindir}/pmap \
>>                       ${base_bindir}/kill ${base_sbindir}/sysctl =
${base_bindir}/ps"
>> -ALTERNATIVE_PRIORITY =3D "90"
>> +ALTERNATIVE_PRIORITY =3D "110"
>>=20
>>  SRC_URI +=3D "file://procmodule.patch \
>>              file://psmodule.patch \
>=20
> Merged to OE-Core.
>=20
> Is there a bug filed against coreutils uptime?

Not yet, but systemd suffers from the same, I'm going to look into it =
after the holidays and pester Karel and Lennart, they are both in =
#systemd :)=

--Apple-Mail=_C8D9A96C-0EE0-4B89-8D61-B45524B0A31C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk8DjE8ACgkQMkyGM64RGpFb/ACgizBryRzmwbyP8I9+8G/XmSSC
IL4AoJrXQ4v/re109M/QIdgkyiosac1P
=wFF8
-----END PGP SIGNATURE-----

--Apple-Mail=_C8D9A96C-0EE0-4B89-8D61-B45524B0A31C--
