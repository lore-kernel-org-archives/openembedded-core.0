Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 310EB78AD9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 00:43:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w770hMxp024501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 Aug 2018 17:43:22 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.117]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0399.000;
	Mon, 6 Aug 2018 17:43:22 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] when is native.bbclass applied
Thread-Index: AdQt5RGZ/B8SRVL+TK+5W6otLsimWQAO82oA//+NLtg=
Date: Tue, 7 Aug 2018 00:43:21 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F3610638@ALA-MBD.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84F3610608@ALA-MBD.corp.ad.wrs.com>,
	<CAJ86T=UjPWPwr2_sM1vHz6kJ13OP9zOUP=xrhgtUZkjHfe6=gQ@mail.gmail.com>
In-Reply-To: <CAJ86T=UjPWPwr2_sM1vHz6kJ13OP9zOUP=xrhgtUZkjHfe6=gQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.214]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: when is native.bbclass applied
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
X-List-Received-Date: Tue, 07 Aug 2018 00:43:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I think it might.  This is distro related, I think.  Should distro's be foo=
ling with things like CXXFLAGS, and if so, how?=0A=
=0A=
________________________________________=0A=
From: Andre McCurdy [armccurdy@gmail.com]=0A=
Sent: Monday, August 06, 2018 5:33 PM=0A=
To: Slater, Joseph=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] when is native.bbclass applied=0A=
=0A=
On Mon, Aug 6, 2018 at 5:24 PM, Slater, Joseph <joe.slater@windriver.com> w=
rote:=0A=
> This class clobbers a number of things that might be manipulated in a=0A=
> recipe.  If, say, I want to add something to CXXFLAGS, what/where do I pu=
t=0A=
> it?  It looks like "_append" works, but "+=3D" might not.=0A=
=0A=
+=3D should work. Either way, "bitbake -e" will tell you the definitive ans=
wer.=0A=

