Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC34960767
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 00:39:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9V0difI016445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Oct 2017 17:39:44 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.97]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0361.001;
	Mon, 30 Oct 2017 17:39:44 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Andre McCurdy
	<armccurdy@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] qemumips64: no qemu-usermode
	for n32
Thread-Index: AQHTTR8s0kMOz2Cf2U6eCCrAriSAYqL0Hs0AgADBOoCAAGWwgP//m4+ggAF+TSOAAIanAP//tZlggAFG8QCABUM3pg==
Date: Tue, 31 Oct 2017 00:39:43 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF448D37@ALA-MBC.corp.ad.wrs.com>
References: <20171024232359.63328-1-jslater@windriver.com>
	<CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
	<52a0c834-6e5f-3bbc-7e99-206607dab4a4@linux.intel.com>
	<CAJ86T=UV_XVjq6SEvc_9-46b1W+N_v6aBjvJOEorov5NYpTLcQ@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF437C9D@ALA-MBC.corp.ad.wrs.com>
	<007BD92917A2324FA403BCF9A464CF84CF43876F@ALA-MBC.corp.ad.wrs.com>
	<CAJ86T=XbzgBuJgs4s=8MphbTM4OLU5JqBA_pL7ABCkM49u80vA@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84CF438A56@ALA-MBC.corp.ad.wrs.com>,
	<96497d52-63c7-aac7-6645-e983e2e1e0cc@linux.intel.com>
In-Reply-To: <96497d52-63c7-aac7-6645-e983e2e1e0cc@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.207]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Tue, 31 Oct 2017 00:39:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could be a multilib issue.  I do see that these constructs work in a poky b=
uild environment.  Are there any "standard" configurations that enable mult=
ilib?  I am typically building in a (surprise!) Wind River build environmen=
t which does support multilib.=0A=
=0A=
Joe=0A=
________________________________________=0A=
From: Alexander Kanavin [alexander.kanavin@linux.intel.com]=0A=
Sent: Friday, October 27, 2017 2:13 AM=0A=
To: Slater, Joseph; Andre McCurdy=0A=
Cc: OE Core mailing list=0A=
Subject: Re: [OE-core] [oe-core][PATCH 1/1] qemumips64: no qemu-usermode fo=
r n32=0A=
=0A=
On 10/26/2017 11:51 PM, Slater, Joseph wrote:=0A=
> I think values for the BACKFILL_CONSIDERED can be used, but only if they =
are literals.  I don't think any variable expansion occurs when getVar() is=
 used at the point of backfilling.  I think the a better way of setting MAC=
HINE or DISTRO_FEATURES would be to directly append/remove  using overrides=
.  In any case, I do not believe any of the CONSIDERED definitions work.=0A=
=0A=
We use the same-style disabling of qemu-usermode in other machine=0A=
definitions (powerpc64, x86 x32), and they do seem to work there.=0A=
Something's not right here.=0A=
=0A=
=0A=
Alex=0A=

