Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T3tP4-0003vF-HY
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:42:15 +0200
Received: from mail94-tx2-R.bigfish.com (10.9.14.236) by
	TX2EHSOBE015.bigfish.com (10.9.40.35) with Microsoft SMTP Server id
	14.1.225.23; Tue, 21 Aug 2012 17:59:54 +0000
Received: from mail94-tx2 (localhost [127.0.0.1])	by mail94-tx2-R.bigfish.com
	(Postfix) with ESMTP id 094C61402D1;
	Tue, 21 Aug 2012 17:59:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz98dI9371I1432Izz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hf0ah107ah10d2hbe9i)
Received: from mail94-tx2 (localhost.localdomain [127.0.0.1]) by mail94-tx2
	(MessageSwitch) id 1345571992943190_9378;
	Tue, 21 Aug 2012 17:59:52 +0000 (UTC)
Received: from TX2EHSMHS031.bigfish.com (unknown [10.9.14.252])	by
	mail94-tx2.bigfish.com (Postfix) with ESMTP id DAA8F360050;
	Tue, 21 Aug 2012 17:59:52 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS031.bigfish.com
	(10.9.99.131) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 21 Aug 2012 17:59:52 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.41]) by
	039-SN1MMR1-005.039d.mgd.msft.net ([::1]) with mapi id 14.02.0309.003;
	Tue, 21 Aug 2012 12:59:52 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] kmod-native_git.bb: fix builds for hosts
	with older libc
Thread-Index: AQHNf8YH40JdCKhtsEicym6VlWG4D5dk4bEA
Date: Tue, 21 Aug 2012 17:59:51 +0000
Message-ID: <CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
In-Reply-To: <CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 18:42:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <745C302E362DCE41866A2B7F742A1D0B@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock <msm@freescale.com> w=
rote:
>> +
>> +do_configure_prepend (){
>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
>> +               export CFLAGS=3D"$CFLAGS -D O_CLOEXEC=3D0"
>> +       fi
>> +}
>
>
> IMO It would be safer to create a patch for kmod itself where you
> define O_CLOEXEC if it
> was not defined before. The above seems a bit risky

Why is it risky? I only wanted to do this for affected systems. There
is not an easy way to do this with a patch, unless of course I apply
the patch manually.

-M=



