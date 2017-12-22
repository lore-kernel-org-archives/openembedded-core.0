Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B62EB788C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 23:50:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBMNoS0S019742
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 22 Dec 2017 15:50:28 -0800
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.62]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Fri, 22 Dec 2017 15:50:27 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "BURTON, ROSS"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] liberation-fonts: do not
	inherit allarch
Thread-Index: AQHTeqHs/2cOO7TH702yWxiplkuaAaNO5uWA//+PSxCAARnrgIAAea5X
Date: Fri, 22 Dec 2017 23:50:27 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84D87A2239@ALA-MBC.corp.ad.wrs.com>
References: <20171221212318.242658-1-jslater@windriver.com>
	<1513895309.16507.97.camel@linuxfoundation.org>
	<007BD92917A2324FA403BCF9A464CF84D87A1EE0@ALA-MBC.corp.ad.wrs.com>,
	<d3dc9e70-694e-5b41-1583-fa8b18bdc6f4@linux.intel.com>
In-Reply-To: <d3dc9e70-694e-5b41-1583-fa8b18bdc6f4@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.215]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] liberation-fonts: do not inherit allarch
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
X-List-Received-Date: Fri, 22 Dec 2017 23:50:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I tried the patch to the allarch class and the problem does away.    Joe=0A=
________________________________________=0A=
From: Alexander Kanavin [alexander.kanavin@linux.intel.com]=0A=
Sent: Friday, December 22, 2017 12:34 AM=0A=
To: Slater, Joseph; Richard Purdie; openembedded-core@lists.openembedded.or=
g; BURTON, ROSS=0A=
Subject: Re: [OE-core] [oe-core][PATCH 1/1] liberation-fonts: do not inheri=
t allarch=0A=
=0A=
On 12/22/2017 02:00 AM, Slater, Joseph wrote:=0A=
> A number of postinstall's run target binaries, whether on the host or=0A=
> target.  This means they invoke qemu on the host and try to tell it=0A=
> where bits are.  I think it might not be necessary to pass explicit=0A=
> information about library locations to qemu, but that is the way it=0A=
> is done, and that information is arch dependent.  It might well be=0A=
> the case that "confusion" occurs only when multilib is enabled, but=0A=
> the point is that it does happen.=0A=
=0A=
I think Ross had a different patch to deal with the multilib-qemu libray=0A=
confusion, so this might not yet be necessary.=0A=
=0A=
Also, if this needs to be fixed, you need to fix it everywhere -=0A=
cantarell-fonts, adwaita-icon-theme, etc. etc.=0A=
=0A=
Alex=0A=

