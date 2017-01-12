Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.33])
	by mail.openembedded.org (Postfix) with ESMTP id 7B48A600E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 11:34:06 +0000 (UTC)
Received: from 1cRdds-0002bf-Vw by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1cRddt-0002cJ-TU; Thu, 12 Jan 2017 03:34:05 -0800
Received: by emcmailer; Thu, 12 Jan 2017 03:34:05 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1cRdds-0002bf-Vw; Thu, 12 Jan 2017 03:34:04 -0800
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0319.002; Thu, 12 Jan 2017 12:34:04 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH][morty] libxtst: 1.2.2 -> 1.2.3
Thread-Index: AQHSazSAc5fBqB0n/EGOVf8znZEj5KEzSNUAgAEaRRA=
Date: Thu, 12 Jan 2017 11:34:03 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48AC10E985@SESTOEX04.enea.se>
References: <1484046651-61364-1-git-send-email-sona.sarmadi@enea.com>
	<e5f879c8-8ea6-d2a6-0e4f-9da16d838f6b@gmail.com>
In-Reply-To: <e5f879c8-8ea6-d2a6-0e4f-9da16d838f6b@gmail.com>
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
Subject: Re: [PATCH][morty] libxtst: 1.2.2 -> 1.2.3
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
X-List-Received-Date: Thu, 12 Jan 2017 11:34:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> On 01/10/2017 03:10 AM, Sona Sarmadi wrote:
> > Upgrade libxtst from 1.2.2 to 1.2.3 to address:
> What else changed in this update?
> - armin

Hi Armin,

I believe the only changes between 1.2.2 and 1.2.3 is one commit=20
" Remove fallback for _XEatDataWords, require libX11 1.6 for it" see below:

https://cgit.freedesktop.org/xorg/lib/libXtst/
Age	Commit message	Author	Files	Lines
2016-10-04	libXtst 1.2.3	HEADlibXtst-1.2.3master	Matthieu Herrb	1	-1/+1
2016-09-25	Out of boundary access and endless loop in libXtst	Tobias Stoeck=
mann	1	-4/+39
2013-11-23	Remove fallback for _XEatDataWords, require libX11 1.6 for it	Mi=
chael Joost	2	-18/+1
2013-05-31	libXtst 1.2.2libXtst-1.2.2

//Sona




