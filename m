Return-Path: <BSREEKAN@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0083.outbound.protection.outlook.com
	[104.47.37.83])
	by mail.openembedded.org (Postfix) with ESMTP id 260F1785C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 20:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uyA9pWjdZ46bTtOaKRCjdjTk7KggzQePckNuiLTABUg=;
	b=YkTthfBtLx221D5gfEw0qQ4LqwfL70ScvdV1yItta/v6YDWI/vb6Bjmf1Dzar67SOc0JIn235885+PPpS7YEctqA5W+ucpiNGh6dSuVqKoTOVcnvjRimP9WuSYzvHT0b1uB/en8xqaPZghrhAYaiiF/q2EM22RQVzI3Nj21znDs=
Received: from BY2PR02MB1283.namprd02.prod.outlook.com (10.162.79.155) by
	BY2PR02MB1653.namprd02.prod.outlook.com (10.163.27.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Thu, 25 Jan 2018 20:08:18 +0000
Received: from BY2PR02MB1283.namprd02.prod.outlook.com ([10.162.79.155]) by
	BY2PR02MB1283.namprd02.prod.outlook.com ([10.162.79.155]) with mapi id
	15.20.0444.014; Thu, 25 Jan 2018 20:08:17 +0000
From: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Thread-Topic: [OE-core] [PATCH]] python-oauthlib_2.0.6.bb: Add python-oauthlib
Thread-Index: AQHTlZiAJ8vjcbSBCU6qwcZgIVOGUqOFBP7w
Date: Thu, 25 Jan 2018 20:08:17 +0000
Message-ID: <BY2PR02MB128317BD82A6776F0D61117DB0E10@BY2PR02MB1283.namprd02.prod.outlook.com>
References: <1516847187-6081-1-git-send-email-bhargava.sreekantappa-gayathri@xilinx.com>
	<E36F9698-3D8E-4574-98D4-7DFF66ED1879@linux.intel.com>
In-Reply-To: <E36F9698-3D8E-4574-98D4-7DFF66ED1879@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=BSREEKAN@xilinx.com; 
x-originating-ip: [62.221.5.234]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB1653;
	6:e00kdgMcl77c/n5xsUgTHBBNLdOfb+LnyERHZ+mA3S8cxqecb7nlWgfE8N+ehKr+gTUI4iU7NkBytuzibZKlclDUxv2VkE1BMXTCRjwfJNWGw8Dr7C9WKrtnMqs4WoqUYbHAQv4r3Dqdr05V7q36hqwgq7HgqNc+mznpxckmN8NLFDGre+30mKO3otERoQny261XC0UisvvE/pSXRwK2SLjOPBW6G9yCeF6v8rOGA5Ppr/NldRYQt3QCLnLN6uDukkQ/dvsdalK00ZtGp2yaOIG2n/+AIbMBiJKUDDIVaNdaLmdOXahipknIWL9FIgo/TpNWYIqnF1Ec25BUfnxrm+D1QpL3rQZk1atAWViHegTBHxVfV5BqB9egL5p+dOrG;
	5:UUl44/E0AQ2mo0YFqWCVJoCs2aqwgtYig7yXQkm5xxcwi1x774wz0KkEMvHEJmRzoYrgCNraVFznNW0wq7kSx6L0nGnOlM3KMRbE8V4r5R3Wd9RuRmt/r/XCCul8B8snWCQyDkPTd8yz5zsn2PlUDRM9G0hGW6f5pzIkOQl7ZT4=;
	24:18Ab3aerViXZd/myOMRZHcWHArCVoopseC1yfJhnIFKeA/sXs2IHc9XDJ9HUzYSzZlM4yTXKdcLLvbxwoFKCT15qJ3ZOTQLvm8psJWzgTq0=;
	7:Ow43DJ2qDnqCh/P/w31GPEaD5meYovDD5PwOcqEheoTZOXjl+9R2I48oqmhMSwO8/gDIeBiwSe64GkY08ekBfqAS1gQuAZKvs65ubsJVcJvxjXBRgcPIPAPnmE+k/scop955ZWpdAHo+huTd+bfeiMtWa/+PAU4ZzySkFRh3OCpklvT5GGS7oMBhSZU1Auw2LkCkPBXSuQxx/HPUrcb5zmRSMSIttiV/g9QrWHeNTEmugdxsxIJTKnWxycxlr7KW
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(396003)(39860400002)(39380400002)(13464003)(189003)(199004)(3660700001)(33656002)(53936002)(97736004)(25786009)(99286004)(3280700002)(966005)(2900100001)(6116002)(3846002)(8936002)(105586002)(1720100001)(8676002)(81156014)(86362001)(81166006)(5890100001)(6246003)(72206003)(478600001)(229853002)(14454004)(68736007)(107886003)(4326008)(2906002)(66066001)(5660300001)(6436002)(316002)(54906003)(6916009)(2950100002)(26005)(55016002)(77096007)(305945005)(59450400001)(53546011)(7736002)(6306002)(6506007)(106356001)(9686003)(76176011)(102836004)(74316002)(186003)(7696005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1653;
	H:BY2PR02MB1283.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 21a15e07-76b4-4f24-9e8b-08d5642f5fe8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB1653; 
x-ms-traffictypediagnostic: BY2PR02MB1653:
x-microsoft-antispam-prvs: <BY2PR02MB1653145DA6BA77A9E6BC0539B0E10@BY2PR02MB1653.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(251646265452963)(264703809997249)(192813158149592)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231023)(2400081)(944501161)(93006095)(93001095)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1653; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1653; 
x-forefront-prvs: 0563F2E8B7
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: /rNIX2ZDl0hwURkaWsGNVz+3+uTg8Z6wmCEyq0FBxgpi+08PFqrifV24lb6eyQpQgpXTrIkZNRc5VWGbqo2ZCQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a15e07-76b4-4f24-9e8b-08d5642f5fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2018 20:08:17.6803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1653
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH]] python-oauthlib_2.0.6.bb: Add python-oauthlib
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
X-List-Received-Date: Thu, 25 Jan 2018 20:24:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Tim,

