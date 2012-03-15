Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S8D51-00075C-7E
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 16:59:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 08:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129376368"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 08:50:19 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 15 Mar 2012 08:50:19 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.199]) with mapi id
	14.01.0355.002; Thu, 15 Mar 2012 08:50:19 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 8/8] gcc: enable multilib for target gcc
Thread-Index: AQHNAk+1sXsM6mJfx0aJt6kFIEQGKpZrG0YAgABmkPA=
Date: Thu, 15 Mar 2012 15:50:18 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137660D@ORSMSX106.amr.corp.intel.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
	<ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
	<513484b0dacc94af1730ddf919b88f57adc63f53.1331776832.git.nitin.a.kamble@intel.com>
	<CAEsOVNceckzotWC3xA9emHbW3aW8DxBk_zArYN1KHhn3anUQ1g@mail.gmail.com>
In-Reply-To: <CAEsOVNceckzotWC3xA9emHbW3aW8DxBk_zArYN1KHhn3anUQ1g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] gcc: enable multilib for target gcc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 15 Mar 2012 15:59:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> McClintock Matthew-B29882
> Sent: Wednesday, March 14, 2012 7:43 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 8/8] gcc: enable multilib for target gcc
>=20
> On Wed, Mar 14, 2012 at 9:02 PM,  <nitin.a.kamble@intel.com> wrote:
> > =A0 ${libdir}/${TARGET_SYS}/${BINV}/crt* \
> > + =A0${libdir}/${TARGET_SYS}/${BINV}/32 \
> > + =A0${libdir}/${TARGET_SYS}/${BINV}/x32 \
> > + =A0${libdir}/${TARGET_SYS}/${BINV}/n32 \
>=20
> Would ${libdir}/${TARGET_SYS}/${BINV}/64 ever exist?
>=20
> -M

It will exist. Thanks for catching this.

Nitin


