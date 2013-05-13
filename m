Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1Uc1dt-0005pW-R5
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 00:54:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4DMaZO2002028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 May 2013 15:36:35 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.88]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.02.0342.003;
	Mon, 13 May 2013 15:36:34 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Saul Wold <sgw@linux.intel.com>, "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] sysvinit: modify bootlog location
Thread-Index: AQHOTEBSzMgy+p17Dkmg7P1Y+jJzPZj+oh2AgADOPoCABEr38A==
Date: Mon, 13 May 2013 22:36:33 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8436FC4D2B@ALA-MBA.corp.ad.wrs.com>
References: <1368054238-21389-1-git-send-email-jslater@windriver.com>
	<CAJTo0LZW4aw9eKoXg5zZhV9-ncSWpWD=AfgW45HQrQadqZatAw@mail.gmail.com>
	<518D6DF1.6080903@linux.intel.com>
In-Reply-To: <518D6DF1.6080903@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysvinit: modify bootlog location
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
X-List-Received-Date: Mon, 13 May 2013 22:55:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, May 10, 2013 3:00 PM
> To: Burton, Ross; Slater, Joseph
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] sysvinit: modify bootlog location
>=20
> On 05/10/2013 02:42 AM, Burton, Ross wrote:
> > On 9 May 2013 00:03, Joe Slater <jslater@windriver.com> wrote:
> >> The default location for bootlog is volatile,
> >> so we change it to something that is not.
> >
> > If this is a problem, why not make /var/log not volatile?  I never
> > understood why the log directory was volatile to be honest.
> >
> How would we handle the Read-Only FS situation?

Maybe we could change around the creation of bootlogd.log such that,
if /var/local were not writeable, we'd stick it in /var/log.

Joe


>=20
> Sau!
>=20
> > Ross
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >


