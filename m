Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBD0L-00076j-3T
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 23:58:25 +0200
Received: from mail55-db3-R.bigfish.com (10.3.81.248) by
	DB3EHSOBE006.bigfish.com (10.3.84.26) with Microsoft SMTP Server id
	14.1.225.22; Tue, 4 Oct 2011 21:52:51 +0000
Received: from mail55-db3 (localhost.localdomain [127.0.0.1])	by
	mail55-db3-R.bigfish.com (Postfix) with ESMTP id CF6597D02FD	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 21:52:50 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail55-db3 (localhost.localdomain [127.0.0.1]) by mail55-db3
	(MessageSwitch) id 1317765170700477_29862;
	Tue,  4 Oct 2011 21:52:50 +0000 (UTC)
Received: from DB3EHSMHS016.bigfish.com (unknown [10.3.81.240])	by
	mail55-db3.bigfish.com (Postfix) with ESMTP id A279B18A8051	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 21:52:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS016.bigfish.com
	(10.3.87.116) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 4 Oct 2011 21:52:49 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Tue, 4 Oct 2011 16:52:49 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 10/16] Fix mdadm for powerpc64
Thread-Index: AQHMggIJ6+1og7PNnEGyLP1+hESaEJVrcnwAgAABBYCAAZwagA==
Date: Tue, 4 Oct 2011 21:52:48 +0000
Message-ID: <CAEsOVNdahRcHTCfVhaqFZiVaKhAtM2a6L6GTm61RtsGoJxjB6A@mail.gmail.com>
References: <1317322353-30258-1-git-send-email-msm@freescale.com>
	<4E8A0B81.1080507@gmail.com>
	<CAEsOVNcvCgboed7tx68aT_CemeN_pVd_k0JM_cWVDiMtRrCG0w@mail.gmail.com>
	<4E8A2667.4090700@gmail.com>
In-Reply-To: <4E8A2667.4090700@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH v2 10/16] Fix mdadm for powerpc64
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
X-List-Received-Date: Tue, 04 Oct 2011 21:58:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D2F86A1C5112134289296FF0DF4189CD@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 3, 2011 at 4:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> I can't find a log of this anywhere, it's probably the default
>> compiler warnings for our platform are different?
>
> It would be handy to understand them since I dont see gcc differentiating
> formats between ppc64 and x86_64 which both are 64bit hosts. But obviousl=
y
> there is something missing.

I finally got around to rerunning this without my patch and the errors
are below.

/.mdadm/failed-slots\" -DUSE_PTHREADS   -c -o mdmon.o mdmon.c
| powerpc64-fsl-linux-gcc -Wall -Werror -Wstrict-prototypes -Wextra
-Wno-unused-parameter -ggdb -DSendmail=3D\""/usr/sbin/sendmail -t"\"
-DCONFFILE=3D\"/etc/mdadm.conf\" -DCONFFILE2=3D\"/etc/mdadm/mdadm.conf\"
-DMAP_DIR=3D\"/dev/.mdadm\" -DMAP_FILE=3D\"map\"
-DMDMON_DIR=3D\"/dev/.mdadm\"
-DFAILED_SLOTS_DIR=3D\"/dev/.mdadm/failed-slots\" -DUSE_PTHREADS   -c -o
monitor.o monitor.c
| powerpc64-fsl-linux-gcc -Wall -Werror -Wstrict-prototypes -Wextra
-Wno-unused-parameter -ggdb -DSendmail=3D\""/usr/sbin/sendmail -t"\"
-DCONFFILE=3D\"/etc/mdadm.conf\" -DCONFFILE2=3D\"/etc/mdadm/mdadm.conf\"
-DMAP_DIR=3D\"/dev/.mdadm\" -DMAP_FILE=3D\"map\"
-DMDMON_DIR=3D\"/dev/.mdadm\"
-DFAILED_SLOTS_DIR=3D\"/dev/.mdadm/failed-slots\" -DUSE_PTHREADS   -c -o
managemon.o managemon.c
| super-intel.c: In function 'getinfo_super_imsm_volume':
| super-intel.c:2327:4: error: format '%llu' expects argument of type
'long long unsigned int', but argument 3 has type '__u64'
[-Werror=3Dformat]
| super-intel.c:2327:4: error: format '%llu' expects argument of type
'long long unsigned int', but argument 4 has type '__u64'
[-Werror=3Dformat]
| cc1: all warnings being treated as errors

-M=



