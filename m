Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1RgZNe-0001v6-41
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 11:08:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Dec 2011 01:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="101607653"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2011 01:59:40 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 30 Dec 2011 17:59:38 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.38]) with mapi id
	14.01.0355.002; Fri, 30 Dec 2011 17:59:36 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] can't install eclipse plugin
Thread-Index: AQHMw7NTQQakbQZPZUSFhuEdCBBAPJXvjCGAgAQVLwCAAIo2EA==
Date: Fri, 30 Dec 2011 09:59:35 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC010BD1@SHSMSX102.ccr.corp.intel.com>
References: <1324892695.4637.10.camel@localhost.localdomain>
	<C6510F6D410BB64A8C15398EDC6B847C2401E62B@ORSMSX102.amr.corp.intel.com>
	<1325238178.4637.61.camel@localhost.localdomain>
In-Reply-To: <1325238178.4637.61.camel@localhost.localdomain>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: can't install eclipse plugin
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
X-List-Received-Date: Fri, 30 Dec 2011 10:08:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Qinliang,

You might need to update the lttng to 0.4.0 in Eclipse through http://downl=
oad.eclipse.org/technology/linuxtools/update first.

Best Regards,
Lianhao

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-bounces@lists.openembedded.org] On Behalf
> Of Ni Qingliang
> Sent: Friday, December 30, 2011 5:43 PM
> To: Zhang, Jessica
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] can't install eclipse plugin
>=20
> no luck:(
>=20
> my lttng is 0.3.1, where is the 0.4.0?
> the error is :
>=20
> Cannot complete the install because one or more required items could not
> be found.
>   Software being installed: Yocto Plugin for Eclipse 1.1.0.201112291418
> (org.yocto.sdk.feature.group 1.1.0.201112291418)
>   Missing requirement: Yocto Project Plugin Remote Tools
> 1.1.0.201112291418 (org.yocto.sdk.remotetools 1.1.0.201112291418)
> requires 'bundle org.eclipse.linuxtools.tmf.core 0.4.0' but it could not
> be found
>   Cannot satisfy dependency:
>     From: Yocto Plugin for Eclipse 1.1.0.201112291418
> (org.yocto.sdk.feature.group 1.1.0.201112291418)
>     To: org.yocto.sdk.remotetools 0.0.0
>=20
>=20
> On Wed, 2011-12-28 at 03:22 +0800, Zhang, Jessica wrote:
> > Hi Qingliang,
> >
> > How did you install the LinuxTools?  For the latest Eclipse plug-in, it=
 uses the built-in Lttng-viewer so the dependency is introduced.  You
> just need to go under Help->install new software Select the Indigo update=
 site: http://download.eclipse.org/releases.indigo, and select its
> Linux Tracing Toolkit Integration, that should bring in all the dependenc=
y.
> >
> > Also, you need to install the Lttng parser library and start eclipse wi=
th LD_LIBRARY_PATH by following the direction from the Lttng wiki
> http://wiki.eclipse.org/Linux_Tools_Project/LTTng.
> >
> > - Jessica
> >
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org [mailto:openembe=
dded-core-bounces@lists.openembedded.org] On
> Behalf Of Ni Qingliang
> > Sent: Monday, December 26, 2011 1:45 AM
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] can't install eclipse plugin
> >
> > hello, all:
> > I have update yocto plugin to 20111224 current version, but can't
> > install it correctly.
> >
> > I don't know where to find linuxtools.tmf.core, I have installed
> > linuxtools totaly, but can't work.
> >
> > who can help me? thanks!
> >
> >
> >
> > Cannot complete the install because one or more required items could no=
t
> > be found.
> >   Software being installed: Yocto Plugin for Eclipse 1.1.0.201112240640
> > (org.yocto.sdk.feature.group 1.1.0.201112240640)
> >   Missing requirement: Yocto Project Plugin Remote Tools
> > 1.1.0.201112240640 (org.yocto.sdk.remotetools 1.1.0.201112240640)
> > requires 'bundle org.eclipse.linuxtools.tmf.core 0.4.0' but it could no=
t
> > be found
> >   Cannot satisfy dependency:
> >     From: Yocto Plugin for Eclipse 1.1.0.201112240640
> > (org.yocto.sdk.feature.group 1.1.0.201112240640)
> >     To: org.yocto.sdk.remotetools 0.0.0
> >
> >
> > --
> > Yi Qingliang
> > niqingliang@insigma.com.cn
> > https://niqingliang2003.wordpress.com
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


