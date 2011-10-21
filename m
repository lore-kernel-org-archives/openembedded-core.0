Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RHHP9-0007s1-3V
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 17:53:07 +0200
Received: by eyd9 with SMTP id 9so4162712eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:47:12 -0700 (PDT)
Received: by 10.213.35.208 with SMTP id q16mr3217850ebd.104.1319212031772;
	Fri, 21 Oct 2011 08:47:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q50sm35996434eef.9.2011.10.21.08.47.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 08:47:11 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
Date: Fri, 21 Oct 2011 17:47:05 +0200
Message-Id: <5F4713F7-993A-4517-808C-E26273A03E5F@dominion.thruhere.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
	<CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/8] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 15:53:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 okt. 2011, om 17:40 heeft Khem Raj het volgende geschreven:

> On Fri, Oct 21, 2011 at 1:17 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  .../pulseaudio/pulseaudio_0.9.23.bb                |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>> index 4ac2418..2f872b8 100644
>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
>> @@ -23,3 +23,4 @@ do_compile_prepend() {
>>     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
>>  }
>>=20
>> +ARM_INSTRUCTION_SET =3D "arm"
>=20
> not averse to patch but it would be nice to know what fails in thumb =
mode.

And pulse is at 1.1 now, maybe upstream has fixed this issue.




