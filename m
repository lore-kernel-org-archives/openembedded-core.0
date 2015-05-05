Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 52B3E72376
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 14:49:29 +0000 (UTC)
Received: from SESTOEX09.enea.se ([fe80::94d8:372f:210c:b4da]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0224.002; Tue, 5 May 2015 16:49:29 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "yocto.security@yoctoproject.org" <yocto.security@yoctoproject.org>
Thread-Topic: CVE list vs bugzilla 
Thread-Index: AdCHMQJlypVzgTuuROqRC6C4yAIJCw==
Date: Tue, 5 May 2015 14:49:28 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48258EB7C5@sestoex09.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: CVE list vs bugzilla
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
X-List-Received-Date: Tue, 05 May 2015 14:49:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

To monitor/scan vulnerabilities (CVE), check affected packages, versions, b=
ranches, fixed versions/branches etc ... we need either to file a bug in bu=
gzilla for each publically disclosed CVE or have a simple data base. Today,=
 we sometimes file a bug but most of the time vulnerabilities just get fixe=
d by someone volunteer and some vulnerabilities don't get fixed.

We have created a CVE list just for test to see if this is easier to mainta=
in and provides better overview, please have a look at this and let us to k=
now what you think:
https://docs.google.com/spreadsheets/d/13o4IPsCQ42aR2CCGzYOHdmpIEHkHUwDWlF4=
QqgI6emQ/edit#gid=3D0=20

The alternative for maintaining such a list is filing a bug in Bugzilla. Th=
e question is which approach is the best, here are some pros and cons:

Bugzilla:=20
=3D=3D=3D=3D=3D=3D=3D
- it takes more time to create/update a bug  in Bugzilla (not a big problem=
)
- history, traceable who updated
- when we have releases, we go through open bugs and try to get them fixed

Question: can we generate a report from Bugzilla, search for CVEs and find =
out what CVEs have been fixed and in what branches etc?


CVE spread sheet:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ Easy to update, anyone just can add info preferably automatically; we cou=
ld use a tool to check with NVD (https://nvd.nist.gov/ ) daily and update t=
he list (some human interactions needs to be done though)=20
+ easy to have an overview
- ?

Any comments?

Thanks
Sona

