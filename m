Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RiUEi-0005kH-5B
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 18:02:48 +0100
Received: from mail150-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Wed, 4 Jan 2012 16:55:25 +0000
Received: from mail150-ch1 (localhost [127.0.0.1])	by
	mail150-ch1-R.bigfish.com (Postfix) with ESMTP id 67A8A2C02D1	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 16:55:25 +0000 (UTC)
X-SpamScore: -8
X-BigFish: VS-8(zz9371I936eK1432N98dKzz1202hzz8275dh92f2jz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail150-ch1 (localhost.localdomain [127.0.0.1]) by mail150-ch1
	(MessageSwitch) id 1325696125249626_27169;
	Wed,  4 Jan 2012 16:55:25 +0000 (UTC)
Received: from CH1EHSMHS005.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.240])	by mail150-ch1.bigfish.com (Postfix) with ESMTP id
	37A1F580046	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2012 16:55:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS005.bigfish.com
	(10.43.70.5) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 4 Jan 2012 16:55:24 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Wed, 4 Jan 2012 10:55:14 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] sstate compression
Thread-Index: AQHMyv5Fqkh967iiIk6cPo9OF6fMgw==
Date: Wed, 4 Jan 2012 16:55:13 +0000
Message-ID: <CAEsOVNeT9-OzfvQ6XLQrnuz9XS4bSkJjhxdLcTqQxJ7TK4x8Kw@mail.gmail.com>
References: <1325689535.28005.59.camel@phil-desktop>
	<1325691189.20759.14.camel@ted>
	<CAEsOVNcsY-dNYBz1Y6BVAQ-N7hVyaxOMcsniev9z455m9GYh5A@mail.gmail.com>
	<CABcZANmEZ6Oy6q7gL2WCCtphSA7fEHJsM0dre0tNpXvPdn2crQ@mail.gmail.com>
	<1325695277.28005.76.camel@phil-desktop>
	<1325695637.20759.32.camel@ted>
In-Reply-To: <1325695637.20759.32.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: sstate compression
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 04 Jan 2012 17:02:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D21A4B978317654595E11DD3549A5FF4@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2012 at 10:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-01-04 at 16:41 +0000, Phil Blundell wrote:
>> On Wed, 2012-01-04 at 09:32 -0700, Chris Larson wrote:
>> > Agreed. Sstate can get truly massive, being able to opt-into xz or
>> > something would be lovely for us as well.
>>
>> Yes, that would be nice. =A0xz does seem to compress nearly twice as wel=
l
>> as "gzip -9", though it takes about six times as long to do it. =A0(16M
>> and 55 seconds vs 28M and 9.5 seconds for my webkit testcase.)
>> Personally I don't care about the disk space as much as the build time,
>> but I can see that sstate could start to become quite unwieldy if you
>> have a lot of packages in there.
>>
>> Alternatively, maybe we could have sstate.bbclass accept multiple
>> compression types when reading (i.e. look for .tar.xz, .tar.gz, .tar.lzo
>> etc in turn), make it use the fastest reasonable compression when
>> generating the archives in the first place, and then folks who want to
>> either put them into long-term storage or send them over slow links can
>> post-process the sstate-cache by transcoding them into .xz or whatever
>> format.
>
> Just to note that looking for multiple versions can cause a fair bit of
> network traffic as for http:// mirror urls it will have to wget each in
> turn. Better would be one file name and dynamic detection of the
> compression format I guess.

The patch I submitted just looks for the type you have selected, so
there is no looking for gzip or xz sstate-cache. It just checks one,
like we currently do.

-M=



