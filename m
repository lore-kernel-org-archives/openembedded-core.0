Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RiBIw-0004MC-1w
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 21:49:54 +0100
Received: from mail17-tx2-R.bigfish.com (10.9.14.253) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.23; Tue, 3 Jan 2012 20:42:08 +0000
Received: from mail17-tx2 (localhost [127.0.0.1])	by mail17-tx2-R.bigfish.com
	(Postfix) with ESMTP id 8E98A802AD	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2012 20:42:08 +0000 (UTC)
X-SpamScore: -7
X-BigFish: VS-7(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9k61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail17-tx2 (localhost.localdomain [127.0.0.1]) by mail17-tx2
	(MessageSwitch) id 1325623300920267_23017;
	Tue,  3 Jan 2012 20:41:40 +0000 (UTC)
Received: from TX2EHSMHS027.bigfish.com (unknown [10.9.14.254])	by
	mail17-tx2.bigfish.com (Postfix) with ESMTP id DAF4F6A0049	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2012 20:41:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS027.bigfish.com
	(10.9.99.127) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 3 Jan 2012 20:41:40 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Tue, 3 Jan 2012 14:41:34 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] libxml2: add shared library version info to
	libxml shared libraries
Thread-Index: AQHMyjO3mZh1rlZoh0i2AKZGEAsoTpX7S0yAgAA074A=
Date: Tue, 3 Jan 2012 20:41:33 +0000
Message-ID: <CAEsOVNckK45BqWw-xtKJ6ppVv2UoZNU6u3-SKb03RD1vKOou0Q@mail.gmail.com>
References: <1325541916-22423-1-git-send-email-msm@freescale.com>
	<20120102232228.GA3958@jama.jama.net>
	<20120102232521.GB3958@jama.jama.net>
	<CAEsOVNcUdhic5Wt=r9XEb1SRmWw7+8Tn+4pWyB4Xdj4Mmv7+Lg@mail.gmail.com>
	<20120103173143.GG3958@jama.jama.net>
In-Reply-To: <20120103173143.GG3958@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH] libxml2: add shared library version info to libxml shared libraries
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
X-List-Received-Date: Tue, 03 Jan 2012 20:49:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D9251B829A40964FA109B4078A5667E3@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 3, 2012 at 11:31 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Jan 03, 2012 at 04:21:16PM +0000, McClintock Matthew-B29882 wrote=
:
>> On Mon, Jan 2, 2012 at 5:25 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> > On Tue, Jan 03, 2012 at 12:22:28AM +0100, Martin Jansa wrote:
>> >> On Mon, Jan 02, 2012 at 04:05:16PM -0600, Matthew McClintock wrote:
>> >> > This fixes an issue with RPM where it checks version imformation fo=
r
>> >> > binaries linked against libxml and fails because it's missing info
>> >> >
>> >> > | error: Failed dependencies:
>> >> > | =A0 =A0 =A0 =A0 =A0 =A0 =A0libxml2.so.2(LIBXML2_2.6.0) is needed =
by fmc-0.9.7+2-r2.1.ppce500mc
>> >> > | =A0 =A0 =A0 =A0 =A0 =A0 =A0libxml2.so.2(LIBXML2_2.4.30) is needed=
 by fmc-0.9.7+2-r2.1.ppce500mc
>> >> > | ERROR: Function 'do_rootfs' failed (see
>> >> >
>> >> > Note: fmc is just an example recipe/name
>> >>
>> >> Weird that I haven't noticed this in oe-core before, but probably
>> >> because in oe-core it was always without version. But it looks the sa=
me
>> >> as this
>> >> http://git.openembedded.org/openembedded/commit/?id=3D50ed401cdaaefb1=
f5ac33de2838af259a52b1c3a
>> >> so
>>
>> You won't see this when building against oe-core stuff from source.
>> This issue is seen when we bring in a prebuilt binary and link against
>> libxml2 in the system.
>
> what about all binaries built before this change which are already
> available in binary feed created with OE?

If you are building from source within oe-core everything is going to
link against the version built by oe-core. I see this issue when I
bring in some prebuilt binary and it's actually linked against an
older version of libxml2.

-M=



