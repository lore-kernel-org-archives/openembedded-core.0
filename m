Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.47])
	by mail.openembedded.org (Postfix) with ESMTP id 200EE6E64A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 10:24:16 +0000 (UTC)
Received: from 1bk7MV-0002IS-Tc by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1bk7MV-0002JD-Uv; Wed, 14 Sep 2016 03:24:15 -0700
Received: by emcmailer; Wed, 14 Sep 2016 03:24:15 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1bk7MV-0002IS-Tc; Wed, 14 Sep 2016 03:24:15 -0700
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0294.000; Wed, 14 Sep 2016 12:24:14 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] CVE-2016-3116: dropbear: X11 forwarding input not
	validated properly
Thread-Index: AdIOYyPZHhBXSrHHRzyIt14w/L4j7P//5uOAgAAKGgCAAARbgP//3D9Q
Date: Wed, 14 Sep 2016 10:24:14 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48ABE3BB09@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E48ABE3BA3B@SESTOEX04.enea.se>
	<37af20ca-62f9-7308-0b97-6ba6c46dafb1@linux.intel.com>
	<1473846188.7207.57.camel@linuxfoundation.org>
	<fd30a088-4a2f-9e4b-1289-d5bababdc3e2@linux.intel.com>
In-Reply-To: <fd30a088-4a2f-9e4b-1289-d5bababdc3e2@linux.intel.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: CVE-2016-3116: dropbear: X11 forwarding input not validated properly
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
X-List-Received-Date: Wed, 14 Sep 2016 10:24:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> >> That said, I vote for updating to the version that comes with the
> >> fix.
> >> Backporting fixes should not be the default in the stable yocto
> >> releases; we should trust the upstream more.
> >
> > Taking that argument to the extreme, we should update all versions in
> > the "stable" release to the latest to ensure we get all the fixes. At
> > that point, it becomes no different to master and its not the
> > definition of "stable" which most people want to use.
>=20
> But I'm not making this argument at all. What I'm saying, is that master
> branch and stable branches are two different extremes with their own
> problems (one is moving too fast, the other is conservative to a fault), =
and
> we should try to find a sensible middle ground between them.
>=20
> > In this case, its a question of what else changed in dropbear between
> > these versions. Were there a ton of new features or was it just
> > bugfixes? How much risk of other problems is there?
>=20
> In this case, the only difference between 2015.71 and 2016.72 is indeed
> the CVE fix commit:
> https://secure.ucc.asn.au/hg/dropbear/graph
>=20
> (you need to scroll down some to see it in the graph).


Thanks guys for your feedbacks. I agree that by default we shouldn't upgrad=
e package=20
versions in stable branches as far as possible but sometimes we have to. If=
 there isn't a=20
suitable patch I personally prefer upgrading (only if it is minor changes) =
rather than=20
sticking to a vulnerable version. We have done this in the past e.g. for Op=
enSSL (from=20
1.0.1x to 1.0.1y).=20

I will do some investigation to find out if https://secure.ucc.asn.au/hg/dr=
opbear/rev/a3e8389e01ff=20
is the fix for CVE-2016-3116 (by quick analysis it looks the right patch) a=
nd use that patch and NOT=20
upgrade the dropbear version in krogoth !!

Thanks
//Sona

