Received: from exprod7og116.obsmtp.com ([64.18.2.219])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabien.Proriol@jdsu.com>) id 1TO94L-0002IW-FW
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Oct 2012 17:28:33 +0200
Received: from MX3.jdsu.com ([141.169.254.5]) (using TLSv1) by
	exprod7ob116.postini.com ([64.18.6.12]) with SMTP
	ID DSNKUH16BWdJUXYN61nKodEkaJeYys/uvJZd@postini.com;
	Tue, 16 Oct 2012 08:15:18 PDT
Received: from EUEXHTCA01.ds.jdsu.net (10.237.69.11) by MX3.jdsu.com
	(141.169.254.5) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 16 Oct 2012 16:42:00 +0200
Received: from EUEXMB01.ds.jdsu.net ([fe80::942f:1810:27a2:359d]) by
	EUEXHTCA01.ds.jdsu.net ([fe80::95ae:4a0b:5ca2:580f%11]) with mapi id
	14.02.0298.004; Tue, 16 Oct 2012 16:42:00 +0200
From: Fabien Proriol <Fabien.Proriol@jdsu.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [oe] [PATCH] SDK: allow SDK path of various level
Thread-Index: AQHNq6NcGEBZuifF5k2jBmJlmxMIzpe72kgAgAAFDoA=
Date: Tue, 16 Oct 2012 14:42:00 +0000
Message-ID: <507D71AB.6060209@jdsu.com>
References: <1350394502-7745-1-git-send-email-fabien.proriol@jdsu.com>
	<20121016142134.GC5662@denix.org>
In-Reply-To: <20121016142134.GC5662@denix.org>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:14.0) Gecko/20120802
	Thunderbird/14.0
x-originating-ip: [10.239.69.13]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH] SDK: allow SDK path of various level
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
X-List-Received-Date: Tue, 16 Oct 2012 15:28:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <24BD1D733083CE428E1E5322DBC439CB@jdsu.com>
Content-Transfer-Encoding: quoted-printable

>> In the previous version, tar extraction use the --strip-component
>> option with "4" hard coded value.
>> If we set another SDKPATH, with a different depth, the sdk installation
>> fails.
>>
>> This patch computes the level from the SDKPATH value.
> Thanks! That's part of the problem I was having lately. Although, I think=
 this
> patch should go to OE-Core list instead...
OK, I re-sent this patch to OE-Core.

> Do you also see the problem building gcc-cross-initial/intermediate
> complaining about missing headers from sysroot (it loses -nativesdk suffi=
x
> for some reason, when looking for the system headers), when building with=
 the
> new SDKPATH/SDK_NAME? I believe there's some path hardcoded somewhere in =
the
> gcc/cross recipes, but I wasn't able to debug it yet...
>
No, I haven't seen this type of problem.
I will look if I see somethings wrong in recipe.
But now, with Yocto 1.2-RC4, I built for PowerPC, a toolchain, a target=20
image with my applications, my own kernel, without any problem except=20
the one this patch solved.

Fabien=


