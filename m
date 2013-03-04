Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1UCTcB-0002Pr-Ry for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 12:31:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Mar 2013 03:14:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,778,1355126400"; 
	d="7628'?scan'208";a="208518283"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Mar 2013 03:14:16 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.108]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.96]) with mapi id
	14.01.0355.002; Mon, 4 Mar 2013 11:13:49 +0000
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH v2] btrfs-tools: added PV to git package recipe
Thread-Index: AQHOFnZxWzbj580GUk+BAY7FnDp85piQx1UAgABs74CAAAN/AIAAST0AgAO4bLqAABjTAIAACP2k
Date: Mon, 4 Mar 2013 11:13:48 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3F2AFCE@IRSMSX102.ger.corp.intel.com>
References: <1362140387-5761-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
	<1362141704.1055.56.camel@ted> <5130FD69.1020804@linux.intel.com>
	<CA+chaQewTJogM92pDtzTgQqz6f90U_F_57t8bQ0MfZx-J9h1rQ@mail.gmail.com>
	,<1362181576.11004.11.camel@ted>
	<985E5BBDA0968D48ABDF343456A521B3F2AF9E@IRSMSX102.ger.corp.intel.com>,
	<1362391438.29587.4.camel@ted>
In-Reply-To: <1362391438.29587.4.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.137]
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] btrfs-tools: added PV to git package recipe
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
X-List-Received-Date: Mon, 04 Mar 2013 11:31:35 -0000
X-Groupsio-MsgNum: 36182
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_985E5BBDA0968D48ABDF343456A521B3F2AFCEIRSMSX102gercorpi_"

--_002_985E5BBDA0968D48ABDF343456A521B3F2AFCEIRSMSX102gercorpi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The error appeared at do_package.=0A=
I've attached the logfile.=0A=
=0A=
Thanks,=0A=
Ema=0A=
________________________________________=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Monday, March 04, 2013 12:03 PM=0A=
To: Ciobanu, Emilia Maria Silvia=0A=
Cc: Martin Jansa; oe-core layer=0A=
Subject: Re: [OE-core] [PATCH v2] btrfs-tools: added PV to git package reci=
pe=0A=
=0A=
On Mon, 2013-03-04 at 08:42 +0000, Ciobanu, Emilia Maria Silvia wrote:=0A=
> I've tried building the package after added the "0.20~rc1" tag for=0A=
> PV. This format for the tag doesn't seem to be supported. I=0A=
> get the following error:=0A=
>  invalid tag value("^[A-Za-z0-9+._]+$") Version: Version: 0.20~rc1+git0+f=
db6c0402337d9607c7a39155088eaf033742752=0A=
=0A=
Which part of the system did that error come from?=0A=
=0A=
From what you've said, we should probably go with 0.19 for now and if we=0A=
upgrade past the tag, switch to 0.19+0.20-rc1.=0A=
=0A=
We need to open a bug about ~ not working in package versions with the=0A=
bug in opkg-compare-versions and the above issue being mentioned.=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=
=0A=
=0A=

--_002_985E5BBDA0968D48ABDF343456A521B3F2AFCEIRSMSX102gercorpi_
Content-Type: application/octet-stream; name="log.do_package_write_rpm.7628"
Content-Description: log.do_package_write_rpm.7628
Content-Disposition: attachment; filename="log.do_package_write_rpm.7628";
	size=1374; creation-date="Mon, 04 Mar 2013 11:10:20 GMT";
	modification-date="Mon, 04 Mar 2013 11:10:20 GMT"
Content-Transfer-Encoding: base64

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3N0YXRlX3Rhc2tfcHJlZnVuYwpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3ByZWZ1bmMgZmluaXNoZWQKREVCVUc6IEV4
ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcGFja2FnZV93cml0ZV9ycG0KREVCVUc6IEV4ZWN1
dGluZyBweXRob24gZnVuY3Rpb24gcmVhZF9zdWJwYWNrYWdlX21ldGFkYXRhCkRFQlVHOiBQeXRo
b24gZnVuY3Rpb24gcmVhZF9zdWJwYWNrYWdlX21ldGFkYXRhIGZpbmlzaGVkCkRFQlVHOiBFeGVj
dXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX3BhY2thZ2VfcnBtCkRFQlVHOiBFeGVjdXRpbmcgcHl0
aG9uIGZ1bmN0aW9uIHdyaXRlX3NwZWNmaWxlCk5PVEU6IENyZWF0aW5nIFJQTSBwYWNrYWdlIGZv
ciBidHJmcy10b29scy1kYmcKTk9URTogTm90IGNyZWF0aW5nIGVtcHR5IFJQTSBwYWNrYWdlIGZv
ciBidHJmcy10b29scy1zdGF0aWNkZXYKTk9URTogQ3JlYXRpbmcgRU1QVFkgUlBNIFBhY2thZ2Ug
Zm9yIGJ0cmZzLXRvb2xzLWRldgpOT1RFOiBDcmVhdGluZyBSUE0gcGFja2FnZSBmb3IgYnRyZnMt
dG9vbHMtZG9jCk5PVEU6IE5vdCBjcmVhdGluZyBlbXB0eSBSUE0gcGFja2FnZSBmb3IgYnRyZnMt
dG9vbHMtbG9jYWxlCk5PVEU6IENyZWF0aW5nIFJQTSBwYWNrYWdlIGZvciBidHJmcy10b29scwpO
T1RFOiBDcmVhdGluZyBSUE0gcGFja2FnZSBmb3IgYnRyZnMtdG9vbHMKREVCVUc6IFB5dGhvbiBm
dW5jdGlvbiB3cml0ZV9zcGVjZmlsZSBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHNoZWxsIGZ1
bmN0aW9uIEJVSUxEU1BFQwplcnJvcjogbGluZSAzOiBpbnZhbGlkIHRhZyB2YWx1ZSgiXltBLVph
LXowLTkrLl9dKyQiKSBWZXJzaW9uOiBWZXJzaW9uOiAwLjIwfnJjMStnaXQwK2ZkYjZjMDQwMjMz
N2Q5NjA3YzdhMzkxNTUwODhlYWYwMzM3NDI3NTIKZXJyb3I6IFBhY2thZ2UgaGFzIG5vICVkZXNj
cmlwdGlvbjogYnRyZnMtdG9vbHMuaTU4NgpCdWlsZGluZyB0YXJnZXQgcGxhdGZvcm1zOiBpNTg2
LXBva3ktbGludXgKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBkb19wYWNrYWdlX3JwbSBmaW5pc2hl
ZApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3BhY2thZ2Vfd3JpdGVfcnBtIGZpbmlzaGVkCkVS
Uk9SOiBGdW5jdGlvbiBmYWlsZWQ6IEJVSUxEU1BFQyAoc2VlIC9ob21lL2VtYS9zc2Qvd2ViYXB5
LWFwcC9wb2t5L2J1aWxkL3RtcC93b3JrL2k1ODYtcG9reS1saW51eC9idHJmcy10b29scy8wLjIw
fnJjMStnaXRBVVRPSU5DK2ZkYjZjMDQwMjMzN2Q5NjA3YzdhMzkxNTUwODhlYWYwMzM3NDI3NTIt
cjYvdGVtcC9sb2cuZG9fcGFja2FnZV93cml0ZV9ycG0uNzYyOCBmb3IgZnVydGhlciBpbmZvcm1h
dGlvbikK

--_002_985E5BBDA0968D48ABDF343456A521B3F2AFCEIRSMSX102gercorpi_--
