Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TvDF1-000095-Vu
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:36:30 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jan 2013 12:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="244290596"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by azsmga001.ch.intel.com with ESMTP; 15 Jan 2013 12:20:48 -0800
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.60]) by
	IRSMSX104.ger.corp.intel.com ([169.254.5.151]) with mapi id
	14.01.0355.002; Tue, 15 Jan 2013 20:18:06 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH V4 2/3] connman-conf: configures connman in
	qemu machines
Thread-Index: AQHN81wtEeC3f6EZ2E6+BuI9v9mtv5hK04oAgAAANKA=
Date: Tue, 15 Jan 2013 20:18:06 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161E02B1@IRSMSX101.ger.corp.intel.com>
References: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
	<1358280527-14078-3-git-send-email-cristian.iorga@intel.com>
	<CAP9ODKpNzcW7qtqC5WX7EP6OZBLBpKPLn_S1zsguZkcjgvz3Kw@mail.gmail.com>
In-Reply-To: <CAP9ODKpNzcW7qtqC5WX7EP6OZBLBpKPLn_S1zsguZkcjgvz3Kw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 2/3] connman-conf: configures connman in qemu machines
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
X-List-Received-Date: Tue, 15 Jan 2013 20:36:32 -0000
X-List-Received-Date: Tue, 15 Jan 2013 20:36:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It didn't during my tests.
But I might be wrong.
Please let me know if there are such warnings.

Thanks,
Cristian

-----Original Message-----
From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On Behal=
f Of Otavio Salvador
Sent: Tuesday, January 15, 2013 10:16 PM
To: Iorga, Cristian
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH V4 2/3] connman-conf: configures connman in q=
emu machines

On Tue, Jan 15, 2013 at 6:08 PM, Cristian Iorga <cristian.iorga@intel.com> =
wrote:
> For qemu machines, connman should not configure virtual wired=20
> interfaces. Wired interfaces (eth0) are assigned static IP addresses=20
> by the virtual machine manager (qemu). This packages places the eth0=20
> interface in a list of blacklisted interfaces, forbiding connman=20
> administering wired interfaces for qemu machines.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>

I think this will raise a warning durig build for non-qemu machines, no?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


