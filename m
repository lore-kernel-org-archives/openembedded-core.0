Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UCR78-0003dF-5h for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 09:51:22 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Mar 2013 00:34:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,778,1355126400"; d="scan'208";a="294390381"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2013 00:34:48 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.108]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.96]) with mapi id
	14.01.0355.002; Mon, 4 Mar 2013 08:34:47 +0000
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v3] btrfs-tools: added PV to git package recipe
Thread-Index: AQHOFp8uo36MmnpFMka+mkLEHNM/V5iRNbYAgAP/ru8=
Date: Mon, 4 Mar 2013 08:34:46 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3F2AF86@IRSMSX102.ger.corp.intel.com>
References: <1362157892-22060-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>,
	<5130FEE4.7050207@linux.intel.com>
In-Reply-To: <5130FEE4.7050207@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] btrfs-tools: added PV to git package recipe
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
X-List-Received-Date: Mon, 04 Mar 2013 08:51:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I rechecked the tags for the btrfs-tools package.=0A=
There was an error - I missed looking at the year=0A=
of the commits. We are currently before 0.20-rc1.=0A=
0.19 should be the current PV.=0A=
=0A=
Thanks,=0A=
Ema=0A=
________________________________________=0A=
From: Saul Wold [sgw@linux.intel.com]=0A=
Sent: Friday, March 01, 2013 9:17 PM=0A=
To: Ciobanu, Emilia Maria Silvia=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH v3] btrfs-tools: added PV to git package reci=
pe=0A=
=0A=
On 03/01/2013 09:11 AM, Emilia Ciobanu wrote:=0A=
> Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>=0A=
> ---=0A=
>   .../btrfs-tools/btrfs-tools_git.bb                 |    2 ++=0A=
>   1 file changed, 2 insertions(+)=0A=
>=0A=
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/=
recipes-devtools/btrfs-tools/btrfs-tools_git.bb=0A=
> index e963a74..df216b1 100644=0A=
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb=0A=
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb=0A=
> @@ -17,6 +17,8 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/=
git/mason/btrfs-progs.git;p=0A=
>=0A=
>   S =3D "${WORKDIR}/git"=0A=
>=0A=
> +PV =3D "0.19+git${SRCPV}"=0A=
> +=0A=
See my previous email, since we are currently beyond the 0.20-rc1 we=0A=
should indicated that in the version info as 0.20~rc1.=0A=
=0A=
Sau!=0A=
=0A=
>   PR =3D "r6"=0A=
>=0A=
>   SRC_URI +=3D " file://fix_use_of_gcc.patch \=0A=
>=0A=


