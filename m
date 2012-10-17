Received: from mail2.gamestop.com ([12.25.107.29]
	helo=gsironport2.gamestop.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <PatrickTurley@gamestop.com>) id 1TOHje-0007p5-Gl
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 02:43:46 +0200
X-IronPort-AV: E=Sophos;i="4.80,595,1344229200"; 
   d="scan'208";a="232392"
Received: from unknown (HELO GV1HQPEX01.babgsetc.pvt) ([172.22.1.244])
	by gsironport2.gamestop.com with ESMTP; 16 Oct 2012 19:29:23 -0500
Received: from GV1HQPEX03.babgsetc.pvt ([169.254.1.3]) by
	GV1HQPEX01.babgsetc.pvt ([172.22.1.191]) with mapi id 14.02.0283.003;
	Tue, 16 Oct 2012 19:29:23 -0500
From: Patrick Turley <PatrickTurley@gamestop.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] lmsensors: Initial commit.
Thread-Index: AQHNq+fnJx+SfKyedkyzZYLNU8Ljf5e82bOAgAAOHoCAABEYAA==
Date: Wed, 17 Oct 2012 00:29:21 +0000
Message-ID: <242F788A-5F02-496B-B9DF-F8F3B0633992@gamestop.com>
References: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
	<1350424046-18863-2-git-send-email-ferlandm@sonatest.com>
	<20121016223739.GB3405@jama.jama.net> <71077863.US7FUzvX2E@helios>
In-Reply-To: <71077863.US7FUzvX2E@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.1.244]
MIME-Version: 1.0
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lmsensors: Initial commit.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 00:43:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48623E531593FB4F88D063920A277FBC@gamestop.com>
Content-Transfer-Encoding: quoted-printable

On Oct 16, 2012, at 6:28 PM, Paul Eggleton <paul.eggleton@linux.intel.com> =
wrote:

> On Wednesday 17 October 2012 00:37:39 Martin Jansa wrote:
>> On Tue, Oct 16, 2012 at 05:47:26PM -0400, Marc Ferland wrote:
>>> Adds the lm_sensors applications. These consists of:
>> Is it really needed in oe-core? why not meta-oe?
>=20
> I'm thinking meta-oe is the place for this. As a bonus, rrdtool is alread=
y=20
> there.

I am not qualified to have an opinion either way - but I *am* curious about=
 the motivating rationale. What are the reasons that this should appear in =
meta-oe?



