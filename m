Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UdJG7-0001Lr-Fe for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 13:55:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2013 04:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,691,1363158000"; d="scan'208";a="338893097"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2013 04:37:20 -0700
Received: from irsmsx105.ger.corp.intel.com (163.33.3.28) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 17 May 2013 12:37:19 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.193]) by
	IRSMSX105.ger.corp.intel.com ([169.254.7.3]) with mapi id
	14.03.0123.003; Fri, 17 May 2013 12:37:18 +0100
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] connman-gnome: fixed DHCP segfault
Thread-Index: AQHOUujsKytUZ+Aj/Ua0zmdTn5OS3JkJIpWAgAAYAPA=
Date: Fri, 17 May 2013 11:37:18 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B301905439@IRSMSX102.ger.corp.intel.com>
References: <1368786726-32071-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>,
	<CAJTo0LaQjm-EukLTCYCMqCXT426L9qGJ69WoQ1NgacthBBecgA@mail.gmail.com>
In-Reply-To: <CAJTo0LaQjm-EukLTCYCMqCXT426L9qGJ69WoQ1NgacthBBecgA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman-gnome: fixed DHCP segfault
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
X-List-Received-Date: Fri, 17 May 2013 11:56:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
When using manual ip the ipv4_config structure has all fields populated and=
 this condition=0A=
is skipped. The only case when the data structure fields are NULL is when w=
e have=0A=
DHCP settings and for different reasons network configurations are not done=
. In this=0A=
case, connman automatically renews the ipv4 configurations in less than a m=
inute.=0A=
Ethernet manual configuration behavior remains unchanged after this fix.=0A=
=0A=
Thanks,=0A=
Ema=0A=
________________________________________=0A=
From: Burton, Ross [ross.burton@intel.com]=0A=
Sent: Friday, May 17, 2013 1:52 PM=0A=
To: Ciobanu, Emilia Maria Silvia=0A=
Cc: openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] connman-gnome: fixed DHCP segfault=0A=
=0A=
On 17 May 2013 11:32, Emilia Ciobanu=0A=
<emilia.maria.silvia.ciobanu@intel.com> wrote:=0A=
> +-      if (g_str_equal(ipv4_config.method, "dhcp") =3D=3D TRUE)=0A=
> ++      if (!ipv4_config.method || g_str_equal(ipv4_config.method, "dhcp"=
) =3D=3D TRUE)=0A=
=0A=
Is this really the right behaviour if IPv4.Method isn't set?=0A=
=0A=
Ross=0A=


