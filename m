Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIKWR-0007QF-N4
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 15:24:59 +0200
Received: by wyg19 with SMTP id 19so6341917wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 06:19:02 -0700 (PDT)
Received: by 10.216.221.228 with SMTP id r78mr3197135wep.31.1319462342742;
	Mon, 24 Oct 2011 06:19:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fi11sm38974811wbb.9.2011.10.24.06.19.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 06:19:01 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1319462157.25011.1.camel@ted>
Date: Mon, 24 Oct 2011 15:19:00 +0200
Message-Id: <91421698-3BCA-4B52-8C7C-AD842A2E62FB@dominion.thruhere.net>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<6038b7e0961ca4aec70cc6de8adbc79567500e2b.1319394187.git.sgw@linux.intel.com>
	<1319462157.25011.1.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [CONSOLIDATED PULL 11/27] pulseaudio-0.9.23: inherit perlnative to work around build on host without XML/Parser.pm
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
X-List-Received-Date: Mon, 24 Oct 2011 13:24:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 okt. 2011, om 15:15 heeft Richard Purdie het volgende geschreven:

> On Sun, 2011-10-23 at 11:26 -0700, Saul Wold wrote:
>> From: Martin Jansa <Martin.Jansa@gmail.com>
>>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>> index 33f5e15..4ac2418 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>> @@ -4,7 +4,7 @@ PR =3D "r5"
>>=20
>> DEPENDS +=3D "gdbm speex"
>>=20
>> -inherit gettext
>> +inherit gettext perlnative
>=20
> This doesn't look right. If we need xmlparser, we should state that in
> DEPENDS. If that is added to DEPENDS, I'm not sure we still need the
> inherit of perlnative?

If you need xmlparser during the build you almost always need the =
perlnative wrapper as well :(

regards,

Koen=