> -----Original Message-----
> From: Tim Orling [mailto:timothy.t.orling@linux.intel.com]
> Sent: Wednesday, January 24, 2018 8:54 PM
> To: Bhargava Sreekantappa Gayathri <BSREEKAN@xilinx.com>
> Cc: openembedded-core@lists.openembedded.org; Manjukumar Harthikote
> Matha <MANJUKUM@xilinx.com>
> Subject: Re: [OE-core] [PATCH]] python-oauthlib_2.0.6.bb: Add python-oaut=
hlib
>=20
> Why do you feel this needs to be in oe-core rather than meta-python? We a=
re
> trying to keep oe-core self contained and if nothing depends on this it d=
oes not
> belong in oe-core.
>=20
> Also, please provide a python3 version as well as oe-core and meta-python=
 are
> transitioning to only python3 support (python2 will be EOL in ~2020).
>=20

I have sent the patch to meta-python. I will work on the python 3 version a=
s well.


Thanks,
Bhargav
> > On Jan 24, 2018, at 6:26 PM, Bhargava Sreekantappa Gayathri
> <bhargava.sreekantappa-gayathri@xilinx.com> wrote:
> >
> > This patch adds python-oauthlib recipe.
> >
> > Signed-off-by: Bhargava Sreekantappa Gayathri <bhargava.sreekantappa-
> gayathri@xilinx.com>
> > ---
> > .../python/python-oauthlib_2.0.6.bb                | 27 +++++++++++++++=
+++++++
> > 1 file changed, 27 insertions(+)
> > create mode 100644 meta/recipes-devtools/python/python-oauthlib_2.0.6.b=
b
> >
> > diff --git a/meta/recipes-devtools/python/python-oauthlib_2.0.6.bb
> b/meta/recipes-devtools/python/python-oauthlib_2.0.6.bb
> > new file mode 100644
> > index 0000000..0bcb7b8
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python-oauthlib_2.0.6.bb
> > @@ -0,0 +1,27 @@
> > +SUMMARY =3D "A generic, spec-compliant, thorough implementation of the
> OAuth request-signing logic"
> > +HOMEPAGE =3D "https://github.com/idan/oauthlib"
> > +
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D5ba9ce41463615e082609806255bce1b"
> > +
> > +SRC_URI =3D
> "https://pypi.python.org/packages/a5/8a/212e9b47fb54be109f3ff0684165bb38
> c51117f34e175c379fce5c7df754/oauthlib-${PV}.tar.gz"
> > +SRC_URI[md5sum] =3D "277a9a966cc8c72e492b4eeb41332445"
> > +SRC_URI[sha256sum] =3D
> "ce57b501e906ff4f614e71c36a3ab9eacbb96d35c24d1970d2539bbc3ec70ce1"
> > +
> > +S =3D "${WORKDIR}/oauthlib-${PV}"
> > +
> > +inherit setuptools
> > +
> > +# The following configs & dependencies are from setuptools extras_requ=
ire.
> > +# These dependencies are optional, hence can be controlled via
> PACKAGECONFIG.
> > +# The upstream names may not correspond exactly to bitbake package
> names.
> > +#
> > +# Uncomment this line to enable all the optional features.
> > +#PACKAGECONFIG ?=3D "test signedtoken signals rsa"
> > +PACKAGECONFIG[test] =3D ",,,python-blinker python-cryptography python-=
nose
> python-pyjwt"
> > +PACKAGECONFIG[signedtoken] =3D ",,,python-cryptography python-pyjwt"
> > +PACKAGECONFIG[signals] =3D ",,,python-blinker"
> > +PACKAGECONFIG[rsa] =3D ",,,python-cryptography"
> > +
> > +RDEPENDS_${PN} +=3D "python-core python-crypt python-datetime python-
> json python-lang python-logging python-math python-netclient python-re
> python-unittest"
> > +
> > --
> > 2.7.4
> >
> > This email and any attachments are intended for the sole use of the nam=
ed
> recipient(s) and contain(s) confidential information that may be propriet=
ary,
> privileged or copyrighted under applicable law. If you are not the intend=
ed
> recipient, do not read, copy, or forward this email message or any attach=
ments.
> Delete this email message and any attachments immediately.
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


